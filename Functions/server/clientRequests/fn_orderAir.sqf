params ["_sender", "_pos", "_class", "_cost"];

if !(isServer) exitWith {};

_asset = objNull;
private _owner = owner _sender;
_uid = getPlayerUID _sender;

if (_class == "B_UAV_02_dynamicLoadout_F" || _class == "B_T_UAV_03_dynamicLoadout_F" || _class == "B_UAV_05_F" || _class == "O_UAV_02_dynamicLoadout_F" || _class == "O_T_UAV_04_CAS_F") then {
	if (isNil {((_pos nearObjects ["Logic", 10]) select {count (_x getVariable ["BIS_WL_runwaySpawnPosArr", []]) > 0}) # 0}) then {
		_sector = (((BIS_WL_allSectors) select {((_x distance2D _pos) < 15)}) # 0);
		_array = (_sector call BIS_fnc_WL2_findSpawnPositions);
		_pos1 = (_array # (_array findIf {(((abs ([_x, 0] call BIS_fnc_terrainGradAngle)) < 5) && ((abs ([_x, 90] call BIS_fnc_terrainGradAngle)) < 5))}));
		_posFinal = _pos1 findEmptyPosition [0, 20, _class];
		if (count _posFinal == 0) then {
			_posFinal = _pos1;
		};
		//systemchat format ["Code block #1 run, Spawned: %1", _class];
		_asset = createVehicle [_class, _posFinal, [], 0, "NONE"];
		_grp = createVehicleCrew _asset;
		_grp deleteGroupWhenEmpty true;
		{
			_member = _x;
			_member setVariable ["BIS_WL_ownerAsset", _uid, [2, _owner]];
		} forEach units _grp;
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
		//systemchat format ["Code block #2 run, Spawned: %1", _class];
		_asset = createVehicle [_class, _spawnPos, [], 0, "NONE"];
		_grp = createVehicleCrew _asset;
		_grp deleteGroupWhenEmpty true;
		{
			_member = _x;
			_member setVariable ["BIS_WL_ownerAsset", _uid, [2, _owner]];
		} forEach units _grp;
		_asset setDir _dir;
	};
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
		//systemchat format ["Code block #3 run, Spawned: %1", _class];
		_asset = createVehicle [_class, _spawnPos, [], 0, "NONE"];
		_asset setDir _dir;
	} else {
		if (_class == "B_UAV_01_F" || {(_class == "O_UAV_01_F") || {(_class ==  "B_UAV_06_F") || {_class ==  "O_UAV_06_F"}}}) then {
			_asset = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
			createVehicleCrew _asset;
			(group _asset) deleteGroupWhenEmpty true;
		} else {
			if (isNil {((_pos nearObjects ["Logic", 10]) select {count (_x getVariable ["BIS_WL_runwaySpawnPosArr", []]) > 0}) # 0}) then {
				_sector = (((BIS_WL_allSectors) select {((_x distance2D _pos) < 15)}) # 0);
				_array = (_sector call BIS_fnc_WL2_findSpawnPositions);
				_pos1 = (_array # (_array findIf {(((abs ([_x, 0] call BIS_fnc_terrainGradAngle)) < 5) && ((abs ([_x, 90] call BIS_fnc_terrainGradAngle)) < 5))}));
				_posFinal = _pos1 findEmptyPosition [0, 20, _class];
				if (count _posFinal == 0) then {
					_posFinal = _pos1;
					//systemchat "findEmptyPosition failed, backup mode";
				};
				//systemchat format ["Code block #4 run, Spawned: %1", _class]; //Heli spawn code, non airport sectors
				_asset = createVehicle [_class, _posFinal, [], 0, "NONE"];
				_asset setDir 0;
								
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

				if (count _spawnPos == 0) exitWith {
					diag_log format ["Ordering aircraft failed. Spawn position not found in sector %1.", _sector getVariable "BIS_WL_name"];
					"No suitable spawn position found. Clear the runways." remoteExec ["systemChat", _owner];
					_sender setVariable ["BIS_WL_isOrdering", false, [2, _owner]];
					
					// refund if nothing spawned
					(_cost) call BIS_fnc_WL2_fundsDatabaseWrite;
				};

				_asset = createVehicle [_class, _spawnPos, [], 0, "NONE"];
				_asset setDir _dir;
			};
		};
	};
};

waitUntil {sleep 0.1; !(isNull _asset)};
_asset enableWeaponDisassembly false;
_asset setVehicleReportRemoteTargets true;
_asset setVehicleReceiveRemoteTargets true;
_asset setVehicleReportOwnPosition true;

//Buzzard CSAT Hex Camo
if (typeOf _asset == "I_Plane_Fighter_03_dynamicLoadout_F") then {
	{
		_asset setObjectTextureGlobal [_forEachIndex, _x];
	} forEach (getArray (configfile >> "CfgVehicles" >> typeof _asset >> "textureSources" >> "Hex" >> "textures"));
};

//Gryphon Digital Grey Camo
if (typeOf _asset == "I_Plane_Fighter_04_F") then {
	{
		_asset setObjectTextureGlobal [_forEachIndex, _x];
	} forEach (getArray (configfile >> "CfgVehicles" >> typeof _asset >> "textureSources" >> "DigitalCamoGrey" >> "textures"));
};

if ("120Rnd_CMFlare_Chaff_Magazine" in (_asset magazinesTurret [-1])) then {
		_asset addMagazineTurret ["120Rnd_CMFlare_Chaff_Magazine", [-1], 120]
};

_asset setVariable ["BIS_WL_ownerAsset", _uid, [2, _owner]];
_asset setOwner _owner;
[_asset, _sender] remoteExec ["BIS_fnc_WL2_newAssetHandle", _owner];
_sender setVariable ["BIS_WL_isOrdering", false, [2, _owner]];