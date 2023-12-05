#include "..\warlords_constants.inc"

params [["_fullRefresh", false, [false]]];

call BIS_fnc_WL2_sub_purchaseMenuRefresh;

waitUntil {!isNull (uiNamespace getVariable ["BIS_WL_osd_action_voting_title", controlNull])};
private _scale = (0.65 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale);
(uiNamespace getVariable "BIS_WL_osd_cp_current") ctrlSetStructuredText parseText format ["<t color='#ffffff' shadow = '2' size = '%2'>%1 CP</t>", ((missionNamespace getVariable "fundsDatabaseClients") get (getPlayerUID player)), 1 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale];
(uiNamespace getVariable "BIS_WL_osd_income_side_2") ctrlSetStructuredText parseText format ["<t size = '%3' shadow = '2'>%1/%2</t>", ((((missionNamespace getVariable ["BIS_WL_matesAvailable", 1]) - count ((units player) select {(_x getVariable ["BIS_WL_ownerAsset", "123"] == getPlayerUID player) && {_x != player}})) + 1) max 0), (missionNamespace getVariable ["BIS_WL_matesAvailable", 1]), _scale];

if (_fullRefresh) then {
	(uiNamespace getVariable "BIS_WL_osd_sectors_side_1") ctrlSetStructuredText parseText format ["<t size = '%2' align = 'center' shadow = '2'>%1</t>", count (BIS_WL_sectorsArray # 0), 0.6 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale];
	(uiNamespace getVariable "BIS_WL_osd_income_side_1") ctrlSetStructuredText parseText format ["<t size = '%2' shadow = '2'>+%1</t>", BIS_WL_playerSide call BIS_fnc_WL2_income, _scale];
};

if (BIS_WL_showHint_maintenance) then {
	(uiNamespace getVariable "BIS_WL_osd_rearm_possible") ctrlSetStructuredText parseText format ["<t color = '#00ff00' size = '%2' shadow = '2'>%1</t>", localize "STR_A3_WL_OSD_rearm_possible", _scale];
} else {
	(uiNamespace getVariable "BIS_WL_osd_rearm_possible") ctrlSetStructuredText parseText format ["<t color = '#00ff00' size = '%1' shadow = '2'></t>", _scale];
};

if (BIS_WL_showHint_nearSL) then {
	(uiNamespace getVariable "BIS_WL_osd_sl_nearby") ctrlSetStructuredText parseText format ["<img color='#3CB043' size='%1' image='\A3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeUnits_ca.paa'/>", 0.70 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale];
} else {
	(uiNamespace getVariable "BIS_WL_osd_sl_nearby") ctrlSetStructuredText parseText format ["<t color='#00ff00' size='%1' shadow='2'></t>", _scale];
};