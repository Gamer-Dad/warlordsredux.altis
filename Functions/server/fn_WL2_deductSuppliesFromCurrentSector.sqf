params ["_caller", "_cost"];

_sector = _caller call BIS_fnc_WL2_getCurrentSector;
if (!isNil "_sector") then {
	[_sector, _cost] call BIS_fnc_WL2_deductSuppliesFromSector;
};