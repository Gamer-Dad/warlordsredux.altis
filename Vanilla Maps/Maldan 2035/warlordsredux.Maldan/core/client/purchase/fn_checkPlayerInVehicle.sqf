#include "..\..\warlords_constants.inc"

params [["_requirements", []]];

if (vehicle player != player && !("A" in _requirements)) then {
    [false, localize "STR_A3_WL_fasttravel_restr3"];
} else {
    [true, ""];
};