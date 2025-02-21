// Override magazine names
// Format: Mag class, new mag name
private _overrideMagazineNames = createHashMapFromArray [
    ["4Rnd_Titan_long_missiles", "Titan AA (Long)"],
    ["4Rnd_Titan_long_missiles_O", "Titan AA (Long)"],
    ["1Rnd_GAA_missiles", "Titan AA"],
    ["2000Rnd_762x51_Belt", "7.62x51 mm Belt"],
    ["2000Rnd_762x51_Belt_Red", "7.62x51 mm Belt Red"],
    ["2000Rnd_762x51_Belt_Green", "7.62x51 mm Belt Green"],
    ["2000Rnd_762x51_Belt_Yellow", "7.62x51 mm Belt Yellow"],
    ["2000Rnd_762x51_Belt_T_Red", "7.62x51 mm Tracer Belt Red"],
    ["2000Rnd_762x51_Belt_T_Green", "7.62x51 mm Tracer Belt Green"],
    ["2000Rnd_762x51_Belt_T_Yellow", "7.62x51 mm Tracer Belt Yellow"],
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
    ["40Rnd_40mm_APFSDS_Tracer_Yellow_shells", "40 mm APFSDS Yellow"],
    ["SmokeLauncherMag", "Smoke Launcher Ammo"],
    ["SmokeLauncherMag_boat", "Smoke Launcher Ammo"],
    ["168Rnd_CMFlare_Chaff_Magazine", "Countermeasures"],
    ["240Rnd_CMFlare_Chaff_Magazine", "Countermeasures"],
    ["120Rnd_CMFlare_Chaff_Magazine", "Countermeasures"],
    ["192Rnd_CMFlare_Chaff_Magazine", "Countermeasures"],
    ["1000Rnd_Gatling_30mm_Plane_CAS_01_F", "30mm Gatling"],
    ["500Rnd_Cannon_30mm_Plane_CAS_02_F", "30mm Gatling"],
    ["60Rnd_20mm_HE_shells", "20mm HE Shells"],
    ["60Rnd_20mm_AP_shells", "20mm AP Shells"]
];

// Override magazine descriptions
// Format: Mag class, new mag description
private _overrideMagazineDescriptions = createHashMapFromArray [
    ["4Rnd_Titan_long_missiles", "Short-range, infrared-guided, surface-to-air missile with high-explosive warhead."],
    ["4Rnd_Titan_long_missiles_O", "Short-range, infrared-guided, surface-to-air missile with high-explosive warhead."],
    ["1Rnd_GAA_missiles", "Short-range, infrared-guided, surface-to-air missile with high-explosive warhead."]
];

// return
[_overrideMagazineNames, _overrideMagazineDescriptions];