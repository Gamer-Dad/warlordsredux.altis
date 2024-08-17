params ["_sender", "_pos", "_class", "_cost"];

if !(isServer) exitWith {};

private _owner = owner _sender;
_uid = getPlayerUID _sender;

private _sector = ((_pos nearObjects ["Logic", 10]) select {count (_x getVariable ["BIS_WL_runwaySpawnPosArr", []]) > 0}) # 0;
private _taxiNodes = _sector getVariable "BIS_WL_runwaySpawnPosArr";
private _taxiNodesCnt = count _taxiNodes;
private _spawnPos = [];
private _dir = 0;
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
};

if (count _spawnPos == 0) exitWith {
	diag_log format ["Ordering aircraft failed. Spawn position not found in sector %1.", _sector getVariable "BIS_WL_name"];
	"No suitable spawn position found. Clear the runways." remoteExec ["systemChat", _owner];
	_sender setVariable ["BIS_WL_isOrdering", false, [2, _owner]];
	
	// refund if nothing spawned
	(_cost) call BIS_fnc_WL2_fundsDatabaseWrite;
};

private _isUav = getNumber (configFile >> "CfgVehicles" >> _class >> "isUav") == 1;
private _asset = if (_isUav) then {
	[_spawnPos, _class, 0, _sender] call BIS_fnc_WL2_createUAVCrew;
} else {
	createVehicle [_class, _spawnPos, [], 0, "NONE"];
};

_asset setDir _dir;

waitUntil {sleep 0.1; !(isNull _asset)};
_asset enableWeaponDisassembly false;
_asset setVehicleReportRemoteTargets true;
_asset setVehicleReceiveRemoteTargets true;
_asset setVehicleReportOwnPosition true;

if ("120Rnd_CMFlare_Chaff_Magazine" in (_asset magazinesTurret [-1])) then {
	_asset addMagazineTurret ["120Rnd_CMFlare_Chaff_Magazine", [-1], 120]
};

_asset setVariable ["BIS_WL_ownerAsset", _uid, [2, _owner]];
[_asset, _sender] remoteExec ["BIS_fnc_WL2_newAssetHandle", _owner];
_sender setVariable ["BIS_WL_isOrdering", false, [2, _owner]];