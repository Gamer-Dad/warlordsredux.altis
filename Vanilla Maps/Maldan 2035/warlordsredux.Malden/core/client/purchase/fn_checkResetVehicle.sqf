#include "..\..\warlords_constants.inc"

private _vehicle = cursorObject;
if (isNull _vehicle) exitWith {
    [false, "Please point at a valid vehicle."];
};

private _outOfRange = player distance2D _vehicle > 15;
if (_outOfRange) exitWith {
    [false, "Please point at a vehicle within 15 meters."];
};

private _accessControl = _vehicle getVariable ["WL2_accessControl", -1];
private _hasNoLock = _accessControl == -1;
if (_hasNoLock) exitWith {
    [false, "Please point at a valid vehicle."];
};

private _isTransporting = _vehicle getVariable ["WL2_transporting", false];
if (_isTransporting) exitWith {
    [false, "Please point at a valid vehicle."];
};

private _isMan = _vehicle isKindOf "Man";
if (_isMan) exitWith {
    [false, "Please point at a valid vehicle."];
};

private _access = [_vehicle, player, "driver"] call WL2_fnc_accessControl;
if !(_access # 0) exitWith {
    [false, format ["You do not have access to this vehicle. %1", _access # 1]];
};

[true, ""];