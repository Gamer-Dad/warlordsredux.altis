// Override the number of ammo "points" for a specific vehicle turret
// Format: Vehicle type, turret path, weapon index, new ammo count
private _ammoForVehicleTurretOverride = [
    ["APC_Wheeled_03_base_F", [0], 2, 10]
];

// Disallow specific magazines for specific vehicles
// Format: Vehicle type, mag type
private _disallowListForVehicle = [
    // ["LSV_01_AT_base_F", "1Rnd_GAA_missiles"]
];

// Add specific pylon weapons for specific aircraft
// Format: Vehicle type, mag type
private _allowListForPylon = [
    ["O_Heli_Attack_02_dynamicLoadout_F", "PylonRack_12Rnd_PG_missiles"]
];

// return
[_ammoForVehicleTurretOverride, _disallowListForVehicle, _allowListForPylon];