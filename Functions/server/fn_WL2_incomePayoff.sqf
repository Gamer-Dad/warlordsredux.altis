while {!BIS_WL_missionEnd} do {
	sleep 60;
	private _notBlocked = allPlayers select {!(_x getVariable ["BIS_WL_incomeBlocked", false])};
	{
		_index = [west, east] find (side group _x);
		_var = ["actualIncomeBlu", "actualIncomeOpf"] select _index;
		_uid = getPlayerUID _x;

		if ((serverNamespace getVariable [_var, 40]) < 50) then {
			[_uid, 50] call BIS_fnc_WL2_fundsDatabaseWrite;
		} else {
			[_uid, (serverNamespace getVariable _var)] call BIS_fnc_WL2_fundsDatabaseWrite;
		};
	} forEach _notBlocked;
};