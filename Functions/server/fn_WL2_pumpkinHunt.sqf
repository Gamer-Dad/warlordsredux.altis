While {!BIS_WL_missionEnd} do {
	sleep 900;
	_hunt = ((floor random 10) >= 4);
	if (_hunt) then {
		[serverTime + 180] remoteExec ["BIS_fnc_WL2_cPumpkinHunt", [0, -2] select isDedicated];
	};
};