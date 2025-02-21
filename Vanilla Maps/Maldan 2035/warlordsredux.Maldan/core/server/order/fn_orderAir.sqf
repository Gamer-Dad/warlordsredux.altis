params ["_sender", "_pos", "_orderedClass", "_cost"];

if !(isServer) exitWith {};
private _class = missionNamespace getVariable ["WL2_spawnClass", createHashMap] getOrDefault [_orderedClass, _orderedClass];

private _owner = owner _sender;
_uid = getPlayerUID _sender;

private _spawnPos = [];
private _dir = 0;

private _sector = _pos nearObjects ["Logic", 10];

private _carrierSectors = _sector select {
	count (_x getVariable ["WL_aircraftCarrier", []]) > 0
};
if (count _carrierSectors > 0) then {
	_sector = _carrierSectors # 0;

	private _carrierSettings = (_sector getVariable ["WL_aircraftCarrier", []]) # 0;
	{
		private _potentialSpawn = _x;
		private _potentialSpawnPos = getPosATL _potentialSpawn;
		private _potentialSpawnDir = getDir _potentialSpawn;

		private _potentialSpawnPosASL = ATLtoASL _potentialSpawnPos;
		private _collisionObjects = (_potentialSpawnPosASL nearObjects ["AllVehicles", 20]) select {
			!(_x isKindOf "Man")
		};
		if (count _collisionObjects == 0) then {
			_spawnPos = _potentialSpawnPos;
			_dir = _potentialSpawnDir;
			break;
		};
	} forEach (_carrierSettings call BIS_fnc_arrayShuffle);
} else {
	_sector = (_sector select {count (_x getVariable ["BIS_WL_runwaySpawnPosArr", []]) > 0}) # 0;

	private _taxiNodes = _sector getVariable "BIS_WL_runwaySpawnPosArr";
	private _taxiNodesCnt = count _taxiNodes;
	private _checks = 0;
	while {count _spawnPos == 0 && _checks < 100} do {
		_checks = _checks + 1;
		private _i = (floor random _taxiNodesCnt) max 1;
		private _pointB = _taxiNodes # _i;
		private _pointA = _taxiNodes # (_i - 1);
		_dir = _pointA getDir _pointB;
		private _pos = [_pointA, random (_pointA distance2D _pointB), _dir] call BIS_fnc_relPos;
		if (count (_pos nearObjects ["AllVehicles", 20]) == 0) then {
			_spawnPos = _pos;
		};
		sleep 0.001;
	};
};

if (count _spawnPos == 0) exitWith {
	diag_log format ["Ordering aircraft failed. Spawn position not found in sector %1.", _sector getVariable "BIS_WL_name"];
	"No suitable spawn position found. Clear the runways." remoteExec ["systemChat", _owner];
	_sender setVariable ["BIS_WL_isOrdering", false, [2, _owner]];

	// refund if nothing spawned
	(_cost) call WL2_fnc_fundsDatabaseWrite;
};

private _isUav = getNumber (configFile >> "CfgVehicles" >> _class >> "isUav") == 1;
private _asset = if (_isUav) then {
	[_spawnPos, _class, _orderedClass, 0, _sender] call WL2_fnc_createUAVCrew;
} else {
	createVehicle [_class, _spawnPos, [], 0, "NONE"];
};

_asset setVehiclePosition [_spawnPos, [], 0, "CAN_COLLIDE"];
_asset setDir _dir;

[_asset, _sender, _orderedClass] call WL2_fnc_processOrder;
[_asset] remoteExec ["WL2_fnc_catapultAction", 0];