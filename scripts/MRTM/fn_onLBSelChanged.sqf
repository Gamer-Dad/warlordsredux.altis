params ["_lb", "_info"];

{
	ctrlEnable [_x, false];
} forEach [4101, 4102, 4103, 4104, 4105];
lbClear 4009;

private _number = random 200;
[format ["%1: LB Sel changed", _number]] remoteExec ["systemChat", player];

if (_lb == "Players") then {
	ctrlShow [4009, false];
	ctrlShow [4106, false];
	_data = lbData [4006, (_info # 1)];
	_unit = _data call BIS_fnc_getUnitByUID;
	[format ["%1: _data: %2", _number, _data]] remoteExec ["systemChat", player];
	[format ["%1: _unit: %2", _number, _unit]] remoteExec ["systemChat", player];
	[format ["%1: Condition: %2, %3, %4", _number, (!(_unit getVariable [(format ["MRTM_InvitedBy_%1", (getPlayerUID player)]), false])), (count ((units _unit) select {isPlayer _x}) == 1), (leader player == player)]] remoteExec ["systemChat", player];
	if (!(_unit getVariable [(format ["MRTM_InvitedBy_%1", (getPlayerUID player)]), false]) && {(count ((units _unit) select {isPlayer _x}) == 1) && {leader player == player}}) then {
		ctrlEnable [4101, true];
		[format ["%1: Can Invite", _number]] remoteExec ["systemChat", player];
	} else {
		ctrlEnable [4101, false];
		[format ["%1: Condition2: %2", _number, (player getVariable [(format ["MRTM_InvitedBy_%1", _data]), false])]] remoteExec ["systemChat", player];
		if (player getVariable [(format ["MRTM_InvitedBy_%1", _data]), false]) then {
			[format ["%1: Can accept", _number]] remoteExec ["systemChat", player];
			ctrlEnable [4105, true];
			ctrlEnable [4102, true];
		} else {
			[format ["%1: Can't accept", _number]] remoteExec ["systemChat", player];
			ctrlEnable [4105, false];
			ctrlEnable [4102, false];
		};
	};
} else {
	_data = lbData [4005, (_info # 1)];
	_unit = _data call BIS_fnc_getUnitByUID;
	if (_unit == player && {(count ((units player) select {isPlayer _x})) > 1}) then {
		ctrlEnable [4103, true];
	};
	if ((leader _unit) == player && {isPlayer _unit}) then {
		ctrlShow [4009, true];
		ctrlShow [4106, true];
		{
			_index = lbAdd [4009, _x];
			lbSetData [4009, _index, (lbData [4005, (_info # 1)])];
		} forEach (["Engineer", "Rifleman", "TeamLeader", "AT", "AA", "Pilot"] select {(_unit getUnitTrait _x) == false});
	} else {
		ctrlShow [4009, false];
		ctrlShow [4106, false];
	};
};

0 spawn MRTM_fnc_openGroupMenu;