params ["_asset", "_actionID"];

private _actionColor = if ([_asset] call APS_fnc_active) then {
    "#4bff58";
} else {
    "#ff4b4b";
};

private _actionText = if ([_asset] call APS_fnc_active) then {
    "DAZZLER: ON";
} else {
    "DAZZLER: OFF";
};

_asset setUserActionText [_actionID, format ["<t color = '%1'>%2</t>", _actionColor, _actionText]];