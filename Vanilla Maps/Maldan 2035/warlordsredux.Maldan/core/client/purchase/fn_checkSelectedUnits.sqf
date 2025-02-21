#include "..\..\warlords_constants.inc"

private _selectedUnits = groupSelectedUnits player;
private _ownedSelectedUnits = _selectedUnits select {
    _x != player && (_x getVariable ["BIS_WL_ownerAsset", "123"]) == getPlayerUID player
};

if (count _ownedSelectedUnits == 0) exitWith {
    [false, localize "STR_A3_WL_info_no_units_selected"];
};