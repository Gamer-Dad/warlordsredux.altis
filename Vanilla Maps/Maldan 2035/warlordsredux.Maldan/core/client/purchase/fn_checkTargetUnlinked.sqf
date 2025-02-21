#include "..\..\warlords_constants.inc"

private _availableSectors = BIS_WL_sectorsArray # 1;
if !(WL_TARGET_FRIENDLY in _availableSectors) then {
    [false, localize "STR_A3_WL_fasttravel_restr5"];
} else {
    [true, ""];
};