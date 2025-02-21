params ["_asset"];

private _defaultMags = _asset getVariable ["WLM_savedDefaultMags", []];
{
    _x params ["_className", "_turretPath", "_ammoCount", "_id", "_creator"];
    _asset removeMagazinesTurret [_className, _turretPath];
} forEach _defaultMags;

// Remove all weapons
private _allTurrets = [[-1]] + allTurrets _asset;
private _weaponsByTurret = createHashMap;
{
    private _turretPath = _x;
    private _weaponsForTurret = _asset weaponsTurret _turretPath;
    _weaponsByTurret set [_turretPath, _weaponsForTurret];
    {
        private _weapon = _x;
        _asset removeWeaponTurret [_weapon, _turretPath];
    } forEach _weaponsForTurret;
} forEach _allTurrets;

{
    _x params ["_className", "_turretPath", "_ammoCount", "_id", "_creator"];
    _asset addMagazineTurret [_className, _turretPath, _ammoCount];
} forEach _defaultMags;

// Re-add all weapons after magazines
{
    private _turretPath = _x;
    private _weapons = _y;
    {
        private _weapon = _x;
        _asset addWeaponTurret [_weapon, _turretPath];
    } forEach _weapons;
} forEach _weaponsByTurret;

_asset spawn APS_fnc_rearmAPS;