#include "..\..\warlords_constants.inc"

if (!alive player || lifeState player == "INCAPACITATED") then {
    [false, localize "STR_A3_WL_fasttravel_restr6"];
} else {
    [true, ""];
};