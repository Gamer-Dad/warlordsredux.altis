#include "..\warlords_constants.inc"

BIS_WL_manLost = false;
while {!BIS_WL_missionEnd} do {
	private _sideCnt = count (allPlayers select {side group _x == side group player});
	private _timeout = (120 * (_sideCnt/8)) max 120;
	_t = serverTime + _timeout;
	waitUntil {sleep 2; _t < serverTime || {BIS_WL_manLost}};
	if (BIS_WL_manLost) then {
		BIS_WL_manLost = false;
	} else {
		_ai = missionNamespace getVariable [format ["BIS_WL_maxSubordinates_%1", side group player], 1];
		BIS_WL_matesAvailable = ((missionNamespace getVariable [format ["BIS_WL_maxSubordinates_%1", side group player], 1]) + 1) min _ai;
		[] spawn BIS_fnc_WL2_refreshOSD;
	};
};