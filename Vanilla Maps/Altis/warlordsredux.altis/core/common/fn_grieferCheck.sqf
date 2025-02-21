params ["_class", "_position", "_direction", "_uid", "_objsToIgnore"];

private _simulatedObject = [_class, _position, _direction, true, false, true] call BIS_fnc_createSimpleObject;

private _circleA = boundingBoxReal [_simulatedObject, "FireGeometry"];
private _radiusA = _circleA select 2;

private _BUFFER = 1;
private _nearbyEntities = _simulatedObject nearEntities 30 select {
    private _circleB = boundingBoxReal [_x, "FireGeometry"];
    private _radiusB = _circleB select 2;
    private _assetOwner = _x getVariable ["BIS_WL_ownerAsset", "notAsset"];

    !(_x in _objsToIgnore)
    && (_x distance _simulatedObject) < (_radiusA + _radiusB + _BUFFER)
    && !(_x isKindOf "Man")
    && _assetOwner != "notAsset"
    && _uid != (_x getVariable ["BIS_WL_ownerAsset", "123"])
};

deleteVehicle _simulatedObject;

_nearbyEntities