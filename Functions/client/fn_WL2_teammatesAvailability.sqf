_side = playerSide;
while {!BIS_WL_missionEnd} do {
	private _sideCnt = count (allPlayers select {side group _x == _side});
	private _timeout = (120 * (_sideCnt/8)) max 120;
	sleep _timeout;
	if (missionNamespace getVariable ["WL2_manLost", false]) then {
		missionNamespace setVariable ["WL2_manLost", false];
	} else {
		BIS_WL_matesAvailable = (BIS_WL_matesAvailable + 1) min (missionNamespace getVariable [format ["BIS_WL_maxSubordinates_%1", _side], 1]);
	};
	false spawn BIS_fnc_WL2_refreshOSD;
};