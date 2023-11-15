#include "..\warlords_constants.inc"

BIS_WL_allWarlords = +(playableUnits + switchableUnits) select {(side group _x) in BIS_WL_competingSides && !(_x getVariable ["BIS_WL_ignore", false])};

0 spawn {
	while {!BIS_WL_missionEnd} do {
		BIS_WL_allWarlords = BIS_WL_allWarlords - [objNull];
		{BIS_WL_allWarlords pushBackUnique _x} forEach ((playableUnits + switchableUnits) select {(side group _x) in BIS_WL_competingSides && !(_x getVariable ["BIS_WL_ignore", false])});
		uiSleep WL_TIMEOUT_LONG
	};
};