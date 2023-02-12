#include "..\warlords_constants.inc"

params ["_displayClass"];

waitUntil {!isNull WL_DISPLAY_MAIN};

// OSD equals the lower right hand HUD stuff for the most part

switch (_displayClass) do {
	case "OSD": {
		{
			_x params ["_var", "_type"];
			uiNamespace setVariable [_var, WL_DISPLAY_MAIN ctrlCreate [_type, -1]];
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
		
		_osd_rearm_possible ctrlSetPosition [_displayX + (_blockW * 73), _displayY + (_blockH * 8), _blockW * 120, _blockH * 16];

		if (BIS_WL_fogOfWar != 0) then {
			_osd_icon_side_2 ctrlSetText "\A3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeUnits_ca.paa";
		} else {
			_osd_icon_side_2 ctrlSetText (BIS_WL_sectorIconsArray # (BIS_WL_sidesArray find BIS_WL_enemySide));
			_color = (BIS_WL_colorsArray # (BIS_WL_sidesArray find BIS_WL_enemySide)); _color set [3, 0.5];
			_osd_icon_side_2 ctrlSetTextColor _color;
			
			_osd_sectors_side_2 ctrlSetTextColor [1,1,1,0.5];
			_osd_sectors_side_2 ctrlSetPosition [_displayX + (_blockW * 122), _displayY - (_blockH * 13), _blockW * 20, _blockH * 16];
			
			_osd_income_side_2 ctrlSetTextColor [1,1,1,0.5];
		};

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
			_osd_rearm_possible
		];

		BIS_WL_OSDEventArr = [[], [], []];

		addMissionEventHandler ["Loaded", {
			{
				[_x, BIS_WL_OSDEventArr # _forEachIndex] spawn BIS_fnc_WL2_setOSDEvent;
			} forEach ["voting", "seizing", "trespassing"];
		}];

		[] spawn {
			while {TRUE} do {
				_oldCPValue = WL_PLAYER_FUNDS;
				waitUntil {sleep WL_TIMEOUT_SHORT; WL_PLAYER_FUNDS != _oldCPValue};
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
		
		_myDisplay = WL_DISPLAY_MAIN createDisplay "RscDisplayEmpty";
		
		WL_CONTROL_MAP ctrlEnable FALSE;
		
		_myDisplay displayAddEventHandler ["Unload", {
			_display = _this # 0;
			uiNamespace setVariable ["BIS_WL_purchaseMenuLastSelection", [lbCurSel (_display displayCtrl 100), lbCurSel (_display displayCtrl 101), lbCurSel (_display displayCtrl 109)]];
			if (ctrlEnabled (_display displayCtrl 120)) then {
				playSound "AddItemFailed";
				[player, BIS_WL_fundsTransferCost] call BIS_fnc_WL2_fundsControl;
				private  _id = clientOwner;
				[] remoteExec ["BIS_fnc_WL2_clientFundsUpdate",  _id];
			};
			BIS_WL_purchaseMenuVisible = FALSE;
			WL_CONTROL_MAP ctrlEnable TRUE;
		}];
		
		_myDisplay displayAddEventHandler ["KeyDown", {
			_key = _this # 1;
			if (_key in actionKeys "Gear" && !BIS_WL_gearKeyPressed) then {
				["RequestMenu_close"] call BIS_fnc_WL2_setupUI;
				TRUE
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
		_purchase_title_queue = _myDisplay ctrlCreate ["RscStructuredText", 108];
		_purchase_queue = _myDisplay ctrlCreate ["RscListBox", 109];
		_purchase_remove_item = _myDisplay ctrlCreate ["RscStructuredText", 110];
		_purchase_remove_all = _myDisplay ctrlCreate ["RscStructuredText", 111];
		_purchase_title_drop = _myDisplay ctrlCreate ["RscStructuredText", 114];
		_purchase_drop_sector = _myDisplay ctrlCreate ["RscStructuredText", 112];
		_purchase_drop_player = _myDisplay ctrlCreate ["RscStructuredText", 113];
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
		_purchase_title_queue ctrlSetPosition [_xDef + (_wDef * 0.75), _yDef + (_hDef * 0.3175), _wDef / 4, _hDef * 0.04];
		_purchase_queue ctrlSetPosition [_xDef + (_wDef * 0.75), _yDef + (_hDef * 0.3575), _wDef / 4, _hDef * 0.1875];
		_purchase_background_2 ctrlSetPosition [_xDef + (_wDef * 0.75), _yDef + (_hDef * 0.5452), _wDef, _hDef * 0.2598];
		_purchase_remove_item ctrlSetPosition [_xDef + (_wDef * 0.75), _yDef + (_hDef * 0.5502), _wDef / 4, _hDef * 0.035];
		_purchase_remove_all ctrlSetPosition [_xDef + (_wDef * 0.75), _yDef + (_hDef * 0.59), _wDef / 4, _hDef * 0.035];
		_purchase_title_drop ctrlSetPosition [_xDef + (_wDef * 0.75), _yDef + (_hDef * 0.6502), _wDef / 4, _hDef * 0.04];
		_purchase_drop_sector ctrlSetPosition [_xDef + (_wDef * 0.75), _yDef + (_hDef * 0.6902), _wDef / 4, _hDef * 0.055];
		_purchase_drop_player ctrlSetPosition [_xDef + (_wDef * 0.75), _yDef + (_hDef * 0.75), _wDef / 4, _hDef * 0.055];
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
			_purchase_title_queue,
			_purchase_background_2,
			_purchase_title_drop
		];
		
		{_x ctrlCommit 0} forEach [
			_purchase_category,
			_purchase_items,
			_purchase_request,
			_purchase_queue,
			_purchase_remove_item,
			_purchase_remove_all,
			_purchase_drop_sector,
			_purchase_drop_player
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
		_purchase_background_2 ctrlSetBackgroundColor [0, 0, 0, 0.3];
		_purchase_remove_item ctrlSetBackgroundColor BIS_WL_colorFriendly;
		_purchase_remove_all ctrlSetBackgroundColor BIS_WL_colorFriendly;
		_purchase_drop_sector ctrlSetBackgroundColor BIS_WL_colorFriendly;
		_purchase_drop_player ctrlSetBackgroundColor BIS_WL_colorFriendly;
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
			_purchase_title_cost,
			_purchase_title_queue,
			_purchase_title_drop
		];
		
		_purchase_title_assets ctrlSetStructuredText parseText format ["<t size = '%2' align = 'center' shadow = '2'>%1</t>", localize "STR_A3_WL_purchase_menu_title_assets", (1.5 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];
		_purchase_title_details ctrlSetStructuredText parseText format ["<t size = '%2' align = 'center' shadow = '2'>%1</t>", localize "STR_A3_WL_purchase_menu_title_detail", (1.5 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];
		_purchase_title_deployment ctrlSetStructuredText parseText format ["<t size = '%2' align = 'center' shadow = '2'>%1</t>", localize "STR_A3_WL_purchase_menu_title_deployment", (1.5 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];
		_purchase_request ctrlSetStructuredText parseText format ["<t font = 'PuristaLight' align = 'center' shadow = '2' size = '%2'>%1</t>", toUpper localize "STR_A3_WL_menu_request", (1.75 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];
		_purchase_remove_item ctrlSetStructuredText parseText format ["<t font = 'PuristaLight' align = 'center' shadow = '2' size = '%2'>%1</t>", toUpper localize "STR_xbox_hint_remove", (1.15 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];
		_purchase_remove_all ctrlSetStructuredText parseText format ["<t font = 'PuristaLight' align = 'center' shadow = '2' size = '%2'>%1</t>", toUpper localize "STR_A3_WL_menu_remove_all", (1.15 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];
		_purchase_title_drop ctrlSetStructuredText parseText format ["<t size = '%2' align = 'center' shadow = '0'>%1</t>", localize "STR_A3_WL_airdrop_target", (1.25 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];
		_purchase_drop_sector ctrlSetStructuredText parseText format ["<t font = 'PuristaLight' align = 'center' shadow = '2' size = '%4'>%1</t>", toUpper localize "STR_A3_WL_airdrop_owned_sector", BIS_WL_dropCost, localize "STR_A3_WL_unit_cp", (1.75 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];
		_purchase_drop_player ctrlSetStructuredText parseText format ["<t font = 'PuristaLight' align = 'center' shadow = '2' size = '%4'>%1</t>", toUpper localize "STR_A3_WL_airdrop_player", BIS_WL_dropCost_far, localize "STR_A3_WL_unit_cp", (1.75 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];
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
					case "Arsenal": {call BIS_fnc_WL2_orderArsenal};
					case "LastLoadout": {call BIS_fnc_WL2_orderLastLoadout};
					case "SaveLoadout": {"save" call BIS_fnc_WL2_orderSavedLoadout};
					case "SavedLoadout": {"apply" call BIS_fnc_WL2_orderSavedLoadout};
					case "Scan": {[] spawn BIS_fnc_WL2_orderSectorScan};
					case "FTSeized": {FALSE spawn BIS_fnc_WL2_orderFastTravel};
					case "FTConflict": {TRUE spawn BIS_fnc_WL2_orderFastTravel};
					case "FundsTransfer": {call BIS_fnc_WL2_orderFundsTransfer};
					case "TargetReset": {call BIS_fnc_WL2_orderTargetReset};
					case "LockVehicles": {{_x lock TRUE; _x setUserActionText [_x getVariable ["BIS_WL_lockActionID", -1], format ["<t color = '%1'>%2</t>", if ((locked _x) == 2) then {"#4bff58"} else {"#ff4b4b"}, if ((locked _x) == 2) then {localize "STR_A3_cfgvehicles_miscunlock_f_0"} else {localize "STR_A3_cfgvehicles_misclock_f_0"}]]} forEach (WL_PLAYER_VEHS select {alive _x}); [toUpper localize "STR_A3_WL_feature_lock_all_msg"] spawn BIS_fnc_WL2_smoothText};
					case "UnlockVehicles": {{_x lock FALSE; _x setUserActionText [_x getVariable ["BIS_WL_lockActionID", -1], format ["<t color = '%1'>%2</t>", if ((locked _x) == 2) then {"#4bff58"} else {"#ff4b4b"}, if ((locked _x) == 2) then {localize "STR_A3_cfgvehicles_miscunlock_f_0"} else {localize "STR_A3_cfgvehicles_misclock_f_0"}]]} forEach (WL_PLAYER_VEHS select {alive _x}); [toUpper localize "STR_A3_WL_feature_unlock_all_msg"] spawn BIS_fnc_WL2_smoothText};
					case "RemoveUnits": {{_x call BIS_fnc_WL2_sub_deleteAsset} forEach ((groupSelectedUnits player) - [player])};
					case "RespawnVic": {[] spawn BIS_fnc_WL2_orderFTVehicle};
					case "RespawnVicFT": {[] spawn BIS_fnc_WL2_orderFTVehicleFT};
					case "welcomeScreen": {[] spawn BIS_fnc_WL2_welcome};
					default {[_className, _cost, _category, _requirements, _offset] call BIS_fnc_WL2_requestPurchase};
				};
			} else {
				playSound "AddItemFailed";
			};
		}];

		{
			_x ctrlAddEventHandler ["MouseEnter", {
				_display = uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull];
				if (ctrlEnabled (_display displayCtrl 107)) then {
					_button = _this # 0;
					_color = BIS_WL_colorFriendly;
					_button ctrlSetBackgroundColor [(_color # 0) * 1.25, (_color # 1) * 1.25, (_color # 2) * 1.25, _color # 3];
					playSound "click";
				};
			}];
			_x ctrlAddEventHandler ["MouseExit", {
				_display = uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull];
				if (ctrlEnabled (_display displayCtrl 107)) then {
					_button = _this # 0;
					_color = BIS_WL_colorFriendly;
					_button ctrlSetTextColor [1, 1, 1, 1];
					_button ctrlSetBackgroundColor _color;
				};
			}];
			_x ctrlAddEventHandler ["MouseButtonDown", {
				_display = uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull];
				if (ctrlEnabled (_display displayCtrl 107)) then {
					_button = _this # 0;
					_button ctrlSetTextColor [0.75, 0.75, 0.75, 1];
				};
			}];
			_x ctrlAddEventHandler ["MouseButtonUp", {
				_display = uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull];
				if (ctrlEnabled (_display displayCtrl 107)) then {
					_button = _this # 0;
					_button ctrlSetTextColor [1, 1, 1, 1];
				};
			}];
		} forEach [_purchase_remove_item, _purchase_remove_all];
		
		_purchase_remove_item ctrlAddEventHandler ["ButtonClick", {
			_display = uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull];
			if (ctrlEnabled (_display displayCtrl 107)) then {
				playSound "AddItemOK";
				_display = uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull];
				_purchase_queue = _display displayCtrl 109;
				_refund = _purchase_queue lbValue lbCurSel _purchase_queue;
				if (_refund > 0) then {
					_class = _purchase_queue lbData lbCurSel _purchase_queue;
					_i = -1;
					{if ((_x # 0) == _class) then {_i = _forEachIndex}} forEach BIS_WL_dropPool;
					_inf = ((BIS_WL_dropPool # _i) # 0) isKindOf "Man";
					BIS_WL_dropPool deleteAt _i;
					[player, _refund] call BIS_fnc_WL2_fundsControl;
					private  _id = clientOwner;
					[] remoteExec ["BIS_fnc_WL2_clientFundsUpdate",  _id];
					if (_inf) then {BIS_WL_matesInBasket = BIS_WL_matesInBasket - 1} else {BIS_WL_vehsInBasket = BIS_WL_vehsInBasket - 1};
					_display = uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull];
					_purchase_items = _display displayCtrl 101;
					call BIS_fnc_WL2_sub_purchaseMenuRefresh;
				};
			};
		}];
		
		_purchase_remove_all ctrlAddEventHandler ["ButtonClick", {
			_display = uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull];
			if (ctrlEnabled (_display displayCtrl 107)) then {
				playSound "AddItemOK";
				_refundTotal = 0;
				{
					_refundTotal = _refundTotal + (_x # 1);
				} forEach BIS_WL_dropPool;
				[player, _refundTotal] call BIS_fnc_WL2_fundsControl;
				private  _id = clientOwner;
				[] remoteExec ["BIS_fnc_WL2_clientFundsUpdate",  _id];
				BIS_WL_matesInBasket = 0;
				BIS_WL_vehsInBasket = 0;
				BIS_WL_dropPool = [];
				_display = uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull];
				_purchase_items = _display displayCtrl 101;
				call BIS_fnc_WL2_sub_purchaseMenuRefresh;
			};
		}];

		_purchase_drop_sector ctrlSetTooltip format ["%1%4: %2 %3", localize "STR_A3_WL_menu_cost", BIS_WL_dropCost, localize "STR_A3_WL_unit_cp", if (toLower language == "french") then {" "} else {""}];
		_purchase_drop_sector ctrlAddEventHandler ["MouseEnter", {
			if (uiNamespace getVariable ["BIS_WL_purchaseMenuDropSectorAffordable", FALSE]) then {
				uiNamespace setVariable ["BIS_WL_purchaseMenuButtonDropSectorHover", TRUE];
				_button = _this # 0;
				_color = BIS_WL_colorFriendly;
				_button ctrlSetBackgroundColor [(_color # 0) * 1.25, (_color # 1) * 1.25, (_color # 2) * 1.25, _color # 3];
				playSound "click";
			};
		}];
		_purchase_drop_sector ctrlAddEventHandler ["MouseExit", {
			if (uiNamespace getVariable ["BIS_WL_purchaseMenuDropSectorAffordable", FALSE]) then {
				uiNamespace setVariable ["BIS_WL_purchaseMenuButtonDropSectorHover", FALSE];
				_button = _this # 0;
				_color = BIS_WL_colorFriendly;
				_button ctrlSetTextColor [1, 1, 1, 1];
				_button ctrlSetBackgroundColor _color;
			};
		}];
		_purchase_drop_sector ctrlAddEventHandler ["MouseButtonDown", {
			if (uiNamespace getVariable ["BIS_WL_purchaseMenuDropSectorAffordable", FALSE]) then {
				_button = _this # 0;
				_button ctrlSetTextColor [0.75, 0.75, 0.75, 1];
			};
		}];
		_purchase_drop_sector ctrlAddEventHandler ["MouseButtonUp", {
			if (uiNamespace getVariable ["BIS_WL_purchaseMenuDropSectorAffordable", FALSE]) then {
				_button = _this # 0;
				_button ctrlSetTextColor [1, 1, 1, 1];
			};
		}];
		_purchase_drop_sector ctrlAddEventHandler ["ButtonClick", {
			_visitedSectorID = (BIS_WL_sectorsArray # 0) findIf {player inArea (_x getVariable "objectAreaComplete")};
			if (BIS_WL_vehsInBasket != ({(_x # 0) isKindOf "Thing"} count BIS_WL_dropPool)) then { //if there is a vehicle in queue
				if ((_visitedSectorID == -1)) then { // if not inside an onwned sector
					playSound "AddItemFailed";
				} else { // if they are in an owned sector
				    if (vehicle player != player) then {
						playSound "AddItemFailed";
					} else {
						playSound "AddItemOK";
						[FALSE] spawn BIS_fnc_WL2_orderAirdrop
					};				
				};
			} else { //if there is no vehicle in queue
				playSound "AddItemOK";
				[FALSE] spawn BIS_fnc_WL2_orderAirdrop
		    };
		}];
		
		_purchase_drop_player ctrlSetTooltip format ["%1%4: %2 %3", localize "STR_A3_WL_menu_cost", BIS_WL_dropCost_far, localize "STR_A3_WL_unit_cp", if (toLower language == "french") then {" "} else {""}];
		_purchase_drop_player ctrlAddEventHandler ["MouseEnter", {
			if (uiNamespace getVariable ["BIS_WL_purchaseMenuDropPlayerAffordable", FALSE]) then {
				uiNamespace setVariable ["BIS_WL_purchaseMenuButtonDropPlayerHover", TRUE];
				_button = _this # 0;
				_color = BIS_WL_colorFriendly;
				_button ctrlSetBackgroundColor [(_color # 0) * 1.25, (_color # 1) * 1.25, (_color # 2) * 1.25, _color # 3];
				playSound "click";
			};
		}];
		_purchase_drop_player ctrlAddEventHandler ["MouseExit", {
			if (uiNamespace getVariable ["BIS_WL_purchaseMenuDropPlayerAffordable", FALSE]) then {
				uiNamespace setVariable ["BIS_WL_purchaseMenuButtonDropPlayerHover", FALSE];
				_button = _this # 0;
				_color = BIS_WL_colorFriendly;
				_button ctrlSetTextColor [1, 1, 1, 1];
				_button ctrlSetBackgroundColor _color;
			};
		}];
		_purchase_drop_player ctrlAddEventHandler ["MouseButtonDown", {
			if (uiNamespace getVariable ["BIS_WL_purchaseMenuDropPlayerAffordable", FALSE]) then {
				_button = _this # 0;
				_button ctrlSetTextColor [0.75, 0.75, 0.75, 1];
			};
		}];
		_purchase_drop_player ctrlAddEventHandler ["MouseButtonUp", {
			if (uiNamespace getVariable ["BIS_WL_purchaseMenuDropPlayerAffordable", FALSE]) then {
				_button = _this # 0;
				_button ctrlSetTextColor [1, 1, 1, 1];
			};
		}];
		_purchase_drop_player ctrlAddEventHandler ["ButtonClick", {
			if (uiNamespace getVariable ["BIS_WL_purchaseMenuDropPlayerAffordable", FALSE]) then {
				playSound "AddItemOK";
				[TRUE] spawn BIS_fnc_WL2_orderAirdrop
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
				_amount = (parseNumber ctrlText (_display displayCtrl 117)) min (player getVariable "BIS_WL_funds");
				_targetArr = BIS_WL_allWarlords select {name _x == _targetName};
				if (count _targetArr > 0) then {
					playSound "AddItemOK";
					_target = _targetArr # 0;
					_targetFunds = _target getVariable "BIS_WL_funds";
					_maxTransfer = BIS_WL_maxCP - _targetFunds;
					_finalTransfer = (_amount min _maxTransfer) max 0;
					["fundsTransfer", [_target, _finalTransfer]] call BIS_fnc_WL2_sendClientRequest;
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
			playSound "AddItemFailed";
			[player, BIS_WL_fundsTransferCost] call BIS_fnc_WL2_fundsControl;
			private  _id = clientOwner;
			[] remoteExec ["BIS_fnc_WL2_clientFundsUpdate",  _id];
		}];
		
		((uiNamespace getVariable ["BIS_WL_purchaseMenuLastSelection", [0, 0, 0]]) # 0) call BIS_fnc_WL2_sub_purchaseMenuSetItemsList;
	};
	
	case "RequestMenu_close": {
		(uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull]) closeDisplay 1;
	};
};
