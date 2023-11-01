/*
	Author: MrThomasM

	Description: Triggers when the slider pos is changed and updates view distance.
*/

params [["_mode", -1, [0]], ["_value", -1, [0]]];
if((_mode isEqualTo -1) || {(_value isEqualTo -1)}) exitWith {};
disableSerialization;

_varData = [["MRTM_inf", 8004], ["MRTM_ground", 8006], ["MRTM_air", 8008], ["MRTM_objects", 8014], ["MRTM_drones", 8010], ["MRTM_rwr1", 8016], ["MRTM_rwr2", 8018], ["MRTM_rwr3", 8020], ["MRTM_rwr4", 8022]] select _mode;

profileNamespace setVariable [(_varData # 0), _value];
ctrlSetText [(_varData # 1), str (profileNamespace getVariable [(_varData # 0), 0])];
[] call MRTM_fnc_updateViewDistance;

if(_mode isEqualTo 3) then {
	setObjectViewDistance [(profileNamespace getVariable ["MRTM_objects", 2000]), 50];
};

if (profileNamespace getVariable ["MRTM_syncObjects", true]) then {
	sliderSetPosition[8012, (profileNamespace getVariable ["MRTM_objects", 2000])];
	ctrlSetText[8014, str (profileNamespace getVariable ["MRTM_objects", 2000])];
};