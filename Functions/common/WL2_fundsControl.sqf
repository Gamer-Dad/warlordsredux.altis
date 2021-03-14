#include "..\warlords_constants.inc"

params ["_warlord", "_amount"];

_warlord setVariable ["BIS_WL_funds", ((_warlord getVariable ["BIS_WL_funds", 0]) + _amount) min BIS_WL_maxCP, TRUE];