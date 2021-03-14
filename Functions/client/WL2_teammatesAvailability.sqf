#include "..\warlords_constants.inc"

BIS_manLost = FALSE;

while {TRUE} do {
	_t = time + 120;
	waitUntil {sleep WL_TIMEOUT_SHORT; time > _t || BIS_manLost};
	if (BIS_manLost) then {
		BIS_manLost = FALSE;
	} else {
		BIS_WL_matesAvailable = (BIS_WL_matesAvailable + 1) min BIS_WL_maxSubordinates;
		[] spawn BIS_fnc_WL2_refreshOSD;
	};
};