/*
	Author: MrThomasM

	Description: Exec's the actions behind the group menu's buttons.
*/

params ["_action"];

if (_action == "Invite") exitWith {
	_curSel = (lbCurSel 4006);
	if (_curSel > -1) then {
		_data = lbData [4006, _curSel];
		_unit = _data call BIS_fnc_getUnitByUID;
		[_unit, player] remoteExec ["MRTM_fnc_invite", 2];
	};
	false spawn MRTM_fnc_openGroupMenu;
};

if (_action == "Decline") exitWith {
	_curSel = lbCurSel 4006;
	if (_curSel > -1) then {
		_data = lbData [4006, _curSel];
		_unit = _data call BIS_fnc_getUnitByUID;
		[_unit, player] remoteExec ["MRTM_fnc_accept", 2];
	};
	false spawn MRTM_fnc_openGroupMenu;
};

if (_action == "Accept") exitWith {
	_curSel = lbCurSel 4006;
	if (_curSel > -1) then {
		_data = lbData [4006, _curSel];
		_unit = _data call BIS_fnc_getUnitByUID;
		if !(_data in (missionNamespace getVariable [(format ["MRTM_invitesIn_%1", getPlayerUID player]), []])) exitWith {};
		_units = ((units player) select {(_x getVariable ["BIS_WL_ownerAsset", "123"]) == getPlayerUID player});
		_group = (group _unit);
		_units joinSilent _group;
		[_unit, player] remoteExec ["MRTM_fnc_accept", 2];
	};
	false spawn MRTM_fnc_openGroupMenu;
};

if (_action == "Leave") exitWith {
	_units = ((units player) select {(_x getVariable ["BIS_WL_ownerAsset", "123"]) == getPlayerUID player});
	if (player == leader group player) then {
		_unit = (selectRandom ((units player) select {isPlayer _x}));
		[group _unit, _unit] remoteExec ["selectLeader", (group player)];
	};
	_group = createGroup (side group player);
	_units joinSilent _group;
	false spawn MRTM_fnc_openGroupMenu;
};

if (_action == "Kick") exitWith {
	if ((lbCurSel 4005) < 0) exitWith {};
	_data = lbData [4005, (lbCurSel 4005)];
	_unit = _data call BIS_fnc_getUnitByUID;
	if ((leader player != player) || {group _unit != group player}) exitWith {};
	0 remoteExec ["MRTM_fnc_leaveGroup", _unit];
	false spawn MRTM_fnc_openGroupMenu;
};

if (_action == "Promote") exitWith {
	if ((lbCurSel 4005) < 0) exitWith {};
	_data = lbData [4005, (lbCurSel 4005)];
	_unit = _data call BIS_fnc_getUnitByUID;
	if ((leader player != player) || {group _unit != group player}) exitWith {};
	[group _unit, _unit] remoteExec ["selectLeader", (group _unit)];
	false spawn MRTM_fnc_openGroupMenu;
};