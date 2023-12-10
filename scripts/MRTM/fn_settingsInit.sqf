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

private _chair = createSimpleObject ["Land_OfficeChair_01_F", [4190.3,20096.9,316.909], true];
_chair setDir 281.389;
private _seat = createSimpleObject ["Sign_Pointer_Cyan_F", [4190.3,20096.9,317.462], true];
_seat setDir 101.802;
_seat setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0,0,0,0)"];
private _desk = createSimpleObject ["OfficeTable_01_new_F", [4191.02,20096.7,316.913], true];
_desk setDir 86.365;
private _screen1 = createSimpleObject ["Land_PCSet_01_screen_F", [4191.05,20097.2,317.754], true];
_screen1 setDir 38.168;
private _screen2 = createSimpleObject ["Land_PCSet_01_screen_F", [4191.31,20096.7,317.753], true];
_screen2 setDir 87.086;
private _screen3 = createSimpleObject ["Land_PCSet_01_screen_F", [4191.12,20096.2,317.753], true];
_screen3 setDir 132.739;
private _serverBottom = createSimpleObject ["Land_PortableServer_01_sand_F", [4190.86,20097.7,316.952], true];
_serverBottom setDir 86.365;
private _serverTop = createSimpleObject ["Land_PortableServer_01_sand_F", [4190.86,20097.7,317.299], true];
_serverTop setDir 86.365;
private _keyboard = createSimpleObject ["Land_PCSet_01_keyboard_F", [4190.9,20096.9,317.736], true];
_keyboard setDir 104.137;
private _mousePad = createSimpleObject ["Land_PCSet_01_mousepad_F", [4190.83,20096.5,317.735], true];
_mousePad setDir 86.365;
private _mouse = createSimpleObject ["Land_PCSet_01_mouse_F", [4190.78,20096.5,317.744], true];
_mouse setDir 91.834;
private _cabinet = createSimpleObject ["Land_OfficeCabinet_01_F", [4191.19,20095.6,316.908], true];
_cabinet setDir 86.365;
private _router = createSimpleObject ["Land_Router_01_sand_F", [4191.07,20097.8,317.647], true];
_router setDir 97.622;