#include "..\warlords_constants.inc"

params ["_caller", ["_fullRecalc", false]];

if (_caller == "server") then {
	BIS_WL_sectorsArrays = [[west, _fullRecalc] call BIS_fnc_WL2_sortSectorArrays, [east, _fullRecalc] call BIS_fnc_WL2_sortSectorArrays];
} else {
	if (isServer && serverTime == 0 && !_fullRecalc) then {
		BIS_WL_sectorsArray = BIS_WL_sectorsArrays select (side group player);
		BIS_WL_sectorsArrayEnemy = BIS_WL_sectorsArrays select (([west, east] deleteAt (side group player)) # 0);
	} else {
		BIS_WL_sectorsArray = [(side group player), _fullRecalc] call BIS_fnc_WL2_sortSectorArrays;
		BIS_WL_sectorsArrayEnemy = [(([west, east] deleteAt (side group player)) # 0), _fullRecalc] call BIS_fnc_WL2_sortSectorArrays;
	};
	[true] spawn BIS_fnc_WL2_refreshOSD;
};