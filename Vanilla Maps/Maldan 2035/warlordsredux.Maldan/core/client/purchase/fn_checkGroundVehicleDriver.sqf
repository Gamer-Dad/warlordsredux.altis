#include "..\..\warlords_constants.inc"

private _vehicle = vehicle player;
private _isInVehicle = _vehicle != player;
if (!_isInVehicle) exitWith {
    [false, "You must be in a vehicle."];
};

private _isGroundVehicle = _vehicle isKindOf "LandVehicle";
if (!_isGroundVehicle) exitWith {
    [false, "You must be in a ground vehicle."];
};

private _isInDriverSeat = (driver _vehicle) == player;
if (!_isInDriverSeat) exitWith {
    [false, "You must be in the driver seat."];
};

private _isAttached = !isNull attachedTo _vehicle;
private _hasAttachment = count attachedObjects _vehicle > 0;
if (_isAttached || _hasAttachment) exitWith {
    [false, "Your vehicle must not be already attached to something."];
};

[true, ""];