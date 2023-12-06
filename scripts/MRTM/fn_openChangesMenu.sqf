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
	parseText format ["<t color='%1' underline='1'>%2</t>", _color, "2.5.8.1 Update:" splitString " " joinString toString [160]], lineBreak,
	"-Server Performance improved.", lineBreak,
	"-Client Performance improved.", lineBreak,
	"-Pelican drones added, acts as suicide drones.", lineBreak,
	"-Group menu should work more smooth.", lineBreak,
	"-Forgive option for friendly fire added to vehicles and ai, not just players.", lineBreak,
	"-Spawn protection is enabled again if enemy team stops attacking the base.", lineBreak,
	"-Empty friendly vehicles show up on map.", lineBreak,
	"-Map markers are now filtered for slurs.", lineBreak,
	"-AI regeneration is reworked. No instant ai refreshing anymore.", lineBreak,
	"-Fixed not beeing able to kick people out of vehicle.", lineBreak,
	"-Fixed T-100x not beeing able to fire the main cannon.", lineBreak,
	"-Fixed enemy device truck showing up on map.", lineBreak,
	"-Fixed sector scan units's color.", lineBreak,
	"-Fixed destroyed autonomous assets still counting.", lineBreak,
	"", lineBreak,
	parseText format ["<a href='https://github.com/Gamer-Dad/warlordsredux.altis'>%1</a>", "Visit our github to view the earlier changes." splitString " " joinString toString [160]], lineBreak,
	parseText format ["<t color='%1' underline='1'>%2</t>", _color, "2.1.0001 Update:" splitString " " joinString toString [160]], lineBreak
];