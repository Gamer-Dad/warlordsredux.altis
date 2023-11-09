#include "..\warlords_constants.inc"

params ["_asset", "_owner"];

if (isServer) exitWith {
	_asset spawn BIS_fnc_WL2_assetRelevanceCheck;
	if !(_asset isKindOf "Man") then {
		_asset call APS_fnc_RegisterVehicle;
		_asset call APS_fnc_SetupProjectiles;
	};
	_asset setSkill (0.2 + random 0.3);
};

if (isPlayer _owner) then {
	WAS_store = true;
	_asset setVariable ["BIS_WL_ownerAsset", (getPlayerUID _owner), [2, clientOwner]];

	if (_asset isKindOf "Man") then {
		_asset addEventHandler ["Killed", {
			false spawn BIS_fnc_WL2_refreshOSD;
		}];
	} else {
		_asset call APS_fnc_RegisterVehicle;
		_asset call APS_fnc_SetupProjectiles;
		_asset setVariable ["BIS_WL_icon", getText (configFile >> "CfgVehicles" >> typeOf _asset >> "Icon")];
		_asset setVariable ["BIS_WL_nextRepair", 0];
		_asset enableWeaponDisassembly false;
		
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
				_t = serverTime + 30;
				waitUntil {sleep WL_TIMEOUT_STANDARD; serverTime > _t || {!alive _this || {vehicle player == _this}}};
				BIS_WL_recentlyPurchasedAssets = BIS_WL_recentlyPurchasedAssets - [_this];
			};

			_rearmTime = switch true do {
				case (_asset isKindOf "Helicopter"): {30};
				case (_asset isKindOf "Plane"): {30};
				default {((missionNamespace getVariable "BIS_WL2_rearmTimers") getOrDefault [(typeOf _asset), 600])};
			};
			_asset setVariable ["BIS_WL_nextRearm", serverTime + _rearmTime];

			if (_asset isKindOf "Air") then {
				_asset spawn BIS_fnc_WL2_sub_rearmActionAir;
			} else {
				_asset spawn BIS_fnc_WL2_sub_rearmAction;
				if (typeOf _asset == "O_T_Truck_03_device_ghex_F" || {typeOf _asset == "O_Truck_03_device_F"}) then {
					_asset setVariable ["dazzlerActivated", false];
					_asset call BIS_fnc_WL2_sub_dazzlerAction;
				};

				if (typeOf _asset == "B_Truck_01_flatbed_F" || {typeOf _asset == "B_T_VTOL_01_vehicle_F" || {typeOf _asset == "O_T_VTOL_02_vehicle_dynamicLoadout_F"}}) then {
					_asset call BIS_fnc_WL2_sub_logisticsAddAction;
					if (side _owner == east) then {
						_asset setObjectTextureGlobal [0, "A3\Soft_F_Exp\Truck_01\Data\Truck_01_ext_01_olive_CO.paa"]; //Truck Cabin
						_asset setObjectTextureGlobal [1, "A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext02_CO.paa"]; //Does nothing but keep for reminder
						_asset setObjectTextureGlobal [2, "A3\Soft_F_EPC\Truck_03\Data\Truck_03_ammo_CO.paa"]; //Truck Bed
					};
				};
			};
		} else {
			_rearmTime = ((missionNamespace getVariable "BIS_WL2_rearmTimers") getOrDefault [(typeOf _asset), 600]);
			_asset setVariable ["BIS_WL_nextRearm", serverTime + _rearmTime];
			_asset spawn BIS_fnc_WL2_sub_rearmAction;

			if (direction _asset != (direction player)) then {
				_asset setDir (direction player);
			};

			if (typeOf _asset == "B_Radar_System_01_F" || {typeOf _asset == "O_Radar_System_02_F"}) then {
				_asset spawn {
					params ["_asset"];

					_asset setVariable ["radarOperation", false];
					_asset call BIS_fnc_WL2_sub_radarOperate;

					_lookAtPositions = [0, 45, 90, 135, 180, 225, 270, 315] apply { _asset getRelPos [100, _x] };
					_radarIter = 0;

					while {alive _asset} do {
						if (_asset getVariable "radarOperation") then {
							_asset setVehicleRadar 1;
							_asset lookAt (_lookAtPositions # _radarIter);
							_radarIter = (_radarIter + 1) % 8;
						} else {
							_asset setVehicleRadar 0;
						};
						sleep 1.2;
					};				
				};
			};
		};

		if (unitIsUAV _asset) then {
			if (profileNamespace getVariable ["MRTM_enableAuto", true]) then {
				_asset setAutonomous false;
			};
			_asset setVariable ["BIS_WL_ownerUavAsset", getPlayerUID player, true];
		};

		if !(typeOf _asset == "B_Truck_01_medical_F" || {typeOf _asset == "O_Truck_03_medical_F" || {typeOf _asset == "Land_Pod_Heli_Transport_04_medevac_F" || {typeOf _asset == "B_Slingload_01_Medevac_F"}}}) then {
			_asset call BIS_fnc_WL2_sub_vehicleLockAction;
			_asset call BIS_fnc_WL2_sub_vehicleKickAction;
		};

		if (profileNamespace getVariable ["MRTM_spawnEmpty", false]) then {
			if !(typeOf _asset == "B_supplyCrate_F" || typeOf _asset == "O_supplyCrate_F") then {
				if !((typeOf _asset) in (getArray (missionConfigFile >> "logisticsConfig" >> "cargoTypes" >> "Cargo"))) then {
					clearMagazineCargoGlobal _asset;
					clearItemCargoGlobal _asset;
					clearWeaponCargoGlobal _asset;
				};
			};
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
							"alive _target && {_this == ((_target getVariable ['BIS_WL_ownerAsset', '123']) call BIS_fnc_getUnitByUID) && {vehicle _this == _this}}",
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
		
		_asset addEventHandler ["Killed", {
			params ["_asset"];
			_ownedVehiclesVarID = format ["BIS_WL_%1_ownedVehicles", getPlayerUID player];
			missionNamespace setVariable [_ownedVehiclesVarID, WL_PLAYER_VEHS - [_asset]];
			publicVariableServer _ownedVehiclesVarID;
		}];
		
		if (getNumber (configFile >> "CfgVehicles" >> typeOf _asset >> "transportRepair") > 0) then {
			[_asset, 0] remoteExec ["setRepairCargo", 0];
			_amount = ((getNumber (configfile >> "CfgVehicles" >> typeof _asset >> "transportRepair")) min 10000);
			_asset setvariable ["GOM_fnc_repairCargo", _amount, true];
		};
		if (getNumber (configFile >> "CfgVehicles" >> typeOf _asset >> "transportAmmo") > 0) then {
			[_asset, 0] remoteExec ["setAmmoCargo", 0];
			_amount = 10000;
			if (typeOf _asset == "B_Truck_01_ammo_F" || {typeOf _asset == "O_Truck_03_ammo_F" || {typeOf _asset == "Land_Pod_Heli_Transport_04_ammo_F" || {typeOf _asset == "B_Slingload_01_Ammo_F"}}}) then {
				_amount = ((getNumber (configfile >> "CfgVehicles" >> typeof _asset >> "transportAmmo")) min 30000);
			};
			_asset setvariable ["GOM_fnc_ammoCargo",_amount,true];
		};
	};

	_asset call BIS_fnc_WL2_sub_removeAction;
};