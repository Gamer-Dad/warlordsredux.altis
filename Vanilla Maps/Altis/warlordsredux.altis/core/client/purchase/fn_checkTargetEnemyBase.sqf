#include "..\..\warlords_constants.inc"

if (WL_TARGET_FRIENDLY in WL_BASES) then {
    [false, localize "STR_A3_WL_fasttravel_restr1"];
} else {
    [true, ""];
};