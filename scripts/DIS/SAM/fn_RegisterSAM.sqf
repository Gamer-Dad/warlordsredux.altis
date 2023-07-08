params ["_sam"];
private _EH = _sam addEventHandler ["fired", {_this spawn DIS_fnc_SAMfired;}];