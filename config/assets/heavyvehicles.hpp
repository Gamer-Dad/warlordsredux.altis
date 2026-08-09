class Heavy_Vehicles {
    category = "Heavy Vehicles";
};

class Marid: Heavy_Vehicles {
    aps = 2;
    capValue = 2;
    loadable = 1;
    name = "MSE-3 Marid";
    rearm = 180;
    spawn = "O_APC_Wheeled_02_rcws_v2_F";
};

// IFV-6c Panther
class B_APC_Tracked_01_rcws_F: Heavy_Vehicles {
    aps = 2;
    capValue = 3;
    cost = 1300;
    hasDroneHunter = 1;
    isLight = 1;
    loadable = 1;
    nameShort = "PANTHER";
    rearm = 180;
    side[] = {"west"};

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "60Rnd_30mm_MP_shells_Tracer_Green",
            "60Rnd_30mm_MP_shells_Tracer_Green",
            "60Rnd_30mm_MP_shells_Tracer_Green",
            "60Rnd_30mm_MP_shells_Tracer_Green"
        };
        addWeapons[] = {
            "autocannon_30mm_RCWS",
            "HMG_127_APC"
        };
        removeMagazines[] = {
            "96Rnd_40mm_G_belt"
        };
        removeWeapons[] = {
            "GMG_40mm",
            "HMG_127_APC"
        };
        turret[] = {0};
    };
};

class Utility_Vehicle: Heavy_Vehicles {
    aps = 2;
    capValue = 2;
    hasDroneHunter = 1;
    hasRearm = 1;
    hasRefuel = 1;
    hasRepair = 1;
    loaded = "Static_Cannon";
    mineClear = 3;
    rearm = 180;
};
// CRV-6e Bobcat
class B_APC_Tracked_01_CRV_F: Utility_Vehicle {
    cost = 1700;
    hasDroneHunter = 1;
    nameShort = "BOBCAT";
    side[] = {"west"};

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "500Rnd_127x99_mag_Tracer_Red",
            "500Rnd_127x99_mag_Tracer_Red",
            "500Rnd_127x99_mag_Tracer_Red"
        };
        addWeapons[] = {
            "HMG_127_APC"
        };
        removeMagazines[] = {
            "200Rnd_127x99_mag_Tracer_Red"
        };
        removeWeapons[] = {
            "HMG_127_APC"
        };
        turret[] = {0};
    };
};
class O_Marid_Utility: Utility_Vehicle {
    cost = 2000;
    description = "MSE-3 Marid (Utility) is a support variant of the MSE-3 Marid equipped for rearming, refueling, and repairing allied vehicles.";
    loadable = 1;
    name = "MSE-3 Marid (Utility)";
    nameShort = "MARID UTIL";
    side[] = {"east"};
    spawn = "O_APC_Wheeled_02_rcws_v2_F";
    variant = 1;

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "500Rnd_127x99_mag_Tracer_Red",
            "500Rnd_127x99_mag_Tracer_Red",
            "500Rnd_127x99_mag_Tracer_Red"
        };
        addWeapons[] = {
            "HMG_127_MBT"
        };
        removeMagazines[] = {
            "96Rnd_40mm_G_belt",
            "200Rnd_127x99_mag_Tracer_Green"
        };
        removeWeapons[] = {
            "HMG_127_APC",
            "GMG_40mm"
        };
        turret[] = {0};
    };
};

// MSE-3 Marid
class O_Marid: Marid {
    cost = 1700;
    nameShort = "MARID";
    side[] = {"east"};
};

// Marid Dragon
class O_Marid_Dragon: Heavy_Vehicles {
    aps = 5;
    capValue = 4;
    cost = 2500;
    hasDroneHunter = 1;
    hasHMD = 1;
    integralWeapon[] = {16, {0, -3.5, 0}, "B_Mortar_01_F", "Integral_Mortar", "mortar_82mm", "8Rnd_82mm_Mo_shells", 8};
    loadable = 1;
    mineClear = 3;
    name = "MSE-4 Marid Dragon";
    nameShort = "DRAGON";
    rearm = 180;
    side[] = {};
    spawn = "O_APC_Wheeled_02_rcws_v2_F";

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "60Rnd_30mm_MP_shells_Tracer_Green",
            "60Rnd_30mm_MP_shells_Tracer_Green",
            "450Rnd_127x108_Ball",
            "450Rnd_127x108_Ball",
            "5Rnd_GAT_missiles",
            "4Rnd_70mm_SAAMI_missiles"
        };
        addWeapons[] = {
            "autocannon_30mm_RCWS",
            "HMG_NSVT",
            "missiles_titan",
            "missiles_SAAMI"
        };
        removeMagazines[] = {
            "96Rnd_40mm_G_belt",
            "200Rnd_127x99_mag_Tracer_Green"
        };
        removeWeapons[] = {
            "HMG_127_APC",
            "GMG_40mm"
        };
        turret[] = {0};
    };
};

class Heavy_Recon: Heavy_Vehicles {
    aps = 5;
    capValue = 1;
    cost = 5000;
    hasDroneHunter = 1;
    hasHMD = 1;
    hideTurret = 1;
    isLight = 1;
    loaded = "Land_BagBunker_Small_F";
    rearm = 120;
    requirements[] = {"S"};
    scanner = 175;
    showToEnemies = 2000;
    variant = 1;
};

class B_Marshall_Recon: Heavy_Recon {
    description = "AMV-7 Marshall (Recon) is a variant of the AMV-7 Marshall armed with a powerful scanner.";
    loadable = 1;
    name = "AMV-7 Marshall (Recon)";
    nameShort = "RECON MARSHALL";
    side[] = {"west"};
    spawn = "B_APC_Wheeled_01_cannon_F";

    class Gunner: WLTurretDefaults {
        removeMagazines[] = {
            "200Rnd_762x51_Belt_Red",
            "40Rnd_40mm_APFSDS_Tracer_Red_shells",
            "60Rnd_40mm_GPR_Tracer_Red_shells"
        };
        removeWeapons[] = {
            "LMG_coax",
            "autocannon_40mm_CTWS"
        };
        turret[] = {0};
    };
};

class O_BTR_Recon: Heavy_Recon {
    description = "BTR-K Kamysh (Recon) is a variant of the BTR-K Kamysh armed with a powerful scanner.";
    loadable = 1;
    name = "BTR-K Kamysh (Recon)";
    nameShort = "RECON BTR";
    side[] = {"east"};
    spawn = "O_APC_Tracked_02_cannon_F";

    class Gunner: WLTurretDefaults {
        removeMagazines[] = {
            "2Rnd_GAT_missiles_O",
            "140Rnd_30mm_MP_shells_Tracer_Green",
            "60Rnd_30mm_APFSDS_shells_Tracer_Green",
            "200Rnd_762x51_Belt_Green"
        };
        removeWeapons[] = {
            "missiles_titan",
            "autocannon_30mm_CTWS",
            "LMG_coax_ext"
        };
        turret[] = {0};
    };
};

// AMV-7 Marshall
class B_APC_Wheeled_01_cannon_F: Heavy_Vehicles {
    aps = 2;
    capValue = 3;
    cost = 2400;
    hasDroneHunter = 1;
    loadable = 1;
    nameShort = "MARSHALL";
    rearm = 180;
    side[] = {"west"};
};

// FV-720 Mora
class Mora: Heavy_Vehicles {
    aps = 3;
    capValue = 4;
    hasDroneHunter = 1;
    integralWeapon[] = {6, {0, -3.5, 0}, "B_Mortar_01_F", "Integral_Mortar", "mortar_82mm", "8Rnd_82mm_Mo_shells", 8};
    name = "FV-720 Mora";
    nameShort = "MORA";
    rearm = 180;
    spawn = "I_APC_tracked_03_cannon_F";
};
class B_Mora: Mora {
    cost = 2500;
    side[] = {"west"};
    textures[] = {
        "A3\Armor_F_Enoch\apc_tracked_03\data\apc_tracked_03_ext_eaf_co.paa",
        "A3\Armor_F_Enoch\apc_tracked_03\data\apc_tracked_03_ext2_eaf_co.paa",
        "A3\Armor_F_Enoch\apc_tracked_03\Data\camonet_EAF_green_CO.paa",
        "A3\Armor_F_Enoch\apc_tracked_03\data\cage_EAF_CO.paa"
    };
};
class I_Mora: Mora {
    cost = 5000;
    side[] = {"guer"};
    vehicleSpawn = 1;
};

// AFV-4 Gorgon
class Gorgon: Heavy_Vehicles {
    aps = 2;
    capValue = 3;
    disallowMagazines[] = {
        "4Rnd_GAA_missiles"
    };
    hasDroneHunter = 1;
    name = "AFV-4 Gorgon";
    nameShort = "GORGON";
    rearm = 180;

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "5Rnd_GAT_missiles",
            "5Rnd_GAT_missiles"
        };
        addWeapons[] = {
            "missiles_titan"
        };
        removeMagazines[] = {
            "2Rnd_GAT_missiles"
        };
        removeWeapons[] = {
            "missiles_titan"
        };
        turret[] = {0};
    };
};
class B_Gorgon: Gorgon {
    cost = 2900;
    side[] = {"west"};
    spawn = "B_APC_Wheeled_03_cannon_F";
    textures[] = {
        "\A3\armor_f_gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext_co.paa",
        "\A3\armor_f_gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext2_co.paa",
        "\A3\armor_f_gamma\APC_Wheeled_03\Data\rcws30_co.paa",
        "\A3\armor_f_gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext_alpha_co.paa"
    };
};
class B_Gorgon_Mortar: Gorgon {
    cost = 2900;
    hideTurret = 1;
    integralWeapon[] = {24, {0.35, -1.5, 0.35}, "B_Mortar_01_F", "Integral_Mortar", "mortar_82mm", "8Rnd_82mm_Mo_shells", 8};
    name = "AFV-4 Gorgon (Mortar)";
    nameShort = "GORGON MORTAR";
    rearm = 420;
    side[] = {"west"};
    spawn = "B_APC_Wheeled_03_cannon_F";
    textures[] = {
        "\A3\armor_f_gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext_co.paa",
        "\A3\armor_f_gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext2_co.paa",
        "\A3\armor_f_gamma\APC_Wheeled_03\Data\rcws30_co.paa",
        "\A3\armor_f_gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext_alpha_co.paa"
    };
    variant = 1;

    class Gunner: WLTurretDefaults {
        removeMagazines[] = {
            "140Rnd_30mm_MP_shells_Tracer_Yellow",
            "60Rnd_30mm_APFSDS_shells_Tracer_Yellow",
            "200Rnd_762x51_Belt_Yellow",
            "2Rnd_GAT_missiles"
        };
        removeWeapons[] = {
            "autocannon_30mm_CTWS",
            "LMG_coax_ext",
            "missiles_titan"
        };
        turret[] = {0};
    };
};
class I_Gorgon: Gorgon {
    cost = 5000;
    side[] = {"guer"};
    spawn = "I_APC_Wheeled_03_cannon_F";
    vehicleSpawn = 1;
};

class B_Marshall_UP: B_APC_Wheeled_01_cannon_F {
    aps = 3;
    cost = 3000;
    description = "AMV-7 Marshall UP is a variant of the AMV-7 Marshall armed with a larger magazine 40mm cannon.";
    hasDroneHunter = 1;
    name = "AMV-7 Marshall UP";
    nameShort = "MARSHALL UP";
    spawn = "B_APC_Wheeled_01_cannon_F";
    variant = 1;

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "240Rnd_40mm_GPR_Tracer_Red_shells",
            "240Rnd_40mm_GPR_Tracer_Red_shells",
            "160Rnd_40mm_APFSDS_Tracer_Red_shells",
            "160Rnd_40mm_APFSDS_Tracer_Red_shells",
            "2000Rnd_762x51_Belt_Red",
            "2000Rnd_762x51_Belt_Red"
        };
        addWeapons[] = {
            "autocannon_40mm_VTOL_01",
            "LMG_coax"
        };
        removeMagazines[] = {
            "60Rnd_40mm_GPR_Tracer_Red_shells",
            "40Rnd_40mm_APFSDS_Tracer_Red_shells",
            "200Rnd_762x51_Belt_Red"
        };
        removeWeapons[] = {
            "autocannon_40mm_CTWS",
            "LMG_coax"
        };
        turret[] = {0};
    };
};

// BTR-K Kamysh
class O_APC_Tracked_02_cannon_F: Heavy_Vehicles {
    aps = 2;
    capValue = 3;
    cost = 3200;
    disallowMagazines[] = {
        "4Rnd_GAA_missiles"
    };
    nameShort = "BTR";
    rearm = 180;
    side[] = {"east"};

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "240Rnd_40mm_GPR_Tracer_Red_shells",
            "160Rnd_40mm_APFSDS_Tracer_Red_shells",
            "500Rnd_127x99_mag_Tracer_Red",
            "500Rnd_127x99_mag_Tracer_Red",
            "500Rnd_127x99_mag_Tracer_Red",
            "500Rnd_127x99_mag_Tracer_Red",
            "6Rnd_LG_scalpel"
        };
        addWeapons[] = {
            "autocannon_40mm_VTOL_01",
            "HMG_127_APC",
            "missiles_SCALPEL"
        };
        removeMagazines[] = {
            "2Rnd_GAT_missiles_O",
            "60Rnd_30mm_APFSDS_shells_Tracer_Green",
            "140Rnd_30mm_MP_shells_Tracer_Green",
            "200Rnd_762x51_Belt_Green"
        };
        removeWeapons[] = {
            "missiles_titan",
            "autocannon_30mm_CTWS",
            "LMG_coax_ext"
        };
        turret[] = {0};
    };
};

// Rhino MGS
class B_AFV_Wheeled_01_cannon_F: Heavy_Vehicles {
    aps = 3;
    capValue = 4;
    cost = 4000;
    isLight = 1;
    loadable = 1;
    nameShort = "RHINO";
    rearm = 240;
    side[] = {"west"};
};

// Rhino MGS UP
class B_AFV_Wheeled_01_up_cannon_F: B_AFV_Wheeled_01_cannon_F {
    cost = 4500;
    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "16Rnd_125mm_APFSDS_T_Red",
            "12Rnd_125mm_HE_T_Red",
            "4Rnd_125mm_cannon_missiles"
        };
        addWeapons[] = {
            "cannon_125mm_advanced",
            "MMG_02_coax"
        };
        removeMagazines[] = {
            "12Rnd_120mm_APFSDS_shells_Tracer_Red",
            "8Rnd_120mm_HE_shells_Tracer_Red",
            "8Rnd_120mm_HEAT_MP_T_Red",
            "4Rnd_120mm_LG_cannon_missiles"
        };
        removeWeapons[] = {
            "cannon_120mm",
            "MMG_02_coax"
        };
        turret[] = {0};
    };
};

class B_Rhino_X: B_AFV_Wheeled_01_up_cannon_F {
    cost = 7000;
    description = "Rhino MGS X is an advanced variant of the Rhino MGS armed with an experimental railgun.";
    hasRailgun = 1;
    nameShort = "RHINO X";
    name = "Rhino MGS X";
    side[] = {};
    spawn = "B_AFV_Wheeled_01_up_cannon_F";

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "60Rnd_75mm_RailGun_APFSDS_mag",
            "RailGun_01_DummyMagazine",
            "240Rnd_40mm_GPR_Tracer_Red_shells",
            "160Rnd_40mm_APFSDS_Tracer_Red_shells",
            "450Rnd_127x108_Ball",
            "450Rnd_127x108_Ball",
            "450Rnd_127x108_Ball",
            "450Rnd_127x108_Ball"
        };
        addWeapons[] = {
            "cannon_railgun_fake",
            "cannon_railgun",
            "autocannon_40mm_VTOL_01",
            "HMG_NSVT"
        };
        removeMagazines[] = {
            "12Rnd_120mm_APFSDS_shells_Tracer_Red",
            "8Rnd_120mm_HE_shells_Tracer_Red",
            "8Rnd_120mm_HEAT_MP_T_Red",
            "4Rnd_120mm_LG_cannon_missiles"
        };
        removeWeapons[] = {
            "cannon_120mm",
            "MMG_02_coax"
        };
        turret[] = {0};
    };
};

// M2A1 Slammer
class B_MBT_01_cannon_F: Heavy_Vehicles {
    aps = 3;
    capValue = 5;
    cost = 5500;
    disallowMagazines[] = {
        "4Rnd_120mm_LG_cannon_missiles"
    };
    isLight = 1;
    integralWeapon[] = {24, {-0.75, -3, 0.8}, "B_Mortar_01_F", "Integral_Mortar", "mortar_82mm", "8Rnd_82mm_Mo_shells", 8};
    loaded = "Land_BagBunker_Small_F";
    nameShort = "SLAMMER";
    rearm = 300;
    side[] = {"west"};

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "24Rnd_125mm_APFSDS_T_Red",
            "8Rnd_125mm_HE_T_Red",
            "8Rnd_125mm_HE_T_Red",
            "8Rnd_125mm_HE_T_Red",
            "450Rnd_127x108_Ball",
            "450Rnd_127x108_Ball",
            "450Rnd_127x108_Ball",
            "450Rnd_127x108_Ball",
            "450Rnd_127x108_Ball",
            "450Rnd_127x108_Ball"
        };
        addWeapons[] = {
            "cannon_125mm_advanced",
            "HMG_NSVT"
        };
        removeMagazines[] = {
            "200Rnd_762x51_Belt_Red",
            "24Rnd_120mm_APFSDS_shells_Tracer_Red",
            "12Rnd_120mm_HE_shells_Tracer_Red",
            "12Rnd_120mm_HEAT_MP_T_Red"
        };
        removeWeapons[] = {
            "cannon_120mm",
            "LMG_coax"
        };
        turret[] = {0};
    };
};

// M2A1 Slammer UP
class B_MBT_01_TUSK_F: B_MBT_01_cannon_F {
    ammoOverrides[] = {
        {"Sh_125mm_APFSDS_T_Red", {"Sh_140mm_APFSDS", "XM291 ATAC"}}
    };
    aps = 5;
    capValue = 6;
    cost = 7500;
    hasHMD = 1;
    nameShort = "SLAMMER UP";
};

class Kuma: Heavy_Vehicles {
    aps = 3;
    capValue = 6;
    cost = 8000;
    disallowMagazines[] = {
        "4Rnd_120mm_LG_cannon_missiles"
    };
    name = "MBT-52 Kuma";
    nameShort = "KUMA";
    rearm = 300;
    spawn = "I_MBT_03_cannon_F";
};
class B_MBT_03_cannon_F: Kuma {
    side[] = {"west"};
    smartMineAP = 3;
    textures[] = {
        "src\img\camo\kuma01.jpg",
        "src\img\camo\kuma02.jpg",
        "src\img\camo\kuma03.jpg",
        "\a3\Armor_F\Data\camonet_NATO_Desert_CO.paa"
    };
};
class I_MBT_03_cannon_F: Kuma {
    side[] = {"guer"};
    vehicleSpawn = 1;
};

class B_Slammer_X: B_MBT_01_TUSK_F {
    cost = 12000;
    description = "M2A4 Slammer X is an advanced variant of the M2A1 Slammer armed with an experimental railgun.";
    hasRailgun = 1;
    nameShort = "SLAMMER X";
    name = "M2A4 Slammer X";
    side[] = {};
    spawn = "B_MBT_01_TUSK_F";
    variant = 0;

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "60Rnd_75mm_RailGun_APFSDS_mag",
            "RailGun_01_DummyMagazine",
            "450Rnd_127x108_Ball",
            "450Rnd_127x108_Ball",
            "450Rnd_127x108_Ball",
            "450Rnd_127x108_Ball",
            "450Rnd_127x108_Ball",
            "450Rnd_127x108_Ball"
        };
        addWeapons[] = {
            "cannon_railgun_fake",
            "cannon_railgun",
            "HMG_NSVT"
        };
        removeMagazines[] = {
            "200Rnd_762x51_Belt_Red",
            "24Rnd_120mm_APFSDS_shells_Tracer_Red",
            "12Rnd_120mm_HE_shells_Tracer_Red",
            "12Rnd_120mm_HEAT_MP_T_Red"
        };
        removeWeapons[] = {
            "cannon_120mm",
            "LMG_coax"
        };
        turret[] = {0};
    };
};

// T-100 Varsuk
class O_MBT_02_cannon_F: Heavy_Vehicles {
    aps = 3;
    capValue = 4;
    cost = 7500;
    nameShort = "VARSUK";
    rearm = 300;
    side[] = {"east"};
};

class Angara: Heavy_Vehicles {
    capValue = 6;
    rearm = 300;
};
class O_MBT_04_cannon_F: Angara {
    aps = 3;
    cost = 8500;
    nameShort = "ANGARA";
    side[] = {"east"};
};
class O_MBT_04_command_F: Angara {
    aps = 5;
    cost = 9500;
    nameShort = "ANGARA-K";
    side[] = {"east"};
};

// T-100X Futura
class O_MBT_02_railgun_F: Heavy_Vehicles {
    aps = 5;
    capValue = 6;
    cost = 15000;
    hasHMD = 1;
    hasRailgun = 1;
    hasReconOptics = 1;
    nameShort = "FUTURA";
    rearm = 300;
    side[] = {};
};

class Howitzer_Artillery: Heavy_Vehicles {
    ammoOverrides[] = {
        {"Smoke_120mm_AMOS_White", {"M_DroneDeployer", "155mm Drone Deployer"}}
    };
    aps = 1;
    capValue = 4;
    disallowMagazines[] = {
        "2Rnd_155mm_Mo_Cluster",
        "2Rnd_155mm_Mo_Cluster_O"
    };
    nameShort = "ARTY";
    rearm = 1800;
};
// M4 Scorcher
class B_MBT_01_arty_F: Howitzer_Artillery {
    cost = 25000;
    loaded = "CamoNet_BLUFOR_big_F";
    side[] = {"west"};
};
// 2S9 Sochor
class O_MBT_02_arty_F: Howitzer_Artillery {
    cost = 20000;
    loaded = "CamoNet_OPFOR_big_F";
    side[] = {"east"};
};

class MRLS: Heavy_Vehicles {
    aps = 1;
    capValue = 4;
    disallowMagazines[] = {
        "12Rnd_230mm_rockets_cluster"
    };
    rearm = 1800;
};
// M5 Sandstorm MRLS
class B_MBT_01_mlrs_F: MRLS {
    cost = 25000;
    loaded = "CamoNet_BLUFOR_big_F";
    nameShort = "MRLS";
    side[] = {"west"};
};
class O_Truck_02_MRL_F: MRLS {
    cost = 18000;
    loaded = "CamoNet_OPFOR_big_F";
    name = "Zamak MRL";
    nameShort = "MRLS";
    side[] = {"east"};
    spawn = "I_Truck_02_MRL_F";
    textures[] = {
        "\A3\soft_f_beta\Truck_02\Data\Truck_02_kab_opfor_co.paa",
        "\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa",
        "\a3\soft_f_gamma\truck_02\data\truck_02_mrl_OPFOR_co.paa"
    };
};