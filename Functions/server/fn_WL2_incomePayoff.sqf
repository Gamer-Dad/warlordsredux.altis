while {!BIS_WL_missionEnd} do {
	sleep 60;
	{
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
	} forEach (BIS_WL_allWarlords) select {!(_x getVariable ["BIS_WL_incomeBlocked", false])};
	
	{
		_l = (vehicles + allUnits) select {(typeOf _x != "Logic") && {(alive _x) && {side group _x != civilian}}};
		_x addCuratorEditableObjects [_l, true];
	} forEach allCurators;	
};