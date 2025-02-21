#include "..\..\warlords_constants.inc"

if (count BIS_WL_lastLoadout == 0) exitWith {
    [false, localize "STR_A3_WL_no_loadout_saved"];
};

if (BIS_WL_loadoutApplied) exitWith {
    [false, localize "STR_A3_WL_loadout_already_applied"];
};

if (BIS_WL_lastLoadout isEqualTo (getUnitLoadout player)) exitWith {
    [false, "You have the same gear as last time."];
};