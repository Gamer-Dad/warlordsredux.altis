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

private _ammoToSet = if (_rearm) then {
    1
} else {
    0
};

{
    private _pylonName = _x select 0;
    private _magazineName = _x select 1;
    private _turret = _x select 2;

    _asset setPylonLoadout [_pylonName, _magazineName, true, _turret];
    _asset setAmmoOnPylon [_pylonName, _ammoToSet];
} forEach _pylonsToSet;

_asset setVehicleAmmo _ammoToSet;

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

if (_rearm) then {
    private _rearmTime = (missionNamespace getVariable "WL2_rearmTimers") getOrDefault [typeOf _asset, 600];

    _asset setVariable ["BIS_WL_nextRearm", serverTime + _rearmTime];
    playSound3D ["A3\Sounds_F\sfx\UI\vehicles\Vehicle_Rearm.wss", _asset, false, getPosASL _asset, 2, 1, 75];
};