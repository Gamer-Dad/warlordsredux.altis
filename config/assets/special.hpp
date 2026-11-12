class Special {
    category = "Special";
};

class Team_Rally_Point: Special {
    cost = 5000;
    demolishable = 1;
    demolishStepTime = 3;
    disableDamage = 1;
    hasFastTravel = 1;
    name = "STR_WL_assetTeamRallyPoint";
    nameShort = "STR_WL_assetTeamRallyPointShort";
    offset[] = {0, 8, 0};
    showToEnemies = 100;
};
class Land_MedicalTent_01_NATO_generic_open_F: Team_Rally_Point {};
class Land_MedicalTent_01_CSAT_brownhex_generic_open_F: Team_Rally_Point {};

class Land_Pallet_MilBoxes_F: Special {
    capValueEmpty = 100;
    cost = 5000;
    demolishable = 2;
    demolishStepTime = 4;
    disableDamage = 1;
    name = "STR_WL_assetCache";
    nameShort = "STR_WL_assetCacheShort";
    showToEnemies = 500;
};

// Recon UAV
class B_UAV_02_F: Special {
    cost = 1000;
    fragileDrone = 1;
    nameShort = "STR_WL_assetScannerShort";
};
class O_UAV_02_F: Special {
    cost = 1000;
    fragileDrone = 1;
    nameShort = "STR_WL_assetScannerShort";
};

class Integral_Mortar: Special {
    cost = -1;
    name = "STR_WL_assetMortar82";
    nameShort = "STR_WL_assetMortarShort";
};

class Land_BagFence_Round_F: Special {
    cost = 200;
    demolishable = 1;
    demolishStepTime = 1;
    lifetime = 180;
    name = "STR_WL_assetTempSandbagWall";
    nameShort = "STR_WL_assetSandbagShort";
    offset[] = {0, 3, 0};
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
    name = "STR_WL_assetFightingPositionCannon";
    nameShort = "STR_WL_assetStaticCannonShort";
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
    name = "STR_WL_assetBaseDome";
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
    name = "STR_WL_assetDebris";
    nameShort = "STR_WL_assetDebrisShort";
};

class Land_ShellCrater_02_large_F: Crater_Debris {};
class Land_ShellCrater_02_small_F: Crater_Debris {};
class SpaceshipCapsule_01_debris_F: Crater_Debris {};
class CraterLong: Crater_Debris {};
class CraterLong_02_F: Crater_Debris {};

class Land_Destroyer_01_base_F: Special {
    cost = 40000;
    name = "STR_WL_assetDestroyer";
    nameShort = "STR_WL_assetDestroyerShort";
};

class B_Ship_MRLS_01_F: Special {
    cost = 20000;
    hasHMD = 1;
    nameShort = "VLS";
};

class Spawn_Tent: Special {
    cost = 300;
    demolishStepTime = 2;
    name = "STR_WL_assetTent";
    nameShort = "STR_WL_assetTentShort";
    showToEnemies = 100;
};

class Land_TentDome_F: Spawn_Tent {};
class Land_TentSolar_01_bluewhite_F: Spawn_Tent {};
class Land_TentSolar_01_redwhite_F: Spawn_Tent {};

class RuggedTerminal_01_communications_hub_F: Special {
    name = "STR_WL_assetForwardBase";
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
    name = "STR_WL_assetFortifiedRallyPoint";
    nameShort = "STR_WL_assetFortShort";
    offset[] = {0, 12, 0};
};

class Land_Cargo_Tower_V4_F: Supply_Fort {
    loaded = "Land_Cargo10_military_green_F";
    name = "STR_WL_assetCargoTower";
    nameShort = "STR_WL_assetTowerShort";
    offset[] = {0, 8, 0};
};

class Deployed_AR2: Special {
    cost = 500;
    fragileDrone = 1;
    hasHMD = 1;
    name = "STR_WL_assetDeployedDarter";
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
    name = "STR_WL_assetSteerableParachute";
    nameShort = "STR_WL_assetParachuteShort";
};

class SpaceshipCapsule_01_container_F: Special {
    name = "STR_WL_assetParadropCapsule";
    nameShort = "STR_WL_assetCapsuleShort";
};

class Deployed_Explosives: Special {
    cost = 100;
    demolishable = 1;
    demolishStepTime = 1;
    name = "STR_WL_assetExplosiveCharge";
    nameShort = "STR_WL_assetChargeShort";
};
class DemoCharge_Remote_Ammo: Deployed_Explosives {};
class SatchelCharge_Remote_Ammo: Deployed_Explosives {};

class Land_VR_Slope_01_F: Special {
    cost = 100;
    demolishable = 1;
    demolishStepTime = 1;
    name = "STR_WL_assetMobileRamp";
    nameShort = "STR_WL_assetRampShort";
    textures[] = {
        "#(rgb,8,8,3)color(0.08,0.12,0.08,1)",
        "#(rgb,8,8,3)color(0.04,0.08,0.04,1)"
    };
};

#define WL_FLARE_BASIC {2, 20, 0}
#define WL_FLARE_UTILITY {3, 15, 2}
#define WL_FLARE_LIGHT_COMBAT {4, 8, 3}
#define WL_FLARE_MAIN_COMBAT {5, 8, 4}
#define WL_FLARE_ADVANCED_COMBAT {6, 6, 5}
#define WL_FLARE_TOP_FIGHTER {15, 6, 5}
#define WL_FLARE_GROWLER {30, 3, 2.5}