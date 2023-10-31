/*
	Author: MrThomasM

	Description: Triggers when the slider pos is changed and updates view distance.
*/

params [["_mode", -1, [0]], ["_value", -1, [0]]];
if((_mode isEqualTo -1) || {(_value isEqualTo -1)}) exitWith {};
disableSerialization;

_varData = [["MRTM_inf", 1400], ["MRTM_ground", 1401], ["MRTM_air", 1402], ["MRTM_objects", 1404], ["MRTM_drones", 1403], ["MRTM_rwr1", 1405], ["MRTM_rwr2", 1406], ["MRTM_rwr3", 1407], ["MRTM_rwr4", 1408]] select _mode;

profileNamespace setVariable [(_varData # 0), _value];
ctrlSetText [(_varData # 1), str (profileNamespace getVariable [(_varData # 0), 0])];
[] call MRTM_fnc_updateViewDistance;

if(_mode isEqualTo 3) then {
	setObjectViewDistance [(profileNamespace getVariable ["MRTM_objects", 2000]), 50];
};

if (profileNamespace getVariable ["MRTM_syncObjects", true]) then {
	sliderSetPosition[1129, (profileNamespace getVariable ["MRTM_objects", 2000])];
	ctrlSetText[1404, str (profileNamespace getVariable ["MRTM_objects", 2000])];
};