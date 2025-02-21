#include "..\..\warlords_constants.inc"

if (player getVariable ["BIS_WL_isOrdering", false]) then {
    [false, "Another order is in progress!"];
} else {
    [true, ""];
};