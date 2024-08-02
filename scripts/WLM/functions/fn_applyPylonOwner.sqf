params ["_asset", "_pylonsToSet", "_vehicleAmmo"];

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

private _assetTurrets = (allTurrets _asset) + [[-1]];
{
    private _turret = _x;
    private _weaponsInTurret = _asset weaponsTurret _turret;
    private _existingMagazines = _asset magazinesTurret [_turret, true];
    {
        private _weapon = _x;
        private _compatibleMagazines = compatibleMagazines _weapon;

        private _deleteWeapon = true;
        {
            if (_x in _compatibleMagazines) then {
                _deleteWeapon = false; 
            };
        } forEach _existingMagazines;

        if (_deleteWeapon) then {
            _asset removeWeaponTurret [_weapon, _turret];
        };
    } forEach _weaponsInTurret;
} forEach _assetTurrets;

_asset setVehicleReceiveRemoteTargets true;
_asset setVehicleReportRemoteTargets true;
_asset setVehicleReportOwnPosition true;

_rearmTime = (missionNamespace getVariable "BIS_WL2_rearmTimers") getOrDefault [typeOf _asset, 600];

_asset setVariable ["BIS_WL_nextRearm", serverTime + _rearmTime]; 
playSound3D ["A3\Sounds_F\sfx\UI\vehicles\Vehicle_Rearm.wss", _asset, false, getPosASL _asset, 2, 1, 75];
[toUpper localize "STR_A3_WL_popup_asset_rearmed"] spawn BIS_fnc_WL2_smoothText;