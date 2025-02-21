params ["_target", "_caller"];
private _isAlive = alive _target;
private _crew = crew _target;
private _hasNoCrew = count (_crew select {alive _x}) == 0;
private _isNotOwner = getPlayerUID _caller != (_target getVariable ["BIS_WL_ownerAsset", "123"]);
private _isNotSameSide = (side group _caller) != (_target getVariable ["BIS_WL_ownerAssetSide", sideUnknown]);
private _isNotUAV = !unitIsUAV _target;

_isAlive && _hasNoCrew && _isNotOwner && _isNotSameSide && _isNotUAV;