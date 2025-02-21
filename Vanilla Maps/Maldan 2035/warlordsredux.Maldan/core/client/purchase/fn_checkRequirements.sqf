#include "..\..\warlords_constants.inc"

params ["_sector", "_requirements"];

private _servicesInSector = _sector getVariable ["BIS_WL_services", []];
if ("H" in _requirements && !("H" in _servicesInSector)) exitWith {
    [false, "Must be in a sector with a helipad."];
};

private _servicesAvailable = BIS_WL_sectorsArray # 5;
if (_requirements findIf {!(_x in _servicesAvailable)} >= 0) exitWith {
    [false, localize "STR_A3_WL_airdrop_restr1"];
};
