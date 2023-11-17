params ["_sector", "_side"];

if (_side == resistance && {_sector getVariable ["BIS_WL_aiSpawnedAAF", false]}) exitWith {};

private _spawnPosArr = _sector call BIS_fnc_WL2_findSpawnPositions;
private _connectedToBase = count ([((profileNamespace getVariable "BIS_WL_lastBases") # 0), ((profileNamespace getVariable "BIS_WL_lastBases") # 1)] arrayIntersect (_sector getVariable "BIS_WL_connectedSectors")) > 0;
private _units = [];

if (_side == resistance) then {
	_sector setVariable ["BIS_WL_aiSpawnedAAF", true];
	if (count (_sector getVariable "BIS_WL_vehiclesToSpawn") == 0) then {
		private _roads = ((_sector nearRoads 400) select {count roadsConnectedTo _x > 0}) inAreaArray (_sector getVariable "objectAreaComplete");
		if (count _roads > 0) then {
			private _road = selectRandom _roads;
			private _posRoad = position _road;
			_vehicleArray = [_posRoad, _road getDir selectRandom (roadsConnectedTo _road), selectRandom (serverNamespace getVariable "WL2_factionVehicleClasses"), _side] call BIS_fnc_spawnVehicle;
			_vehicleArray params ["_vehicle", "_crew", "_group"];
			
			_vehicle setVariable ["BIS_WL_parentSector", _sector];
			_vehicle call BIS_fnc_WL2_newAssetHandle;
			_units pushBack _vehicle;
			
			{
				_x setVariable ["BIS_WL_parentSector", _sector];
				_x call BIS_fnc_WL2_newAssetHandle;
				_units pushBack _x;
			} forEach _crew;
			
			[_group, 0] setWaypointPosition [position _vehicle, 100];
			_group setBehaviour "COMBAT";
			_group deleteGroupWhenEmpty true;
			
			_wp = _group addWaypoint [_posRoad, 100];
			_wp setWaypointType "SAD";
			
			_wp = _group addWaypoint [_posRoad, 100];
			_wp setWaypointType "CYCLE";

			_vehicle allowCrewInImmobile [true, true];
		};
	} else {
		{
			_vehicleInfo = _x;
			_vehicleInfo params ["_type", "_pos", "_dir", "_lock", "_waypoints"];
			_vehicleArray = [_pos, _dir, _type, _side] call BIS_fnc_spawnVehicle;
			_vehicleArray params ["_vehicle", "_crew", "_group"];
			
			_vehicle setVariable ["BIS_WL_parentSector", _sector];
			_vehicle call BIS_fnc_WL2_newAssetHandle;
			_units pushBack _vehicle;
			
			{
				_x setVariable ["BIS_WL_parentSector", _sector];
				_x call BIS_fnc_WL2_newAssetHandle;
				_units pushBack _x;
			} forEach _crew;
			
			_vehicle lock _lock;
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
	if (!_connectedToBase && {"H" in (_sector getVariable "BIS_WL_services")}) then {
		private _neighbors = (_sector getVariable "BIS_WL_connectedSectors") select {(_x getVariable "BIS_WL_owner") == _side};
		
		if (count _neighbors > 0) then {
			_vehicleArray = [position selectRandom _neighbors, 0, selectRandom (serverNamespace getVariable "WL2_factionAircraftClasses"), _side] call BIS_fnc_spawnVehicle;
			_vehicleArray params ["_vehicle", "_crew", "_group"];
			
			_vehicle setVariable ["BIS_WL_parentSector", _sector];
			_vehicle call BIS_fnc_WL2_newAssetHandle;
			_units pushBack _vehicle;
			
			{
				_x setVariable ["BIS_WL_parentSector", _sector];
				_x call BIS_fnc_WL2_newAssetHandle;
				_units pushBack _x;
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
};
[_units] spawn BIS_fnc_WL2_assetRelevanceCheck;

if (count _spawnPosArr == 0) exitWith {};

private _garrisonSize = (_sector getVariable "BIS_WL_value") * 2.3; // * x: the bigger x the more ai
private _unitsPool = (serverNamespace getVariable "WL2_factionUnitClasses") # ([west, east, resistance] find _side);
_units = [];
_i = 0;
while {_i < _garrisonSize} do {
	private _pos = selectRandom _spawnPosArr;
	private _newGrp = createGroup _side;
	private _grpSize = floor (3 + random (5 - 3));
	private _cnt = (count allPlayers) max 1;
	
	private _i2 = 0;
	for "_i2" from 0 to _grpSize do {
		_newUnit = _newGrp createUnit [(selectRandom _unitsPool), _pos, [], 5, "NONE"];
		_newUnit setVariable ["BIS_WL_parentSector", _sector];
		_newUnit call BIS_fnc_WL2_newAssetHandle;
		_units pushBack _newUnit;

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
};

[_units] spawn BIS_fnc_WL2_assetRelevanceCheck;