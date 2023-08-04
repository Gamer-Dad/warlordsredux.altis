#include "..\warlords_constants.inc"

waitUntil {!isNull (findDisplay 46)};
sleep 2;
(findDisplay 46) displayAddEventHandler ["KeyDown", {
	_key = _this # 1;
	if (_key in actionKeys "Gear" && {!(missionNamespace getVariable ["BIS_WL_gearKeyPressed", false]) && {alive player && {lifeState player != "INCAPACITATED" && {!BIS_WL_penalized}}}}) then {
		if !(isNull (uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull])) then {
			["RequestMenu_close"] call BIS_fnc_WL2_setupUI;
		} else {
			BIS_WL_gearKeyPressed = TRUE;
			0 spawn {
				_t = time + 0.5;
				waitUntil {!BIS_WL_gearKeyPressed || {time >= _t}};
				if (time < _t) then {
					if (isNull findDisplay 602) then {
						if (vehicle player == player) then {
							if (cursorTarget distance player <= 5 && {!(cursorTarget isKindOf "House") && {(!alive cursorTarget || {!(cursorTarget isKindOf "Man")})}}) then {
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
						if (BIS_WL_currentSelection in [WL_ID_SELECTION_NONE, WL_ID_SELECTION_VOTED]) then {
							["RequestMenu_open"] call BIS_fnc_WL2_setupUI;
						} else {
							playSound "AddItemFailed";
							_action = switch (BIS_WL_currentSelection) do {
								case WL_ID_SELECTION_VOTING: {localize "STR_A3_WL_popup_voting"};
								case WL_ID_SELECTION_FAST_TRAVEL;
								case WL_ID_SELECTION_FAST_TRAVEL_CONTESTED: {localize "STR_A3_WL_action_destination_select"};
								case WL_ID_SELECTION_ORDERING_NAVAL;
								case WL_ID_SELECTION_ORDERING_AIRCRAFT;
								case WL_ID_SELECTION_ORDERING_AIRDROP: {localize "STR_A3_WL_action_dropzone"};
								case WL_ID_SELECTION_SCAN: {localize "STR_A3_WL_action_scan_select"};
								default {""};
							};
							[toUpper format [(localize "STR_A3_WL_another_action") + (if (_action == "") then {"."} else {" (%1)."}), _action]] spawn BIS_fnc_WL2_smoothText;
						};
					};
				};
			};
		};
		TRUE
	};
}];

(findDisplay 46) displayAddEventHandler ["KeyUp", {
	_key = _this # 1;
	if (_key in actionKeys "Gear") then {
		BIS_WL_gearKeyPressed = FALSE;
	};
}];
