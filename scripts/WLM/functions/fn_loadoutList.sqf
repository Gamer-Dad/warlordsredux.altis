// Override the number of ammo "points" for a specific vehicle turret
// Format: Vehicle type, turret path, weapon index, new ammo count
private _ammoForVehicleTurretOverride = [
    ["APC_Wheeled_03_base_F", [0], 2, 10]
];

// Disallow specific magazines for specific vehicles
// Format: Vehicle type, mag type
private _disallowListForVehicle = [
    // ["LSV_01_AT_base_F", "1Rnd_GAA_missiles"]
    ["APC_Wheeled_03_base_F", "4Rnd_GAA_missiles"]
];

// Add specific pylon weapons for specific aircraft
// Format: Vehicle type, mag type
private _allowListForPylon = [
    ["O_Heli_Attack_02_dynamicLoadout_F", "PylonRack_12Rnd_PG_missiles"]
];

// Override magazine names
// Format: Mag class, new mag name
private _overrideMagazineNames = createHashMapFromArray [
    ["4Rnd_Titan_long_missiles", "Titan AA (Long)"],
    ["4Rnd_Titan_long_missiles_O", "Titan AA (Long)"],
    ["1Rnd_GAA_missiles", "Titan AA"],
    ["1000Rnd_762x51_Belt", "7.62x51 mm Belt"],
    ["1000Rnd_762x51_Belt_Red", "7.62x51 mm Belt Red"],
    ["1000Rnd_762x51_Belt_Green", "7.62x51 mm Belt Green"],
    ["1000Rnd_762x51_Belt_Yellow", "7.62x51 mm Belt Yellow"],
    ["1000Rnd_762x51_Belt_T_Red", "7.62x51 mm Tracer Belt Red"],
    ["1000Rnd_762x51_Belt_T_Green", "7.62x51 mm Tracer Belt Green"],
    ["1000Rnd_762x51_Belt_T_Yellow", "7.62x51 mm Tracer Belt Yellow"],
    ["200Rnd_762x51_Belt", "7.62x51 mm Belt"],
    ["200Rnd_762x51_Belt_Red", "7.62x51 mm Belt Red"],
    ["200Rnd_762x51_Belt_Green", "7.62x51 mm Belt Green"],
    ["200Rnd_762x51_Belt_Yellow", "7.62x51 mm Belt Yellow"],
    ["200Rnd_762x51_Belt_T_Red", "7.62x51 mm Tracer Belt Red"],
    ["200Rnd_762x51_Belt_T_Green", "7.62x51 mm Tracer Belt Green"],
    ["200Rnd_762x51_Belt_T_Yellow", "7.62x51 mm Tracer Belt Yellow"],
    ["140Rnd_30mm_MP_shells", "30 mm MP-T"],
    ["140Rnd_30mm_MP_shells_Tracer_Red", "30 mm MP-T Red"],
    ["140Rnd_30mm_MP_shells_Tracer_Green", "30 mm MP-T Green"],
    ["140Rnd_30mm_MP_shells_Tracer_Yellow", "30 mm MP-T Yellow"],
    ["60Rnd_30mm_APFSDS_shells_Tracer_Red", "30 mm APFSDS Red"],
    ["60Rnd_30mm_APFSDS_shells_Tracer_Green", "30 mm APFSDS Green"],
    ["60Rnd_30mm_APFSDS_shells_Tracer_Yellow", "30 mm APFSDS Yellow"],
    ["60Rnd_40mm_GPR_Tracer_Red_shells", "40 mm GPR Red"],
    ["60Rnd_40mm_GPR_Tracer_Green_shells", "40 mm GPR Green"],
    ["60Rnd_40mm_GPR_Tracer_Yellow_shells", "40 mm GPR Yellow"],
    ["40Rnd_40mm_APFSDS_Tracer_Red_shells", "40 mm APFSDS Red"],
    ["40Rnd_40mm_APFSDS_Tracer_Green_shells", "40 mm APFSDS Green"],
    ["40Rnd_40mm_APFSDS_Tracer_Yellow_shells", "40 mm APFSDS Yellow"]
];

// Override magazine descriptions
// Format: Mag class, new mag description
private _overrideMagazineDescriptions = createHashMapFromArray [
    ["4Rnd_Titan_long_missiles", "Short-range, infrared-guided, surface-to-air missile with high-explosive warhead."],
    ["4Rnd_Titan_long_missiles_O", "Short-range, infrared-guided, surface-to-air missile with high-explosive warhead."],
    ["1Rnd_GAA_missiles", "Short-range, infrared-guided, surface-to-air missile with high-explosive warhead."]
];

// return
[_ammoForVehicleTurretOverride, _disallowListForVehicle, _allowListForPylon, _overrideMagazineNames, _overrideMagazineDescriptions];