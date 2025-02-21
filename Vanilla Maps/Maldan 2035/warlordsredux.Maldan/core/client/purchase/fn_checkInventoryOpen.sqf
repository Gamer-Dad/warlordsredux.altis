#include "..\..\warlords_constants.inc"

if !(isNull (findDisplay 602)) then {
    [false, localize "STR_A3_WL_menu_arsenal_restr2"];
} else {
    [true, ""];
};