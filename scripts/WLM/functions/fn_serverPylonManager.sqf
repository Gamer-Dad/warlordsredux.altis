params ["_asset", "_attachments"];

private _pylonConfig = configFile >> "CfgVehicles" >> typeOf _asset >> "Components" >> "TransportPylonsComponent";
private _pylonsInfo = configProperties [_pylonConfig >> "pylons"];

private _weaponsToRemove = [];
{
    private _weaponName = getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon");
    _weaponsToRemove pushBack _weaponName;
} forEach getPylonMagazines _asset;

private _pylonsToSet = [];
{
    private _attach = _attachments select _forEachIndex;
    private _mag = _attach select 0;
    private _turret = _attach select 1;

    private _pylonName = configName _x;

    _pylonsToSet pushBack [_pylonName, _mag, _turret, 0];
} forEach _pylonsInfo;

[_asset, _weaponsToRemove, _pylonsToSet, 0] remoteExec ["WLM_fnc_applyPylonFinal", _asset];