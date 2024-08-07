#include "..\warlords_constants.inc"

params ["_side"];

private _sortedArray = [];
private _lastLoadoutHandled = FALSE;
private _saveLoadoutHandled = FALSE;
private _savedLoadoutHandled = FALSE;

{
	_presetName = _x;
	_preset = configNull;
	
	if (isClass (missionConfigFile >> "CfgWLRequisitionPresets" >> _presetName)) then {
		_preset = missionConfigFile >> "CfgWLRequisitionPresets" >> _presetName;
	} else {
		if (isClass (configFile >> "CfgWLRequisitionPresets" >> _presetName)) then {
			_preset = configFile >> "CfgWLRequisitionPresets" >> _presetName;
		} else {
			[format ["Warlords error: Input preset class '%1' not found in any configs.", _presetName]] call BIS_fnc_error;
		};
	};
	
	if (isNull _preset) exitWith {};
	
	if (isClass (_preset >> str _side)) then {
		{
			if (_x == "Strategy") exitWith {};

			_index = _forEachIndex;
			_category = _x;
			_data = [];
			if (count _sortedArray >= (_index + 1)) then {
				_data = _sortedArray # _index
			};
			
			if (_category == "Gear") then {
				_data pushBack ["Arsenal", (getMissionConfigValue ["BIS_WL_arsenalCost", 1000]), [], (localize "STR_A3_Arsenal"), "\A3\Data_F_Warlords\Data\preview_arsenal.jpg", localize "STR_A3_WL_arsenal_open"];
			};
			
			if (_category == "Gear" && !_lastLoadoutHandled) then {
				_lastLoadoutHandled = TRUE;
				_data pushBack ["LastLoadout", (getMissionConfigValue ["BIS_WL_lastLoadoutCost", 100]), [], (localize "STR_A3_WL_last_loadout"), "\A3\Data_F_Warlords\Data\preview_loadout.jpg", localize "STR_A3_WL_last_loadout_info"];
			};
			
			if (_category == "Gear" && !_savedLoadoutHandled) then {
				_savedLoadoutHandled = TRUE;
				_data pushBack ["SavedLoadout", (getMissionConfigValue ["BIS_WL_savedLoadoutCost", 500]), [], (localize "STR_A3_WL_saved_loadout"), "\A3\Data_F_Warlords\Data\preview_loadout.jpg", format [localize "STR_A3_WL_saved_loadout_info", "<br/>"]];
			};
			
			{
				_className = configName _x;
				_class = configFile >> "CfgVehicles" >> _className;
				_cost = getNumber (_x >> "cost");
				_requirements = getArray (_x >> "requirements");
				_offset = getArray (_x >> "offset");
				_notForAIUse = getNumber (_x >> "blacklistAI");
				_displayName = getText (_class >> "displayName");
				_picture = getText (_class >> "editorPreview");
				_text = "";
				
				if (_category == "Infantry") then {
					_wpns = getArray (_class >> "weapons");
					_wpnArrPrimary = _wpns select {getNumber (configFile >> "CfgWeapons" >> _x >> "type") == 1};
					_wpnArrSecondary = _wpns select {getNumber (configFile >> "CfgWeapons" >> _x >> "type") == 4};
					_wpnArrHandgun = _wpns select {getNumber (configFile >> "CfgWeapons" >> _x >> "type") == 2};
					_wpn = if (count _wpnArrSecondary > 0) then {
						_wpnArrSecondary # 0;
					} else {
						if (count _wpnArrPrimary > 0) then {
							_wpnArrPrimary # 0;
						} else {
							if (count _wpnArrHandgun > 0) then {
								_wpnArrPrimary # 0;
							} else {
								""
							};
						};
					};
					{
						_text = _text + (getText (configFile >> "CfgWeapons" >> _x >> "displayName")) + "<br/>";
					} forEach (_wpnArrPrimary + _wpnArrSecondary + _wpnArrHandgun);
					_text = _text + "<br/>";
					_linked = getArray (_class >> "linkedItems");
					if (count _linked > 0) then {
						_text = _text + (getText (configFile >> "CfgWeapons" >> _linked # 0 >> "displayName")) + "<br/>";
					};
					_backpack = getText (_class >> "backpack");
					if (_backpack != "") then {_text = _text + (getText (configFile >> "CfgVehicles" >> _backpack >> "displayName"))};
				} else {
					if (_category in ["Vehicles", "Aircraft", "Naval", "Defences"]) then {
						_text = getText (_class >> "Library" >> "LibTextDesc");
						if (_text == "") then {_text = getText (_class >> "Armory" >> "description")};
						if (_text == "") then {
							_validClassArr = "toLower getText (_x >> 'vehicle') == toLower _entryClass" configClasses (configFile >> "CfgHints");
							if (count _validClassArr > 0) then {
								_hintLibClass = ("toLower getText (_x >> 'vehicle') == toLower _entryClass" configClasses (configFile >> "CfgHints")) # 0;
								_text = getText (_hintLibClass >> "description");
								if (count _text > 0) then {
									if (((toArray _text) # 0) == 37) then {
										_text = localize (((getArray (_hintLibClass >> "arguments")) # 1) # 0);
									};
								};
							};
						};
					} else {
						if (_category == "Gear") then {
							_transportWeapons = _class >> "TransportWeapons";
							_weaponsCnt = count _transportWeapons;
							_i = 0;
							for "_i" from 0 to (_weaponsCnt - 1) do {
								_item = getText ((_transportWeapons select _i) >> "weapon");
								_text = _text + format ["%3%2x %1", getText (configFile >> "CfgWeapons" >> _item >> "displayName"), getNumber ((_transportWeapons select _i) >> "count"), if (_text == "") then {""} else {", "}];
							};

							_transportItems = _class >> "TransportItems";
							_itemsCnt = count _transportItems;
							_i = 0;
							for "_i" from 0 to (_itemsCnt - 1) do {
								_item = getText ((_transportItems select _i) >> "name");
								_text = _text + format ["%3%2x %1", getText (configFile >> "CfgWeapons" >> _item >> "displayName"), getNumber ((_transportItems select _i) >> "count"), if (_text == "") then {""} else {", "}];
							};

							_transportMags = _class >> "TransportMagazines";
							_magsCnt = count _transportMags;
							_i = 0;
							for "_i" from 0 to (_magsCnt - 1) do {
								_item = getText ((_transportMags select _i) >> "magazine");
								_text = _text + format ["%3%2x %1", getText (configFile >> "CfgMagazines" >> _item >> "displayName"), getNumber ((_transportMags select _i) >> "count"), if (_text == "") then {""} else {", "}];
							};

							_transportBPacks = _class >> "TransportBackpacks";
							_bPacksCnt = count _transportBPacks;
							_i = 0;
							for "_i" from 0 to (_bPacksCnt - 1) do {
								_item = getText ((_transportBPacks select _i) >> "backpack");
								_text = _text + format ["%3%2x %1", getText (configFile >> "CfgVehicles" >> _item >> "displayName"), getNumber ((_transportBPacks select _i) >> "count"), if (_text == "") then {""} else {", "}];
							};
						};
					};
				};
				
				if (_text != "") then {
					_textNew = (_text splitString "$") # 0;
					if (_textNew != _text) then {_text = localize _textNew} else {_text = _textNew};
				};
				
				_textSize = count _text;
				_textLimit = if (_category != "Gear") then {500} else {750};
				
				if (_textSize > _textLimit) then {
					_textArr = toArray _text;
					_textArr deleteRange [_textLimit, _textSize - _textLimit];
					_text = toString _textArr;
					if (_category != "Gear") then {
						_text = _text + "...<br/><br/>" + localize "STR_A3_WL_menu_field_manual_tip";
					} else {
						_text = _text + "..."
					};
				};
				
				if (_text == "") then {_text = " "};
				if (_picture == "") then {_picture = " "};
				
				_data pushBack [_className, _cost, _requirements, _displayName, _picture, _text, _offset, _notForAIUse];
			} forEach (configProperties [_preset >> str _side >> _x, "isClass _x"]);
			
			if (_category == "Gear" && !_saveLoadoutHandled) then {
				_saveLoadoutHandled = TRUE;
				_data pushBack ["SaveLoadout", 0, [], (localize "STR_A3_WL_save_loadout"), "\A3\Data_F_Warlords\Data\preview_loadout.jpg", localize "STR_A3_WL_save_loadout_info"];
			};
			
			_sortedArray set [_index, _data];
		} forEach WL_REQUISITION_CATEGORIES;
	} else {
		[format ["Warlords warning: Input preset class '%1' does not contain any data for side '%2'", _presetName, _side]] call BIS_fnc_error;
	};
} forEach BIS_WL_purchaseListTeplateArr;

_strategyArr = [];

_strategyArr pushBack ["Scan", (getMissionConfigValue ["BIS_WL_scanCost", 750]), [], localize "STR_A3_WL_param4_title", "\A3\Data_F_Warlords\Data\preview_scan.jpg", localize "STR_A3_WL_menu_scan_info"];
_strategyArr pushBack ["FTSeized", 0, [], localize "STR_A3_WL_menu_fasttravel_seized", "\A3\Data_F_Warlords\Data\preview_ft_owned.jpg", localize "STR_A3_WL_menu_fasttravel_info"];
_strategyArr pushBack ["FTConflict", (getMissionConfigValue ["BIS_WL_fastTravelCostContested", 200]), [], localize "STR_A3_WL_menu_fasttravel_conflict", "\A3\Data_F_Warlords\Data\preview_ft_conflict.jpg", localize "STR_A3_WL_menu_fasttravel_info"];
_strategyArr pushBack ["RespawnVicFT", 0, [], localize "STR_A3_WL_respawn_vicFT_ft", "\A3\Data_F_Warlords\Data\preview_ft_conflict.jpg", ""];
_strategyArr pushBack ["RespawnPodFT", 0, [], "Fast Travel to Medical Pod (Free)", "\A3\Data_F_Warlords\Data\preview_ft_conflict.jpg", ""];
_strategyArr pushBack ["RespawnVic", (getMissionConfigValue ["BIS_WL_orderFTVehicleCost", 200]), [], localize "STR_A3_WL_respawn_vicFT_order", "\A3\Data_F_Warlords\Data\preview_ft_conflict.jpg", ""];
_strategyArr pushBack ["RespawnPod", (getMissionConfigValue ["BIS_WL_orderFTVehicleCost", 200]), [], "Purchase Fast Travel Pod", "\A3\Data_F_Warlords\Data\preview_ft_conflict.jpg", "Order medical pod"];
_strategyArr pushBack ["FundsTransfer", (getMissionConfigValue ["BIS_WL_fundsTransferCost", 2000]), [], localize "STR_A3_WL_menu_fundstransfer", "\A3\Data_F_Warlords\Data\preview_cp_transfer.jpg", localize "STR_A3_WL_menu_fundstransfer_info"];
_strategyArr pushBack ["TargetReset", (getMissionConfigValue ["BIS_WL_targetResetCost", 500]), [], localize "STR_A3_WL_menu_resetvoting", "\A3\Data_F_Warlords\Data\preview_ft_conflict.jpg", localize "STR_A3_WL_menu_resetvoting_info"];
_strategyArr pushBack ["forfeitVote", 0, [], "Order forfeit", "\A3\Data_F_Warlords\Data\preview_ft_conflict.jpg", ""];
_strategyArr pushBack ["LockVehicles", 0, [], localize "STR_A3_WL_feature_lock_all", "\A3\Data_F_Warlords\Data\preview_empty.jpg", ""];
_strategyArr pushBack ["UnlockVehicles", 0, [], localize "STR_A3_WL_feature_unlock_all", "\A3\Data_F_Warlords\Data\preview_empty.jpg", ""];
_strategyArr pushBack ["clearVehicles", 0, [], "Kick players from all vehicles", "\A3\Data_F_Warlords\Data\preview_empty.jpg", "This doesn't include you or your AI."];
_strategyArr pushBack ["wipeMap", 0, [], "Wipe Map", "\A3\Data_F_Warlords\Data\preview_empty.jpg", "Wipes all user-defined markers from your own map locally. This includes your own."];
_strategyArr pushBack ["RemoveUnits", 0, [], localize "STR_A3_WL_feature_dismiss_selected", "\A3\Data_F_Warlords\Data\preview_empty.jpg", ""];
_strategyArr pushBack ["welcomeScreen", 0, [], localize "STR_A3_WL_infoScreen", "img\wl_logo_ca.paa", ""];
_sortedArray pushBack _strategyArr;

missionNamespace setVariable [format ["BIS_WL_purchasable_%1", _side], _sortedArray];