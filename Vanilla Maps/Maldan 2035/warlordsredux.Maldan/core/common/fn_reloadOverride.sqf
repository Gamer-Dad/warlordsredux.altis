params ["_unit", "_weapon", "_turret", "_reloadTime"];

sleep _reloadTime;
private _saveWeaponState = weaponState [_unit, _turret];

_unit removeWeaponTurret [_weapon, _turret];
private _magazinesInTurret = _unit magazinesTurret _turret;
private _magsAmmo = magazinesAmmo [_unit, true];
{
    _unit removeMagazineTurret [_x, _turret];
} forEach _magazinesInTurret;

{
    private _magazine = _x # 0;
    private _ammo = _x # 1;
    _unit addMagazineTurret [_magazine, _turret, _ammo];
} forEach _magsAmmo;
_unit addWeaponTurret [_weapon, _turret];

private _savedWeapon = _saveWeaponState # 0;
private _savedMuzzle = _saveWeaponState # 1;
private _savedFireMode = _saveWeaponState # 2;
_unit selectWeaponTurret [_savedWeapon, _turret, _savedMuzzle, _savedFireMode];