#include "..\..\warlords_constants.inc"

params ["_target", "_caller"];

private _isAlive = alive _target;
private _hasAccess = ([_target, _caller, "full"] call WL2_fnc_accessControl) # 0;
private _isInVehicle = cursorObject == _target;
private _nearbyRepair = (_target nearEntities ["All", WL_MAINTENANCE_RADIUS]) select {
    alive _x && getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "transportRepair") > 0
};

_isAlive && _hasAccess && _isInVehicle && count _nearbyRepair > 0;