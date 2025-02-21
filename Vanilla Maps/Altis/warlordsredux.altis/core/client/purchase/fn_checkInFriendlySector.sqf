#include "..\..\warlords_constants.inc"

params [["_requirements", []]];

private _findCurrentSector = (BIS_WL_sectorsArray # 0) select {
    player inArea (_x getVariable "objectAreaComplete")
};

if (count _findCurrentSector == 0 && !("A" in _requirements) && !("W" in _requirements)) then {
    [false, localize "STR_A3_WL_menu_arsenal_restr1"];
} else {
    [true, ""];
};