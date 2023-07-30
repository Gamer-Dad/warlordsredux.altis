/*
	Author: MrThomasM

	Description: Opens the settings menu.
*/

if (isNull (findDisplay 8000)) then {
	createDialog "MRTM_settingsMenu";
};
disableSerialization;

{
	ctrlSetText[(_x # 0), str (_x # 1)];
} forEach [[1400, (profileNamespace getVariable "MRTM_inf")], [1401, (profileNamespace getVariable "MRTM_ground")], [1402, (profileNamespace getVariable "MRTM_air")], [1403, (profileNamespace getVariable "MRTM_drones")], [1404, (profileNamespace getVariable "MRTM_objects")], [1405, (profileNamespace getVariable "MRTM_rwr1")], [1406, (profileNamespace getVariable "MRTM_rwr2")], [1407, (profileNamespace getVariable "MRTM_rwr3")], [1408, (profileNamespace getVariable "MRTM_rwr4")]];

{
	slidersetRange [(_x select 0), 100, 4000];
	sliderSetPosition[(_x select 0), (_x select 1)];
	((findDisplay 8000) displayCtrl (_x select 0)) sliderSetSpeed [(_x select 0), 100, 100];
} forEach [[1125, (profileNamespace getVariable "MRTM_inf")], [1126, (profileNamespace getVariable "MRTM_ground")], [1127, (profileNamespace getVariable "MRTM_air")], [1128, (profileNamespace getVariable "MRTM_drones")], [1129, (profileNamespace getVariable "MRTM_objects")]];

{
	slidersetRange [(_x select 0), 0.05, 2];
	sliderSetPosition[(_x select 0), (_x select 1)];
	((findDisplay 8000) displayCtrl (_x select 0)) sliderSetSpeed [(_x select 0), 0.05, 0.01];
} forEach [[1130, (profileNamespace getVariable "MRTM_rwr1")], [1131, (profileNamespace getVariable "MRTM_rwr2")], [1132, (profileNamespace getVariable "MRTM_rwr3")], [1133, (profileNamespace getVariable "MRTM_rwr4")]];

ctrlSetText[1101, (name player)];

if (profileNamespace getVariable "MRTM_syncObjects") then {
	((findDisplay 8000) displayCtrl 2800) cbSetChecked true;
	ctrlEnable [1129, false];
	ctrlEnable [1404, false];
} else {
	((findDisplay 8000) displayCtrl 2800) cbSetChecked false;
	ctrlEnable [1129, true];
	ctrlEnable [1404, true];
};

if (profileNamespace getVariable "MRTM_3rdPersonDisabled") then {
	((findDisplay 8000) displayCtrl 2801) cbSetChecked true;
} else {
	((findDisplay 8000) displayCtrl 2801) cbSetChecked false;
};

if (profileNamespace getVariable "MRTM_muteVoiceInformer") then {
	((findDisplay 8000) displayCtrl 2802) cbSetChecked true;
} else {
	((findDisplay 8000) displayCtrl 2802) cbSetChecked false;
};

if (profileNamespace getVariable "MRTM_playKillSound") then {
	((findDisplay 8000) displayCtrl 2803) cbSetChecked true;
} else {
	((findDisplay 8000) displayCtrl 2803) cbSetChecked false;
};

if (profileNamespace getVariable "MRTM_EnableRWR") then {
	((findDisplay 8000) displayCtrl 2804) cbSetChecked true;
} else {
	((findDisplay 8000) displayCtrl 2804) cbSetChecked false;
};

if (profileNamespace getVariable "MRTM_disableHint") then {
	((findDisplay 8000) displayCtrl 2805) cbSetChecked true;
} else {
	((findDisplay 8000) displayCtrl 2805) cbSetChecked false;
};

if (profileNamespace getVariable "MRTM_smallAnnouncerText") then {
	((findDisplay 8000) displayCtrl 2806) cbSetChecked true;
} else {
	((findDisplay 8000) displayCtrl 2806) cbSetChecked false;
};