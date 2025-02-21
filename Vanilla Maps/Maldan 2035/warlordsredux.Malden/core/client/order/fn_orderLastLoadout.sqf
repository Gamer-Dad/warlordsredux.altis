#include "..\..\warlords_constants.inc"

"RequestMenu_close" call WL2_fnc_setupUI;

player setUnitLoadout BIS_WL_lastLoadout;
BIS_WL_loadoutApplied = true;
[toUpper localize "STR_A3_WL_loadout_applied"] spawn WL2_fnc_smoothText;