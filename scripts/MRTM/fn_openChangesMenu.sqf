/*
	Author: MrThomasM

	Description: Opens the changelogs.
*/

if (isNull (findDisplay 6000)) then {
	private _d = [4000, 5000, 6000, 7000, 8000];
	{
		if !(isNull (findDisplay _x)) then {
			(findDisplay _x) closeDisplay 1;
		};
	} forEach _d;
	createDialog "MRTM_changesMenu";
};
disableSerialization;

private _color = [profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843],profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019],profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862],profilenamespace getvariable ['GUI_BCG_RGB_A',0.7]] call BIS_fnc_colorRGBAtoHTML;
((findDisplay 6000) displayCtrl 6102) ctrlSetStructuredText composeText [
	parseText format ["<t color='%1' underline='1'>%2</t>", _color, "2.5.8 Update:" splitString " " joinString toString [160]], lineBreak,
	"-Performance improved.", lineBreak,
	"-Group system added.", lineBreak,
	"-When in a group and you die within 200m of the SL, you respawn next to him with your last loadout.", lineBreak,
	"-Friendly fire between group members disabled.", lineBreak,
	"-APS Improved. 120m -> 40m interception range.", lineBreak,
	"-User settings are saved acros games.", lineBreak,
	"-Player stats added: Total kills, K/D, Sectors seized, Total CP earned, Longest kill distance.", lineBreak,
	"-Last loadout unavailable if it's the same as your current.", lineBreak,
	"-Option to spawn vehicles with empty inventory added.", lineBreak,
	"-Dynamic sector population. More players means less AI spawns.", lineBreak,
	"-Kill bonus if the unit you killed was in the AO.", lineBreak,
	"-Emotes added.", lineBreak,
	"-AI availability UI improved. *available*/*Total*", lineBreak,
	"-Cheaters can't spawn vehicles anymore.", lineBreak,
	"-Cheaters can't get free vehicles.", lineBreak,
	"-Cheaters can't get sector scans for free or target resets.", lineBreak,
	"-Can't bypass rearm timer anymore.", lineBreak,
	"-New base location code. Bases are now a lot more random and never the same as the game before.", lineBreak,
	"-By default autonomous mode is turned off on vehicles with this option.", lineBreak,
	"-Auto smokes for vehicles when APS is triggered is disabled.", lineBreak,
	"-AAF can capture sectors.", lineBreak,
	"-CP income is only for connected sectors.", lineBreak,
	"-Autonomous HMG/GMG added.", lineBreak,
	"-Option to forgive friendly fire incidents.", lineBreak,
	"-Anti AFK system added.", lineBreak,
	"-UI rework.", lineBreak,
	"-'T-100X Futura' added.", lineBreak,
	"-MK45 Hammer added.", lineBreak,
	"", lineBreak,
	parseText format ["<a href='https://github.com/Gamer-Dad/warlordsredux.altis'>%1</a>", "Visit our github to view the earlier changes." splitString " " joinString toString [160]], lineBreak,
	parseText format ["<t color='%1' underline='1'>%2</t>", _color, "2.1.0001 Update:" splitString " " joinString toString [160]], lineBreak
];