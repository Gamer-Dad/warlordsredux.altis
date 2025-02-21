params ["_accessControl"];

private _lockStatus = [
    "ALL (FULL)", "ALL (OPERATE)", "ALL (PASSENGER)",
    "SQUAD (FULL)", "SQUAD (OPERATE)", "SQUAD (PASSENGER)",
    "PERSONAL",
    "LOCKED"
] select _accessControl;

private _lockColor = [
    "#4bff58", "#4bff58", "#4bff58",
    "#00ffff", "#00ffff", "#00ffff",
    "#ff4b4b",
    "#ff4b4b"
] select _accessControl;

private _lockText = format ["ACCESS: <t color='%1'>%2</t>", _lockColor, _lockStatus];
_lockText;