private _refreshTimerVar = format ["WL2_manpowerRefreshTimers_%1", getPlayerUID player];

private _manpowerRefreshTimers = missionNamespace getVariable [_refreshTimerVar, []];
_manpowerRefreshTimers = _manpowerRefreshTimers select {
	private _asset = _x # 1;
	_x # 0 > serverTime || alive _asset
};

private _maxSubordinates = missionNamespace getVariable [format ["BIS_WL_maxSubordinates_%1", BIS_WL_playerSide], 1];
BIS_WL_matesAvailable = _maxSubordinates - (count _manpowerRefreshTimers);

false spawn WL2_fnc_refreshOSD;