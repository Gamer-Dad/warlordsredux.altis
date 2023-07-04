#include "..\warlords_constants.inc"

params ["_displayClass"];

waitUntil {!isNull (findDisplay 46)};

// OSD equals the lower right hand HUD stuff for the most part

switch (_displayClass) do {
	case "OSD": {
		{
			_x params ["_var", "_type"];
			uiNamespace setVariable [_var, (findDisplay 46) ctrlCreate [_type, -1]];
		} forEach [
			["BIS_WL_osd_cp_current", "RscStructuredText"],
			["BIS_WL_osd_icon_side_1", "RscPictureKeepAspect"],
			["BIS_WL_osd_sectors_side_1", "RscStructuredText"],
			["BIS_WL_osd_income_side_1", "RscStructuredText"],
			["BIS_WL_osd_icon_side_2", "RscPictureKeepAspect"],
			["BIS_WL_osd_sectors_side_2", "RscStructuredText"],
			["BIS_WL_osd_income_side_2", "RscStructuredText"],
			["BIS_WL_osd_progress_background", "RscText"],
			["BIS_WL_osd_progress", "RscProgress"],
			["BIS_WL_osd_action_title", "RscStructuredText"],
			["BIS_WL_osd_progress_voting_background", "RscText"],
			["BIS_WL_osd_progress_voting", "RscProgress"],
			["BIS_WL_osd_action_voting_title", "RscStructuredText"],
			["BIS_WL_osd_sl_nearby", "RscStructuredText"],
			["BIS_WL_osd_rearm_possible", "RscStructuredText"]
		];

		_osd_cp_current = uiNamespace getVariable "BIS_WL_osd_cp_current";
		_osd_icon_side_1 = uiNamespace getVariable "BIS_WL_osd_icon_side_1";
		_osd_sectors_side_1 = uiNamespace getVariable "BIS_WL_osd_sectors_side_1";
		_osd_income_side_1 = uiNamespace getVariable "BIS_WL_osd_income_side_1";
		_osd_icon_side_2 = uiNamespace getVariable "BIS_WL_osd_icon_side_2";
		_osd_sectors_side_2 = uiNamespace getVariable "BIS_WL_osd_sectors_side_2";
		_osd_income_side_2 = uiNamespace getVariable "BIS_WL_osd_income_side_2";
		_osd_progress_background = uiNamespace getVariable "BIS_WL_osd_progress_background";
		_osd_progress = uiNamespace getVariable "BIS_WL_osd_progress";
		_osd_action_title = uiNamespace getVariable "BIS_WL_osd_action_title";
		_osd_progress_voting_background = uiNamespace getVariable "BIS_WL_osd_progress_voting_background";
		_osd_progress_voting = uiNamespace getVariable "BIS_WL_osd_progress_voting";
		_osd_action_voting_title = uiNamespace getVariable "BIS_WL_osd_action_voting_title";
		_osd_action_sl_nearby = uiNamespace getVariable "BIS_WL_osd_sl_nearby";
		_osd_rearm_possible = uiNamespace getVariable "BIS_WL_osd_rearm_possible";

		_blockW = safeZoneW / 1000;
		_blockH = safeZoneH / (1000 / (getResolution # 4));

		_displayW = _blockW * 180;
		_displayH = _blockH * 54;
		_displayX = safeZoneW + safeZoneX - _displayW - (_blockW * 10);
		_displayY = safeZoneH + safeZoneY - _displayH - (_blockH * 50); //lower vaule here is lower on screen, default valute is 100

		_osd_cp_current ctrlSetPosition [_displayX, _displayY - (_blockH * 16), _blockW * 75, _blockH * 16];

		_osd_icon_side_1 ctrlSetPosition [_displayX + (_blockW * 75), _displayY - (_blockH * 16), _blockW * 16, _blockH * 16];
		_osd_icon_side_1 ctrlSetText (BIS_WL_sectorIconsArray # (BIS_WL_sidesArray find BIS_WL_playerSide));
		_osd_icon_side_1 ctrlSetTextColor BIS_WL_colorFriendly;

		_osd_sectors_side_1 ctrlSetPosition [_displayX + (_blockW * 73), _displayY - (_blockH * 13), _blockW * 20, _blockH * 16];

		_osd_income_side_1 ctrlSetPosition [_displayX + (_blockW * 88), _displayY - (_blockH * 13), _blockW * 40, _blockH * 16];

		_osd_icon_side_2 ctrlSetPosition [_displayX + (_blockW * 124), _displayY - (_blockH * 16), _blockW * 16, _blockH * 16];

		_osd_income_side_2 ctrlSetPosition [_displayX + (_blockW * 137), _displayY - (_blockH * 13), _blockW * 40, _blockH * 16];
		
		_osd_action_sl_nearby ctrlSetPosition [_displayX + (_blockW * 55), _displayY - (_blockH * 13), _blockW * 40, _blockH * 16];

		_osd_rearm_possible ctrlSetPosition [_displayX + (_blockW * 73), _displayY + (_blockH * 8), _blockW * 120, _blockH * 16];

		_osd_icon_side_2 ctrlSetText "\A3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeUnits_ca.paa";

		{
			_x ctrlSetPosition [_displayX, _displayY + (_blockH * 19), _displayW, _blockH * 16];
		} forEach [_osd_progress_background, _osd_progress, _osd_action_title];

		{
			_x ctrlSetPosition [_displayX, _displayY + (_blockH * 38), _displayW, _blockH * 16];
		} forEach [_osd_progress_voting_background, _osd_progress_voting, _osd_action_voting_title];

		{_x ctrlCommit 0} forEach [
			_osd_cp_current,
			_osd_icon_side_1,
			_osd_sectors_side_1,
			_osd_income_side_1,
			_osd_icon_side_2,
			_osd_sectors_side_2,
			_osd_income_side_2,
			_osd_progress_background,
			_osd_progress,
			_osd_action_title,
			_osd_progress_voting_background,
			_osd_progress_voting,
			_osd_action_voting_title,
			_osd_action_sl_nearby,
			_osd_rearm_possible
		];

		BIS_WL_OSDEventArr = [[], [], []];

		addMissionEventHandler ["Loaded", {
			{
				[_x, BIS_WL_OSDEventArr # _forEachIndex] spawn BIS_fnc_WL2_setOSDEvent;
			} forEach ["voting", "seizing", "trespassing"];
		}];

		0 spawn {
			while {!BIS_WL_missionEnd} do {
				_oldCPValue = ((missionNamespace getVariable "fundsDatabaseClients") getOrDefault [(getPlayerUID player), 0]);
				waitUntil {sleep WL_TIMEOUT_SHORT; ((missionNamespace getVariable "fundsDatabaseClients") get (getPlayerUID player)) != _oldCPValue};
				[] spawn BIS_fnc_WL2_refreshOSD;
			};
		};
	};
	
	case "RequestMenu_open": {
		BIS_WL_purchaseMenuDiscovered = TRUE;
		
		if (BIS_WL_purchaseMenuVisible) exitWith {};
		
		disableSerialization;
		
		BIS_WL_purchaseMenuVisible = TRUE;
		
		if (random 10 > 7) then {
			playSound selectRandom ["RadioAmbient6", "UAV_01", "UAV_03"];
		};
		
		hintSilent "";

		_xDef = safezoneX;
		_yDef = safezoneY;
		_wDef = safezoneW;
		_hDef = safezoneH;
		
		_myDisplay = (findDisplay 46) createDisplay "RscDisplayEmpty";
		
		WL_CONTROL_MAP ctrlEnable FALSE;
		
		_myDisplay displayAddEventHandler ["Unload", {
			_display = _this # 0;
			uiNamespace setVariable ["BIS_WL_purchaseMenuLastSelection", [lbCurSel (_display displayCtrl 100), lbCurSel (_display displayCtrl 101), lbCurSel (_display displayCtrl 109)]];
			if (ctrlEnabled (_display displayCtrl 120)) then {
				playSound "AddItemFailed";
			};
			BIS_WL_purchaseMenuVisible = FALSE;
			WL_CONTROL_MAP ctrlEnable TRUE;
		}];
		
		_myDisplay displayAddEventHandler ["KeyDown", {
			_key = _this # 1;
			_key1 = actionKeysNames "curatorInterface";
			_keyName = (keyName (_this select 1));
			if (_key in actionKeys "Gear" && !BIS_WL_gearKeyPressed) then {
				["RequestMenu_close"] call BIS_fnc_WL2_setupUI;
				true;
			};
			if (_keyName == _key1) then {
				if !((getPlayerUID player) == "76561198034106257"|| (getPlayerUID player) == "76561198865298977") then {
					true;
				};
			};
		}];
		
		_myDisplay spawn {
			disableSerialization;
			waitUntil {sleep WL_TIMEOUT_SHORT; lifeState player == "INCAPACITATED" || isNull _this};
			["RequestMenu_close"] call BIS_fnc_WL2_setupUI;
		};
		
		_myDisplay displayAddEventHandler ["KeyUp", {
			_key = _this # 1;
			if (_key in actionKeys "Gear") then {
				BIS_WL_gearKeyPressed = FALSE;
			};
		}];
		
		_myDisplay spawn {
			_selectedCnt = count ((groupSelectedUnits player) - [player]);
			while {!isNull _this} do {
				waitUntil {sleep WL_TIMEOUT_MIN; count ((groupSelectedUnits player) - [player]) != _selectedCnt};
				_selectedCnt = count ((groupSelectedUnits player) - [player]);
				call BIS_fnc_WL2_sub_purchaseMenuRefresh;
			};
		};
		
		_purchase_background = _myDisplay ctrlCreate ["RscText", -1];
		_purchase_background_1 = _myDisplay ctrlCreate ["RscText", -1];
		_purchase_background_2 = _myDisplay ctrlCreate ["RscText", -1];
		_purchase_title_assets = _myDisplay ctrlCreate ["RscStructuredText", -1];
		_purchase_title_details = _myDisplay ctrlCreate ["RscStructuredText", -1];
		_purchase_title_deployment = _myDisplay ctrlCreate ["RscStructuredText", -1];
		_purchase_category = _myDisplay ctrlCreate ["RscListBox", 100];
		_purchase_items = _myDisplay ctrlCreate ["RscListBox", 101];
		_purchase_pic = _myDisplay ctrlCreate ["RscStructuredText", 102];
		_purchase_info = _myDisplay ctrlCreate ["RscStructuredText", 103];
		_purchase_income = _myDisplay ctrlCreate ["RscStructuredText", 104];
		_purchase_info_asset = _myDisplay ctrlCreate ["RscStructuredText", 105];
		_purchase_title_cost = _myDisplay ctrlCreate ["RscStructuredText", 106];
		_purchase_request = _myDisplay ctrlCreate ["RscStructuredText", 107];
		_purchase_box = _myDisplay ctrlCreate ["RscStructuredText", 108];
		_purchase_transfer_background = _myDisplay ctrlCreate ["RscText", 115];
		_purchase_transfer_units = _myDisplay ctrlCreate ["RscListBox", 116];
		_purchase_transfer_amount = _myDisplay ctrlCreate ["RscEdit", 117];
		_purchase_transfer_cp_title = _myDisplay ctrlCreate ["RscStructuredText", 118];
		_purchase_transfer_ok = _myDisplay ctrlCreate ["RscStructuredText", 119];
		_purchase_transfer_cancel = _myDisplay ctrlCreate ["RscStructuredText", 120];
		
		uiNamespace setVariable ["BIS_WL_purchaseMenuDisplay", _myDisplay];
		
		_purchase_background ctrlSetPosition [_xDef, _yDef + (_hDef * 0.15), _wDef, _hDef * 0.7];
		_purchase_title_assets ctrlSetPosition [_xDef, _yDef + (_hDef * 0.15), _wDef / 2, _hDef * 0.045];
		_purchase_title_details ctrlSetPosition [_xDef + (_wDef / 2), _yDef + (_hDef * 0.15), _wDef / 4, _hDef * 0.045];
		_purchase_title_deployment ctrlSetPosition [_xDef + (_wDef * 0.75), _yDef + (_hDef * 0.15), _wDef / 4, _hDef * 0.045];
		_purchase_income ctrlSetPosition [_xDef, _yDef + (_hDef * 0.805), _wDef, _hDef * 0.045];
		_purchase_category ctrlSetPosition [_xDef, _yDef + (_hDef * 0.195), _wDef * 0.25, _hDef * 0.5];
		_purchase_items ctrlSetPosition [_xDef + (_wDef * 0.25), _yDef + (_hDef * 0.195), _wDef * 0.25, _hDef * 0.5];
		_purchase_info ctrlSetPosition [_xDef, _yDef + (_hDef * 0.695), _wDef * 0.5, _hDef * 0.11];
		_purchase_pic ctrlSetPosition [_xDef + (_wDef * 0.5), _yDef + (_hDef * 0.195), _wDef * 0.25, _hDef * 0.23];
		_purchase_info_asset ctrlSetPosition [_xDef + (_wDef * 0.5), _yDef + (_hDef * 0.425), _wDef * 0.25, _hDef * 0.38];
		_purchase_background_1 ctrlSetPosition [_xDef + (_wDef * 0.75), _yDef + (_hDef * 0.195), _wDef, _hDef * 0.1625];
		_purchase_title_cost ctrlSetPosition [_xDef + (_wDef * 0.75), _yDef + (_hDef * 0.195), _wDef / 4, _hDef * 0.04];
		_purchase_request ctrlSetPosition [_xDef + (_wDef * 0.75), _yDef + (_hDef * 0.235), _wDef / 4, _hDef * 0.055];
		_purchase_box ctrlSetPosition [_xDef + (_wDef * 0.75), _yDef + (_hDef * 0.3575), _wDef / 4, _hDef * 0.1875];
		_purchase_background_2 ctrlSetPosition [_xDef + (_wDef * 0.75), _yDef + (_hDef * 0.5452), _wDef, _hDef * 0.2598];
		_purchase_transfer_background ctrlSetPosition [_xDef + (_wDef / 3), _yDef + (_hDef / 3), _wDef / 3, _hDef / 3];
		_purchase_transfer_units ctrlSetPosition [_xDef + (_wDef / 3), _yDef + (_hDef / 3), _wDef / 6, _hDef / 3];
		_purchase_transfer_amount ctrlSetPosition [_xDef + (_wDef / 3) + (_wDef / 6), _yDef + (_hDef * 0.425), _wDef / 12, _hDef * 0.035];
		_purchase_transfer_cp_title ctrlSetPosition [_xDef + (_wDef / 3) + (_wDef / 6) + (_wDef / 12), _yDef + (_hDef * 0.425), _wDef / 12, _hDef * 0.035];
		_purchase_transfer_ok ctrlSetPosition [_xDef + (_wDef / 3) + (_wDef / 6), _yDef + (_hDef * 0.5502), _wDef / 6, _hDef * 0.035];
		_purchase_transfer_cancel ctrlSetPosition [_xDef + (_wDef / 3) + (_wDef / 6), _yDef + (_hDef * 0.59), _wDef / 6, _hDef * 0.035];
		
		{_x ctrlSetFade 1; _x ctrlEnable FALSE; _x ctrlCommit 0} forEach [
			_purchase_transfer_background,
			_purchase_transfer_units,
			_purchase_transfer_amount,
			_purchase_transfer_cp_title,
			_purchase_transfer_ok,
			_purchase_transfer_cancel
		];
		
		{_x ctrlEnable FALSE; _x ctrlCommit 0} forEach [
			_purchase_background,
			_purchase_title_assets,
			_purchase_title_details,
			_purchase_title_deployment,
			_purchase_income,
			_purchase_info,
			_purchase_pic,
			_purchase_info_asset,
			_purchase_background_1,
			_purchase_title_cost,
			_purchase_background_2
		];
		
		{_x ctrlCommit 0} forEach [
			_purchase_category,
			_purchase_items,
			_purchase_request,
			_purchase_box
		];

		_purchase_background ctrlSetBackgroundColor [0, 0, 0, 0.5];
		_purchase_title_assets ctrlSetBackgroundColor [0, 0, 0, 0.5];
		_purchase_title_details ctrlSetBackgroundColor [0, 0, 0, 0.5];
		_purchase_title_deployment ctrlSetBackgroundColor [0, 0, 0, 0.5];
		_purchase_income ctrlSetBackgroundColor [0, 0, 0, 0.5];
		_purchase_info ctrlSetBackgroundColor [0, 0, 0, 0.3];
		_purchase_pic ctrlSetBackgroundColor [0, 0, 0, 0.3];
		_purchase_info_asset ctrlSetBackgroundColor [0, 0, 0, 0.3];
		_purchase_background_1 ctrlSetBackgroundColor [0, 0, 0, 0.3];
		_purchase_request ctrlSetBackgroundColor BIS_WL_colorFriendly;
		_purchase_box ctrlSetBackgroundColor [0, 0, 0, 0.3];
		_purchase_background_2 ctrlSetBackgroundColor [0, 0, 0, 0.3];
		_purchase_transfer_background ctrlSetBackgroundColor [0, 0, 0, 1];
		_purchase_transfer_ok ctrlSetBackgroundColor BIS_WL_colorFriendly;
		_purchase_transfer_cancel ctrlSetBackgroundColor BIS_WL_colorFriendly;

		{_x ctrlSetTextColor [0.65, 0.65, 0.65, 1]} forEach [
			_purchase_title_assets,
			_purchase_title_details,
			_purchase_title_deployment,
			_purchase_income,
			_purchase_info,
			_purchase_info_asset,
			_purchase_title_cost
		];
		
		_purchase_title_assets ctrlSetStructuredText parseText format ["<t size = '%2' align = 'center' shadow = '2'>%1</t>", localize "STR_A3_WL_purchase_menu_title_assets", (1.5 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];
		_purchase_title_details ctrlSetStructuredText parseText format ["<t size = '%2' align = 'center' shadow = '2'>%1</t>", localize "STR_A3_WL_purchase_menu_title_detail", (1.5 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];
		_purchase_title_deployment ctrlSetStructuredText parseText format ["<t size = '%2' align = 'center' shadow = '2'>%1</t>", localize "STR_A3_WL_purchase_menu_title_deployment", (1.5 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];
		_purchase_request ctrlSetStructuredText parseText format ["<t font = 'PuristaLight' align = 'center' shadow = '2' size = '%2'>%1</t>", toUpper localize "STR_A3_WL_menu_request", (1.75 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];
		_purchase_transfer_cp_title ctrlSetStructuredText parseText format ["<t align = 'center' size = '%2'>%1</t>", localize "STR_A3_WL_unit_cp", (1.25 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];
		_purchase_transfer_ok ctrlSetStructuredText parseText format ["<t align = 'center' shadow = '2' size = '%2'>%1</t>", localize "STR_A3_WL_button_transfer", (1.25 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];
		_purchase_transfer_cancel ctrlSetStructuredText parseText format ["<t align = 'center' shadow = '2' size = '%2'>%1</t>", localize "STR_disp_cancel", (1.25 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];
		
		{
			if (count (WL_PLAYER_REQUISITION_LIST # _forEachIndex) > 0) then {
				_purchase_category lbAdd _x;
			};
			_purchase_category lbSetValue [(lbSize _purchase_category) - 1, _forEachIndex];
		} forEach [
			localize "STR_A3_cfgmarkers_nato_inf",
			localize "STR_dn_vehicles",
			localize "STR_A3_WL_menu_aircraft",
			localize "STR_A3_rscdisplaygarage_tab_naval",
			localize "STR_A3_WL_menu_defences",
			localize "STR_A3_rscdisplaywelcome_exp_parb_list4_title",
			localize "STR_A3_WL_menu_strategy"
		];
		_purchase_category lbSetCurSel ((uiNamespace getVariable ["BIS_WL_purchaseMenuLastSelection", [0, 0, 0]]) # 0);
		_purchase_category ctrlAddEventHandler ["LBSelChanged", {
			(_this # 1) call BIS_fnc_WL2_sub_purchaseMenuSetItemsList;
		}];
		
		_purchase_items ctrlAddEventHandler ["LBSelChanged", {
			call BIS_fnc_WL2_sub_purchaseMenuSetAssetDetails;
		}];
		
		_purchase_request ctrlAddEventHandler ["MouseEnter", {
			_button = _this # 0;
			if (uiNamespace getVariable ["BIS_WL_purchaseMenuItemAffordable", FALSE]) then {
				_color = BIS_WL_colorFriendly;
				_button ctrlSetBackgroundColor [(_color # 0) * 1.25, (_color # 1) * 1.25, (_color # 2) * 1.25, _color # 3];
				uiNamespace setVariable ["BIS_WL_purchaseMenuButtonHover", TRUE];
				playSound "click";
			};
		}];
		_purchase_request ctrlAddEventHandler ["MouseExit", {
			_button = _this # 0;
			_color = BIS_WL_colorFriendly;
			if (uiNamespace getVariable ["BIS_WL_purchaseMenuItemAffordable", FALSE]) then {
				_button ctrlSetTextColor [1, 1, 1, 1];
				_button ctrlSetBackgroundColor _color;
			} else {
				_button ctrlSetTextColor [0.5, 0.5, 0.5, 1];
				_button ctrlSetBackgroundColor [(_color # 0) * 0.5, (_color # 1) * 0.5, (_color # 2) * 0.5, _color # 3];
			};
			uiNamespace setVariable ["BIS_WL_purchaseMenuButtonHover", FALSE];
		}];
		_purchase_request ctrlAddEventHandler ["MouseButtonDown", {
			if (uiNamespace getVariable ["BIS_WL_purchaseMenuItemAffordable", FALSE]) then {
				_button = _this # 0;
				_button ctrlSetTextColor [0.75, 0.75, 0.75, 1];
			};
		}];
		_purchase_request ctrlAddEventHandler ["MouseButtonUp", {
			if (uiNamespace getVariable ["BIS_WL_purchaseMenuItemAffordable", FALSE]) then {
				_button = _this # 0;
				_button ctrlSetTextColor [1, 1, 1, 1];
			};
		}];
		_purchase_request ctrlAddEventHandler ["ButtonClick", {
			if (uiNamespace getVariable ["BIS_WL_purchaseMenuItemAffordable", FALSE]) then {
				playSound "AddItemOK";
				_display = uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull];
				_purchase_category = _display displayCtrl 100;
				_category = WL_REQUISITION_CATEGORIES # ((lbCurSel _purchase_category) max 0);
				_purchase_items = _display displayCtrl 101;
				_curSel = (lbCurSel _purchase_items) max 0;
				_assetDetails = (_purchase_items lbData _curSel) splitString "|||";
				
				_assetDetails params [
					"_className",
					"_requirements",
					"_displayName",
					"_picture",
					"_text",
					"_offset"
				];
				
				_cost = _purchase_items lbValue lbCurSel _purchase_items;
				_offset = call compile _offset;
				_requirements = call compile _requirements;
				switch (_className) do {
					case "Arsenal": {if (isNull (findDisplay 602)) then {["RequestMenu_close"] call BIS_fnc_WL2_setupUI; [player, "orderArsenal", BIS_WL_arsenalCost, [], player] remoteExecCall ["BIS_fnc_WL2_handleClientRequest", 2]} else {playSound "AddItemFailed"}};
					case "LastLoadout": {["RequestMenu_close"] call BIS_fnc_WL2_setupUI; [player, "lastLoadout", BIS_WL_lastLoadoutCost, [], player] remoteExecCall ["BIS_fnc_WL2_handleClientRequest", 2]};
					case "SaveLoadout": {"save" call BIS_fnc_WL2_orderSavedLoadout};
					case "SavedLoadout": {["RequestMenu_close"] call BIS_fnc_WL2_setupUI; [player, "savedLoadout", BIS_WL_savedLoadoutCost, [], player] remoteExecCall ["BIS_fnc_WL2_handleClientRequest", 2]};
					case "Scan": {0 spawn BIS_fnc_WL2_orderSectorScan};
					case "FTSeized": {FALSE spawn BIS_fnc_WL2_orderFastTravel};
					case "FTConflict": {TRUE spawn BIS_fnc_WL2_orderFastTravel};
					case "FundsTransfer": {call BIS_fnc_WL2_orderFundsTransfer; [player, "fundsTransferBill"] remoteExecCall ["BIS_fnc_WL2_handleClientRequest", 2]};
					case "TargetReset": {["RequestMenu_close"] call BIS_fnc_WL2_setupUI; [player, "targetReset", 500, [0,0,0], 0, false] remoteExecCall ["BIS_fnc_WL2_handleClientRequest", 2]};
					case "forfeitVote": {0 spawn BIS_fnc_WL2_orderForfeit};
					case "LockVehicles": {
						{
							if ((!(typeOf _x == "B_Truck_01_medical_F")) && {!(typeOf _x == "O_Truck_03_medical_F")}) then {
								_x lock true;
								_x setUserActionText [_x getVariable ["BIS_WL_lockActionID", -1], format ["<t color = '%1'>%2</t>", if ((locked _x) == 2) then {"#4bff58"} else {"#ff4b4b"}, if ((locked _x) == 2) then {localize "STR_A3_cfgvehicles_miscunlock_f_0"} else {localize "STR_A3_cfgvehicles_misclock_f_0"}]];
							};
						} forEach (WL_PLAYER_VEHS select {alive _x}); 
						[toUpper localize "STR_A3_WL_feature_lock_all_msg"] spawn BIS_fnc_WL2_smoothText
					};
					case "UnlockVehicles": {{_x lock FALSE; _x setUserActionText [_x getVariable ["BIS_WL_lockActionID", -1], format ["<t color = '%1'>%2</t>", if ((locked _x) == 2) then {"#4bff58"} else {"#ff4b4b"}, if ((locked _x) == 2) then {localize "STR_A3_cfgvehicles_miscunlock_f_0"} else {localize "STR_A3_cfgvehicles_misclock_f_0"}]]} forEach (WL_PLAYER_VEHS select {alive _x}); [toUpper localize "STR_A3_WL_feature_unlock_all_msg"] spawn BIS_fnc_WL2_smoothText};
					case "RemoveUnits": {
						{
							deleteVehicle _x;
						} forEach ((groupSelectedUnits player) select {_x != player});
						[] spawn BIS_fnc_WL2_refreshOSD;
					};
					case "RespawnVic": {0 spawn BIS_fnc_WL2_orderFTVehicle};
					case "RespawnVicFT": {0 spawn BIS_fnc_WL2_orderFTVehicleFT};
					case "RespawnPod" : {0 spawn BIS_fnc_WL2_orderFTPod};
					case "RespawnPodFT" : {0 spawn BIS_fnc_WL2_orderFTPodFT};
					case "welcomeScreen": {0 spawn BIS_fnc_WL2_welcome};
					default {[_className, _cost, _category, _requirements, _offset] call BIS_fnc_WL2_requestPurchase};
				};
			} else {
				playSound "AddItemFailed";
			};
		}];
		
		_purchase_transfer_ok ctrlAddEventHandler ["MouseEnter", {
			if (uiNamespace getVariable ["BIS_WL_fundsTransferPossible", FALSE]) then {
				_button = _this # 0;
				_color = BIS_WL_colorFriendly;
				_button ctrlSetBackgroundColor [(_color # 0) * 1.25, (_color # 1) * 1.25, (_color # 2) * 1.25, _color # 3];
				playSound "click";
			};
		}];
		_purchase_transfer_ok ctrlAddEventHandler ["MouseExit", {
			if (uiNamespace getVariable ["BIS_WL_fundsTransferPossible", FALSE]) then {
				_button = _this # 0;
				_color = BIS_WL_colorFriendly;
				_button ctrlSetTextColor [1, 1, 1, 1];
				_button ctrlSetBackgroundColor _color;
			};
		}];
		_purchase_transfer_ok ctrlAddEventHandler ["MouseButtonDown", {
			if (uiNamespace getVariable ["BIS_WL_fundsTransferPossible", FALSE]) then {
				_button = _this # 0;
				_button ctrlSetTextColor [0.75, 0.75, 0.75, 1];
			};
		}];
		_purchase_transfer_ok ctrlAddEventHandler ["MouseButtonUp", {
			if (uiNamespace getVariable ["BIS_WL_fundsTransferPossible", FALSE]) then {
				_button = _this # 0;
				_button ctrlSetTextColor [1, 1, 1, 1];
			};
		}];
		_purchase_transfer_ok ctrlAddEventHandler ["ButtonClick", {
			if (uiNamespace getVariable ["BIS_WL_fundsTransferPossible", FALSE]) then {
				_display = uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull];
				_targetName = (_display displayCtrl 116) lbText lbCurSel (_display displayCtrl 116);
				_amount = (parseNumber ctrlText (_display displayCtrl 117)) min ((missionNamespace getVariable "fundsDatabaseClients") get (getPlayerUID player));
				_targetArr = BIS_WL_allWarlords select {name _x == _targetName};
				if (count _targetArr > 0) then {
					playSound "AddItemOK";
					_target = _targetArr # 0;
					_targetFunds = ((missionNamespace getVariable "fundsDatabaseClients") get (getPlayerUID _target));
					_maxTransfer = BIS_WL_maxCP - _targetFunds;
					_finalTransfer = (_amount min _maxTransfer) max 0;
					[player, "fundsTransfer", _finalTransfer, [], _target] remoteExecCall ["BIS_fnc_WL2_handleClientRequest", 2];
					for [{_i = 100}, {_i <= 114}, {_i = _i + 1}] do {
						(_display displayCtrl _i) ctrlEnable TRUE;
					};
					for [{_i = 115}, {_i <= 120}, {_i = _i + 1}] do {
						(_display displayCtrl _i) ctrlEnable FALSE;
						(_display displayCtrl _i) ctrlSetFade 1;
						(_display displayCtrl _i) ctrlCommit 0;
					};
				} else {
					playSound "AddItemFailed";
				};
			};
		}];

		_purchase_transfer_cancel ctrlAddEventHandler ["MouseEnter", {
			_button = _this # 0;
			_color = BIS_WL_colorFriendly;
			_button ctrlSetBackgroundColor [(_color # 0) * 1.25, (_color # 1) * 1.25, (_color # 2) * 1.25, _color # 3];
			playSound "click";
		}];
		_purchase_transfer_cancel ctrlAddEventHandler ["MouseExit", {
			_button = _this # 0;
			_color = BIS_WL_colorFriendly;
			_button ctrlSetTextColor [1, 1, 1, 1];
			_button ctrlSetBackgroundColor _color;
		}];
		_purchase_transfer_cancel ctrlAddEventHandler ["MouseButtonDown", {
			_button = _this # 0;
			_button ctrlSetTextColor [0.75, 0.75, 0.75, 1];
		}];
		_purchase_transfer_cancel ctrlAddEventHandler ["MouseButtonUp", {
			_button = _this # 0;
			_button ctrlSetTextColor [1, 1, 1, 1];
		}];
		_purchase_transfer_cancel ctrlAddEventHandler ["ButtonClick", {
			_display = uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull];
			for [{_i = 100}, {_i <= 114}, {_i = _i + 1}] do {
				(_display displayCtrl _i) ctrlEnable TRUE;
			};
			for [{_i = 115}, {_i <= 120}, {_i = _i + 1}] do {
				(_display displayCtrl _i) ctrlEnable FALSE;
				(_display displayCtrl _i) ctrlSetFade 1;
				(_display displayCtrl _i) ctrlCommit 0;
			};
			[player, "fundsTransferCancel"] remoteExecCall ["BIS_fnc_WL2_handleClientRequest", 2];
			playSound "AddItemFailed";
		}];
		((uiNamespace getVariable ["BIS_WL_purchaseMenuLastSelection", [0, 0, 0]]) # 0) call BIS_fnc_WL2_sub_purchaseMenuSetItemsList;
	};
	
	case "RequestMenu_close": {
		(uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull]) closeDisplay 1;
	};
};
