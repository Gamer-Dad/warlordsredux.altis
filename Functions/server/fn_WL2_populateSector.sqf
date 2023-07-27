params ["_sector", "_side"];

if (_sector getVariable ["BIS_WL_aiSpawned", false]) exitWith {};

_sector setVariable ["BIS_WL_aiSpawned", true];
private _spawnPosArr = _sector call BIS_fnc_WL2_findSpawnPositions;
private _connectedToBase = count ([BIS_WL_base1, BIS_WL_base2] arrayIntersect (_sector getVariable "BIS_WL_connectedSectors")) > 0;

//adjusting nearroads value below should change spawn slots for non-hard coded towns.
// Orginal if (_side == BIS_WL_localSide)
if (_side == BIS_WL_localSide) then {
	if (count (_sector getVariable "BIS_WL_vehiclesToSpawn") == 0) then {
		private _roads = ((_sector nearRoads 400) select {count roadsConnectedTo _x > 0}) inAreaArray (_sector getVariable "objectAreaComplete");
		if (count _roads > 0) then {
			private _road = selectRandom _roads;
			_vehicleArray = [position _road, _road getDir selectRandom (roadsConnectedTo _road), selectRandomWeighted (BIS_WL_factionVehicleClasses # (BIS_WL_sidesArray find _side)), _side] call BIS_fnc_spawnVehicle;
			_vehicleArray params ["_vehicle", "_crew", "_group"];
			if !(_vehicle isKindOf "Man") then {
				_vehicle spawn DAPS_fnc_RegisterVehicle;
			};
			
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

			[_asset, 2] remoteExec ["lock", (owner _vehicle)];
		};
	} else {
		private _roads = ((_sector nearRoads 400) select {count roadsConnectedTo _x > 0}) inAreaArray (_sector getVariable "objectAreaComplete");
		{
			private _road = selectRandom _roads;
			_vehicleInfo = _x;
			_vehicleInfo params ["_type", "_pos", "_dir", "_lock", "_waypoints"];
			_vehicleArray = [_pos, _dir, _type, _side] call BIS_fnc_spawnVehicle;
			_vehicleArray params ["_vehicle", "_crew", "_group"];

			if !(_vehicle isKindOf "Man") then {
				_vehicle spawn DAPS_fnc_RegisterVehicle;
			};
			
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
			[_asset, 2] remoteExec ["lock", (owner _vehicle)];
		} forEach (_sector getVariable "BIS_WL_vehiclesToSpawn");
	}; 
	//below is heli/jet spawn code 
	if (!_connectedToBase && "H" in (_sector getVariable "BIS_WL_services")) then {
		private _neighbors = (_sector getVariable "BIS_WL_connectedSectors") select {(_x getVariable "BIS_WL_owner") == _side};
		
		if (count _neighbors > 0) then {
			_vehicleArray = [position selectRandom _neighbors, 0, selectRandomWeighted (BIS_WL_factionAircraftClasses # (BIS_WL_sidesArray find _side)), _side] call BIS_fnc_spawnVehicle;
			_vehicleArray params ["_vehicle", "_crew", "_group"];
			if !(_vehicle isKindOf "Man") then {
				_vehicle spawn DAPS_fnc_RegisterVehicle;
			};
			
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
			[_asset, 2] remoteExec ["lock", (owner _vehicle)];
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
	
	for [{_i2 = 0}, {_i2 < _grpSize && _i < _garrisonSize}, {_i2 = _i2 + 1; _i = _i + 1}] do {
		_newUnit = _newGrp createUnit [selectRandomWeighted _unitsPool, _pos, [], 5, "NONE"];
		_newUnit setVariable ["BIS_WL_parentSector", _sector];
		[objNull, _newUnit] spawn BIS_fnc_WL2_newAssetHandle;
	};
	
	_newGrp setBehaviour "COMBAT";
	_newGrp setSpeedMode "LIMITED";
	[_newGrp, 0] setWaypointPosition [_pos, 0];
	_newGrp deleteGroupWhenEmpty TRUE;
	
	for [{_i3 = 0}, {_i3 < 5}, {_i3 = _i3 + 1}] do {
		_newWP = _newGrp addWaypoint [selectRandom _spawnPosArr, 0];
	};
	
	_newWP = _newGrp addWaypoint [_pos, 0];
	_newWP setWaypointType "CYCLE";
};

{
	_l = (vehicles + allUnits) select {(typeOf _x != "Logic") && {(alive _x) && {side group _x != civilian}}};
	_x addCuratorEditableObjects [_l, true];
} forEach allCurators;