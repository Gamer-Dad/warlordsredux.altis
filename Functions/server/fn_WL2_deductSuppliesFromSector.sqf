#include "..\warlords_constants.inc"

params ["_sector", "_supplies"];

if (WL_LOGISTICS_ENABLED) then {
	_sectorSupplyPoints = _sector getVariable ["BIS_WL_supplyPoints", 0];
	_sector setVariable ["BIS_WL_supplyPoints", _sectorSupplyPoints - (_supplies * WL_LOGISTICS_COST_RATIO), true];
};