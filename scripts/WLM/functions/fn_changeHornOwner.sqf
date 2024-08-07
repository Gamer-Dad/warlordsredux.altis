params ["_asset", "_horn"];

private _hornWeapons = ["CarHorn", "TruckHorn", "TruckHorn2", "TruckHorn3", "SportCarHorn", "MiniCarHorn"];
private _turretWeapons = _asset weaponsTurret [-1];
private _existingHorns = _hornWeapons arrayIntersect _turretWeapons;
{
    _asset removeWeaponTurret [_x, [-1]];
} forEach _existingHorns;
diag_log format ["%1", _horn];
_asset addWeaponTurret [_horn, [-1]];