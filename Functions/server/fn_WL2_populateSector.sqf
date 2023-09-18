params ["_sector", "_side"];

if (_side == RESISTANCE && {_sector getVariable ["BIS_WL_aiSpawnedAAF", false]}) exitWith {};

private _spawnPosArr = _sector call BIS_fnc_WL2_findSpawnPositions;
private _connectedToBase = count ([BIS_WL_base1, BIS_WL_base2] arrayIntersect (_sector getVariable "BIS_WL_connectedSectors")) > 0;

if (_side == RESISTANCE) then {
	_sector setVariable ["BIS_WL_aiSpawnedAAF", true];
	if (count (_sector getVariable "BIS_WL_vehiclesToSpawn") == 0) then {
		private _roads = ((_sector nearRoads 400) select {count roadsConnectedTo _x > 0}) inAreaArray (_sector getVariable "objectAreaComplete");
		if (count _roads > 0) then {
			private _road = selectRandom _roads;
			_vehicleArray = [position _road, _road getDir selectRandom (roadsConnectedTo _road), selectRandomWeighted BIS_WL_factionVehicleClasses, _side] call BIS_fnc_spawnVehicle;
			_vehicleArray params ["_vehicle", "_crew", "_group"];
			
			_vehicle setVariable ["BIS_WL_parentSector", _sector];
			[objNull, _vehicle] spawn BIS_fnc_WL2_newAssetHandle;
			
			{
				_x setVariable ["BIS_WL_parentSector", _sector];
				[objNull, _x] spawn BIS_fnc_WL2_newAssetHandle;
			} forEach _crew;
			
			[_group, 0] setWaypointPosition [position _vehicle, 100];
			_group setBehaviour "COMBAT";
			_group deleteGroupWhenEmpty TRUE;
			
			_wp = _group addWaypoint [position _road, 100];
			_wp setWaypointType "SAD";
			
			_wp = _group addWaypoint [position _road, 100];
			_wp setWaypointType "CYCLE";

			_vehicle allowCrewInImmobile [true, true];
		};
	} else {
		private _roads = ((_sector nearRoads 400) select {count roadsConnectedTo _x > 0}) inAreaArray (_sector getVariable "objectAreaComplete");
		{
			private _road = selectRandom _roads;
			_vehicleInfo = _x;
			_vehicleInfo params ["_type", "_pos", "_dir", "_lock", "_waypoints"];
			_vehicleArray = [_pos, _dir, _type, _side] call BIS_fnc_spawnVehicle;
			_vehicleArray params ["_vehicle", "_crew", "_group"];
			
			_vehicle setVariable ["BIS_WL_parentSector", _sector];
			[objNull, _vehicle] spawn BIS_fnc_WL2_newAssetHandle;
			
			{
				_x setVariable ["BIS_WL_parentSector", _sector];
				[objNull, _x] spawn BIS_fnc_WL2_newAssetHandle;
			} forEach _crew;
			
			_vehicle lock _lock;
			[_group, 0] setWaypointPosition [position _vehicle, 100];
			_group setBehaviour "COMBAT";
			_group deleteGroupWhenEmpty TRUE;
			
			_wp = _group addWaypoint [position _vehicle, 100];
			_wp setWaypointType "SAD";
			
			_wp = _group addWaypoint [position _vehicle, 100];
			_wp setWaypointType "CYCLE";

			_vehicle allowCrewInImmobile [true, true];
		} forEach (_sector getVariable "BIS_WL_vehiclesToSpawn");
	}; 
	//below is heli/jet spawn code 
	if (!_connectedToBase && {"H" in (_sector getVariable "BIS_WL_services")}) then {
		private _neighbors = (_sector getVariable "BIS_WL_connectedSectors") select {(_x getVariable "BIS_WL_owner") == _side};
		
		if (count _neighbors > 0) then {
			_vehicleArray = [position selectRandom _neighbors, 0, selectRandomWeighted BIS_WL_factionAircraftClasses, _side] call BIS_fnc_spawnVehicle;
			_vehicleArray params ["_vehicle", "_crew", "_group"];
			
			_vehicle setVariable ["BIS_WL_parentSector", _sector];
			[objNull, _vehicle] spawn BIS_fnc_WL2_newAssetHandle;
			
			{
				_x setVariable ["BIS_WL_parentSector", _sector];
				[objNull, _x] spawn BIS_fnc_WL2_newAssetHandle;
			} forEach _crew;
			
			

			[_group, 0] setWaypointPosition [position _vehicle, 300];
			_group setBehaviour "COMBAT";
			_group deleteGroupWhenEmpty TRUE;
			
			_wp1 = _group addWaypoint [position _sector vectorAdd [0, 0, 300], 300];
			_wp1 setWaypointType "SAD";
			
			_wp2 = _group addWaypoint [position _sector vectorAdd [0, 0, 300], 300];
			_wp2 setWaypointType "SAD";
			
			_wp3 = _group addWaypoint [waypointPosition _wp1 vectorAdd [0, 0, 300], 300];
			_wp3 setWaypointType "CYCLE";

			_vehicle allowCrewInImmobile [true, true];
		};
	};
};

if (count _spawnPosArr == 0) exitWith {};
// Adjust GROUP_SIZE_MIN up to help smaller sectors without turning telos in to 1 FPS hell
private _garrisonSize = (_sector getVariable "BIS_WL_value") * 2.3; // * x: the bigger x the more ai
private _unitsPool = BIS_WL_factionUnitClasses # (BIS_WL_sidesArray find _side);

_i = 0;

while {_i < _garrisonSize} do {
	private _pos = selectRandom _spawnPosArr;
	private _newGrp = createGroup _side;
	private _grpSize = floor (3 + random (5 - 3));
	private _cnt = (count allPlayers) max 1;
	
	private _i2 = 0;
	for "_i2" from 0 to _grpSize do {
		_newUnit = _newGrp createUnit [selectRandomWeighted _unitsPool, _pos, [], 5, "NONE"];
		_newUnit setVariable ["BIS_WL_parentSector", _sector];
		[objNull, _newUnit] spawn BIS_fnc_WL2_newAssetHandle;
		_newUnit spawn DAPS_fnc_SetupProjectiles;

		_i = _i + (((_cnt/50) max 0.4) min 2);
		if (_i >= _garrisonSize) exitwith {};
	};
	
	_newGrp setBehaviour "COMBAT";
	_newGrp setSpeedMode "LIMITED";
	[_newGrp, 0] setWaypointPosition [_pos, 0];
	_newGrp deleteGroupWhenEmpty TRUE;
	
	_i3 = 0;
	for "_i3" from 0 to 5 do {
		_newGrp addWaypoint [selectRandom _spawnPosArr, 0];
	};
	
	_newWP = _newGrp addWaypoint [_pos, 0];
	_newWP setWaypointType "CYCLE";
};

{
	_l = (vehicles + allUnits) select {(typeOf _x != "Logic") && {(alive _x) && {side group _x != civilian}}};
	_x addCuratorEditableObjects [_l, true];
} forEach allCurators;