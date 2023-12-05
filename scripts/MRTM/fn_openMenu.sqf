/*
	Author: MrThomasM

	Description: Opens the settings menu.
*/

if (isNull (findDisplay 8000)) then {
	private _d = [4000, 5000, 6000, 7000, 8000];
	{
		if !(isNull (findDisplay _x)) then {
			(findDisplay _x) closeDisplay 1;
		};
	} forEach _d;
	createDialog "MRTM_settingsMenu";
};
disableSerialization;

((findDisplay 8000) displayCtrl 8001) ctrlSetStructuredText parseText format ["<a href='https://discord.gg/grmzsZE4ua'>%1</a> <t size='%3' valign='middle' align='right'>%2</t></t>", "Join the discord" splitString " " joinString toString [160], (name player), 1 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale];
{
	ctrlSetText [(_x # 0), str (_x # 1)];
} forEach [[8004, (profileNamespace getVariable ["MRTM_inf", 2000])], [8006, (profileNamespace getVariable ["MRTM_ground", 3000])], [8008, (profileNamespace getVariable ["MRTM_air", 4000])], [8010, (profileNamespace getVariable ["MRTM_drones", 4000])], [8014, (profileNamespace getVariable ["MRTM_objects", 2000])], [8016, (profileNamespace getVariable ["MRTM_rwr1", 0.3])], [8018, (profileNamespace getVariable ["MRTM_rwr2", 0.3])], [8020, (profileNamespace getVariable ["MRTM_rwr3", 0.2])], [8022, (profileNamespace getVariable ["MRTM_rwr4", 0.3])]];
{
	slidersetRange [(_x select 0), 100, 4000];
	sliderSetPosition [(_x select 0), (_x select 1)];
	((findDisplay 8000) displayCtrl (_x select 0)) sliderSetSpeed [100, 4000, 50];
} forEach [[8003, (profileNamespace getVariable ["MRTM_inf", 2000])], [8005, (profileNamespace getVariable ["MRTM_ground", 3000])], [8007, (profileNamespace getVariable ["MRTM_air", 4000])], [8009, (profileNamespace getVariable ["MRTM_drones", 4000])], [8012, (profileNamespace getVariable ["MRTM_objects", 2000])]];
((findDisplay 8000) displayCtrl 8013) cbSetChecked (profileNamespace getVariable ["MRTM_syncObjects", true]);
ctrlEnable [8012, !(profileNamespace getVariable ["MRTM_syncObjects", true])];
ctrlEnable [8014, !(profileNamespace getVariable ["MRTM_syncObjects", true])];

{
	slidersetRange [(_x select 0), 0.05, 0.4];
	sliderSetPosition [(_x select 0), (_x select 1)];
	((findDisplay 8000) displayCtrl (_x select 0)) sliderSetSpeed [0.05, 0.4, 0.01];
} forEach [[8015, (profileNamespace getVariable ["MRTM_rwr1", 0.3])], [8017, (profileNamespace getVariable ["MRTM_rwr2", 0.3])], [8019, (profileNamespace getVariable ["MRTM_rwr3", 0.2])], [8021, (profileNamespace getVariable ["MRTM_rwr4", 0.3])]];

((findDisplay 8000) displayCtrl 8023) cbSetChecked (profileNamespace getVariable ["MRTM_EnableRWR", true]);
((findDisplay 8000) displayCtrl 8024) cbSetChecked (profileNamespace getVariable ["MRTM_3rdPersonDisabled", false]);
((findDisplay 8000) displayCtrl 8025) cbSetChecked (profileNamespace getVariable ["MRTM_muteVoiceInformer", false]);
((findDisplay 8000) displayCtrl 8026) cbSetChecked (profileNamespace getVariable ["MRTM_playKillSound", true]);
((findDisplay 8000) displayCtrl 8027) cbSetChecked (profileNamespace getVariable ["MRTM_enableAuto", false]);
((findDisplay 8000) displayCtrl 8028) cbSetChecked (profileNamespace getVariable ["MRTM_smallAnnouncerText", false]);
((findDisplay 8000) displayCtrl 8029) cbSetChecked (profileNamespace getVariable ["MRTM_spawnEmpty", false]);

_kills = (profileNamespace getVariable ["WL2_totalKills", 0]);
_kd = round ((profileNamespace getVariable ["WL2_totalKills", 0])/((profileNamespace getVariable ["WL2_totalDeaths", 0]) max 1));
((findDisplay 8000) displayCtrl 8030) ctrlSetStructuredText parseText format ["<t size='%3'><t size='%3' valign='middle' align='left'>Kills: %1</t> <t size='%3' valign='middle' align='right'>K/D:%2</t></t>", _kills, _kd, 0.8 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale];
ctrlSetText [8031, format ["Win ratio: %1/%2", (profileNamespace getVariable ["WL2_gamesWon", 0]), (profileNamespace getVariable ["WL2_gamesLost", 0])]];
ctrlSetText [8032, format ["Sectors seized: %1", (profileNamespace getVariable ["WL2_sectorsSeized", 0])]];
ctrlSetText [8033, format ["Longest distance kill: %1meters", round (sqrt (profileNamespace getVariable ["WL2_longestDistanceKill", 0]))]];