#include "..\WLM_constants.inc"

params ["_asset", "_targetTurret"];

private _compatibleSmokeMags = compatibleMagazines "SmokeLauncher";
private _smokeMags = (magazinesAllTurrets _asset) select { (_x # 0) in _compatibleSmokeMags };

private _turretsWithSmoke = [];
{
    private _smokeMagazine = _x # 0;
    private _turret = _x # 1;
    _turretsWithSmoke pushBack [_turret, _smokeMagazine];
} forEach _smokeMags;

{
    private _turret = _x # 0;
    private _smokeMagazine = _x # 1;
    _asset removeMagazinesTurret [_smokeMagazine, _turret];
    _asset removeWeaponTurret ["SmokeLauncher", _turret];
} forEach _turretsWithSmoke;

{
    private _smokeMagazine = _x # 0;
    private _ammo = _x # 2;

    _asset addMagazineTurret [_smokeMagazine, _targetTurret, _ammo];
} forEach _smokeMags;

_asset addWeaponTurret ["SmokeLauncher", _targetTurret];

private _defaultMags = _asset getVariable ["WLM_savedDefaultMags", []];

{
    private _mag = _x;
    private _magName = _mag # 0;
    if ((_mag # 0) in _compatibleSmokeMags) then {
        _mag set [1, _targetTurret];
    };
} forEach _defaultMags;

_asset setVariable ["BIS_WL_defaultMagazines", _defaultMags, true];
_asset setVariable ["WLM_savedMagazines", [], true];
_asset setVariable ["WLM_savedDefaultMags", _defaultMags, true];