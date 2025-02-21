params ["_asset", "_childAsset", "_isAttaching"];

if (_isAttaching) then {
    {
        moveOut _x;
    } forEach (crew _childAsset);

    private _ropes = ropes _asset;
    {
        ropeDestroy _x;
    } forEach _ropes;

    _asset setVariable ["WL2_loadedItem", _childAsset, true];
    _childAsset setVariable ["WL2_autonomousBeforeLoad", isAutonomous _childAsset, true];
    _childAsset setVariable ["WL2_transporting", true, true];
    [_childAsset] remoteExec ["WL2_fnc_uavConnectRefresh", 0];

    [_childAsset, false] remoteExec ["setAutonomous", 0];
    [_childAsset, true] remoteExec ["lock", _childAsset];

    private _side = _asset call WL2_fnc_getAssetSide;

    private _enemyGroups = allGroups select { side _x != _side };
    {
        _x forgetTarget _childAsset;
    } forEach _enemyGroups;
    private _enemyUnits = allUnits select { side _x != _side };
    {
        _x forgetTarget _childAsset;
    } forEach _enemyUnits;

    private _assetChildren = _asset getVariable ["WL2_children", []];
    _assetChildren pushBack _childAsset;
    _asset setVariable ["WL2_children", _assetChildren, true];
} else {
    private _ropes = ropes _asset;
    {
        ropeDestroy _x;
    } forEach _ropes;

    private _wasAutonomous = _childAsset getVariable ["WL2_autonomousBeforeLoad", false];
    [_childAsset, _wasAutonomous] remoteExec ["setAutonomous", 0];

    _childAsset setVariable ["WL2_transporting", false, true];
    [_childAsset] call WL2_fnc_uavConnectRefresh;

    _asset setVariable ["WL2_loadedItem", objNull, true];

    private _assetChildren = _asset getVariable ["WL2_children", []];
    _assetChildren = _assetChildren - [_childAsset];
    _asset setVariable ["WL2_children", _assetChildren, true];

    private _massBeforeLoad = _childAsset getVariable ["WL2_massDefault", 1000];
    [_childAsset, _massBeforeLoad] remoteExec ["setMass", 0];
    [_childAsset, false] remoteExec ["lock", _childAsset];
};