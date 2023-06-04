#include "..\warlords_constants.inc"

params ["_action", "_actionParams"];

waitUntil {!isNull (uiNamespace getVariable ["BIS_WL_osd_action_voting_title", controlNull])};

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

switch (_action) do {
	case "voting": {
		BIS_WL_OSDEventArr set [0, _actionParams];
		if (count _actionParams == 0) exitWith {BIS_WL_terminateOSDEvent_voting = TRUE};
		BIS_WL_terminateOSDEvent_voting = FALSE;
		_actionParams params ["_tStart", "_tEnd", "_var"];
		_osd_progress_voting_background ctrlSetBackgroundColor [0, 0, 0, 0.25];
		_osd_progress_voting ctrlSetTextColor BIS_WL_colorFriendly;
		while {WL_SYNCED_TIME < _tEnd && {!BIS_WL_terminateOSDEvent_voting}} do {
			_osd_action_voting_title ctrlSetStructuredText parseText format ["<t shadow = '2' align = 'center' size = '%4'>%1%3: %2</t>", localize "STR_A3_WL_voting_hud_most_voted", ((missionNamespace getVariable _var) # 0) getVariable "BIS_WL_name", if (toLower language == "french") then {" "} else {""}, 1 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale];
			_osd_progress_voting progressSetPosition linearConversion [_tStart, _tEnd, WL_SYNCED_TIME, 0, 1];
			sleep WL_TIMEOUT_MIN;
		};
		BIS_WL_terminateOSDEvent_voting = FALSE;
		_osd_progress_voting_background ctrlSetBackgroundColor [0, 0, 0, 0];
		_osd_action_voting_title ctrlSetStructuredText parseText "";
		_osd_progress_voting ctrlSetTextColor [0, 0, 0, 0];
		_osd_progress_voting progressSetPosition 0;
	};
	case "seizing": {
		BIS_WL_OSDEventArr set [1, _actionParams];
		if (count _actionParams == 0) exitWith {BIS_WL_terminateOSDEvent_seizing = TRUE};
		BIS_WL_terminateOSDEvent_trespassing = TRUE;
		BIS_WL_terminateOSDEvent_seizingDisabled = TRUE;
		BIS_WL_terminateOSDEvent_seizing = FALSE;
		_actionParams params ["_sector", "_side", "_tStart", "_tEnd"];
		_osd_progress_background ctrlSetBackgroundColor (BIS_WL_colorsArray # (BIS_WL_sidesArray find (_sector getVariable "BIS_WL_owner")));
		_color = BIS_WL_colorsArray # (BIS_WL_sidesArray find _side);
		_color set [3, 1];
		_osd_progress ctrlSetTextColor _color;
		while {WL_SYNCED_TIME < _tEnd && {!BIS_WL_terminateOSDEvent_seizing}} do {
			_osd_action_title ctrlSetStructuredText parseText format ["<t shadow = '2' align = 'center' size = '%2'>%1</t>", _sector getVariable "BIS_WL_name", 1 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale];
			_osd_progress progressSetPosition linearConversion [_tStart, _tEnd, WL_SYNCED_TIME, 0, 1];
			sleep WL_TIMEOUT_MIN;
		};
		BIS_WL_terminateOSDEvent_seizing = TRUE;
		if (BIS_WL_terminateOSDEvent_trespassing) then {
			_osd_progress_background ctrlSetBackgroundColor [0, 0, 0, 0];
			_osd_action_title ctrlSetStructuredText parseText "";
			_osd_progress ctrlSetTextColor [0, 0, 0, 0];
			_osd_progress progressSetPosition 0;
		};
	};
	case "trespassing": {
		BIS_WL_OSDEventArr set [2, _actionParams];
		if (count _actionParams == 0) exitWith {BIS_WL_terminateOSDEvent_trespassing = TRUE};
		BIS_WL_terminateOSDEvent_seizing = TRUE;
		BIS_WL_terminateOSDEvent_trespassing = FALSE;
		_actionParams params ["_tStart", "_tEnd"];
		_osd_progress_background ctrlSetBackgroundColor [0, 0, 0, 0.25];
		_osd_progress ctrlSetTextColor [1, 0, 0, 1];
		while {WL_SYNCED_TIME < _tEnd && {!BIS_WL_terminateOSDEvent_trespassing}} do {
			_osd_action_title ctrlSetStructuredText parseText format ["<t shadow = '2' align = 'center' size = '%2'>%1</t>", localize "STR_A3_WL_osd_zone", 1 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale];
			_osd_progress progressSetPosition linearConversion [_tStart, _tEnd, WL_SYNCED_TIME, 0, 1];
			sleep WL_TIMEOUT_MIN;
		};
		BIS_WL_terminateOSDEvent_trespassing = TRUE;
		if (BIS_WL_terminateOSDEvent_seizing) then {
			_osd_progress_background ctrlSetBackgroundColor [0, 0, 0, 0];
			_osd_action_title ctrlSetStructuredText parseText "";
			_osd_progress ctrlSetTextColor [0, 0, 0, 0];
			_osd_progress progressSetPosition 0;
		};
	};
	case "seizingDisabled": {
		if (count _actionParams == 0) exitWith {BIS_WL_terminateOSDEvent_seizingDisabled = TRUE};
		BIS_WL_terminateOSDEvent_seizing = TRUE;
		BIS_WL_terminateOSDEvent_seizingDisabled = FALSE;
		_actionParams params ["_owner"];
		_osd_progress_background ctrlSetBackgroundColor (BIS_WL_colorsArray # (BIS_WL_sidesArray find _owner));
		_osd_action_title ctrlSetStructuredText parseText format ["<t shadow = '2' align = 'center' size = '%2'>%1</t>", localize "STR_A3_to_editterrainobject23", 1 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale];
		while {!BIS_WL_terminateOSDEvent_seizingDisabled} do {
			sleep WL_TIMEOUT_MIN;
		};
		BIS_WL_terminateOSDEvent_seizingDisabled = TRUE;
		if (BIS_WL_terminateOSDEvent_seizing) then {
			_osd_progress_background ctrlSetBackgroundColor [0, 0, 0, 0];
			_osd_action_title ctrlSetStructuredText parseText "";
			_osd_progress ctrlSetTextColor [0, 0, 0, 0];
			_osd_progress progressSetPosition 0;
		};
	};
};