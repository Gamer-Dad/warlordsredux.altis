if !(profileNamespace getVariable ["viewSettingsInitialzed", false]) then {
	profileNamespace setVariable ["MRTM_inf", 2000];
	profileNamespace setVariable ["MRTM_ground", 3000];
	profileNamespace setVariable ["MRTM_air", 4000];
	profileNamespace setVariable ["MRTM_drones", 4000];
	profileNamespace setVariable ["MRTM_objects", 2000];
	profileNamespace setVariable ["MRTM_syncObjects", true];
	profileNamespace setVariable ["viewSettingsInitialzed", true];
	saveProfileNamespace;
};
setTerrainGrid 3.125;

if !(profileNamespace getVariable ["warningSettingsInitialzed", false]) then {
	profileNamespace setVariable ["MRTM_rwr1", 0.3];
	profileNamespace setVariable ["MRTM_rwr2", 0.3];
	profileNamespace setVariable ["MRTM_rwr3", 0.2];
	profileNamespace setVariable ["MRTM_rwr4", 0.3];
	profileNamespace setVariable ["warningSettingsInitialzed", true];
	saveProfileNamespace;
};

if !(profileNamespace getVariable ["preferencesInitialzed", false]) then {
	profileNamespace setVariable ["MRTM_3rdPersonDisabled", false];
	profileNamespace setVariable ["MRTM_playKillSound", true];
	profileNamespace setVariable ["MRTM_muteVoiceInformer", false];
	profileNamespace setVariable ["MRTM_EnableRWR", true];
	profileNamespace setVariable ["MRTM_smallAnnouncerText", false];
	profileNamespace setVariable ["MRTM_spawnEmpty", false];
	profileNamespace setVariable ["MRTM_enableAuto", true];
	profileNamespace setVariable ["preferencesInitialzed", true];
	saveProfileNamespace;
};

if !(profileNamespace getVariable ["statsInitialized", false]) then {
	profileNamespace setVariable ["WL2_gamesWon", 0];
	profileNamespace setVariable ["WL2_gamesLost", 0];
	profileNamespace setVariable ["WL2_sectorsSeized", 0];
	profileNamespace setVariable ["WL2_longestDistanceKill", 0];
	profileNamespace setVariable ["WL2_totalKills", 0];
	profileNamespace setVariable ["WL2_totalDeaths", 0];
	profileNamespace setVariable ["statsInitialized", true];
	saveProfileNamespace;
};
player setVariable ["MRTM_3rdPersonDisabled", (profileNamespace getVariable ["MRTM_3rdPersonDisabled", false]), [2, clientOwner]];

MRTM_fnc_onSliderChanged = compileFinal preprocessFileLineNumbers "scripts\MRTM\fn_onSliderChanged.sqf";
MRTM_fnc_updateViewDistance = compileFinal preprocessFileLineNumbers "scripts\MRTM\fn_updateViewDistance.sqf";
MRTM_fnc_openMenu = compileFinal preprocessFileLineNumbers "scripts\MRTM\fn_openMenu.sqf";
MRTM_fnc_onChar = compileFinal preprocessFileLineNumbers "scripts\MRTM\fn_onChar.sqf";
MRTM_fnc_statTracker = compileFinal preprocessFileLineNumbers "scripts\MRTM\fn_statTracker.sqf";
MRTM_fnc_openGroupMenu = compileFinal preprocessFileLineNumbers "scripts\MRTM\fn_openGroupMenu.sqf";
MRTM_fnc_getLBPicture = compileFinal preprocessFileLineNumbers "scripts\MRTM\fn_getLBPicture.sqf";
MRTM_fnc_getLBText = compileFinal preprocessFileLineNumbers "scripts\MRTM\fn_getLBText.sqf";
MRTM_fnc_onLBSelChanged = compileFinal preprocessFileLineNumbers "scripts\MRTM\fn_onLBSelChanged.sqf";
MRTM_fnc_onButtonClick = compileFinal preprocessFileLineNumbers "scripts\MRTM\fn_onButtonClick.sqf";
MRTM_fnc_openDebugMenu = compileFinal preprocessFileLineNumbers "Scripts\MRTMDebug\fn_openDebugMenu.sqf";
MRTM_fnc_setReturnValue = compileFinal preprocessFileLineNumbers "Scripts\MRTMDebug\fn_setReturnValue.sqf";