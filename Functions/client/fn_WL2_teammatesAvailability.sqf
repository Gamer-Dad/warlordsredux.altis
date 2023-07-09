#include "..\warlords_constants.inc"

while {!BIS_WL_missionEnd} do {
	_t = serverTime + 600;
	waitUntil {sleep 5; serverTime > _t};
	BIS_WL_matesAvailable = (BIS_WL_matesAvailable + 1) min BIS_WL_maxSubordinates;
	[] spawn BIS_fnc_WL2_refreshOSD;
};