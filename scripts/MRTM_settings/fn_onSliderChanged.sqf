/*
	Author: MrThomasM

	Description: Triggers when the slider pos is changed and updates view distance.
*/

params [["_mode", -1, [0]], ["_value", -1, [0]]];
if((_mode isEqualTo -1) || (_value isEqualTo -1)) exitWith {};
disableSerialization;

_varData = switch(_mode) do {
	case 0: {["MRTM_inf", 1400]};
	case 1: {["MRTM_ground", 1401]};
	case 2: {["MRTM_air", 1402]};
	case 3: {["MRTM_objects", 1404]};
	case 4: {["MRTM_drones", 1403]};
	case 5: {["MRTM_rwr1", 1405]};
	case 6: {["MRTM_rwr2", 1406]};
	case 7: {["MRTM_rwr3", 1407]};
	case 8: {["MRTM_rwr4", 1408]};
};

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