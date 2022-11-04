#include "..\warlords_constants.inc"

["RequestMenu_close"] call BIS_fnc_WL2_setupUI;
[player, -BIS_WL_lastLoadoutCost] call BIS_fnc_WL2_fundsControl;

player setUnitLoadout BIS_WL_lastLoadout;
BIS_WL_loadoutApplied = TRUE;
[toUpper localize "STR_A3_WL_loadout_applied"] spawn BIS_fnc_WL2_smoothText;