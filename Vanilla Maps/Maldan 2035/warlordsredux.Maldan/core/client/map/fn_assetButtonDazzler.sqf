params ["_asset"];

private _dazzlerActivated = [_asset] call APS_fnc_active;
private _dazzlerColor = if (_dazzlerActivated) then {
    "#4bff58"
} else {
    "#ff4b4b"
};
private _dazzlerText = if (_dazzlerActivated) then {
    "ON"
} else {
    "OFF"
};
private _buttonText = format ["DAZZLER: <t color='%1'>%2</t>", _dazzlerColor, _dazzlerText];
_buttonText;