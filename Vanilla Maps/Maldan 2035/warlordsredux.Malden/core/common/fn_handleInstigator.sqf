params ["_damager", "_instigator"];

_ret = objNull;

if (isNull _instigator) then {
    private _potentialInstigatorByUID = _damager getVariable ["BIS_WL_ownerAsset", "123"] call BIS_fnc_getUnitByUID;
    _instigator = if !(isNull _potentialInstigatorByUID) then {
        _potentialInstigatorByUID
    } else {
        // Fallback to killer's uav controller
        (UAVControl vehicle _damager) select 0
    };
};

if (isNull _instigator) then {
    _instigator = vehicle _damager;
};

/* We should have the instigator beyond this point. */

if !(isNull _instigator) then {
    private _responsibleLeader = (_instigator getVariable ["BIS_WL_ownerAsset", "123"]) call BIS_fnc_getUnitByUID;

    // Check if the responsible leader is a player
    if (isPlayer _responsibleLeader) then {
        _ret = _responsibleLeader;
    } else {
        _ret = _instigator;
    };
};

_ret;