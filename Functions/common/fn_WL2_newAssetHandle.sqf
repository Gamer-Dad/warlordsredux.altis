#include "..\warlords_constants.inc"

params ["_owner", "_asset", ["_assembled", FALSE]];

if (isNull _owner && isServer) then {
	_asset spawn BIS_fnc_WL2_assetRelevanceCheck;
	_asset setSkill (0.2 + random 0.3);
};

if (isPlayer _owner) then {
	_asset setVariable ["BIS_WL_ownerAsset", (group _owner), true];
	_asset setVariable ["BIS_WL_iconText", getText (configFile >> "CfgVehicles" >> typeOf _asset >> "displayName")];
	_asset spawn DAPS_fnc_RegisterVehicle;

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
			_asset setVariable ["BIS_WL_nextRearm", serverTime + 30]; 
		} else { 
			if (_asset isKindOf "Plane") then {  
				_asset setVariable ["BIS_WL_nextRearm", serverTime + 30]; 
			} else { 
				if (_asset isKindOf "B_MBT_01_arty_F") then {  
					_asset setVariable ["BIS_WL_nextRearm", serverTime + WL_MAINTENANCE_COOLDOWN_REARM_Artillery];
				} else { 
					if (_asset isKindOf "O_MBT_02_arty_F") then {  
						_asset setVariable ["BIS_WL_nextRearm", serverTime + WL_MAINTENANCE_COOLDOWN_REARM_Artillery];
					} else { 
						if (_asset isKindOf "B_Mortar_01_F") then {  
							_asset setVariable ["BIS_WL_nextRearm", serverTime + WL_MAINTENANCE_COOLDOWN_REARM_Mortar];
						} else { 
							if (_asset isKindOf "O_Mortar_01_F") then {  
								_asset setVariable ["BIS_WL_nextRearm", serverTime + WL_MAINTENANCE_COOLDOWN_REARM_Mortar];
							} else { 
								if (_asset isKindOf "B_AAA_System_01_F ") then {  
									_asset setVariable ["BIS_WL_nextRearm", serverTime + WL_MAINTENANCE_COOLDOWN_REARM_Preatorian];
								} else { 
									if (_asset isKindOf "B_SAM_System_01_F") then {  
										_asset setVariable ["BIS_WL_nextRearm", serverTime + WL_MAINTENANCE_COOLDOWN_REARM_Spartan];
									} else { 
										if (_asset isKindOf "B_SAM_System_03_F") then {  
											_asset setVariable ["BIS_WL_nextRearm", serverTime + WL_MAINTENANCE_COOLDOWN_REARM_DefenderRhea];
										} else { 
											if (_asset isKindOf "O_SAM_System_04_F") then {  
												_asset setVariable ["BIS_WL_nextRearm", serverTime + WL_MAINTENANCE_COOLDOWN_REARM_DefenderRhea];
											} else { 
												if (_asset isKindOf "B_SAM_System_02_F") then {  
													_asset setVariable ["BIS_WL_nextRearm", serverTime + WL_MAINTENANCE_COOLDOWN_REARM_Centurion];
												} else { 
													if (_asset isKindOf "B_Ship_MRLS_01_F") then {  
														_asset setVariable ["BIS_WL_nextRearm", serverTime + WL_MAINTENANCE_COOLDOWN_REARM_VLS];
													} else { 
														if (_asset isKindOf "B_MBT_01_mlrs_F") then {  
															_asset setVariable ["BIS_WL_nextRearm", serverTime + WL_MAINTENANCE_COOLDOWN_REARM_Artillery];
														} else { 
															if (_asset isKindOf "I_Truck_02_MRL_F") then {  
																_asset setVariable ["BIS_WL_nextRearm", serverTime + WL_MAINTENANCE_COOLDOWN_REARM_Artillery];
															} else { 
																_asset setVariable ["BIS_WL_nextRearm", serverTime + WL_MAINTENANCE_COOLDOWN_REARM]; 
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
				_t = serverTime + WL_ASSET_SCENE_ICON_DURATION;
				waitUntil {sleep WL_TIMEOUT_STANDARD; serverTime > _t || !alive _this || vehicle player == _this};
				BIS_WL_recentlyPurchasedAssets = BIS_WL_recentlyPurchasedAssets - [_this];
			};
		};
		
		_asset spawn BIS_fnc_WL2_sub_rearmAction;
		_asset spawn BIS_fnc_WL2_sub_vehicleKickAction;
		_asset spawn BIS_fnc_WL2_sub_vehicleLockAction;
		_asset spawn {
			params ["_asset"];
			_repairActionID = -1;
			while {alive _asset} do {
				_nearbyVehicles = (_asset nearEntities ["All", WL_MAINTENANCE_RADIUS]) select {alive _x};
				_repairCooldown = ((_asset getVariable "BIS_WL_nextRepair") - serverTime) max 0;
				
				if (_nearbyVehicles findIf {_x getVariable ["BIS_WL_canRepair", FALSE]} != -1) then {
					if (_repairActionID == -1) then {
						_repairActionID = _asset addAction [
							"",
							{
								params ["_asset"];
								[_asset] spawn {
									params ["_asset"];
									if ((_asset getVariable "BIS_WL_nextRepair") <= serverTime) then {
										[player, "repair", (_asset getVariable "BIS_WL_nextRepair"), 0, _asset] remoteExecCall ["BIS_fnc_WL2_handleClientRequest", 2];
										playSound3D ["A3\Sounds_F\sfx\UI\vehicles\Vehicle_Repair.wss", _asset, FALSE, getPosASL _asset, 2, 1, 75];
										[toUpper localize "STR_A3_WL_popup_asset_repaired"] spawn BIS_fnc_WL2_smoothText;
										sleep 2;
										_asset setVariable ["BIS_WL_nextRepair", serverTime + WL_MAINTENANCE_COOLDOWN_REPAIR];
									} else {
										playSound "AddItemFailed";
									};
								};
							},
							[],
							5,
							TRUE,
							FALSE,
							"",
							"alive _target && (group _this) == (_target getVariable ['BIS_WL_ownerAsset', grpNull]) && vehicle _this == _this",
							WL_MAINTENANCE_RADIUS,
							FALSE
						];
					};
					_asset setUserActionText [_repairActionID, if (_repairCooldown == 0) then {format ["<t color = '#4bff58'>%1</t>", localize "STR_repair"]} else {format ["<t color = '#7e7e7e'><t align = 'left'>%1</t><t align = 'right'>%2     </t></t>", localize "STR_repair", [_repairCooldown, "MM:SS"] call BIS_fnc_secondsToString]}, format ["<img size='2' color = '%1' image='\A3\ui_f\data\IGUI\Cfg\Actions\repair_ca.paa'/>", if (_repairCooldown == 0) then {"#ffffff"} else {"#7e7e7e"}]];
				} else {
					if (_repairActionID != -1) then {
						_asset removeAction _repairActionID;
						_repairActionID = -1;
					};
				};
				sleep WL_TIMEOUT_STANDARD;
			};
			
			_asset removeAction _repairActionID;
		};

		if !(_assembled || _asset isKindOf "Thing") then {
			if (typeof _asset == "O_T_Truck_03_device_ghex_F" || typeof _asset == "O_Truck_03_device_F") then {
				_asset setVariable ["dazzlerActivated", false];
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
				if ((_this # 0) isKindOf "Man") then {
					deleteVehicle (_this # 0);
				} else {
					(_this # 0) spawn BIS_fnc_WL2_sub_deleteAsset;
				};
			};
		},
		[],
		-98,
		false,
		true,
		"",
		"alive _target && vehicle _this != _target && (group _this) == (_target getVariable ['BIS_WL_ownerAsset', grpNull])",
		30,
		false
	];

	_asset setUserActionText [_removeActionID, format ["<t color = '#ff4b4b'>%1</t>", localize "STR_xbox_hint_remove"]];
};