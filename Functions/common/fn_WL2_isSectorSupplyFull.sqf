#include "..\warlords_constants.inc"

params ["_caller"];

_sector = _caller call BIS_fnc_WL2_getCurrentSector;
_points = _sector getVariable ["BIS_WL_supplyPoints", 0];
_maxPoints = _sector getVariable ["BIS_WL_supplyPointsMax", 0];

_points + WL_LOGISTICS_CARGO_UNIT > _maxPoints;