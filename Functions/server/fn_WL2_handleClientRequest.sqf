#include "..\warlords_constants.inc"

params ["_sender", "_action", "_cost", "_pos", "_target", "_isStatic"];

_assetVar = "";
_playerFunds = ((serverNamespace getVariable "fundsDatabase") get (getPlayerUID _sender));
_hasFunds  = (_playerFunds >= _cost);

_processTargetPos = {
	params ["_pos"];
	private _targetPosFinalArr = [];
	private _targetPosFinal = [];
	_pos = getPosATL _pos;
	
	if !(surfaceIsWater _pos) then {
		_nearSectorArr = _pos nearObjects ["Logic", 10];
		
		if (count _nearSectorArr == 0) then {
			_targetPosFinalArr = [_sender, nil, FALSE, _sender] call BIS_fnc_WL2_findSpawnPositions;
		} else {
			_sector = _nearSectorArr # 0;
			_targetPosFinalArr = [_sector, nil, FALSE, if (_sender inArea (_sector getVariable "objectAreaComplete")) then {_sender}] call BIS_fnc_WL2_findSpawnPositions;
		};
	} else {
		_targetPosFinalArr = [_pos];
	};

	if (count _targetPosFinalArr > 0) then {
		_targetPosFinal = selectRandom _targetPosFinalArr;
	} else {
		_targetPosFinal = [_pos, random 10, random 100] call BIS_fnc_relPos;
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
		case "targetReset": {
			if (_hasFunds) then {
				missionNamespace setVariable [format ["BIS_WL_targetResetVotingSince_%1", side _sender], WL_SYNCED_TIME, true];
				missionNamespace setVariable [format ["BIS_WL_targetResetOrderedBy_%1", side _sender], name _sender, true];

				_sender setVariable ["BIS_WL_targetResetVote", 1, TRUE];
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
				private _asset = if (_target == west) then {
					createVehicle ["B_Truck_01_medical_F", _sender, [], 0, "NONE"];
				} else  {
					createVehicle ["O_Truck_03_medical_F", _sender, [], 0, "NONE"];
				};
				if (_target == west) then {
					missionNamespace setVariable ["ftVehicleExistsBlu", true, true];
				} else  {
					missionNamespace setVariable ["ftVehicleExistsOpf", true, true];
				};
				[_sender, _asset] remoteExec ["BIS_fnc_WL2_newAssetHandle", (owner _sender)];

				private _uid = getPlayerUID _sender;
				[_uid, -_cost] spawn BIS_fnc_WL2_fundsDatabaseWrite;
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
		};
		case "orderAsset": {
			if (_hasFunds) then {
				private _class = _target;
				private _asset = objNull;
				
				_targetPos = _pos;
				_targetPosFinal = if (_isStatic) then {_targetPos} else {( call _processTargetPos) # 0};
				
				if (_class isKindOf "Ship") then {
					_asset = createVehicle [_class, _targetPosFinal, [], 0, "CAN_COLLIDE"];
					_asset setPos (_targetPosFinal vectorAdd [0,0,3]);
				} else {
					if (_class isKindOf "Air") then {
						if (_class == "B_UAV_02_dynamicLoadout_F" || _class == "B_T_UAV_03_dynamicLoadout_F" || _class == "B_UAV_05_F" || _class == "O_UAV_02_dynamicLoadout_F" || _class == "O_T_UAV_04_CAS_F") then {
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

							_asset = createVehicle [_class, _spawnPos, [], 0, "NONE"];
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
							_isPlane = (toLower getText (configFile >> "CfgVehicles" >> _class >> "simulation")) in ["airplanex", "airplane"] && !(_class isKindOf "VTOL_Base_F");
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
								_asset = createVehicle [_class, _spawnPos, [], 0, "NONE"];
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
								_asset = createVehicle [_class, _spawnPos, [], 0, "NONE"];
								_asset setDir _dir;
								_asset setDamage 0;
								_asset setFuel 1;
							};
						};
					} else {
						if (_isStatic) then {
							_asset = createVehicle [_class, _targetPos, [], 0, "CAN_COLLIDE"];
							_targetPos set [2, (_targetPos # 2) max 0];
							_asset setDir direction _sender;
							_asset setPos _targetPos;
							_asset enableWeaponDisassembly false;
							if (getNumber (configFile >> "CfgVehicles" >> _class >> "isUav") == 1) then {
								//Code to allow Both sides to use a drone of the other side.
								createVehicleCrew _asset;
								_side = side _sender; 
								_group = createGroup _side;
								(crew _asset) joinSilent _group;
								(effectiveCommander _asset) setSkill 1;
								(group effectiveCommander _asset) deleteGroupWhenEmpty TRUE;
							};
						} else {
							if (_class isKindOf "Man") then {
								private _playerPos = getPosATL _sender;
								_asset = (group _sender) createUnit [_class, _playerPos, [], 0, "NONE"];
								_asset setVariable ["BIS_WL_Owned_By", getPlayerUID _sender, true];
							} else { // Vehicle creation code
								private _playerPos = getPosATL _sender;
								_asset = createVehicle [_class, _playerPos, [], 0, "NONE"];
							};
						};

						if (_class == "B_UAV_01_F" || _class == "O_UAV_01_F") then {
							//Code to allow Both sides to use a drone of the other side.
							createVehicleCrew _asset;
							_side = side _sender; 
							_group = createGroup _side;
							(crew _asset) joinSilent _group;
							(effectiveCommander _asset) setSkill 1;
							(group effectiveCommander _asset) deleteGroupWhenEmpty TRUE;
							_asset enableWeaponDisassembly fasle;
						};
					};
				}; 
				
				_assetVariable = call BIS_fnc_WL2_generateVariableName;
				_asset setVehicleVarName _assetVariable;
				missionNamespace setVariable [_assetVariable, _asset];
				[_asset, _assetVariable] remoteExec ["setVehicleVarName", _sender];
				(owner _sender) publicVariableClient _assetVariable;
				[_asset, _sender, _isStatic] spawn _setOwner;
				[_sender, _asset] remoteExec ["BIS_fnc_WL2_newAssetHandle", (owner _sender)];

				private _uid = getPlayerUID _sender;
				[_uid, -_cost] spawn BIS_fnc_WL2_fundsDatabaseWrite;
				
				if (typeOf _asset == "I_Truck_02_MRL_F") then { //Zamak MLRS
					_asset setObjectTextureGlobal [0, "A3\armor_f_gamma\mbt_01\data\mbt_01_scorcher_hexarid_co.paa"]; //Zamak cabin
					_asset setObjectTextureGlobal [2, "A3\armor_f_gamma\mbt_01\data\mbt_01_scorcher_hexarid_co.paa"]; //Zamak Bed&Launcher                
				};

				if (typeOf _asset == "B_APC_Wheeled_03_cannon_F") then {
					_asset setObjectTextureGlobal [0, "A3\armor_f_gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext_co.paa"];
					_asset setObjectTextureGlobal [1, "A3\armor_f_gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext2_co.paa"];
					_asset setObjectTextureGlobal [2, "A3\armor_f_gamma\APC_Wheeled_03\Data\rcws30_co.paa"];
					_asset setObjectTextureGlobal [3, "A3\armor_f_gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext_alpha_co.paa"];
				};
				
				if (typeOf _asset == "B_AAA_System_01_F") then { //Praetorian
					private _side = side (crew _asset select 0);
					if (_side == east) then {
						_asset setObjectTextureGlobal [0, "A3\static_f_jets\AAA_System_01\data\AAA_system_01_olive_co.paa"];
						_asset setObjectTextureGlobal [1, "A3\static_f_jets\AAA_System_01\data\AAA_system_02_olive_co.paa"];
					};
				} else {
					if (typeOf _asset == "B_SAM_System_01_F") then { //Spartan
						private _side = side (crew _asset select 0);
						if (_side == east) then {
							_asset setObjectTextureGlobal [0, "A3\static_f_jets\SAM_System_01\data\SAM_system_01_olive_co.paa"];
						};
					} else {
						if (typeOf _asset == "B_SAM_System_02_F") then { //Centurion
							private _side = side (crew _asset select 0);
							if (_side == east) then {
								_asset setObjectTextureGlobal [0, "A3\static_f_jets\SAM_System_02\data\SAM_system_02_olive_co.paa"];
							};
						};
					};
				};
			};
		};
		case "fundsTransfer": {
			if (_playerFunds >= (_cost + 2000)) then {
				_targetUID = getPlayerUID _target;
				_uid = getPlayerUID _sender;
				_recipient = _targetUID call BIS_fnc_getUnitByUID;

				[_targetUID, _cost] spawn BIS_fnc_WL2_fundsDatabaseWrite;
				[_uid, -(_cost + 2000)] spawn BIS_fnc_WL2_fundsDatabaseWrite;

				[_sender, _recipient, _amount] remoteExec ["BIS_fnc_WL2_displayCPtransfer", -2];
			};
		};
		case "requestBounty": {
			if (_hasFunds) then {
			_targetUID = getPlayerUID _target;
			_uid = getPlayerUID _sender;
			[_uid, -_cost] spawn BIS_fnc_WL2_fundsDatabaseWrite;
			_target setVariable [format ["BIS_WL_Bounty_%1", _targetUID], _cost, true];
			[format ["%1 set a bounty off %3CP on %2's head.", name _sender, name _target, _cost]] remoteExec ["systemChat", -2];
			};
		};
	};
};