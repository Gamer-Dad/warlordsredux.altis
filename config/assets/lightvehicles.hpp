class Light_Vehicle {
    category = "Light Vehicles";
    loadable = 1;
};

// Quad Bike
class Quadbike: Light_Vehicle {
    capValue = 1;
    cost = 20;
    nameShort = "QUAD";
    offset[] = {0, 3, 0};
};
class B_Quadbike_01_F: Quadbike {
    side[] = {"west"};
};
class O_Quadbike_01_F: Quadbike {
    side[] = {"east"};
};
class I_Quadbike_01_F: Quadbike {
    side[] = {"guer"};
};

// Offroad (HMG)
class Offroad_Armed: Light_Vehicle {
    capValue = 1;
    cost = 150;
    nameShort = "OFFROAD";
    offset[] = {0, 5, 0};
    rearm = 120;

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "100Rnd_127x99_mag_Tracer_Yellow",
            "100Rnd_127x99_mag_Tracer_Yellow",
            "100Rnd_127x99_mag_Tracer_Yellow",
            "100Rnd_127x99_mag_Tracer_Yellow"
        };
        addWeapons[] = {
            "HMG_M2_Mounted"
        };
        removeMagazines[] = {};
        removeWeapons[] = {
            "HMG_M2_Mounted"
        };
        turret[] = {0};
    };
};
class B_G_Offroad_01_armed_F: Offroad_Armed {
    side[] = {"west"};
};
class O_G_Offroad_01_armed_F: Offroad_Armed {
    side[] = {"east"};
};
class I_G_Offroad_01_armed_F: Offroad_Armed {
    side[] = {"guer"};
};

class LSV_Armed: Light_Vehicle {
    capValue = 1;
    cost = 200;
    offset[] = {0, 5, 0};
    rearm = 120;
};

// Prowler (HMG)
class B_LSV_01_armed_F: LSV_Armed {
    loaded = "B_Static_Designator_01_F";
    nameShort = "PROWLER";
    side[] = {"west"};

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "100Rnd_127x99_mag_Tracer_Red",
            "100Rnd_127x99_mag_Tracer_Red",
            "100Rnd_127x99_mag_Tracer_Red"
        };
        addWeapons[] = {
            "HMG_127_LSV_01"
        };
        removeMagazines[] = {};
        removeWeapons[] = {
            "HMG_127_LSV_01"
        };
        turret[] = {0};
    };
};

// Qilin (Minigun)
class O_LSV_02_armed_F: LSV_Armed {
    loaded = "O_Static_Designator_02_F";
    nameShort = "QILIN";
    side[] = {"east"};

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "500Rnd_65x39_Belt_Tracer_Green_Splash",
            "500Rnd_65x39_Belt_Tracer_Green_Splash",
            "500Rnd_65x39_Belt_Tracer_Green_Splash"
        };
        addWeapons[] = {
            "LMG_Minigun_Transport"
        };
        removeMagazines[] = {};
        removeWeapons[] = {
            "LMG_Minigun_Transport"
        };
        turret[] = {0};
    };
};

// HEMTT/Tempest Transport
class Passenger_Transport: Light_Vehicle {
    capValue = 1;
    cost = 200;
    hasFastTravel = 1;
    loadable = 0;
};
class B_Truck_01_transport_F: Passenger_Transport {
    loaded = "Land_MedicalTent_01_NATO_generic_open_F";
    nameShort = "HEMMT";
    side[] = {"west"};
};
class O_Truck_03_transport_F: Passenger_Transport {
    loaded = "Land_MedicalTent_01_CSAT_brownhex_generic_open_F";
    nameShort = "TEMPEST";
    side[] = {"east"};
};

// HEMTT/Tempest Medical
class Medical_Transport: Light_Vehicle {
    capValue = 1;
    cost = 250;
    hasFastTravel = 1;
    loadable = 0;
    nameShort = "MEDICAL";
};
class B_Truck_01_medical_F: Medical_Transport {
    loaded = "Land_MedicalTent_01_NATO_generic_open_F";
    side[] = {"west"};
};
class O_Truck_03_medical_F: Medical_Transport {
    loaded = "Land_MedicalTent_01_CSAT_brownhex_generic_open_F";
    side[] = {"east"};
};

// HEMTT Flatbed
class Flatbed: Light_Vehicle {
    capValue = 1;
    cost = 300;
    disableParadrop = 1;
    hasFastTravel = 1;
    hasLoader = 1;
    isLight = 1;
    loadable = 0;
    name = "HEMTT Flatbed";
    nameShort = "FLATBED";
    spawn = "B_Truck_01_flatbed_F";
};
class B_FlatbedTruck: Flatbed {
    side[] = {"west"};
};
class O_FlatbedTruck: Flatbed {
    side[] = {"east"};
    textures[] = {
        "\a3\soft_f_Exp\truck_01\data\truck_01_ext_01_olive_co.paa",
        "\a3\soft_f_Exp\truck_01\data\truck_01_ext_02_olive_co.paa",
        "\a3\Soft_F_Enoch\Truck_01\Data\truck_01_ammo_pacific_co.paa",
        "\a3\Soft_F_Enoch\Truck_01\Data\Truck_01_cargo_pacific_CO.paa"
    };
};
class I_FlatbedTruck: Flatbed {
    side[] = {"guer"};
};

class MRAP_Unarmed: Light_Vehicle {
    capValue = 1;
    cost = 300;
};

// Hunter
class B_MRAP_01_F: MRAP_Unarmed {
    loaded = "B_AR2_Deployed";
    nameShort = "HUNTER";
    side[] = {"west"};
};

// Ifrit
class O_MRAP_02_F: MRAP_Unarmed {
    loaded = "O_AR2_Deployed";
    nameShort = "IFRIT";
    side[] = {"east"};
};

// Strider
class I_MRAP_03_F: MRAP_Unarmed {
    loaded = "I_AR2_Deployed";
    nameShort = "STRIDER";
    side[] = {"guer"};
};

// Offroad AT
class Offroad_AT: Light_Vehicle {
    capValue = 1;
    cost = 500;
    nameShort = "OFFROAD AT";
    offset[] = {0, 5, 0};
    rearm = 180;

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "12Rnd_SPG9_HEAT"
        };
        addWeapons[] = {
            "launcher_SPG9"
        };
        removeMagazines[] = {};
        removeWeapons[] = {
            "launcher_SPG9"
        };
        turret[] = {0};
    };
};
class B_G_Offroad_01_AT_F: Offroad_AT {
    side[] = {"west"};
};
class O_G_Offroad_01_AT_F: Offroad_AT {
    side[] = {"east"};
};

class LSV_AT: Light_Vehicle {
    capValue = 1;
    cost = 750;
    offset[] = {0, 5, 0};
    rearm = 180;
};

// Prowler AT
class B_LSV_01_AT_F: LSV_AT {
    nameShort = "PROWLER AT";
    side[] = {"west"};

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "1Rnd_GAT_missiles",
            "1Rnd_GAT_missiles",
            "1Rnd_GAT_missiles",
            "1Rnd_GAT_missiles"
        };
        addWeapons[] = {
            "missiles_titan_static"
        };
        removeMagazines[] = {};
        removeWeapons[] = {
            "missiles_titan_static"
        };
        turret[] = {0};
    };
};

// Qilin AT
class O_LSV_02_AT_F: LSV_AT {
    nameShort = "QILIN AT";
    side[] = {"east"};

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "Vorona_HEAT",
            "Vorona_HEAT",
            "Vorona_HEAT",
            "Vorona_HEAT"
        };
        addWeapons[] = {
            "missiles_Vorona"
        };
        removeMagazines[] = {};
        removeWeapons[] = {
            "missiles_Vorona"
        };
        turret[] = {0};
    };
};

// Hunter/Ifrit HMG
class MRAP_HMG: Light_Vehicle {
    aps = 1;
    capValue = 2;
    cost = 950;
    rearm = 120;
};
class B_MRAP_01_hmg_F: MRAP_HMG {
    nameShort = "HUNTER HMG";
    side[] = {"west"};
};
class O_MRAP_02_hmg_F: MRAP_HMG {
    nameShort = "IFRIT HMG";
    side[] = {"east"};
};
class I_MRAP_03_hmg_F: MRAP_HMG {
    nameShort = "STRIDER HMG";
    side[] = {"guer"};
    vehicleSpawn = 1;
};

// Hunter/Ifrit GMG
class MRAP_GMG: Light_Vehicle {
    aps = 1;
    capValue = 2;
    cost = 950;
    rearm = 120;
};
class B_MRAP_01_gmg_F: MRAP_GMG {
    nameShort = "HUNTER GMG";
    side[] = {"west"};
};
class O_MRAP_02_gmg_F: MRAP_GMG {
    nameShort = "IFRIT GMG";
    side[] = {"east"};
};
class I_MRAP_03_gmg_F: MRAP_GMG {
    nameShort = "STRIDER GMG";
    side[] = {"guer"};
    vehicleSpawn = 1;
};

// HEMTT/Tempest Ammo
class Transport_Ammo: Light_Vehicle {
    capValue = 1;
    cost = 1000;
    hasRearm = 1;
    loadable = 0;
    nameShort = "AMMO";
};
class B_Truck_01_ammo_F: Transport_Ammo {
    loaded = "B_Slingload_01_Ammo_F";
    side[] = {"west"};
};
class O_Truck_03_ammo_F: Transport_Ammo {
    loaded = "Land_Pod_Heli_Transport_04_ammo_F";
    side[] = {"east"};
};

// HEMMT/Tempest Fuel
class Transport_Fuel: Light_Vehicle {
    capValue = 1;
    cost = 1000;
    hasRefuel = 1;
    loadable = 0;
    nameShort = "FUEL";
};
class B_Truck_01_fuel_F: Transport_Fuel {
    loaded = "B_Slingload_01_Fuel_F";
    side[] = {"west"};
};
class O_Truck_03_Fuel_F: Transport_Fuel {
    loaded = "Land_Pod_Heli_Transport_04_fuel_F";
    side[] = {"east"};
};

// HEMMT/Tempest Repair
class Transport_Repair: Light_Vehicle {
    capValue = 1;
    cost = 1000;
    hasRepair = 1;
    loadable = 0;
    nameShort = "REPAIR";
};
class B_Truck_01_Repair_F: Transport_Repair {
    loaded = "B_Slingload_01_Repair_F";
    side[] = {"west"};
};
class O_Truck_03_Repair_F: Transport_Repair {
    loaded = "Land_Pod_Heli_Transport_04_repair_F";
    side[] = {"east"};
};

// Hunter AFV
class Hunter_Upgraded: Light_Vehicle {
    hasDroneHunter = 1;
    rearm = 120;
    spawn = "B_MRAP_01_gmg_F";
    variant = 1;
};

class B_Hunter_AFV: Hunter_Upgraded {
    aps = 2;
    attachments[] = {
        {"A3\Structures_F\Mil\BagFence\BagFence_Short_F.p3d", {-1.1, -1.7, -0.7}, 90, "", 1},
        {"A3\Structures_F\Mil\BagFence\BagFence_Short_F.p3d", {1.1, -1.7, -0.7}, 270, "", 1}
    };
    capValue = 2;
    cost = 1200;
    name = "Hunter AFV";
    nameShort = "HUNTER AFV";
    side[] = {"west"};

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "450Rnd_127x108_Ball",
            "450Rnd_127x108_Ball",
            "200Rnd_40mm_G_belt"
        };
        addWeapons[] = {
            "HMG_NSVT"
        };
        removeMagazines[] = {
            "96Rnd_40mm_G_belt"
        };
        turret[] = {0};
    };
};

class Device_Truck: Light_Vehicle {
    aps = 4;
    capValue = 1;
    cost = 750;
    description = "Provides a mobile APS platform for vehicle convoys.";
    ewBoost = 1;
    loadable = 0;
    name = "Device Truck";
    nameShort = "DEVICE";
    rearm = 120;
    spawn = "O_Truck_03_device_F";
};
class B_Truck_03_device_F: Device_Truck {
    side[] = {"west"};
    textures[] = {
        "#(argb,8,8,3)color(0.80,0.76,0.66,0.15)",
        "#(argb,8,8,3)color(0.2,0.25,0.25,0.15)",
        "#(argb,8,8,3)color(0.2,0.25,0.3,0.15)",
        "#(argb,8,8,3)color(0.6,0.6,0.4,0.15)"
    };
};
class O_Truck_03_device_F: Device_Truck {
    side[] = {"east"};
};

class Nyx_Armed: Light_Vehicle {
    aps = 1;
    capValue = 4;
    cost = 1500;
    rearm = 300;
    vehicleSpawn = 1;
};

// AWC Nyx (AT)
class I_LT_01_AT_F: Nyx_Armed {
    nameShort = "NYX AT";
    side[] = {"guer"};

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "2Rnd_127mm_Firefist_missiles",
            "2Rnd_127mm_Firefist_missiles",
            "2Rnd_127mm_Firefist_missiles",
            "2Rnd_127mm_Firefist_missiles",
            "2Rnd_127mm_Firefist_missiles"
        };
        turret[] = {0};
    };
};

// AWC Nyx (Autocannon)
class I_LT_01_cannon_F: Nyx_Armed {
    nameShort = "NYX";
    side[] = {"guer"};
};

// AWC Nyx (AA)
class I_LT_01_AA_F: Nyx_Armed {
    nameShort = "NYX AA";
    side[] = {"guer"};
};

// Hunter Apex
class B_Hunter_Apex: Hunter_Upgraded {
    aps = 5;
    attachments[] = {
        {"A3\Structures_F\Mil\BagFence\BagFence_Short_F.p3d", {-1.1, -1.7, -0.7}, 90, "", 1},
        {"A3\Structures_F\Mil\BagFence\BagFence_Short_F.p3d", {1.1, -1.7, -0.7}, 270, "", 1},
        {"A3\Structures_F\Mil\BagFence\BagFence_Round_F.p3d", {-0.1, 1.5, -1.3}, 180, "", 1}
    };
    capValue = 4;
    cost = 2000;
    disallowMagazines[] = {
        "5Rnd_GAT_missiles",
        "4Rnd_GAA_missiles"
    };
    hasHMD = 1;
    name = "Hunter Apex";
    nameShort = "APEX";
    side[] = {"west"};

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "60Rnd_30mm_MP_shells_Tracer_Green",
            "60Rnd_30mm_MP_shells_Tracer_Green",
            "450Rnd_127x108_Ball",
            "450Rnd_127x108_Ball",
            "2Rnd_GAT_missiles",
            "2Rnd_GAT_missiles",
            "4Rnd_70mm_SAAMI_missiles"
        };
        addWeapons[] = {
            "autocannon_30mm_RCWS",
            "HMG_NSVT",
            "missiles_titan",
            "missiles_SAAMI"
        };
        removeMagazines[] = {
            "96Rnd_40mm_G_belt"
        };
        removeWeapons[] = {
            "GMG_40mm"
        };
        turret[] = {0};
    };
};