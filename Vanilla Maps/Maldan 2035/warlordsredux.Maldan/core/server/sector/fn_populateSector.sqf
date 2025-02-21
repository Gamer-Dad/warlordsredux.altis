#include "..\..\warlords_constants.inc"

params ["_sector", "_owner"];

private _vehicleUnits = [];
if (count (_sector getVariable ["BIS_WL_vehiclesToSpawn", []]) == 0) then {
	private _roads = ((_sector nearRoads 400) select {count roadsConnectedTo _x > 0}) inAreaArray (_sector getVariable "objectAreaComplete");
	if (count _roads > 0) then {
		private _hasRadar = false;
		private _hardAIMode = WL_HARD_AI_MODE == 1;
		private _numVehicleSpawn = if (_hardAIMode) then {
			private _sectorValue = _sector getVariable ["BIS_WL_value", 50];
			((_sectorValue / 5) max 1) min 4;
		} else {
			1;
		};

		for "_i" from 1 to _numVehicleSpawn do {
			private _road = selectRandom _roads;
			private _posRoad = position _road;
			_vehicleArray = [_posRoad, _road getDir selectRandom (roadsConnectedTo _road), selectRandom (serverNamespace getVariable "WL2_populateVehiclePoolList"), _owner] call BIS_fnc_spawnVehicle;
			_vehicleArray params ["_vehicle", "_crew", "_group"];

			_vehicle call WL2_fnc_newAssetHandle;
			_vehicleUnits pushBack _vehicle;

			{
				_x call WL2_fnc_newAssetHandle;
				_vehicleUnits pushBack _x;
			} forEach _crew;

			[_group, 0] setWaypointPosition [position _vehicle, 100];
			_group setBehaviour "COMBAT";
			_group deleteGroupWhenEmpty true;

			_wp = _group addWaypoint [_posRoad, 100];
			_wp setWaypointType "SAD";

			_wp = _group addWaypoint [_posRoad, 100];
			_wp setWaypointType "CYCLE";

			_vehicle allowCrewInImmobile [true, true];

			if (typeOf _vehicle == "I_LT_01_scout_F") then {
				_hasRadar = true;

				_vehicle setVehicleReportRemoteTargets true;
				_vehicle setVehicleReceiveRemoteTargets true;
				_vehicle setVehicleReportOwnPosition true;
			};
		};

		if (_hasRadar && _hardAIMode) then {
			private _samLocation = selectRandom ([_sector, 0, true] call WL2_fnc_findSpawnPositions);
			private _createSamResult = [_samLocation, 0, "I_E_SAM_System_03_F", resistance] call BIS_fnc_spawnVehicle;
			private _sam = _createSamResult select 0;
			for "_i" from 1 to 10 do {
				_sam addMagazineTurret ["magazine_Missile_mim145_x4", [0]];
			};

			_sam setVehicleReportRemoteTargets true;
			_sam setVehicleReceiveRemoteTargets true;
			_sam setVehicleReportOwnPosition true;

			_sam call WL2_fnc_newAssetHandle;
			_vehicleUnits pushBack _sam;
		};
	};
} else {
	{
		_vehicleInfo = _x;
		_vehicleInfo params ["_type", "_pos", "_dir", "_lock", "_waypoints"];
		_vehicleArray = [_pos, _dir, _type, _owner] call BIS_fnc_spawnVehicle;
		_vehicleArray params ["_vehicle", "_crew", "_group"];

		_vehicle call WL2_fnc_newAssetHandle;
		_vehicleUnits pushBack _vehicle;

		{
			_x call WL2_fnc_newAssetHandle;
			_vehicleUnits pushBack _x;
		} forEach _crew;

		_posVic = position _vehicle;
		[_group, 0] setWaypointPosition [_posVic, 100];
		_group setBehaviour "COMBAT";
		_group deleteGroupWhenEmpty true;

		_wp = _group addWaypoint [_posVic, 100];
		_wp setWaypointType "SAD";

		_wp1 = _group addWaypoint [_posVic, 100];
		_wp1 setWaypointType "CYCLE";

		_vehicle allowCrewInImmobile [true, true];
	} forEach (_sector getVariable "BIS_WL_vehiclesToSpawn");
	_sector setVariable ["BIS_WL_vehiclesToSpawn", nil];
};

_connectedToBase = count ((profileNamespace getVariable "BIS_WL_lastBases") arrayIntersect (_sector getVariable "BIS_WL_connectedSectors")) > 0;
if (!_connectedToBase && {"H" in (_sector getVariable "BIS_WL_services")}) then {
	private _neighbors = (_sector getVariable "BIS_WL_connectedSectors") select {(_x getVariable "BIS_WL_owner") == _owner};

	if (count _neighbors > 0) then {
		_vehicleArray = [position selectRandom _neighbors, 0, selectRandom (serverNamespace getVariable "WL2_populateAircraftPoolList"), _owner] call BIS_fnc_spawnVehicle;
		_vehicleArray params ["_vehicle", "_crew", "_group"];

		_vehicle call WL2_fnc_newAssetHandle;
		_vehicleUnits pushBack _vehicle;

		{
			_x call WL2_fnc_newAssetHandle;
			_vehicleUnits pushBack _x;
		} forEach _crew;

		[_group, 0] setWaypointPosition [position _vehicle, 300];
		_group setBehaviour "COMBAT";
		_group deleteGroupWhenEmpty true;

		_wp1 = _group addWaypoint [position _sector vectorAdd [0, 0, 300], 300];
		_wp1 setWaypointType "SAD";

		_wp2 = _group addWaypoint [position _sector vectorAdd [0, 0, 300], 300];
		_wp2 setWaypointType "SAD";

		_wp3 = _group addWaypoint [waypointPosition _wp1 vectorAdd [0, 0, 300], 300];
		_wp3 setWaypointType "CYCLE";

		_vehicle allowCrewInImmobile [true, true];
	};
};
[_vehicleUnits, _sector] spawn WL2_fnc_assetRelevanceCheck;

private _spawnPosArr = [_sector, 0, true] call WL2_fnc_findSpawnPositions;
if (count _spawnPosArr == 0) exitWith {};

private _garrisonSize = (_sector getVariable "BIS_WL_value") * 2.3; // * x: the bigger x the more ai
private _unitsPool = serverNamespace getVariable ["WL2_populateUnitPoolList", []];
private _infantryUnits = [];
private _infantryGroups = [];
_i = 0;
while {_i < _garrisonSize} do {
	private _pos = selectRandom _spawnPosArr;
	/*
	//***Spawning Diag code, visual tool for spawn points***
	{
       	private _posNumber = str _x;
    	_mrkr = createMarkerLocal [_posNumber, _x];
		_mrkr setMarkerColorLocal "ColorRed";
    	_mrkr setMarkerTypeLocal "loc_LetterX";
    	_mrkr setMarkerSizeLocal [1, 1];
    } forEach _spawnPosArr;

    private _posNumber = str _i;
    _mrkr = createMarkerLocal [_posNumber, _pos];
    _mrkr setMarkerTypeLocal "mil_dot_noShadow";
    _mrkr setMarkerSizeLocal [1.5, 1.5];
	//***end diag code block***
	*/
	private _newGrp = createGroup _owner;
	_infantryGroups pushBack _newGrp;
	private _grpSize = floor (10 + random 3);
	private _cnt = (count allPlayers) max 1;

	private _i2 = 0;
	for "_i2" from 0 to _grpSize do {
		private _newUnit = _newGrp createUnit [selectRandom _unitsPool, _pos, [], 100, "NONE"];
		_newUnit setVehiclePosition [getPosATL _newUnit, [], 0, "CAN_COLLIDE"];
		_newUnit call WL2_fnc_newAssetHandle;
		_infantryUnits pushBack _newUnit;

		_i = _i + (((_cnt/50) max 0.6) min 2);
		if (_i >= _garrisonSize) exitwith {};
	};

	_newGrp setBehaviour "COMBAT";
	_newGrp setSpeedMode "LIMITED";
	[_newGrp, 0] setWaypointPosition [_pos, 0];
	_newGrp deleteGroupWhenEmpty true;

	_i3 = 0;
	for "_i3" from 0 to 5 do {
		_newGrp addWaypoint [selectRandom _spawnPosArr, 0];
	};

	_newWP = _newGrp addWaypoint [_pos, 0];
	_newWP setWaypointType "CYCLE";
	sleep 0.001;
};

{
	private _infantryUnit = _x;
	{
		_x reveal [_infantryUnit, 4];
	} forEach _infantryGroups
} forEach _infantryUnits;

[_infantryUnits, _sector] spawn WL2_fnc_assetRelevanceCheck;