#include "..\warlords_constants.inc"

params ["_sector"];

_sector getVariable "BIS_WL_fastTravelEnabled" && (!WL_LOGISTICS_ENABLED || _sector getVariable ["BIS_WL_supplyPoints", 0] >= WL_LOGISTICS_FAST_TRAVEL_COST);