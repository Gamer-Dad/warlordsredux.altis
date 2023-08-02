params ["_lb"];

{
    ctrlEnable [_x, false];
} forEach [4101, 4102, 4103, 4104, 4105];

if (_lb == "Players") then {
    _info = lbCurSel 4006;
    if (_info < 0) exitWith {};
    _data = lbData [4006, _info];
    _unit = _data call BIS_fnc_getUnitByUID;
    if (!(_unit getVariable [(format ["MRTMInvitedBy%1", (getPlayerUID player)]), false]) && {count ((units _unit) select {isPlayer _x}) == 1}) then {
        ctrlEnable [4101, true];
    };
    if (player getVariable [(format ["MRTMInvitedBy%1", _data]), false]) then {
        ctrlEnable [4105, true];
        ctrlEnable [4102, true];
    };
} else {
    _info = lbCurSel 4005;
    if (_info < 0) exitWith {};
    _data = lbData [4005, _info];
    _unit = _data call BIS_fnc_getUnitByUID;
    //if (leader (group _unit) == player && {_unit != player && {isPlayer _unit}}) then {
    //    ctrlEnable [4104, true];
    //};
    if (_unit == player && {count ((units _unit) select {isPlayer _x}) > 1}) then {
        ctrlEnable [4103, true];
    };
};

[] call MRTM_fnc_openGroupMenu;