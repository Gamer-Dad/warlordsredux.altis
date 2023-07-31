params ["_lb", "_info"];

hint format ["%1, %2", _lb, _info];

{
	ctrlEnable [_x, false];
} forEach [4101, 4102, 4103, 4104, 4105];

if (_lb == "Players") then {
	_data = lbData [4006, (_info # 1)];
	_unit = _data call BIS_fnc_getUnitByUID;
	if !((_unit getVariable [(format ["MRTM_InvitedBy_%1", (getPlayerUID player)]), false]) && {count ((units _unit) select {isPlayer _x}) == 0}) then {
		ctrlEnable [4101, true];
	} else {
		if (player getVariable [(format ["MRTM_InvitedBy_%1", _data]), false]) then {
			ctrlEnable [4105, true];
			ctrlEnable [4102, true];
		};
	};
} else {
	_data = lbData [4005, (_info # 1)];
	_unit = _data call BIS_fnc_getUnitByUID;
	//if (leader (group _unit) == player && {_unit != player && {isPlayer _unit}}) then {
	//	ctrlEnable [4104, true];
	//};
	if (_unit == player) then {
		ctrlEnable [4103, true];
	};
};

[] call MRTM_fnc_openGroupMenu;