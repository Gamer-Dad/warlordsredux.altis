class Special {
    category = "Special";
};

class FOB_Crate: Special {
    conversion = 1;
    cost = 1000;
    demolishable = 1;
    demolishStepTime = 3;
    loadable[] = {0, -1.5, 0.5};
    loadableAngle = 90;
    name = "Forward Base Supplies";
    offset[] = {0, 5, 0};
};
class Land_Cargo20_blue_F: FOB_Crate {
    side[] = {"west"};
};
class Land_Cargo20_brick_red_F: FOB_Crate {
    side[] = {"east"};
};

class Team_Rally_Point: Special {
    conversion = 1;
    cost = 5000;
    demolishable = 1;
    demolishStepTime = 3;
    hasFastTravel = 1;
    name = "Team Rally Point";
    offset[] = {0, 8, 0};
    singleton = 1;
    showToEnemies = 1000;
};
class Land_MedicalTent_01_NATO_generic_open_F: Team_Rally_Point {
    side[] = {"west"};
};
class Land_MedicalTent_01_CSAT_brownhex_generic_open_F: Team_Rally_Point {
    side[] = {"east"};
};

// Recon UAV
class B_UAV_02_F: Special {
    cost = 1000;
    fragileDrone = 1;
};
class O_UAV_02_F: Special {
    cost = 1000;
    fragileDrone = 1;
};

class B_Integral_Mortar: Special {
    cost = -1;
    name = "Integral Mortar System";
};

class Land_BagFence_Round_F: Special {
    cost = 200;
    demolishable = 1;
    demolishStepTime = 1;
    lifetime = 180;
    name = "Temporary Sandbag Wall";
    offset[] = {0, 3, 0};
};

class Land_BagBunker_Small_F: Special {
    cost = 1500;
    demolishable = 1;
    demolishStepTime = 1;
    hasFastTravel = 1;
    loaded = "Static_HMG_Shielded";
    name = "Fighting Position";
    offset[] = {0, 5, 0};
};

class Static_HMG_Shielded: Special {
    cost = 500;
    name = "M2 HMG .50 (Raised)";
    offset[] = {0, 3, 0};
    rearm = 180;
    spawn = "I_HMG_02_high_F";

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "500Rnd_127x99_mag_Tracer_Yellow",
            "500Rnd_127x99_mag_Tracer_Yellow"
        };
        addWeapons[] = {
            "HMG_static"
        };
        removeMagazines[] = {
            "100Rnd_127x99_mag_Tracer_Yellow"
        };
        removeWeapons[] = {
            "HMG_M2_Mounted"
        };
        turret[] = {0};
    };
};

class Light_Mortar: Special {
    cost = 500;
    loaded = "Land_SandbagBarricade_01_hole_F";
    name = "Mk6 Mortar (Light Load)";
    offset[] = {0, 3, 0};
    rearm = 900;
    spawn = "I_Mortar_01_F";
    lifetime = 300;

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "8Rnd_82mm_Mo_shells"
        };
        removeMagazines[] = {
            "8Rnd_82mm_Mo_shells",
            "8Rnd_82mm_Mo_Flare_white",
            "8Rnd_82mm_Mo_Flare_white_illumination",
            "8Rnd_82mm_Mo_Smoke_white"
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
    loaded = "Land_IRMaskingCover_01_F";
    loadable[] = {0, -3.4, 0.8};
    loadableAngle = 180;
    name = "Fighting Position (Cannon)";
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
class Land_TentHangar_V1_F: Forward_Base_Dome {};

class Crater_Debris: Special {
    cost = 200;
    obstacle = 3;
    demolishable = 1;
    demolishStepTime = 40;
    lifetime = 1200;
    name = "Debris";
};

class Land_ShellCrater_02_large_F: Crater_Debris {};
class Land_ShellCrater_02_small_F: Crater_Debris {};
class SpaceshipCapsule_01_debris_F: Crater_Debris {};
class CraterLong: Crater_Debris {};
class CraterLong_02_F: Crater_Debris {};

class Land_Destroyer_01_base_F: Special {
    cost = 40000;
    name = "Destroyer";
};

class B_Ship_MRLS_01_F: Special {
    cost = 20000;
    hasHMD = 1;
};

class Spawn_Tent: Special {
    cost = 300;
    demolishStepTime = 2;
    name = "Tent";
};

class Land_TentA_F: Spawn_Tent {};
class Land_TentDome_F: Spawn_Tent {};
class Land_TentSolar_01_bluewhite_F: Spawn_Tent {};
class Land_TentSolar_01_redwhite_F: Spawn_Tent {};

class RuggedTerminal_01_communications_hub_F: Special {
    name = "Forward Base";
};