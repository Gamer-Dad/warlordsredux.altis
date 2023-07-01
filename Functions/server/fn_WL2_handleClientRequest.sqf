#include "..\warlords_constants.inc"

params ["_sender", "_action", "_cost", "_pos", "_target", "_isStatic"];

_playerFunds = ((serverNamespace getVariable "fundsDatabase") get (getPlayerUID _sender));

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
		case "kill" : {
			if ((owner _sender) == _cost) then {
				_sender setDamage 1;
			};
		};
		case "repair" : {
			if ((!isNil {_cost}) && {_cost <= serverTime}) then {
				_target setDamage _pos;
			};
		};
		case "scan" : {
			_hasFunds = (_playerFunds >= _cost);
			if (_hasFunds) then {
				_target setVariable [format ["BIS_WL_lastScanEnd_%1", side _sender], serverTime + WL_SCAN_DURATION, TRUE];

				private _uid = getPlayerUID _sender;
				[_uid, -_cost] call BIS_fnc_WL2_fundsDatabaseWrite;
			};
		};
		case "targetReset": {
			_hasFunds = (_playerFunds >= _cost);
			if (_hasFunds) then {
				missionNamespace setVariable [format ["BIS_WL_targetResetVotingSince_%1", side _sender], serverTime, true];
				missionNamespace setVariable [format ["BIS_WL_targetResetOrderedBy_%1", side _sender], name _sender, true];

				_sender setVariable ["BIS_WL_targetResetVote", 1, [2, (owner _sender)]];
			};
		};
		case "lastLoadout": {
			_hasFunds = (_playerFunds >= _cost);
			if (_hasFunds) then {
				0 remoteExecCall ["BIS_fnc_WL2_orderLastLoadout", (owner _sender)];

				private _uid = getPlayerUID _sender;
				[_uid, -_cost] call BIS_fnc_WL2_fundsDatabaseWrite;
			};
		};
		case "savedLoadout": {
			_hasFunds = (_playerFunds >= _cost);
			if (_hasFunds) then {
				["apply"] remoteExecCall ["BIS_fnc_WL2_orderSavedLoadout", (owner _sender)];

				private _uid = getPlayerUID _sender;
				[_uid, -_cost] call BIS_fnc_WL2_fundsDatabaseWrite;
			};
		};
		case "orderFTVehicle": {
			_hasFunds = (_playerFunds >= _cost);
			if (_hasFunds) then {
				if (_target == west) then {
					if ((count ((entities "B_Truck_01_medical_F") select {alive _x})) == 0) then {
						_asset = createVehicle ["B_Truck_01_medical_F", _sender, [], 0, "NONE"];
						[_sender, _asset] remoteExecCall ["BIS_fnc_WL2_newAssetHandle", (owner _sender)];
					};
				} else {
					if ((count ((entities "O_Truck_03_medical_F") select {alive _x})) == 0) then {
						_asset = createVehicle ["O_Truck_03_medical_F", _sender, [], 0, "NONE"];
						[_sender, _asset] remoteExecCall ["BIS_fnc_WL2_newAssetHandle", (owner _sender)];
					};
				};

				private _uid = getPlayerUID _sender;
				[_uid, -_cost] call BIS_fnc_WL2_fundsDatabaseWrite;
			};
		};
		case "orderFTPod": {
			_hasFunds = (_playerFunds >= _cost);
			if (_hasFunds) then {
				if (_target == west) then {
					if ((count (entities "B_Slingload_01_Medevac_F")) == 0) then {
						_asset = createVehicle ["B_Slingload_01_Medevac_F", _sender, [], 0, "NONE"];
						[_sender, _asset] remoteExecCall ["BIS_fnc_WL2_newAssetHandle", (owner _sender)];
					};
				} else {
					if ((count (entities "Land_Pod_Heli_Transport_04_medevac_F")) == 0) then {
						_asset = createVehicle ["Land_Pod_Heli_Transport_04_medevac_F", _sender, [], 0, "NONE"];
						[_sender, _asset] remoteExecCall ["BIS_fnc_WL2_newAssetHandle", (owner _sender)];
					};
				};

				private _uid = getPlayerUID _sender;
				[_uid, -_cost] call BIS_fnc_WL2_fundsDatabaseWrite;
			};
		};
		case "fastTravelContested": {
			_hasFunds = (_playerFunds >= _cost);
			if (_hasFunds) then {
				_sender setVehiclePosition [_pos, [], 2, "NONE"];

				private _uid = getPlayerUID _sender;
				[_uid, -_cost] call BIS_fnc_WL2_fundsDatabaseWrite;
			};
		};
		case "fastTravel": {
			_sender setVehiclePosition [_pos, [], 3, "NONE"];
		};
		case "orderArsenal": {
			_hasFunds = (_playerFunds >= _cost);
			if (_hasFunds) then {
				0 remoteExecCall ["BIS_fnc_WL2_orderArsenal", (owner _sender)];
				private _uid = getPlayerUID _sender;
				[_uid, -_cost] call BIS_fnc_WL2_fundsDatabaseWrite;				
			};
		};
		case "orderAI" : {
			private _uid = getPlayerUID _sender;
			[_uid, -_cost] call BIS_fnc_WL2_fundsDatabaseWrite;		
		};
		case "orderAsset": {
			_hasFunds = (_playerFunds >= _cost);
			if (_hasFunds) then {
				private _class = _target;
				private _asset = objNull;
				
				_targetPos = _pos;
				if (_class isKindOf "Ship") then {
					_asset = createVehicle [_class, (_pos vectorAdd [0,0,3]), [], 0, "CAN_COLLIDE"];
				} else {
					if (_class isKindOf "Air") then {
						if (_class == "B_UAV_02_dynamicLoadout_F" || _class == "B_T_UAV_03_dynamicLoadout_F" || _class == "B_UAV_05_F" || _class == "O_UAV_02_dynamicLoadout_F" || _class == "O_T_UAV_04_CAS_F") then {
							if (isNil {((_targetPos nearObjects ["Logic", 10]) select {count (_x getVariable ["BIS_WL_runwaySpawnPosArr", []]) > 0}) # 0}) then {
								_sector = (((BIS_WL_allSectors) select {((_x distance _targetPos) < 15)}) # 0);
								_array = (_sector call BIS_fnc_WL2_findSpawnPositions);
								_pos1 = (_array # (_array findIf {(((abs ([_x, 0] call BIS_fnc_terrainGradAngle)) < 5) && ((abs ([_x, 90] call BIS_fnc_terrainGradAngle)) < 5))}));
								_posFinal = _pos1 findEmptyPosition [0, 20, _class];
								_asset = createVehicle [_class, _posFinal, [], 5, "NONE"];
								_asset setDir 0;
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

								_asset = createVehicle [_class, _spawnPos, [], 0, "NONE"];
								_asset setDir _dir;
								_asset setDamage 0;
								_asset setFuel 1;
							};

							//Code to allow Both sides to use a drone of the other side. and code to allow for air drones.
							createVehicleCrew _asset;
							_side = side _sender; 
							_group = createGroup _side;
							(crew _asset) joinSilent _group;
							(group _asset) deleteGroupWhenEmpty true;
							switch (side group _sender) do {
								case west: {
									(vestContainer _sender) addItemCargoGlobal ["B_UavTerminal", 1];
								};
								case east: {
									(vestContainer _sender) addItemCargoGlobal ["O_UavTerminal", 1];
								};
							};
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

								_asset = createVehicle [_class, _spawnPos, [], 0, "NONE"];
								_asset setDir _dir;
								_asset setDamage 0;
								_asset setFuel 1;
							} else {
								if (_class == "B_UAV_01_F" || _class == "O_UAV_01_F") then {
									_asset = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
									_asset setDir 0;
									_asset setDamage 0;
									_asset setFuel 1;
									
									//Code to allow Both sides to use a drone of the other side. and code to allow for air drones.
									createVehicleCrew _asset;
									_side = side _sender; 
									_group = createGroup _side;
									(crew _asset) joinSilent _group;
									(group _asset) deleteGroupWhenEmpty true;
									switch (side group _sender) do {
										case west: {
											(vestContainer _sender) addItemCargoGlobal ["B_UavTerminal", 1];
										};
										case east: {
											(vestContainer _sender) addItemCargoGlobal ["O_UavTerminal", 1];
										};
									};
								} else {
									if (isNil {((_targetPos nearObjects ["Logic", 10]) select {count (_x getVariable ["BIS_WL_runwaySpawnPosArr", []]) > 0}) # 0}) then {
										_sector = (((BIS_WL_allSectors) select {((_x distance _targetPos) < 15)}) # 0);
										_array = (_sector call BIS_fnc_WL2_findSpawnPositions);
										_pos1 = (_array # (_array findIf {(((abs ([_x, 0] call BIS_fnc_terrainGradAngle)) < 5) && ((abs ([_x, 90] call BIS_fnc_terrainGradAngle)) < 5))}));
										_posFinal = _pos1 findEmptyPosition [0, 20, _class];
										_asset = createVehicle [_class, _posFinal, [], 5, "NONE"];
										_asset setDir 0;
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

										_asset = createVehicle [_class, _spawnPos, [], 0, "NONE"];
										_asset setDir _dir;
										_asset setDamage 0;
										_asset setFuel 1;
									};
								};
							};
						};
					} else {
						if (_isStatic) then {
							_asset = createVehicle [_class, [(_targetPos # 0), (_targetPos # 1), 0], [], 0, "CAN_COLLIDE"];
							_asset setDir direction _sender;
							_asset enableWeaponDisassembly false;
							if (getNumber (configFile >> "CfgVehicles" >> _class >> "isUav") == 1) then {
								//Code to allow Both sides to use a drone of the other side.
								createVehicleCrew _asset;
								_side = side _sender; 
								_group = createGroup _side;
								(crew _asset) joinSilent _group;
								(group _asset) deleteGroupWhenEmpty true;
								switch (side group _sender) do {
									case west: {
										(vestContainer _sender) addItemCargoGlobal ["B_UavTerminal", 1];
									};
									case east: {
										(vestContainer _sender) addItemCargoGlobal ["O_UavTerminal", 1];
									};
								};
							};
						} else {
							_asset = createVehicle [_class, _targetPos, [], 0, "CAN_COLLIDE"];
							_asset setDir direction _sender;
						};
					};
				}; 

				private _uid = getPlayerUID _sender;
				[_uid, -_cost] call BIS_fnc_WL2_fundsDatabaseWrite;

				if !(typeOf _asset == "B_Truck_01_medical_F" || typeOf _asset == "O_Truck_03_medical_F") then {
					_asset lock true;
				} else {
					_asset lock 0;
				};
				
				_assetVariable = call BIS_fnc_WL2_generateVariableName;
				_asset setVehicleVarName _assetVariable;
				[_asset, _assetVariable] remoteExec ["setVehicleVarName", (owner _sender)];
				(owner _sender) publicVariableClient _assetVariable;
				[_asset, _sender, _isStatic] spawn _setOwner;
				_asset setOwner (owner _sender);
				[_sender, _asset] remoteExecCall ["BIS_fnc_WL2_newAssetHandle", (owner _sender)];

				waitUntil {sleep 0.1; !(isNull _asset)};
			};
			_sender setVariable ["BIS_WL_isOrdering", false, [2, (owner _sender)]];
		};
		case "fundsTransferBill": {
			private _uid = getPlayerUID _sender;
			[_uid, -2000] call BIS_fnc_WL2_fundsDatabaseWrite;
			serverNamespace setVariable [format ["BIS_WL_isTransferring_%1", _uid], true];
		};
		case "fundsTransferCancel": {
			private _uid = getPlayerUID _sender;
			if (serverNamespace getVariable (format ["BIS_WL_isTransferring_%1", _uid])) then {
				[_uid, 2000] call BIS_fnc_WL2_fundsDatabaseWrite;
				serverNamespace setVariable [format ["BIS_WL_isTransferring_%1", _uid], false];
			};
		};
		case "fundsTransfer": {
			if (_playerFunds >= _cost) then {
				_targetUID = getPlayerUID _target;
				_uid = getPlayerUID _sender;
				_recipient = _targetUID call BIS_fnc_getUnitByUID;

				[_targetUID, _cost] call BIS_fnc_WL2_fundsDatabaseWrite;
				[_uid, -_cost] call BIS_fnc_WL2_fundsDatabaseWrite;
				serverNamespace setVariable [format ["BIS_WL_isTransferring_%1", _uid], false];
				[_sender, _recipient, _cost] remoteExecCall ["BIS_fnc_WL2_displayCPtransfer", -2];
			};
		};
	};
};