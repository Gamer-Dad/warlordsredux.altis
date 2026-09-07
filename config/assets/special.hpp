class Special {
    category = "Special";
};

class Team_Rally_Point: Special {
    cost = 5000;
    demolishable = 1;
    demolishStepTime = 3;
    disableDamage = 1;
    hasFastTravel = 1;
    name = "Team Rally Point";
    nameShort = "RALLY";
    offset[] = {0, 8, 0};
    showToEnemies = 30;
};
class Land_MedicalTent_01_NATO_generic_open_F: Team_Rally_Point {};
class Land_MedicalTent_01_CSAT_brownhex_generic_open_F: Team_Rally_Point {};

class Land_Pallet_MilBoxes_F: Special {
    capValueEmpty = 100;
    cost = 5000;
    demolishable = 2;
    demolishStepTime = 4;
    disableDamage = 1;
    name = "Cache";
    nameShort = "CACHE";
    showToEnemies = 500;
};

// Recon UAV
class B_UAV_02_F: Special {
    cost = 1000;
    fragileDrone = 1;
    nameShort = "SCANNER";
};
class O_UAV_02_F: Special {
    cost = 1000;
    fragileDrone = 1;
    nameShort = "SCANNER";
};

class Integral_Mortar: Special {
    cost = -1;
    name = "82mm Mortar";
    nameShort = "MORTAR";
};

class Land_BagFence_Round_F: Special {
    cost = 200;
    demolishable = 1;
    demolishStepTime = 1;
    lifetime = 180;
    name = "Temporary Sandbag Wall";
    nameShort = "SANDBAG";
    offset[] = {0, 3, 0};
};

class Static_Mora: Special {
    aps = 3;
    capValue = 2;
    conversion = 1;
    cost = 3000;
    demolishable = 1;
    demolishStepTime = 1;
    immobile = 1;
    name = "Mora (Static)";
    nameShort = "STATIC MORA";
    rearm = 180;
    spawn = "I_APC_tracked_03_cannon_F";
    textures[] = {
        "A3\Armor_F_Enoch\apc_tracked_03\data\apc_tracked_03_ext_eaf_co.paa",
        "A3\Armor_F_Enoch\apc_tracked_03\data\apc_tracked_03_ext2_eaf_co.paa",
        "A3\Armor_F_Enoch\apc_tracked_03\Data\camonet_EAF_green_CO.paa",
        "A3\Armor_F_Enoch\apc_tracked_03\data\cage_EAF_CO.paa"
    };

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "450Rnd_127x108_Ball",
            "450Rnd_127x108_Ball",
            "5Rnd_GAT_missiles",
            "5Rnd_GAT_missiles"
        };
        addWeapons[] = {
            "HMG_NSVT",
            "missiles_titan"
        };
        removeMagazines[] = {
            "200Rnd_762x51_Belt_Yellow"
        };
        removeWeapons[] = {
            "LMG_coax"
        };
        turret[] = {0};
    };
};

class Static_Cannon: Special {
    aps = 2;
    capValue = 2;
    cost = 3000;
    conversion = 1;
    hasRearm = 1;
    immobile = 1;
    loaded = "Static_Mora";
    loadable = 1;
    loadRotate = 2;
    name = "Fighting Position (Cannon)";
    nameShort = "STATIC CANNON";
    offset[] = {0, 8, 0};
    rearm = 300;
    spawn = "B_AFV_Wheeled_01_cannon_F";

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "12Rnd_120mm_APFSDS_shells_Tracer_Yellow",
            "8Rnd_120mm_HE_shells_Tracer_Yellow"
        };
        addWeapons[] = {
            "cannon_120mm"
        };
        removeMagazines[] = {
            "12Rnd_120mm_APFSDS_shells_Tracer_Red",
            "8Rnd_120mm_HE_shells_Tracer_Red",
            "8Rnd_120mm_HEAT_MP_T_Red",
            "4Rnd_120mm_LG_cannon_missiles",
            "200Rnd_338_Mag"
        };
        removeWeapons[] = {
            "cannon_120mm",
            "MMG_02_coax"
        };
        turret[] = {0};
    };
};

class Forward_Base_Dome: Special {
    hideMap = 2;
    name = "Base Dome";
};

class Land_Dome_Small_WIP_F: Forward_Base_Dome {};
class Land_Dome_Small_WIP2_F: Forward_Base_Dome {};
class Land_Dome_Small_F: Forward_Base_Dome {};

class Crater_Debris: Special {
    cost = 200;
    obstacle = 3;
    demolishable = 1;
    demolishStepTime = 25;
    hideMap = 2;
    lifetime = 1200;
    name = "Debris";
    nameShort = "DEBRIS";
};

class Land_ShellCrater_02_large_F: Crater_Debris {};
class Land_ShellCrater_02_small_F: Crater_Debris {};
class SpaceshipCapsule_01_debris_F: Crater_Debris {};
class CraterLong: Crater_Debris {};
class CraterLong_02_F: Crater_Debris {};

class Land_Destroyer_01_base_F: Special {
    cost = 40000;
    name = "Destroyer";
    nameShort = "DESTROYER";
};

class B_Ship_MRLS_01_F: Special {
    cost = 20000;
    hasHMD = 1;
    nameShort = "VLS";
};

class Spawn_Tent: Special {
    cost = 300;
    demolishStepTime = 2;
    name = "Tent";
    nameShort = "TENT";
    showToEnemies = 20;
};

class Land_TentDome_F: Spawn_Tent {};
class Land_TentSolar_01_bluewhite_F: Spawn_Tent {};
class Land_TentSolar_01_redwhite_F: Spawn_Tent {};

class RuggedTerminal_01_communications_hub_F: Special {
    name = "Forward Base";
    nameShort = "FOB";
};

class Supply_Fort: Special {
    aps = 5;
    conversion = 1;
    cost = 8000;
    demolishable = 12;
    demolishStepTime = 5;
    disableDamage = 1;
    hasFastTravel = 1;
    hasRearm = 1;
    hasRepair = 1;
    hasRefuel = 1;
    rearm = 60;
    showToEnemies = 100;
};

class Land_Cargo_HQ_V4_F: Supply_Fort {
    loaded = "Land_Cargo_Tower_V4_F";
    name = "Fortified Rally Point";
    nameShort = "FORT";
    offset[] = {0, 12, 0};
};

class Land_Cargo_Tower_V4_F: Supply_Fort {
    loaded = "Land_Cargo10_military_green_F";
    name = "Cargo Tower";
    nameShort = "TOWER";
    offset[] = {0, 8, 0};
};

class Deployed_AR2: Special {
    cost = 500;
    fragileDrone = 1;
    hasHMD = 1;
    name = "Deployed AR-2 Darter";
    nameShort = "DARTER";
    offset[] = {0, 3, 0};
    singleton = 2;
};
class B_AR2_Deployed: Deployed_AR2 {
    spawn = "B_UAV_01_F";
};
class O_AR2_Deployed: Deployed_AR2 {
    spawn = "O_UAV_01_F";
};
class I_AR2_Deployed: Deployed_AR2 {
    spawn = "I_UAV_01_F";
};

class Steerable_Parachute_F: Special {
    name = "Steerable Parachute";
    nameShort = "PARACHUTE";
};

class Land_VR_Slope_01_F: Special {
    cost = 100;
    demolishable = 1;
    demolishStepTime = 1;
    name = "Mobile Ramp";
    nameShort = "RAMP";
    textures[] = {
        "#(rgb,8,8,3)color(0.08,0.12,0.08,1)",
        "#(rgb,8,8,3)color(0.04,0.08,0.04,1)"
    };
};

class Deployed_Explosives: Special {
    cost = 100;
    demolishable = 1;
    demolishStepTime = 1;
    name = "Explosive Charge";
    nameShort = "CHARGE";
};
class DemoCharge_Remote_Ammo: Deployed_Explosives {};
class SatchelCharge_Remote_Ammo: Deployed_Explosives {};