#include "..\warlords_constants.inc"

BIS_manLost = FALSE;

while {TRUE} do {
	_t = WL_SYNCED_TIME + 600;
	waitUntil {sleep WL_TIMEOUT_SHORT; WL_SYNCED_TIME > _t || BIS_manLost};
	if (BIS_manLost) then {
		BIS_manLost = FALSE;
	} else {
		BIS_WL_matesAvailable = (BIS_WL_matesAvailable + 1) min BIS_WL_maxSubordinates;
		0 spawn BIS_fnc_WL2_refreshOSD;
	};
};