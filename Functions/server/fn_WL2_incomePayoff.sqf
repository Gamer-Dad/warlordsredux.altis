while {!BIS_WL_missionEnd} do {
	sleep 60;
	private _notBlocked = BIS_WL_allWarlords select {!(_x getVariable ["BIS_WL_incomeBlocked", false])};
	{
		_side = (side group _x);
		_uid = getPlayerUID _x;

		if (_side == west) then {
			if ((serverNamespace getVariable ["actualIncomeBlu", 40]) < 50) then {
				[_uid, 50] call BIS_fnc_WL2_fundsDatabaseWrite;
			} else {
				[_uid, (serverNamespace getVariable "actualIncomeBlu")] call BIS_fnc_WL2_fundsDatabaseWrite;
			};
		} else {
			if ((serverNamespace getVariable ["actualIncomeOpf", 40]) < 50) then {
				[_uid, 50] call BIS_fnc_WL2_fundsDatabaseWrite;
			} else {
				[_uid, (serverNamespace getVariable "actualIncomeOpf")] call BIS_fnc_WL2_fundsDatabaseWrite;
			};
		};
	} forEach _notBlocked;
};