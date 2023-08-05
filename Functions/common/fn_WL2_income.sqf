#include "..\warlords_constants.inc"

params ["_side"];

(BIS_WL_sectorsArrays # (BIS_WL_competingSides find _side)) # 4;