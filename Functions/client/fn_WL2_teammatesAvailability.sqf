#include "..\warlords_constants.inc"

while {!BIS_WL_missionEnd} do {
	private _sideCnt = count (allPlayers select {side group _x == side group player});
	private _timeout = (120 * (_sideCnt/8)) max 120;
	sleep _timeout;
	BIS_WL_matesAvailable = (BIS_WL_matesAvailable + 1) min (missionNamespace getVariable [format ["BIS_WL_maxSubordinates_%1", side group player], 1]);
	false spawn BIS_fnc_WL2_refreshOSD;
};