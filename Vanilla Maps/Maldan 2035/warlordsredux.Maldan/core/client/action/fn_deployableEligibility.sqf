params ["_asset", "_caller", "_slingloading"];
private _isLoading = _asset getVariable ["WL2_loadingAsset", false];
private _isPointing = cursorObject == _asset || _slingloading;
private _hasAccess = ([_asset, _caller, "full"] call WL2_fnc_accessControl) # 0;
private _callerID = getPlayerID _caller;
private _loadedItem = _asset getVariable ["WL2_loadedItem", objNull];
private _loadedVehicles = getVehicleCargo _asset;
private _slingLoadedVehicle = getSlingLoad _asset;
private _hasLoadedItem = !isNull _loadedItem || count _loadedVehicles > 0 || !isNull _slingLoadedVehicle;

private _nearLoadableEntities = (_asset nearEntities 30) select {
    (isNull attachedTo _x) && (count ropesAttachedTo _x == 0);
};
private _loadableHashmap = missionNamespace getVariable ["WL2_loadable", createHashMap];
private _nearLoadable = _nearLoadableEntities select {
    private _assetActualType = _x getVariable ["WL2_orderedClass", typeOf _x];
    private _access = [_x, _caller, "full"] call WL2_fnc_accessControl;
    (_assetActualType in _loadableHashmap) && (_access # 0);
};
private _hasNearLoadable = count _nearLoadable > 0;

private _sortedNearLoadable = if (_hasNearLoadable) then {
    [_nearLoadable, [_asset], {
        _input0 distance _x;
    }, "ASCEND"] call BIS_fnc_sortBy;
} else {
    [];
};

private _offset = if (_hasNearLoadable) then {
    private _loadable = _sortedNearLoadable # 0;
    private _loadableType = _loadable getVariable ["WL2_orderedClass", typeOf _loadable];
    _loadableHashmap getOrDefault [_loadableType, [0, 0, 1]];
} else {
    [0, 0, 1];
};

// 0: eligible
// 1: near loadables
// 2: offset
[_isPointing && _hasAccess && !_isLoading && alive _asset && (_hasLoadedItem || _hasNearLoadable), _sortedNearLoadable, _offset];