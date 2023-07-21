#include "..\warlords_constants.inc"

params ["_sector"];

_hasServices = BIS_WL_orderedAssetRequirements isEqualTo (BIS_WL_orderedAssetRequirements arrayIntersect (_sector getVariable "BIS_WL_services"));
_hasLogistics = !WL_LOGISTICS_ENABLED || _sector getVariable ["BIS_WL_supplyPoints", 0] >= BIS_WL_orderedAssetSupplyCost;

_hasServices && _hasLogistics;