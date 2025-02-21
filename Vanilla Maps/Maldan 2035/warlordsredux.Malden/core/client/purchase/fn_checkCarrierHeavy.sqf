#include "..\..\warlords_constants.inc"

params ["_sector", "_category"];

private _isCarrierSector = count (_sector getVariable ["WL_aircraftCarrier", []]) > 0;
if (_category == "Heavy Vehicles" && _isCarrierSector) then {
    [false, "Heavy vehicles unavailable on aircraft carrier."]
} else {
    [true, ""]
};