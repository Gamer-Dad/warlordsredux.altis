params ["_asset", "_radarActionID"];

private _radarRotation = _asset getVariable ["radarRotation", false];
private _actionColor = if (_radarRotation) then {
    "#ff4b4b"
} else {
    "#4bff58"
};
private _actionText = if (_radarRotation) then {
    localize "STR_A3_radar_rotation_disable"
} else {
    localize "STR_A3_radar_rotation_enable"
};
_asset setUserActionText [_radarActionID, format ["<t color = '%1'>%2</t>", _actionColor, _actionText]];