#include "..\..\warlords_constants.inc"

if (BIS_WL_playerSide == independent) then {
    [false, "This action is not available for Independents."];
} else {
    [true, ""];
};
