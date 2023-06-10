#include "..\warlords_constants.inc"

BIS_manLost = FALSE;

while {!BIS_WL_missionEnd} do {
	_t = serverTime + 600;
	waitUntil {sleep WL_TIMEOUT_SHORT; serverTime > _t || BIS_manLost};
	if (BIS_manLost) then {
		BIS_manLost = FALSE;
	} else {
		BIS_WL_matesAvailable = (BIS_WL_matesAvailable + 1) min BIS_WL_maxSubordinates;
		[] spawn BIS_fnc_WL2_refreshOSD;
	};
};