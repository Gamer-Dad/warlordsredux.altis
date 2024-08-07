params ["_asset", "_rearm"];

private _attachments = _asset getVariable ["WLM_assetAttachments", []];

private _pylonConfig = configFile >> "CfgVehicles" >> typeOf _asset >> "Components" >> "TransportPylonsComponent";
private _pylonsInfo = configProperties [_pylonConfig >> "pylons"];

private _pylonsToSet = [];
{
    private _attach = _attachments select _forEachIndex;
    private _mag = _attach select 0;
    private _turret = _attach select 1;

    private _pylonName = configName _x;

    _pylonsToSet pushBack [_pylonName, _mag, _turret];
} forEach _pylonsInfo;

[_asset, _pylonsToSet, _rearm] remoteExec ["WLM_fnc_applyPylonOwner", _asset, true];