#include "..\..\warlords_constants.inc"

if (count BIS_WL_savedLoadout == 0) then {
    [false, localize "STR_A3_WL_no_loadout_saved"];
} else {
    [true, ""];
};