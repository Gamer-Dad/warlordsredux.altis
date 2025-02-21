params ["_asset"];

private _jammerActivated = _asset getVariable ["BIS_WL_jammerActivated", false] && isEngineOn _asset;
private _jammerActivating = _asset getVariable ["BIS_WL_jammerActivating", false] && isEngineOn _asset;
private _jammerColor = if (_jammerActivated) then {
    "#4bff58"
} else {
    if (_jammerActivating) then {
        "#4b51ff"
    } else {
        "#ff4b4b"
    };
};
private _jammerText = if (_jammerActivated) then {
    "ON"
} else {
    if (_jammerActivating) then {
        "ACTIVATING"
    } else {
        "OFF"
    };
};
private _buttonText = format ["JAMMER: <t color='%1'>%2</t>", _jammerColor, _jammerText];
_buttonText;