params ["_asset", "_relativeDirection"];

private _ownerUID = _asset getVariable ["BIS_WL_ownerAsset", "123"];
private _assetOwner = _ownerUID call BIS_fnc_getUnitByUID;

[_asset, _relativeDirection, true] remoteExec ["APS_fnc_ReportOwner", _assetOwner, true];