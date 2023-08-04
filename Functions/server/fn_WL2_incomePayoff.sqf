while {!BIS_WL_missionEnd} do {
	sleep 60;
	private _notBlocked = BIS_WL_allWarlords select {!(_x getVariable ["BIS_WL_incomeBlocked", false])};
	for "_i" from 0 to (count _notBlocked - 1) do {
		private _x = _notBlocked select _i;
		_side = (side group _x);
		_uid = getPlayerUID _x;

		if (_side == west) then {
			if ((missionNamespace getVariable ["actualIncomeBlu", 40]) < 50) then {
				[_uid, 50] call BIS_fnc_WL2_fundsDatabaseWrite;
			} else {
				[_uid, (missionNamespace getVariable "actualIncomeBlu")] call BIS_fnc_WL2_fundsDatabaseWrite;
			};
		} else {
			if ((missionNamespace getVariable ["actualIncomeOpf", 40]) < 50) then {
				[_uid, 50] call BIS_fnc_WL2_fundsDatabaseWrite;
			} else {
				[_uid, (missionNamespace getVariable "actualIncomeOpf")] call BIS_fnc_WL2_fundsDatabaseWrite;
			};
		};
	};

	private _curators = allCurators;
	for "_i2" from 0 to (count _curators - 1) do {
		private _x = _curators select _i2;
		_l = (vehicles + allUnits) select {(typeOf _x != "Logic") && {(alive _x) && {side group _x != civilian}}};
		_x addCuratorEditableObjects [_l, true];
	};
};