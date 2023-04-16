#include "..\warlords_constants.inc"

params ["_sender", "_action", "_cost", "_pos", "_target"];
_assetVar = "";
_playerFunds = ((serverNamespace getVariable "fundsDatabase") get (getPlayerUID _sender));
_hasFunds  = (_playerFunds >= _cost);

_processTargetPos = {
	private _targetPosFinalArr = [];
	private _targetPosFinal = [];
	
	if !(surfaceIsWater _targetPos) then {
		_nearSectorArr = _targetPos nearObjects ["Logic", 10];
		
		if (count _nearSectorArr == 0) then {
			_targetPosFinalArr = [_sender, nil, FALSE, _sender] call BIS_fnc_WL2_findSpawnPositions;
		} else {
			_sector = _nearSectorArr # 0;
			_targetPosFinalArr = [_sector, nil, FALSE, if (_sender inArea (_sector getVariable "objectAreaComplete")) then {_sender}] call BIS_fnc_WL2_findSpawnPositions;
		};
	} else {
		_targetPosFinalArr = [_targetPos];
	};

	if (count _targetPosFinalArr > 0) then {
		_targetPosFinal = selectRandom _targetPosFinalArr;
	} else {
		_targetPosFinal = [_targetPos, random 10, random 100] call BIS_fnc_relPos;
	};
	
	[_targetPosFinal, _targetPosFinalArr]
};

_setOwner = {
	params ["_asset", "_sender", ["_isStatic", FALSE]];
	if (_asset isKindOf "Man") exitWith {};
	if (isMultiplayer) then {
		if !(_isStatic) then {
			waitUntil {sleep WL_TIMEOUT_SHORT; {uniform _x == "U_VirtualMan_F"} count crew _asset == 0};
		};
		_i = 0;
		if (count crew _asset > 0 && _isStatic) then {
			_assetGrp = group effectiveCommander _asset;
			while {!(_assetGrp setGroupOwner (owner _sender)) && _i < 50} do {
				_i = _i + 1;
				_assetGrp setGroupOwner (owner _sender);
				sleep WL_TIMEOUT_SHORT;
			};
		};
		_i = 0;
		while {!(_asset setOwner (owner _sender)) && (owner _asset) != (owner _sender) && _i < 50} do {
			_i = _i + 1;
			_asset setOwner (owner _sender);
			sleep WL_TIMEOUT_SHORT;
		};
	};
};

if !(isNull _sender) then {
	switch (_action) do {
		case "scan" : {
			if (_hasFunds) then {
				_target setVariable [format ["BIS_WL_lastScanEnd_%1", side _sender], WL_SYNCED_TIME + WL_SCAN_DURATION, TRUE];

				private _uid = getPlayerUID _sender;
				[_uid, -_cost] spawn BIS_fnc_WL2_fundsDatabaseWrite;
			};
		};
		case "lastLoadout": {
			if (_hasFunds) then {
				0 remoteExec ["BIS_fnc_WL2_orderLastLoadout", (owner _sender)];

				private _uid = getPlayerUID _sender;
				[_uid, -_cost] spawn BIS_fnc_WL2_fundsDatabaseWrite;
			};
		};
		case "savedLoadout": {
			if (_hasFunds) then {
				["apply"] remoteExec ["BIS_fnc_WL2_orderSavedLoadout", (owner _sender)];

				private _uid = getPlayerUID _sender;
				[_uid, -_cost] spawn BIS_fnc_WL2_fundsDatabaseWrite;
			};
		};
		case "orderFTVehicle": {
			if (_hasFunds) then {
				
			};
		};
		case "fastTravelContested": {
			if (_hasFunds) then {
				private _tagAlong = (units group _sender) select {_x distance2D _sender <= WL_FAST_TRAVEL_TEAM_RADIUS && vehicle _x == _x};
				{
					_x setVehiclePosition [_pos, [], 2, "NONE"];
				} forEach _tagAlong;

				private _uid = getPlayerUID _sender;
				[_uid, -_cost] spawn BIS_fnc_WL2_fundsDatabaseWrite;
			};
		};
		case "orderArsenal": {
			if (_hasFunds) then {
				0 remoteExec ["BIS_fnc_WL2_orderArsenal", (owner _sender)];
				private _uid = getPlayerUID _sender;
				[_uid, -_cost] spawn BIS_fnc_WL2_fundsDatabaseWrite;				
			};
		}:
		case "orderAsset": {
			if (_hasFunds) then {
				_params params ["_assetVar", "_className", "_targetPos", "_isStatic", "_disable"];
				private _asset = objNull;
				
				private _isStatic = call compile _isStatic;
				private _disable = call compile _disable;
				
				_targetPos = call compile _targetPos;
				_targetPosFinal = if (_isStatic) then {_targetPos} else {(call _processTargetPos) # 0};
				
				if (_className isKindOf "Ship") then {
					_asset = createVehicle [_className, _targetPosFinal, [], 0, "CAN_COLLIDE"];
					_asset setPos (_targetPosFinal vectorAdd [0,0,3]);
				} else {
					if (_className isKindOf "Air") then {
						if (_className == "B_UAV_02_dynamicLoadout_F" || _className == "B_T_UAV_03_dynamicLoadout_F" || _className == "B_UAV_05_F" || _className == "O_UAV_02_dynamicLoadout_F" || _className == "O_T_UAV_04_CAS_F") then {
							private _sector = ((_targetPos nearObjects ["Logic", 10]) select {count (_x getVariable ["BIS_WL_runwaySpawnPosArr", []]) > 0}) # 0;
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
							if (count _spawnPos == 0) then {
								_spawnPos = _targetPosFinal;
							};

							_asset = createVehicle [_className, _spawnPos, [], 0, "NONE"];
							_asset setDir _dir;
							_asset setDamage 0;
							_asset setFuel 1;

							//Code to allow Both sides to use a drone of the other side. and code to allow for air drones.
							createVehicleCrew _asset;
							_side = side _sender; 
							_group = createGroup _side;
							(crew _asset) joinSilent _group;
							(effectiveCommander _asset) setSkill 1;
							(group effectiveCommander _asset) deleteGroupWhenEmpty TRUE;
						} else {
							_isPlane = (toLower getText (configFile >> "CfgVehicles" >> _className >> "simulation")) in ["airplanex", "airplane"] && !(_className isKindOf "VTOL_Base_F");
							if (_isPlane) then {
								private _sector = ((_targetPos nearObjects ["Logic", 10]) select {count (_x getVariable ["BIS_WL_runwaySpawnPosArr", []]) > 0}) # 0;
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
								if (count _spawnPos == 0) then {
									_spawnPos = _targetPosFinal;
								};
								_asset = createVehicle [_className, _spawnPos, [], 0, "NONE"];
								_asset setDir _dir;
								_asset setDamage 0;
								_asset setFuel 1;
							} else {
								private _sector = ((_targetPos nearObjects ["Logic", 10]) select {count (_x getVariable ["BIS_WL_runwaySpawnPosArr", []]) > 0}) # 0;
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
								if (count _spawnPos == 0) then {
									_spawnPos = _targetPosFinal;
								};
								_asset = createVehicle [_className, _spawnPos, [], 0, "NONE"];
								_asset setDir _dir;
								_asset setDamage 0;
								_asset setFuel 1;
							};
						};
					} else {
						if (_isStatic) then {
							_asset = createVehicle [_className, _targetPos, [], 0, "CAN_COLLIDE"];
							_targetPos set [2, (_targetPos # 2) max 0];
							_asset setDir direction _sender;
							_asset setPos _targetPos;
							if (_disable) then {
								_asset enableSimulationGlobal FALSE;
								_asset hideObjectGlobal TRUE;
							} else {
								if (getNumber (configFile >> "CfgVehicles" >> _className >> "isUav") == 1) then {
									//Code to allow Both sides to use a drone of the other side.
									createVehicleCrew _asset;
									_side = side _sender; 
									_group = createGroup _side;
									(crew _asset) joinSilent _group;
									(effectiveCommander _asset) setSkill 1;
									(group effectiveCommander _asset) deleteGroupWhenEmpty TRUE;
								};
							};
						} else {
							if (_className isKindOf "Man") then {
								_asset = (group _sender) createUnit [_className, _targetPosFinal, [], 0, "NONE"];
							} else { // Vehicle creation code
								if (_className == "Box_NATO_Ammo_F" || _className == "Box_NATO_Grenades_F" || _className == "Box_NATO_Wps_F" || _className == "Box_NATO_AmmoOrd_F" || _className == "Box_NATO_WpsLaunch_F" || _className == "Box_NATO_WpsSpecial_F" || _className == "B_supplyCrate_F" || _className == "Box_NATO_AmmoVeh_F" || _className == "Box_East_Ammo_F" || _className == "Box_East_Grenades_F" || _className == "Box_East_Wps_F" || _className == "Box_East_AmmoOrd_F" || _className == "Box_East_WpsLaunch_F" || _className == "Box_East_WpsSpecial_F" || _className == "O_supplyCrate_F" || _className == "Box_East_AmmoVeh_F") then {
									_asset = createVehicle [_className, _playerPos, [], 0, "NONE"];
								} else {
									private _playerPos = getPosATL _sender;
									_asset = createVehicle [_className, _playerPos, [], 0, "NONE"];
								};
							};
						};

						if (_className == "B_UAV_01_F" || _className == "O_UAV_01_F") then {
							//Code to allow Both sides to use a drone of the other side.
							createVehicleCrew _asset;
							_side = side _sender; 
							_group = createGroup _side;
							(crew _asset) joinSilent _group;
							(effectiveCommander _asset) setSkill 1;
							(group effectiveCommander _asset) deleteGroupWhenEmpty TRUE;					
						};
					};
				}; 
				
				_asset setVehicleVarName _assetVar;
				missionNamespace setVariable [_assetVar, _asset];
				(owner _sender) publicVariableClient _assetVar;
				
				[_asset, _sender, _isStatic] spawn _setOwner;

				private _uid = getPlayerUID _sender;
				[_uid, -_cost] spawn BIS_fnc_WL2_fundsDatabaseWrite;
			};
		};
		case "fundsTransfer": {
			if (_playerFunds >= (_cost + 2000)) then {
				_targetUID = getPlayerUID _target;
				_uid = getPlayerUID _sender;

				[_targetUID, _cost] spawn BIS_fnc_WL2_fundsDatabaseWrite;
				[_uid, -(_cost + 2000)] spawn BIS_fnc_WL2_fundsDatabaseWrite;
			};
		};
	};
};