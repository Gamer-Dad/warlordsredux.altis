#include "..\..\warlords_constants.inc"

if ((playersNumber BIS_WL_playerSide) < 2) then {
    [false, localize "STR_A3_WL_transfer_restr1_TODO_REWRITE"]
} else {
    [true, ""]
};