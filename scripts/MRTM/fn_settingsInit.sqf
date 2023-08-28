//View distance
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

//Radar warning system
if !(profileNamespace getVariable ["warningSettingsInitialzed", false]) then {
	profileNamespace setVariable ["MRTM_rwr1", 0.3];
	profileNamespace setVariable ["MRTM_rwr2", 0.3];
	profileNamespace setVariable ["MRTM_rwr3", 0.2];
	profileNamespace setVariable ["MRTM_rwr4", 0.3];
	profileNamespace setVariable ["warningSettingsInitialzed", true];
	saveProfileNamespace;
};

//Options
if !(profileNamespace getVariable ["preferencesInitialzed", false]) then {
	profileNamespace setVariable ["MRTM_3rdPersonDisabled", false];
	profileNamespace setVariable ["MRTM_playKillSound", true];
	profileNamespace setVariable ["MRTM_muteVoiceInformer", false];
	profileNamespace setVariable ["MRTM_EnableRWR", true];
	profileNamespace setVariable ["MRTM_disableHint", true];
	profileNamespace setVariable ["MRTM_smallAnnouncerText", false];
	profileNamespace setVariable ["MRTM_spawnEmpty", false];
	profileNamespace setVariable ["preferencesInitialzed", true];
	saveProfileNamespace;
};

//Stats
if !(profileNamespace getVariable ["statsInitialized", false]) then {
	profileNamespace setVariable ["WL2_TotalEarnedCP", 0];
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
has_recieved_reward = false;
player setVariable ["reward_active", false];

missionNamespace setVariable [(format ["MRTM_invitesOut_%1", getPlayerUID player]), [], [clientOwner, 2]];
missionNamespace setVariable [(format ["MRTM_invitesIn_%1", getPlayerUID player]), [], [clientOwner, 2]];