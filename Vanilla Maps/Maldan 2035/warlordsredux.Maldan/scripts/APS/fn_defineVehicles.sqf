APS_projectileConfig = createHashMap;

private _projectileConfig = missionConfigFile >> "WLProjectilesConfig";
private _projectileClasses = "inheritsFrom _x == (missionConfigFile >> 'WLProjectile')" configClasses _projectileConfig;
{
    private _projectileClass = configName _x;
    private _projectileAmmos = getArray (_x >> "ammo");
    private _projectileAps = getNumber (_x >> "aps");
    private _projectileCamera = getNumber (_x >> "camera") == 1;
    private _projectileConsumption = getNumber (_x >> "consumption");
    private _projectileDazzleable = getNumber (_x >> "dazzleable") == 1;
    private _projectileSam = getNumber (_x >> "sam") == 1;
    private _projectileSead = getNumber (_x >> "sead") == 1;

    {
        private _ammo = _x;

        private _projectileConfig = createHashMapFromArray [
            ["aps", _projectileAps],
            ["camera", _projectileCamera],
            ["consumption", _projectileConsumption],
            ["dazzleable", _projectileDazzleable],
            ["sam", _projectileSam],
            ["sead", _projectileSead]
        ];

        APS_projectileConfig set [_ammo, _projectileConfig];
    } forEach _projectileAmmos;
} forEach _projectileClasses;