params ["_asset", "_attachments"];

private _pylonConfig = configFile >> "CfgVehicles" >> typeOf _asset >> "Components" >> "TransportPylonsComponent";
private _pylonsInfo = configProperties [_pylonConfig >> "pylons"];

{
    private _weaponName = getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon");
    [_asset, _weaponName] remoteExec ["removeWeaponGlobal", 0, true];
} forEach getPylonMagazines _asset;

private _compareTurrets = {
    params ["_pylonInfoTurret", "_setTurret"];
    if (_pylonInfoTurret isEqualTo [-1]) then {
        count _setTurret == 0;
    } else {
        _pylonInfoTurret isEqualTo _setTurret;
    };
};

{
    private _attach = _attachments select _forEachIndex;
    private _mag = _attach select 0;
    private _turret = _attach select 1;

    private _pylonName = configName _x;
    private _currentPylonInfo = (getAllPylonsInfo _asset) select { _pylonName == (_x # 1) } select 0;

    [_asset, [_pylonName, _mag, false, _turret]] remoteExec ["setPylonLoadout", 0, true];
    [_asset, [_pylonName, 0]] remoteExec ["setAmmoOnPylon", 0, true];
} forEach _pylonsInfo;