params ["_asset", "_weaponsToRemove", "_pylonsToSet", "_vehicleAmmo"];

{
    _asset removeWeapon _x;
} forEach _weaponsToRemove;

{
    private _pylonName = _x select 0;
    private _magazineName = _x select 1;
    private _turret = _x select 2;
    private _ammoToSet = _x select 3;

    _asset setPylonLoadout [_pylonName, _magazineName, false, _turret];
    _asset setAmmoOnPylon [_pylonName, _ammoToSet];
} forEach _pylonsToSet;

if (_vehicleAmmo == 1) then {
    _asset setVehicleAmmo 1;
};