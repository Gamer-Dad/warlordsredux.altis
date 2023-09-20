#include "..\warlords_constants.inc"

BIS_WL_manLost = false;
while {!BIS_WL_missionEnd} do {
	_t = serverTime + 600;
	waitUntil {sleep 2; _t < serverTime || {BIS_WL_manLost}};
	if (BIS_WL_manLost) then {
		BIS_WL_manLost = false;
	} else {
		BIS_WL_matesAvailable = (BIS_WL_matesAvailable + 1) min BIS_WL_maxSubordinates;
		[] spawn BIS_fnc_WL2_refreshOSD;
	};
};