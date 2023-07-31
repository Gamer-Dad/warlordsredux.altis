params ["_action", "_ctrl"];

if (_action == "Invite") exitWith {
	_curSel = lbCurSel 4007;
	if (_curSel > -1) then {
		_data = lbData [4007, _curSel];
		_unit = _data call BIS_fnc_getUnitByUID;
		[_unit, player] remoteExec ["MRTM_fnc_invite", 2];
	};
	[] call MRTM_fnc_openGroupMenu;
};

if (_action == "Decline") exitWith {
	_curSel = lbCurSel 4007;
	if (_curSel > -1) then {
		_data = lbData [4007, _curSel];
		_unit = _data call BIS_fnc_getUnitByUID;
		[_unit, player] remoteExec ["MRTM_fnc_accept", 2];
	};
	[] call MRTM_fnc_openGroupMenu;
};

if (_action == "Accept") exitWith {
	_curSel = lbCurSel 4007;
	if (_curSel > -1) then {
		_data = lbData [4007, _curSel];
		_unit = _data call BIS_fnc_getUnitByUID;
		_units = ((units player) select {((_x getVariable ["BIS_WL_ownerAsset", "123"]) call BIS_fnc_getUnitByUID) == player});
		_group = (group _unit);
		player joinSilent _group;
		{
			_x joinSilent _group;
		} forEach _units;	
		[_unit, player] remoteExec ["MRTM_fnc_accept", 2];

	};
	[] call MRTM_fnc_openGroupMenu;
};

if (_action == "Promote") exitWith {
	_curSel = lbCurSel 4006;
	if (_curSel > -1) then {
		_data = lbData [4006, _curSel];
		_unit = _data call BIS_fnc_getUnitByUID;
		hint "Promote";
	};
	[] call MRTM_fnc_openGroupMenu;
};

if (_action == "Leave") exitWith {
	_units = ((units player) select {((_x getVariable ["BIS_WL_ownerAsset", "123"]) call BIS_fnc_getUnitByUID) == player});
	_group = createGroup (side group player);
	player joinSilent _group;
	{
		_x joinSilent _group;
	} forEach _units;
	[] call MRTM_fnc_openGroupMenu;
};