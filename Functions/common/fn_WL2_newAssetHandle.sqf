#include "..\warlords_constants.inc"

params ["_owner", "_asset", ["_assembled", FALSE]];

if (isNull _owner && isServer) then {
	_asset spawn BIS_fnc_WL2_assetRelevanceCheck;
	_asset setSkill (0.2 + random 0.3);
};

if (isPlayer _owner) then {
	_asset setVariable ["BIS_WL_ownerAsset", (group _owner), [2, clientOwner]];
	_asset setVariable ["BIS_WL_iconText", getText (configFile >> "CfgVehicles" >> typeOf _asset >> "displayName")];
	_asset spawn DAPS_fnc_RegisterVehicle;

	if (_asset isKindOf "Man") then {
		_asset call BIS_fnc_WL2_sub_assetAssemblyHandle;
	
		_asset addEventHandler ["Killed", {
			[] spawn BIS_fnc_WL2_refreshOSD;
		}];
	} else {
		private _group = createGroup (side (group player));
		(crew _asset) joinSilent _group;
		_asset setVariable ["BIS_WL_icon", getText (configFile >> "CfgVehicles" >> typeOf _asset >> "Icon")];
		_asset setVariable ["BIS_WL_nextRepair", 0];

		private _assetFF = _asset addEventHandler ["HandleDamage", {
			params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];
			_ownerGrp = _unit getVariable ["BIS_WL_ownerAsset", grpNull];
			_base = (([BIS_WL_base1, BIS_WL_base2] select {(_x getVariable "BIS_WL_owner") == (side group _unit)}) # 0);
			if (side group _instigator == side _ownerGrp && {(_unit inArea (_base getVariable "objectAreaComplete")) && {((_base getVariable ["BIS_WL_baseUnderAttack", false]) == false)}}) then {0};
		}];
		
		[_asset, _assetFF] spawn {
			params ["_asset", "_friendlyFireProtection"];
			sleep 30;
			_asset removeEventHandler ["HandleDamage", _friendlyFireProtection];
		};
		
		_rearmTime = switch true do {
			case (_asset isKindOf "Helicopter"): { 30 };
			case (_asset isKindOf "Plane"): { 30 };
			case (_asset isKindOf "B_MBT_01_arty_F"): { WL_MAINTENANCE_COOLDOWN_REARM_Artillery };
			case (_asset isKindOf "O_MBT_02_arty_F"): { WL_MAINTENANCE_COOLDOWN_REARM_Artillery };
			case (_asset isKindOf "B_Mortar_01_F"): { WL_MAINTENANCE_COOLDOWN_REARM_Mortar };
			case (_asset isKindOf "O_Mortar_01_F"): { WL_MAINTENANCE_COOLDOWN_REARM_Mortar };
			case (_asset isKindOf "B_AAA_System_01_F"): { WL_MAINTENANCE_COOLDOWN_REARM_Preatorian };
			case (_asset isKindOf "B_SAM_System_01_F"): { WL_MAINTENANCE_COOLDOWN_REARM_Spartan };
			case (_asset isKindOf "B_SAM_System_03_F"): { WL_MAINTENANCE_COOLDOWN_REARM_DefenderRhea };
			case (_asset isKindOf "O_SAM_System_04_F"): { WL_MAINTENANCE_COOLDOWN_REARM_Centurion };
			case (_asset isKindOf "B_Ship_MRLS_01_F"): { WL_MAINTENANCE_COOLDOWN_REARM_VLS };
			case (_asset isKindOf "B_MBT_01_mlrs_F"): { WL_MAINTENANCE_COOLDOWN_REARM_Artillery };
			case (_asset isKindOf "I_Truck_02_MRL_F"): { WL_MAINTENANCE_COOLDOWN_REARM_Artillery };
			default { WL_MAINTENANCE_COOLDOWN_REARM };
		};
		
		_asset setVariable ["BIS_WL_nextRearm", serverTime + _rearmTime]; 
		
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
		
		if !(typeOf _asset == "O_T_Truck_03_device_ghex_F" || typeOf _asset == "O_Truck_03_device_F") then {
			_asset spawn BIS_fnc_WL2_sub_rearmAction;
		};

		if !(typeOf _asset == "B_Truck_01_medical_F" || typeOf _asset == "O_Truck_03_medical_F" || typeOf _asset == "Land_Pod_Heli_Transport_04_medevac_F") then {
			_asset call BIS_fnc_WL2_sub_vehicleLockAction;
			_asset call BIS_fnc_WL2_sub_vehicleKickAction;
		};

		_asset spawn {
			params ["_asset"];
			_repairActionID = -1;
			while {alive _asset} do {
				_nearbyVehicles = (_asset nearEntities ["All", WL_MAINTENANCE_RADIUS]) select {alive _x};
				_repairCooldown = ((_asset getVariable "BIS_WL_nextRepair") - serverTime) max 0;
				
				if (_nearbyVehicles findIf {getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "transportRepair") > 0} != -1) then {
					if (_repairActionID == -1) then {
						_repairActionID = _asset addAction [
							"",
							{
								params ["_asset"];
								if ((_asset getVariable "BIS_WL_nextRepair") <= serverTime) then {
									[player, "repair", (_asset getVariable "BIS_WL_nextRepair"), 0, _asset] remoteExec ["BIS_fnc_WL2_handleClientRequest", 2];
									playSound3D ["A3\Sounds_F\sfx\UI\vehicles\Vehicle_Repair.wss", _asset, FALSE, getPosASL _asset, 2, 1, 75];
									[toUpper localize "STR_A3_WL_popup_asset_repaired"] spawn BIS_fnc_WL2_smoothText;
									_asset setVariable ["BIS_WL_nextRepair", serverTime + WL_MAINTENANCE_COOLDOWN_REPAIR];
								} else {
									playSound "AddItemFailed";
								};
							},
							[],
							5,
							TRUE,
							FALSE,
							"",
							"alive _target && {(group _this) == (_target getVariable ['BIS_WL_ownerAsset', grpNull]) && {vehicle _this == _this}}",
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
			if (typeOf _asset == "O_T_Truck_03_device_ghex_F" || typeOf _asset == "O_Truck_03_device_F") then {
				_asset setVariable ["dazzlerActivated", false];
				_asset call BIS_fnc_WL2_sub_dazzlerAction;
			};

			if (typeOf _asset == "B_Truck_01_flatbed_F" || typeOf _asset == "B_T_VTOL_01_vehicle_F" || typeOf _asset == "O_T_VTOL_02_vehicle_dynamicLoadout_F") then {
				_asset call BIS_fnc_WL2_sub_logisticsAddAction;
				if (side _owner == east) then {
					_asset setObjectTextureGlobal [0, "A3\Soft_F_Exp\Truck_01\Data\Truck_01_ext_01_olive_CO.paa"]; //Truck Cabin
					_asset setObjectTextureGlobal [1, "A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext02_CO.paa"]; //Does nothing but keep for reminder
					_asset setObjectTextureGlobal [2, "A3\Soft_F_EPC\Truck_03\Data\Truck_03_ammo_CO.paa"]; //Truck Bed
				};
			};
		};

		if (_asset call DIS_fnc_IsSAM) then {
			[_asset] spawn DIS_fnc_RegisterSAM;
		};
		
		_asset addEventHandler ["Killed", {
			params ["_asset"];
			_ownedVehiclesVarID = format ["BIS_WL_%1_ownedVehicles", getPlayerUID player];
			missionNamespace setVariable [_ownedVehiclesVarID, WL_PLAYER_VEHS - [_asset]];
			publicVariableServer _ownedVehiclesVarID;
		}];
		
		if (getNumber (configFile >> "CfgVehicles" >> typeOf _asset >> "transportRepair") > 0) then {
			_asset setRepairCargo 0; 
			_amount = ((getNumber (configfile >> "CfgVehicles" >> typeof _asset >> "transportRepair")) min 10000);
			_asset setvariable ["GOM_fnc_repairCargo", _amount, true];
		};
		if (getNumber (configFile >> "CfgVehicles" >> typeOf _asset >> "transportAmmo") > 0) then {
			_asset setAmmoCargo 0; 
			_amount = 10000;
			if (typeOf _asset == "B_Truck_01_ammo_F" || typeOf _asset == "O_Truck_03_ammo_F" || typeOf _asset == "Land_Pod_Heli_Transport_04_ammo_F" || typeOf _asset == "B_Slingload_01_Ammo_F") then {
				_amount = ((getNumber (configfile >> "CfgVehicles" >> typeof _asset >> "transportAmmo")) min 30000);
			};
			_asset setvariable ["GOM_fnc_ammoCargo",_amount,true];
		};
		if (getNumber (configfile >> "CfgVehicles" >> typeof _asset >> "transportFuel") > 0) then {
			_asset setFuelCargo 0;
			_amount = ((getNumber (configfile >> "CfgVehicles" >> typeof _asset >> "transportFuel")) min 10000);
			_asset setvariable ["GOM_fnc_fuelCargo", _amount, true];
		};
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
		"alive _target && {vehicle _this != _target && {(group _this) == (_target getVariable ['BIS_WL_ownerAsset', grpNull])}}",
		30,
		false
	];

	_asset setUserActionText [_removeActionID, format ["<t color = '#ff4b4b'>%1</t>", localize "STR_xbox_hint_remove"], "<img size='2' color='#ff4b4b' image='\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_cancel_ca'/>"];
};