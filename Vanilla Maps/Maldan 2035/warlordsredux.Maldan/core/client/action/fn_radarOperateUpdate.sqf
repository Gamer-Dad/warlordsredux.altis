params ["_asset", "_radarActionID"];

private _radarOperation = _asset getVariable ["radarOperation", false];
private _actionColor = if (_radarOperation) then {
    "#ff4b4b"
} else {
    "#4bff58"
};
private _actionText = if (_radarOperation) then {
    localize "STR_A3_radar_operation_disable"
} else {
    localize "STR_A3_radar_operation_enable"
};
_asset setUserActionText [_radarActionID, format ["<t color = '%1'>%2</t>", _actionColor, _actionText]];