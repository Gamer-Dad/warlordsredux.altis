#include "..\warlords_constants.inc"

params ["_owner", "_asset", ["_assembled", FALSE]];

_asset addEventHandler ["Killed", {
	params ["_asset"];
	_asset setVariable ["BIS_WL_deleteAt", WL_SYNCED_TIME + (if (_asset isKindOf "Man") then {BIS_WL_corpseRemovalTimeout} else {BIS_WL_wreckRemovalTimeout}), !isServer];
}];

if (isNull _owner && isServer) then {
	_asset spawn BIS_fnc_WL2_assetRelevanceCheck;
	_asset setSkill (0.2 + random 0.3);
};

if (isPlayer _owner) then {
	_asset setVariable ["BIS_WL_ownerGrp", group _owner];
	_asset setVariable ["BIS_WL_iconText", getText (configFile >> "CfgVehicles" >> typeOf _asset >> "displayName")];
	
	_friendlyFireProtection = _asset addEventHandler ["HandleDamage", {
		params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];
		_ownerGrp = _unit getVariable ["BIS_WL_ownerGrp", objNull];
		if (group _instigator != _ownerGrp && side group _instigator == side _ownerGrp) then {0};
	}];
	
	[_asset, _friendlyFireProtection] spawn {
		params ["_asset", "_friendlyFireProtection"];
		sleep WL_ASSET_PROTECTION_DURATION;
		_asset removeEventHandler ["HandleDamage", _friendlyFireProtection];
	};

	if (_asset isKindOf "Man") then {
		_asset call BIS_fnc_WL2_sub_assetAssemblyHandle;
	
		_asset addEventHandler ["Killed", {
			BIS_WL_matesAvailable = BIS_WL_matesAvailable - 1;
			BIS_manLost = TRUE;
			[] spawn BIS_fnc_WL2_refreshOSD;
		}];
	} else {
		_asset setVariable ["BIS_WL_icon", getText (configFile >> "CfgVehicles" >> typeOf _asset >> "Icon")];
		_asset setVariable ["BIS_WL_nextRepair", 0];

		if (_asset isKindOf "Helicopter") then {  
			_asset setVariable ["BIS_WL_nextRearm", WL_SYNCED_TIME + 30]; 
		} else { 
			if (_asset isKindOf "Plane") then {  
				_asset setVariable ["BIS_WL_nextRearm", WL_SYNCED_TIME + 30]; 
			} else { 
				if (_asset isKindOf "B_MBT_01_arty_F") then {  
					_asset setVariable ["BIS_WL_nextRearm", WL_SYNCED_TIME + WL_MAINTENANCE_COOLDOWN_REARM_Artillery];
				} else { 
					if (_asset isKindOf "O_MBT_02_arty_F") then {  
						_asset setVariable ["BIS_WL_nextRearm", WL_SYNCED_TIME + WL_MAINTENANCE_COOLDOWN_REARM_Artillery];
					} else { 
						if (_asset isKindOf "B_Mortar_01_F") then {  
							_asset setVariable ["BIS_WL_nextRearm", WL_SYNCED_TIME + WL_MAINTENANCE_COOLDOWN_REARM_Mortar];
						} else { 
							if (_asset isKindOf "O_Mortar_01_F") then {  
								_asset setVariable ["BIS_WL_nextRearm", WL_SYNCED_TIME + WL_MAINTENANCE_COOLDOWN_REARM_Mortar];
							} else { 
								if (_asset isKindOf "B_AAA_System_01_F ") then {  
									_asset setVariable ["BIS_WL_nextRearm", WL_SYNCED_TIME + WL_MAINTENANCE_COOLDOWN_REARM_Preatorian];
								} else { 
									if (_asset isKindOf "B_SAM_System_01_F") then {  
										_asset setVariable ["BIS_WL_nextRearm", WL_SYNCED_TIME + WL_MAINTENANCE_COOLDOWN_REARM_Spartan];
									} else { 
										if (_asset isKindOf "B_SAM_System_03_F") then {  
											_asset setVariable ["BIS_WL_nextRearm", WL_SYNCED_TIME + WL_MAINTENANCE_COOLDOWN_REARM_DefenderRhea];
										} else { 
											if (_asset isKindOf "O_SAM_System_04_F") then {  
												_asset setVariable ["BIS_WL_nextRearm", WL_SYNCED_TIME + WL_MAINTENANCE_COOLDOWN_REARM_DefenderRhea];
											} else { 
												if (_asset isKindOf "B_SAM_System_02_F") then {  
													_asset setVariable ["BIS_WL_nextRearm", WL_SYNCED_TIME + WL_MAINTENANCE_COOLDOWN_REARM_Centurion];
												} else { 
													if (_asset isKindOf "B_Ship_MRLS_01_F") then {  
														_asset setVariable ["BIS_WL_nextRearm", WL_SYNCED_TIME + WL_MAINTENANCE_COOLDOWN_REARM_VLS];
													} else { 
														if (_asset isKindOf "B_MBT_01_mlrs_F") then {  
															_asset setVariable ["BIS_WL_nextRearm", WL_SYNCED_TIME + WL_MAINTENANCE_COOLDOWN_REARM_Artillery];
														} else { 
															if (_asset isKindOf "I_Truck_02_MRL_F") then {  
																_asset setVariable ["BIS_WL_nextRearm", WL_SYNCED_TIME + WL_MAINTENANCE_COOLDOWN_REARM_Artillery];
															} else { 
																_asset setVariable ["BIS_WL_nextRearm", WL_SYNCED_TIME + WL_MAINTENANCE_COOLDOWN_REARM]; 
															};
														};
													};
												};
											};
										};
									};	
								};
							};
						};
					};
				};
			};
		};     
		
		private _defaultMags = [];
		{
			_defaultMags pushBack (_asset magazinesTurret _x);
		} forEach allTurrets _asset;
		_asset setVariable ["BIS_WL_defaultMagazines", _defaultMags];
		_ownedVehiclesVarName = format ["BIS_WL_%1_ownedVehicles", getPlayerUID _owner];
		missionNamespace setVariable [_ownedVehiclesVarName, WL_PLAYER_VEHS + [_asset]];
		publicVariableServer _ownedVehiclesVarName;
		
		if !(_asset isKindOf "StaticWeapon") then {
			BIS_WL_recentlyPurchasedAssets pushBack _asset;
			
			_asset spawn {
				_t = WL_SYNCED_TIME + WL_ASSET_SCENE_ICON_DURATION;
				waitUntil {sleep WL_TIMEOUT_STANDARD; WL_SYNCED_TIME > _t || !alive _this || vehicle player == _this};
				BIS_WL_recentlyPurchasedAssets = BIS_WL_recentlyPurchasedAssets - [_this];
			};
		};
		
		_asset spawn {
			params ["_asset"];
			_repairActionID = -1;
			_rearmActionID = -1;
			while {alive _asset} do {
				_nearbyVehicles = (_asset nearObjects ["All", WL_MAINTENANCE_RADIUS]) select {alive _x};
				_repairCooldown = ((_asset getVariable "BIS_WL_nextRepair") - WL_SYNCED_TIME) max 0;
				_rearmCooldown = ((_asset getVariable "BIS_WL_nextRearm") - WL_SYNCED_TIME) max 0;
				
				if (_nearbyVehicles findIf {_x getVariable ["BIS_WL_canRepair", FALSE]} != -1) then {
					if (_repairActionID == -1) then {
						_repairActionID = _asset addAction [
							"",
							{
								params ["_asset"];
								if ((_asset getVariable "BIS_WL_nextRepair") <= WL_SYNCED_TIME) then {
									["repairAsset", [_asset]] call BIS_fnc_WL2_sendClientRequest;
									_asset setVariable ["BIS_WL_nextRepair", WL_SYNCED_TIME + WL_MAINTENANCE_COOLDOWN_REPAIR];
									playSound3D ["A3\Sounds_F\sfx\UI\vehicles\Vehicle_Repair.wss", _asset, FALSE, getPosASL _asset, 2, 1, 75];
									[toUpper localize "STR_A3_WL_popup_asset_repaired"] spawn BIS_fnc_WL2_smoothText;
								} else {
									playSound "AddItemFailed";
								};
							},
							[],
							5,
							TRUE,
							FALSE,
							"",
							"alive _target && group _this == (_target getVariable ['BIS_WL_ownerGrp', grpNull]) && vehicle _this == _this",
							WL_MAINTENANCE_RADIUS,
							FALSE
						];
						_asset setVariable ["BIS_WL_repairActionID", _repairActionID];
					};
					_asset setUserActionText [_repairActionID, if (_repairCooldown == 0) then {format ["<t color = '#4bff58'>%1</t>", localize "STR_repair"]} else {format ["<t color = '#7e7e7e'><t align = 'left'>%1</t><t align = 'right'>%2     </t></t>", localize "STR_repair", [_repairCooldown, "MM:SS"] call BIS_fnc_secondsToString]}, format ["<img size='2' color = '%1' image='\A3\ui_f\data\IGUI\Cfg\Actions\repair_ca.paa'/>", if (_repairCooldown == 0) then {"#ffffff"} else {"#7e7e7e"}]];
				} else {
					if (_repairActionID != -1) then {
						_asset removeAction _repairActionID;
						_repairActionID = -1;
					};
				};
				
				if (_nearbyVehicles findIf {_x getVariable ["BIS_WL_canRearm", FALSE]} != -1) then {
					if (_rearmActionID == -1) then {
						_rearmActionID = _asset addAction [
							"",
							{
								params ["_asset"];
								if ((_asset getVariable "BIS_WL_nextRearm") <= WL_SYNCED_TIME) then {
									_curWeapon = currentWeapon _asset;
									{
											if (_asset isKindOf "LandVehicle") then {
												
												private _turret = _x;
												private _mags = (_asset getVariable "BIS_WL_defaultMagazines") # _forEachIndex;
												{											
													  	_asset removeMagazineTurret [_x, _turret];
														_asset setVehicleAmmoDef 1; //_asset addMagazineTurret [_x, _turret];
												} forEach _mags;
																				 
											};
									} forEach allTurrets _asset;

									_asset spawn DAPS_fnc_RearmAPS;

									//The line below was moved outside the {} and rearms jets using GOMs airloadout.
									if (_asset isKindOf "Air") then {  [player] spawn GOM_fnc_aircraftLoadout; }; 

									_asset selectWeapon _curWeapon;

									if (_asset isKindOf "Helicopter") then {  
										_asset setVariable ["BIS_WL_nextRearm", WL_SYNCED_TIME + WL_MAINTENANCE_COOLDOWN_REARM_Helicopter]; 
									} else { if (_asset isKindOf "Plane") then {  
										_asset setVariable ["BIS_WL_nextRearm", WL_SYNCED_TIME + WL_MAINTENANCE_COOLDOWN_REARM_Jets]; 
										} else { if (_asset isKindOf "B_MBT_01_arty_F") then {  
											_asset setVariable ["BIS_WL_nextRearm", WL_SYNCED_TIME + WL_MAINTENANCE_COOLDOWN_REARM_Artillery];
											} else { if (_asset isKindOf "O_MBT_02_arty_F") then {  
												_asset setVariable ["BIS_WL_nextRearm", WL_SYNCED_TIME + WL_MAINTENANCE_COOLDOWN_REARM_Artillery];
												} else { if (_asset isKindOf "B_Mortar_01_F") then {  
													_asset setVariable ["BIS_WL_nextRearm", WL_SYNCED_TIME + WL_MAINTENANCE_COOLDOWN_REARM_Mortar];
													} else { if (_asset isKindOf "O_Mortar_01_F") then {  
														_asset setVariable ["BIS_WL_nextRearm", WL_SYNCED_TIME + WL_MAINTENANCE_COOLDOWN_REARM_Mortar];
														} else { if (_asset isKindOf "B_AAA_System_01_F ") then {  
															_asset setVariable ["BIS_WL_nextRearm", WL_SYNCED_TIME + WL_MAINTENANCE_COOLDOWN_REARM_Preatorian];
															} else { if (_asset isKindOf "B_SAM_System_01_F") then {  
																_asset setVariable ["BIS_WL_nextRearm", WL_SYNCED_TIME + WL_MAINTENANCE_COOLDOWN_REARM_Spartan];
																} else { if (_asset isKindOf "B_SAM_System_03_F") then {  
																	_asset setVariable ["BIS_WL_nextRearm", WL_SYNCED_TIME + WL_MAINTENANCE_COOLDOWN_REARM_DefenderRhea];
																	} else { if (_asset isKindOf "O_SAM_System_04_F") then {  
																		_asset setVariable ["BIS_WL_nextRearm", WL_SYNCED_TIME + WL_MAINTENANCE_COOLDOWN_REARM_DefenderRhea];
																		} else { if (_asset isKindOf "B_SAM_System_02_F") then {  
																			_asset setVariable ["BIS_WL_nextRearm", WL_SYNCED_TIME + WL_MAINTENANCE_COOLDOWN_REARM_Centurion];
																			} else { if (_asset isKindOf "B_Ship_MRLS_01_F") then {  
																				_asset setVariable ["BIS_WL_nextRearm", WL_SYNCED_TIME + WL_MAINTENANCE_COOLDOWN_REARM_VLS];
																				} else { if (_asset isKindOf "B_MBT_01_mlrs_F") then {
																					_asset setVariable ["BIS_WL_nextRearm", WL_SYNCED_TIME + WL_MAINTENANCE_COOLDOWN_REARM_Artillery];
																					} else {
																						_asset setVariable ["BIS_WL_nextRearm", WL_SYNCED_TIME + WL_MAINTENANCE_COOLDOWN_REARM];
																					};
																				};
																			};
																		};
																	};
																};
															};
														};
													};
												};
											};
										};
									};   
									
									playSound3D ["A3\Sounds_F\sfx\UI\vehicles\Vehicle_Rearm.wss", _asset, FALSE, getPosASL _asset, 2, 1, 75];
									[toUpper localize "STR_A3_WL_popup_asset_rearmed"] spawn BIS_fnc_WL2_smoothText;
								} else {
									playSound "AddItemFailed";
								};
							},
							[],
							5,
							TRUE,
							FALSE,
							"",
							"alive _target && group _this == (_target getVariable ['BIS_WL_ownerGrp', grpNull]) && vehicle _this == _this",
							WL_MAINTENANCE_RADIUS,
							FALSE
						];
						_asset setVariable ["BIS_WL_rearmActionID", _rearmActionID];
					};
					_asset setUserActionText [_rearmActionID, if (_rearmCooldown == 0) then {format ["<t color = '#4bff58'>%1</t>", localize "STR_rearm"]} else {format ["<t color = '#7e7e7e'><t align = 'left'>%1</t><t align = 'right'>%2     </t></t>", localize "STR_rearm", [_rearmCooldown, "MM:SS"] call BIS_fnc_secondsToString]}, format ["<img size='2' color = '%1' image='\A3\ui_f\data\IGUI\Cfg\Actions\reammo_ca.paa'/>", if (_rearmCooldown == 0) then {"#ffffff"} else {"#7e7e7e"}]];
				} else {
					if (_rearmActionID != -1) then {
						_asset removeAction _rearmActionID;
						_rearmActionID = -1;
					};
				};
				
				sleep WL_TIMEOUT_STANDARD;
			};
			
			_asset removeAction _repairActionID;
			_asset removeAction _rearmActionID;
		};

		if !(_assembled || _asset isKindOf "Thing") then {
			if !(typeOf _asset == "B_Truck_01_medical_F" || typeOf _asset == "O_Truck_03_medical_F") then {
				_initialLock = if (_asset isKindOf "StaticWeapon") then {FALSE} else {TRUE};
				_asset lock _initialLock;
				_asset call BIS_fnc_WL2_sub_vehicleLockAction;
			} else {
				_asset lock 0;
			};

			if (typeof _asset == "O_T_Truck_03_device_ghex_F" || typeof _asset == "O_Truck_03_device_F") then {
				_asset setVariable ["dazzlerActivated", false, true];
				_asset spawn DAPS_fnc_APSDazzler;
				_asset call BIS_fnc_WL2_sub_dazzlerAction;
			};

			if (typeOf _asset == "B_Truck_01_flatbed_F") then {
				_asset call BIS_fnc_WL2_sub_logisticsAddAction;
				if (side _owner == east) then {
					_asset setObjectTextureGlobal [0, "A3\Soft_F_Exp\Truck_01\Data\Truck_01_ext_01_olive_CO.paa"]; //Truck Cabin
					_asset setObjectTextureGlobal [1, "A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext02_CO.paa"]; //Does nothing but keep for reminder
					_asset setObjectTextureGlobal [2, "A3\Soft_F_EPC\Truck_03\Data\Truck_03_ammo_CO.paa"]; //Truck Bed
				};
			};

			if (typeOf _asset == "B_Plane_Fighter_01_F" || typeOf _asset == "B_Plane_CAS_01_dynamicLoadout_F") then {
				_asset addEventHandler ["Gear", {
					params ["_vehicle", "_gearState"];
					if (_gearState == true) then {
						_vehicle setVariable ["landingGear", true, true];
					} else {
						_vehicle setVariable ["landingGear", false, true];
					};
				}];
				_asset setVariable ["landingGear", true, true];
				_asset setVariable ["bettyEnabled", false, true];
				_asset call BIS_fnc_WL2_sub_bettyAction;
			};
		};
		
		_asset addEventHandler ["Killed", {
			params ["_asset"];
			_ownedVehiclesVarID = format ["BIS_WL_%1_ownedVehicles", getPlayerUID player];
			missionNamespace setVariable [_ownedVehiclesVarID, WL_PLAYER_VEHS - [_asset]];
			publicVariableServer _ownedVehiclesVarID;
		}];
		
		if (getNumber (configFile >> "CfgVehicles" >> typeOf _asset >> "transportRepair") > 0) then {_asset setRepairCargo 0; _asset setVariable ["BIS_WL_canRepair", TRUE, TRUE]};
		if (getNumber (configFile >> "CfgVehicles" >> typeOf _asset >> "transportAmmo") > 0) then {_asset setAmmoCargo 0; _asset setVariable ["BIS_WL_canRearm", TRUE, TRUE]};
	};

	private _removeActionID = _asset addAction [
		"",
		{
			_displayName = getText (configFile >> "CfgVehicles" >> (typeOf (_this # 0)) >> "displayName");
			_result = [format ["Are you sure you would like to delete: %1", _displayName], "Delete asset", true, true] call BIS_fnc_guiMessage;

			if (_result) exitWith {
				_ownedVehiclesVarName = format ["BIS_WL_%1_ownedVehicles", getPlayerUID player];
				missionNamespace setVariable [_ownedVehiclesVarName, WL_PLAYER_VEHS - [_this # 0]];
				publicVariableServer _ownedVehiclesVarName;
				(_this # 0) call BIS_fnc_WL2_sub_deleteAsset;
			};
		},
		[],
		-100,
		false,
		true,
		"",
		"alive _target && vehicle _this != _target && group _this == (_target getVariable ['BIS_WL_ownerGrp', grpNull])",
		30,
		false
	];

	_asset setUserActionText [_removeActionID, format ["<t color = '#ff4b4b'>%1</t>", localize "STR_xbox_hint_remove"]];
};