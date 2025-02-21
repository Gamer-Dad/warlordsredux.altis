params ["_asset"];

private _radarOperation = _asset getVariable ["radarOperation", false];
private _radarColor = if (_radarOperation) then {
    "#4bff58"
} else {
    "#ff4b4b"
};
private _radarOnText = if (_radarOperation) then {
    "ON"
} else {
    "OFF"
};

private _buttonText = format ["RADAR CONTROL: <t color='%1'>%2</t>", _radarColor, _radarOnText];
_buttonText;