#include "..\warlords_constants.inc"

BIS_WL_allWarlords = +(playableUnits + switchableUnits) select {(side group _x) in BIS_WL_competingSides && !(_x getVariable ["BIS_WL_ignore", FALSE])};

[] spawn BIS_fnc_WL2_refreshIconsToDraw;

[] spawn {
	while {TRUE} do {
		BIS_WL_allWarlords = BIS_WL_allWarlords - [objNull];
		{BIS_WL_allWarlords pushBackUnique _x} forEach ((playableUnits + switchableUnits) select {(side group _x) in BIS_WL_competingSides && !(_x getVariable ["BIS_WL_ignore", FALSE])});
		call BIS_fnc_WL2_refreshIconsToDraw;
		uiSleep WL_TIMEOUT_LONG
	};
};