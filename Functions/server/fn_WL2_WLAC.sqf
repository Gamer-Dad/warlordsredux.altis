private _oldFundsDB = (serverNamespace getVariable "fundsDatabase");
private _serverCheck = (["(EU) #11", serverName] call BIS_fnc_inString);

while {!BIS_WL_missionEnd && _serverCheck} do {
	private _sleep = 10;
	sleep _sleep;
	private _fundsDB = (serverNamespace getVariable "fundsDatabase");
	{
		private _uid = _x;
		private _newPlayerFunds = _y;
		private _transferFunds = (serverNamespace getVariable [format ["BIS_WL_WLAC_%1", _uid], 0]);
		private _oldPlayerFunds = (_oldFundsDB getOrDefault [_uid, 0]);
		private _diff = _newPlayerFunds - _oldPlayerFunds + _transferFunds;

		if (_diff >= 10000) then {
			private _player = _uid call BIS_fnc_getUnitByUid;
			private _diff = _newPlayerFunds - _oldPlayerFunds;
			diag_log format ["WLAC: Name: %1 UID: %2 earned %3CP within %4 seconds", name _player, _uid, _diff, _sleep];
			"You have been flagged for cheating and your CP has been reverted" remoteExec ["hint", owner _player];
			_fundsDB set [_uid, _oldPlayerFunds];
			(serverNamespace getVariable "fundsDatabase") call BIS_fnc_WL2_fundsDatabaseUpdate;
		};

		serverNamespace setVariable [format ["BIS_WL_WLAC_%1", _uid], nil];
	} forEach _fundsDB;
	_oldFundsDB = +_fundsDB;
};