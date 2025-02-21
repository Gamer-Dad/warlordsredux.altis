params ["_asset"];

private _radarRotation = _asset getVariable ["radarRotation", false];
private _radarColor = if (_radarRotation) then {
    "#4bff58"
} else {
    "#ff4b4b"
};
private _radarOnText = if (_radarRotation) then {
    "ROTATING"
} else {
    "STOPPED"
};

private _buttonText = format ["RADAR ROTATE: <t color='%1'>%2</t>", _radarColor, _radarOnText];
_buttonText;