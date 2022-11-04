#include "..\warlords_constants.inc"

params [["_fullRefresh", FALSE]];

call BIS_fnc_WL2_sub_purchaseMenuRefresh;

waitUntil {!isNull (uiNamespace getVariable ["BIS_WL_osd_action_voting_title", controlNull])};

(uiNamespace getVariable "BIS_WL_osd_cp_current") ctrlSetStructuredText parseText format ["<t shadow = '2' size = '%2'>%1 CP</t>", WL_PLAYER_FUNDS, 1 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale];

if (BIS_WL_fogOfWar != 0) then {
	(uiNamespace getVariable "BIS_WL_osd_income_side_2") ctrlSetStructuredText parseText format ["<t size = '%2' shadow = '2'>%1</t>", (BIS_WL_matesAvailable + 1 - count units group player) max 0, 0.65 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale];
};

if (_fullRefresh) then {
	(uiNamespace getVariable "BIS_WL_osd_sectors_side_1") ctrlSetStructuredText parseText format ["<t size = '%2' align = 'center' shadow = '2'>%1</t>", count (BIS_WL_sectorsArray # 0), 0.6 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale];
	(uiNamespace getVariable "BIS_WL_osd_income_side_1") ctrlSetStructuredText parseText format ["<t size = '%2' shadow = '2'>+%1</t>", BIS_WL_playerSide call BIS_fnc_WL2_income, 0.65 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale];
	if (BIS_WL_fogOfWar == 0) then {
		(uiNamespace getVariable "BIS_WL_osd_sectors_side_2") ctrlSetStructuredText parseText format ["<t size = '%2' align = 'center' shadow = '2'>%1</t>", count (BIS_WL_sectorsArrayEnemy # 0), 0.6 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale];
		(uiNamespace getVariable "BIS_WL_osd_income_side_2") ctrlSetStructuredText parseText format ["<t size = '%2' shadow = '2'>+%1</t>", BIS_WL_enemySide call BIS_fnc_WL2_income, 0.65 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale];
	};
};