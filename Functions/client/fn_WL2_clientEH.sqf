"fundsDatabaseClients" addPublicVariableEventHandler {
	false spawn BIS_fnc_WL2_refreshOSD;
};

addMissionEventHandler ["GroupIconClick", BIS_fnc_WL2_groupIconClickHandle];
addMissionEventHandler ["GroupIconOverEnter", BIS_fnc_WL2_groupIconEnterHandle];
addMissionEventHandler ["GroupIconOverLeave", BIS_fnc_WL2_groupIconLeaveHandle];

player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	VIC_ENTERED = true;
	if ((typeOf _vehicle == "B_Plane_Fighter_01_F") || {(typeOf _vehicle == "B_Plane_CAS_01_dynamicLoadout_F") || {(typeOf _vehicle == "B_Heli_Attack_01_dynamicLoadout_F") || {(typeOf _vehicle == "B_T_VTOL_01_armed_F") || {(typeOf _vehicle == "B_T_VTOL_01_vehicle_F") || {(typeOf _vehicle == "B_T_VTOL_01_infantry_F")}}}}}) then  {
		[["voiceWarningSystem", "betty"], 0, "", 25, "", false, true, false, true] call BIS_fnc_advHint;
		0 spawn BIS_fnc_WL2_betty;
	};
	if ((typeOf _vehicle == "O_Plane_Fighter_02_F") || {(typeOf _vehicle == "O_Plane_CAS_02_dynamicLoadout_F") || {(typeOf _vehicle == "O_Heli_Attack_02_dynamicLoadout_F") || {(typeOf _vehicle == "O_T_VTOL_02_vehicle_dynamicLoadout_F")}}}) then {
		[["voiceWarningSystem", "rita"], 0, "", 25, "", false, true, false, true] call BIS_fnc_advHint;
		0 spawn BIS_fnc_WL2_rita;
	};
}];

player addEventHandler ["InventoryOpened",{
	params ["_unit","_container"];
	_override = false;
	_allUnitBackpackContainers = (player nearEntities ["Man", 50]) select {isPlayer _x} apply {backpackContainer _x};

	if (_container in _allUnitBackpackContainers) then {
		systemchat "Access denied!";
		_override = true;
	};
	_override;
}];

player addEventHandler ["Killed", {
	BIS_WL_loadoutApplied = FALSE;
	"RequestMenu_close" call BIS_fnc_WL2_setupUI;
	
	BIS_WL_lastLoadout = +getUnitLoadout player;
	private _varName = format ["BIS_WL_purchasable_%1", BIS_WL_playerSide];
	private _gearArr = (missionNamespace getVariable _varName) # 5;
	private _lastLoadoutArr = _gearArr # 1;
	private _text = localize "STR_A3_WL_last_loadout_info";
	_text = _text + "<br/><br/>";
	{
		if (_forEachIndex in [0,1,2,3,4]) then {
			if (count _x > 0) then {
				_text = _text + (getText (configFile >> "CfgWeapons" >> _x # 0 >> "displayName")) + "<br/>";
			};
		};
		if (_forEachIndex == 5) then {
			if (count _x > 0) then {
				_text = _text + (getText (configFile >> "CfgVehicles" >> _x # 0 >> "displayName")) + "<br/>";
			};
		};
	} forEach BIS_WL_lastLoadout;
	_lastLoadoutArr set [5, _text];
	_gearArr set [1, _lastLoadoutArr];
	(missionNamespace getVariable _varName) set [5, _gearArr];

	_connectedUAV = getConnectedUAV player;
	if (_connectedUAV != objNull) exitWith {
		player connectTerminalToUAV objNull;
	};
}];

player addEventHandler ["HandleDamage", {
	params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit"];
	_base = (([BIS_WL_base1, BIS_WL_base2] select {(_x getVariable "BIS_WL_owner") == (side group _unit)}) # 0);
	if ((_unit inArea (_base getVariable "objectAreaComplete")) && {!(_base getVariable ["BIS_WL_baseUnderAttack", false])}) then {
		0;
	} else {
		_damage;
	};
}];

addMissionEventHandler ["HandleChatMessage", {
	params ["_channel", "_owner", "_from", "_text"];
	_text = toLower _text;
	_list = getArray (missionConfigFile >> "adminFilter");
	_return = ((_list findIf {[_x, _text] call BIS_fnc_inString}) != -1);

	_admin = (getPlayerUID player) in (getArray (missionConfigFile >> "adminIDs"));
	if (_admin && {_owner == clientOwner}) then {
		_input = _text splitString " ";
		_valid = _input # 0 == "!getCP";
		if (count _input == 2 && {_valid}) then {
			_amount = parseNumber (_input # 1);
			[player, 'devCP', _amount] remoteExecCall ["BIS_fnc_WL2_handleClientRequest", 2];
		} else {
			if (_valid) then {
				systemChat "Unexpected arguments!";
			};
		};
	} else {
		if (_owner == clientOwner && {!_admin}) then {
			_input = _text splitString " ";
			_valid = _input # 0 == "!getCP";
			if (count _input == 2 && {_valid}) then {
				systemChat "You don't have access to this command!";
			};
		};
	};
	_return;
}];

0 spawn {
	waituntil {sleep 0.1; !isnull (findDisplay 46)};
	(findDisplay 46) displayAddEventHandler ["KeyUp", {
		_key = _this # 1;
		if (_key in actionKeys "Gear") then {
			BIS_WL_gearKeyPressed = false;
		};
	}];

	(findDisplay 46) displayAddEventHandler ["KeyDown", {
		params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];
		private _e = false;
		private _settingsKey = actionKeys "user2";
		private _groupKey = actionKeys "user3";
		private _emotesKey = actionKeys "user4";
		private _zeusKey = actionKeys "curatorInterface";
		private _viewKey = actionKeys "tacticalView";
		_e = ((_key in _viewKey || {_key in _zeusKey}) && {!((getPlayerUID player) in (getArray (missionConfigFile >> "adminIDs")))});

		if (inputAction "cycleThrownItems" > 0.01) exitWith {
			[vehicle player, 0, false] spawn APS_fnc_Report;
		};

		if (_key in actionKeys "Gear" && {!(missionNamespace getVariable ["BIS_WL_gearKeyPressed", false]) && {alive player && {lifeState player != "INCAPACITATED" && {!BIS_WL_penalized}}}}) then {
			if !(isNull (uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull])) then {
				"RequestMenu_close" call BIS_fnc_WL2_setupUI;
			} else {
				BIS_WL_gearKeyPressed = true;
				0 spawn {
					_t = time + 0.5;
					waitUntil {!BIS_WL_gearKeyPressed || {time >= _t}};
					if (time < _t) then {
						if (isNull findDisplay 602) then {
							if (vehicle player == player) then {
								if (cursorTarget distanceSqr player <= 25 && {!(cursorTarget isKindOf "House") && {(!alive cursorTarget || {!(cursorTarget isKindOf "Man")})}}) then {
									player action ["Gear", cursorTarget];
								} else {
									player action ["Gear", objNull];
								};
							} else {
								vehicle player action ["Gear", vehicle player];
							};
						} else {
							closeDialog 602;
						};
					} else {
						if (BIS_WL_gearKeyPressed && {!(player getVariable ["BIS_WL_menuLocked", false])}) then {
							if (BIS_WL_currentSelection in [0, 2]) then {
								"RequestMenu_open" call BIS_fnc_WL2_setupUI;
							} else {
								playSound "AddItemFailed";
								_action = if (BIS_WL_currentSelection == 1) then {
									localize "STR_A3_WL_popup_voting";
								} else {
									if (BIS_WL_currentSelection in [3,8]) then {
										localize "STR_A3_WL_action_destination_select";
									} else {
										if (BIS_WL_currentSelection in [4,5,7]) then {
											localize "STR_A3_WL_action_scan_select";
										} else {
											"";
										};
									};
								};
								[toUpper format [(localize "STR_A3_WL_another_action") + (if (_action == "") then {"."} else {" (%1)."}), _action]] spawn BIS_fnc_WL2_smoothText;
							};
						};
					};
				};
			};
			_e = true;
		};
		
		if (_key in _settingsKey) exitWith {
			private _d = [4000, 5000, 6000, 7000, 8000];
			{
				if !(isNull (findDisplay _x)) then {
					(findDisplay _x) closeDisplay 1;
				};
			} forEach _d;
			0 spawn MRTM_fnc_openMenu;
		};
		if (_key in _groupKey) exitWith {
			private _d = [4000, 5000, 6000, 7000, 8000];
			{
				if !(isNull (findDisplay _x)) then {
					(findDisplay _x) closeDisplay 1;
				};
			} forEach _d;
			true spawn MRTM_fnc_openGroupMenu;
		};
		if (_key in _emotesKey) exitWith {
			private _d = [4000, 5000, 6000, 7000, 8000];
			{
				if !(isNull (findDisplay _x)) then {
					(findDisplay _x) closeDisplay 1;
				};
			} forEach _d;
			0 spawn MRTM_fnc_openEmoteMenu;
		};
		_e;
	}];
};

missionNamespace setVariable ["BIS_WL2_rearmTimers", 
	createHashMapFromArray [
		["B_Mortar_01_F", 900], ["O_Mortar_01_F", 900], ["B_MBT_01_arty_F", 1800], 
		["O_MBT_02_arty_F", 1800], ["B_MBT_01_mlrs_F", 1800], ["I_Truck_02_MRL_F", 1800], 
		["B_Ship_Gun_01_F", 2700], ["B_Ship_MRLS_01_F", 2700],
		["B_AAA_System_01_F", 300], ["B_SAM_System_03_F", 450], ["O_SAM_System_04_F", 450], 
		["B_SAM_System_01_F", 600], ["B_SAM_System_02_F", 900],
		["B_LSV_01_armed_F", 120], ["B_G_Offroad_01_armed_F", 120], ["B_LSV_01_AT_F", 200], ["B_G_Offroad_01_AT_F", 180],
		["B_MRAP_01_hmg_F", 300], ["B_MRAP_01_gmg_F", 300], ["B_APC_Wheeled_03_cannon_F", 500], ["B_APC_Wheeled_01_cannon_F", 600], ["B_APC_Tracked_01_rcws_F", 400], ["B_APC_Tracked_01_AA_F", 500],
		["B_AFV_Wheeled_01_cannon_F", 550], ["B_AFV_Wheeled_01_up_cannon_F", 600], ["B_MBT_01_cannon_F", 600], ["B_MBT_01_TUSK_F", 650],
		["O_LSV_02_armed_F", 120], ["O_G_Offroad_01_armed_F", 120], ["O_LSV_02_AT_F", 200], ["O_G_Offroad_01_AT_F", 180],
		["O_MRAP_02_hmg_F", 300], ["O_MRAP_02_gmg_F", 300], ["O_APC_Wheeled_02_rcws_v2_F", 400], ["O_APC_Tracked_02_cannon_F", 500], ["O_APC_Tracked_02_AA_F", 500], ["O_MBT_02_cannon_F", 600],
		["O_MBT_04_cannon_F", 650], ["O_MBT_04_command_F", 700], ["O_MBT_02_railgun_F", 700],
		["B_Heli_Light_01_dynamicLoadout_F", 300], ["B_UAV_02_dynamicLoadout_F", 500], ["B_Heli_Attack_01_dynamicLoadout_F", 700], ["B_T_UAV_03_dynamicLoadout_F", 600], ["B_UAV_05_F", 500],
		["B_T_VTOL_01_armed_F", 600], ["B_Plane_CAS_01_dynamicLoadout_F", 900], ["B_Plane_Fighter_01_F", 900], ["B_Plane_Fighter_01_Stealth_F", 900],
		["O_Heli_Light_02_dynamicLoadout_F", 300], ["O_T_UAV_04_CAS_F", 500], ["O_Heli_Attack_02_dynamicLoadout_F", 700], ["O_UAV_02_dynamicLoadout_F", 330], ["O_T_VTOL_02_vehicle_dynamicLoadout_F", 700],
		["O_Plane_CAS_02_dynamicLoadout_F", 900], ["O_Plane_Fighter_02_F", 900], ["O_Plane_Fighter_02_Stealth_F", 900]
	]
];

BIS_WL_assetInfoActive = false;
addMissionEventHandler ["Map", {
	params ["_mapIsOpened", "_mapIsForced"];
	if (_mapIsOpened) then {
		MAP_CONTROL = addMissionEventHandler ["EachFrame", {
			_shown = false;
			_map = (uiNamespace getVariable ["BIS_WL_mapControl", controlNull]);
			
			if (visibleMap) then {
				_nearbyAssets = ((_map ctrlMapScreenToWorld getMousePosition) nearEntities (((ctrlMapScale _map) * 500) min 30)) select {(getPlayerUID player) == (_x getVariable ["BIS_WL_ownerAsset", "123"]) && {_x != player && {alive _x}}};

				if (count _nearbyAssets > 0) then {
					BIS_WL_mapAssetTarget = _nearbyAssets # 0;
					BIS_WL_assetInfoActive = true;
					_shown = true;
					((ctrlParent _map) getVariable "BIS_sectorInfoBox") ctrlSetPosition [(getMousePosition # 0) + safeZoneW / 100, (getMousePosition # 1) + safeZoneH / 50, safeZoneW, safeZoneH];
					((ctrlParent _map) getVariable "BIS_sectorInfoBox") ctrlCommit 0;
					((ctrlParent _map) getVariable "BIS_sectorInfoBox") ctrlSetStructuredText parseText format [
						"<t shadow = '2' size = '%1'>%2</t>",
						(1 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale),
						format [
							localize "STR_A3_WL_info_asset_map_deletion",
							"<t color = '#ff4b4b'>",
							"</t>",
							"<br/>",
							getText (configFile >> "CfgVehicles" >> typeOf BIS_WL_mapAssetTarget >> "displayName")
						]
					];
					((ctrlParent _map) getVariable "BIS_sectorInfoBox") ctrlShow true;
					((ctrlParent _map) getVariable "BIS_sectorInfoBox") ctrlEnable true;
				};
			};
			
			if (!_shown && BIS_WL_assetInfoActive) then {
				BIS_WL_mapAssetTarget = objNull;
				BIS_WL_assetInfoActive = false;
				((ctrlParent _map) getVariable "BIS_sectorInfoBox") ctrlShow false;
				((ctrlParent _map) getVariable "BIS_sectorInfoBox") ctrlEnable false;
			};
		}];

		MAP_CONTROL_CLICK = addMissionEventHandler ["MapSingleClick", {
			params ["_units", "_pos", "_alt", "_shift"];
			if (_alt && _shift) then {
				if !(isNull BIS_WL_mapAssetTarget) then {
					_vehicles = (missionNamespace getVariable [format ["BIS_WL_%1_ownedVehicles", getPlayerUID player], []]);
					if ((BIS_WL_mapAssetTarget in _vehicles) && count crew BIS_WL_mapAssetTarget > 0) then {
						if (getNumber (configFile >> "CfgVehicles" >> (typeOf BIS_WL_mapAssetTarget) >> "isUav") == 1) then {
							[BIS_WL_mapAssetTarget] spawn BIS_fnc_WL2_deleteAssetFromMap;
						} else {
							if ((crew BIS_WL_mapAssetTarget) findIf {alive _x} != -1) then {
								playSound "AddItemFailed";
								[toUpper localize "STR_A3_WL_popup_asset_not_empty"] spawn BIS_fnc_WL2_smoothText;				
							} else {
								[BIS_WL_mapAssetTarget] spawn BIS_fnc_WL2_deleteAssetFromMap;
							};
						};
					} else {
						[BIS_WL_mapAssetTarget] spawn BIS_fnc_WL2_deleteAssetFromMap;
					};
				};
			};
		}];
	} else {
		removeMissionEventHandler ["EachFrame", MAP_CONTROL];
		removeMissionEventHandler ["MapSingleClick", MAP_CONTROL_CLICK];
	};
}];