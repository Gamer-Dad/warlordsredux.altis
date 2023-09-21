params ["_sender", "_pos", "_class"];

if !(isServer) exitWith {};

_asset = objNull;
if (_class == "B_UAV_02_dynamicLoadout_F" || _class == "B_T_UAV_03_dynamicLoadout_F" || _class == "B_UAV_05_F" || _class == "O_UAV_02_dynamicLoadout_F" || _class == "O_T_UAV_04_CAS_F") then {
	if (isNil {((_pos nearObjects ["Logic", 10]) select {count (_x getVariable ["BIS_WL_runwaySpawnPosArr", []]) > 0}) # 0}) then {
		_sector = (((BIS_WL_allSectors) select {((_x distance _pos) < 15)}) # 0);
		_array = (_sector call BIS_fnc_WL2_findSpawnPositions);
		_pos1 = (_array # (_array findIf {(((abs ([_x, 0] call BIS_fnc_terrainGradAngle)) < 5) && ((abs ([_x, 90] call BIS_fnc_terrainGradAngle)) < 5))}));
		_posFinal = _pos1 findEmptyPosition [0, 20, _class];
		if (count _posFinal == 0) then {
			_posFinal = _pos1;
		};
		_asset = createVehicle [_class, _posFinal, [], 5, "NONE"];
		_asset setDir (direction _sender);
	} else {
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

		_asset = createVehicle [_class, _spawnPos, [], 0, "NONE"];
		_asset setDir _dir;
	};

	createVehicleCrew _asset;
	(group effectiveCommander _asset) deleteGroupWhenEmpty true;
} else {
	_isPlane = (toLower getText (configFile >> "CfgVehicles" >> _class >> "simulation")) in ["airplanex", "airplane"] && {!(_class isKindOf "VTOL_Base_F")};
	if (_isPlane) then {
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

		_asset = createVehicle [_class, _spawnPos, [], 0, "NONE"];
		_asset setDir _dir;
	} else {
		if (_class == "B_UAV_01_F" || {_class == "O_UAV_01_F"}) then {
			_asset = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
			private _grp = createVehicleCrew _asset;
			_grp deleteGroupWhenEmpty true;
		} else {
			if (isNil {((_pos nearObjects ["Logic", 10]) select {count (_x getVariable ["BIS_WL_runwaySpawnPosArr", []]) > 0}) # 0}) then {
				_sector = (((BIS_WL_allSectors) select {((_x distance _pos) < 15)}) # 0);
				_array = (_sector call BIS_fnc_WL2_findSpawnPositions);
				_pos1 = (_array # (_array findIf {(((abs ([_x, 0] call BIS_fnc_terrainGradAngle)) < 5) && ((abs ([_x, 90] call BIS_fnc_terrainGradAngle)) < 5))}));
				_posFinal = _pos1 findEmptyPosition [0, 20, _class];
				_asset = createVehicle [_class, _posFinal, [], 5, "NONE"];
				_asset setDir 0;
				_pos2 = getPosATL _asset;
				_asset setVehiclePosition [[_pos2 # 0, _pos2 # 1, ((_pos2 # 2) + 0.5)], [], 0, "CAN_COLLIDE"];
			} else {
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

				_asset = createVehicle [_class, _spawnPos, [], 0, "NONE"];
				_asset setDir _dir;
			};
		};
	};
};

if (unitIsUAV _asset) then {
	[_asset, 0] remoteExec ["lock", (owner _asset)];
} else {
	[_asset, 2] remoteExec ["lock", (owner _asset)];
};

[_asset, _sender, false] call BIS_fnc_WL2_setOwner;
[_sender, _asset] remoteExec ["BIS_fnc_WL2_newAssetHandle", (owner _sender)];

waitUntil {sleep 0.01; !(isNull _asset)};

_sender setVariable ["BIS_WL_isOrdering", false, [2, (owner _sender)]];