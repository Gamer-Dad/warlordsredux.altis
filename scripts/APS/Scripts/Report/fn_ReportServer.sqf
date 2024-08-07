params ["_asset", "_relativeDirection", "_assetOwner"];

private _owner = owner _assetOwner;

[_asset, _relativeDirection, true] remoteExec ["APS_fnc_ReportOwner", _owner, true];