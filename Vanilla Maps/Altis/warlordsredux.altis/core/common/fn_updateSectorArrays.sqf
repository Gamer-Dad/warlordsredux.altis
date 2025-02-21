#include "..\warlords_constants.inc"

params ["_caller", ["_fullRecalc", false]];

if (_caller == "server") then {
	BIS_WL_sectorsArrays = [
		[west, _fullRecalc] call WL2_fnc_sortSectorArrays,
		[east, _fullRecalc] call WL2_fnc_sortSectorArrays,
		[independent, _fullRecalc] call WL2_fnc_sortSectorArrays
	];
} else {
	if (isServer && serverTime == 0 && !_fullRecalc) then {
		BIS_WL_sectorsArray = BIS_WL_sectorsArrays select BIS_WL_playerSide;
		BIS_WL_sectorsArrayEnemy = BIS_WL_sectorsArrays select (([west, east] deleteAt BIS_WL_playerSide) # 0);
	} else {
		BIS_WL_sectorsArray = [BIS_WL_playerSide, _fullRecalc] call WL2_fnc_sortSectorArrays;
		BIS_WL_sectorsArrayEnemy = [(([west, east] select {_x != BIS_WL_playerSide}) # 0), _fullRecalc] call WL2_fnc_sortSectorArrays;
	};
	true spawn WL2_fnc_refreshOSD;
};