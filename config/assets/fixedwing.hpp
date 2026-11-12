class Fixed_Wing {
    category = "Fixed Wing";
    requirements[] = {"A"};
};

class Caesar: Fixed_Wing {
    ammoOverrides[] = {
        {"M_SPG9_HE", {"M_BunkerDeployer", "STR_WL_ammoBunkerDeployer"}}
    };
    cost = 800;
    description = "$STR_WL_descCaesar";
    flares[] = WL_FLARE_BASIC;
    hasDroneHunter = 1;
    name = "Caesar";
    nameShort = "CAESAR";
    spawn = "C_Plane_Civil_01_F";

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "SPG9_HE",
            "SPG9_HE"
        };
        addWeapons[] = {
            "launcher_SPG9"
        };
        turret[] = {-1};
    };
};
class B_Caesar: Caesar {
    side[] = {"west"};
};
class O_Caesar: Caesar {
    side[] = {"east"};
};
class I_Caesar: Caesar {
    side[] = {"guer"};
};

// V-44 X Blackfish
class Blackfish: Fixed_Wing {
    cost = 2000;
    flares[] = WL_FLARE_MAIN_COMBAT;
    hasFastTravel = 1;
    hasHMD = 1;
    nameShort = "BLACKFISH";
    paradrops = 1;
    rearm = 120;
    requirements[] = {"H"};
};
class B_T_VTOL_01_infantry_F: Blackfish {
    ammoOverrides[] = {
        {"Bo_Mk82", {"M_SupplyLayer", "STR_WL_ammoSupplyDrop"}}
    };
    cost = 4000;
    description = "$STR_WL_descBlackfishSupply";
    flares[] = WL_FLARE_LIGHT_COMBAT;
    name = "STR_WL_assetBlackfishSupply";
    nameShort = "STR_WL_assetBlackfishSupplyShort";
    rearm = 900;
    requirements[] = {"H", "NF", "S"};
    side[] = {"west"};

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "PylonMissile_1Rnd_Mk82_F",
            "PylonMissile_1Rnd_Mk82_F"
        };
        addWeapons[] = {
            "Mk82BombLauncher"
        };
        removeMagazines[] = {
            "240Rnd_CMFlare_Chaff_Magazine"
        };
        removeWeapons[] = {
            "CMFlareLauncher_Triples"
        };
        turret[] = {-1};
    };
};
class B_T_VTOL_01_vehicle_F: Blackfish {
    ammoOverrides[] = {
        {"Bo_Mk82", {"M_MineLayer", "STR_WL_ammoMineLayerCBU89"}}
    };
    description = "$STR_WL_descBlackfishMine";
    flares[] = WL_FLARE_LIGHT_COMBAT;
    hasLoader = 1;
    isHeavyLift = 1;
    name = "STR_WL_assetBlackfishMineLayer";
    nameShort = "STR_WL_assetBlackfishMinesShort";
    side[] = {"west"};

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "PylonMissile_1Rnd_Mk82_F"
        };
        addWeapons[] = {
            "Mk82BombLauncher"
        };
        removeMagazines[] = {
            "240Rnd_CMFlare_Chaff_Magazine"
        };
        removeWeapons[] = {
            "CMFlareLauncher_Triples"
        };
        turret[] = {-1};
    };
};

// V-44 X Blackfish (Armed)
class B_T_VTOL_01_armed_F: Blackfish {
    cost = 6500;
    hasHMD = 1;
    hasReconOptics = 1;
    hasTurretVisualizer = 1;
    rearm = 300;
    side[] = {"west"};

    class Pilot: WLTurretDefaults {
        removeMagazines[] = {
            "240Rnd_CMFlare_Chaff_Magazine"
        };
        removeWeapons[] = {
            "CMFlareLauncher_Triples"
        };
        turret[] = {-1};
    };
};

class B_Archerfish: Blackfish {
    ammoOverrides[] = {
        {"Missile_AGM_02_F", {"Missile_AGM_02_Laser_F", "STR_WL_ammoJassmLaser"}}
    };
    cost = 13000;
    description = "$STR_WL_descArcherfish";
    isHeavyLift = 1;
    hasHMD = 1;
    hasLoader = 1;
    name = "V-44 J Archerfish";
    nameShort = "ARCHERFISH";
    rearm = 420;
    requirements[] = {"A"};
    side[] = {"west"};
    spawn = "B_T_VTOL_01_vehicle_F";
    variant = 1;

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_BIM9X_x1",
            "magazine_Missile_BIM9X_x1",
            "Laserbatteries"
        };
        addWeapons[] = {
            "weapon_AGM_65Launcher",
            "weapon_BIM9xLauncher",
            "Laserdesignator_vehicle"
        };
        removeMagazines[] = {
            "240Rnd_CMFlare_Chaff_Magazine"
        };
        removeWeapons[] = {
            "CMFlareLauncher_Triples"
        };
        turret[] = {-1};
    };
};

// Scout Stealth
// class Scout_Stealth: Fixed_Wing {
//     cost = 14000;
//     disallowMagazines[] = {
//         "PylonRack_Bomb_SDB_x4",
//         "PylonRack_Bomb_GBU12_x2",
//         "PylonMissile_Missile_BIM9X_x1",
//         "PylonMissile_Bomb_GBU12_x1",
//         "PylonRack_Missile_AGM_02_x1",
//         "PylonRack_Missile_AGM_02_x2",
//         "PylonRack_Missile_AMRAAM_D_x1",
//         "PylonRack_Missile_AMRAAM_D_x2",
//         "PylonRack_Missile_HARM_x1",
//         "PylonRack_Missile_BIM9X_x1",
//         "PylonRack_Missile_BIM9X_x2",
//         "PylonMissile_Missile_AMRAAM_D_INT_x1",
//         "PylonMissile_Missile_KH58_x1",
//         "PylonMissile_Missile_AGM_KH25_x1",
//         "PylonMissile_Missile_AGM_KH25_INT_x1",
//         "PylonMissile_Bomb_KAB250_x1",
//         "PylonMissile_Missile_KH58_INT_x1",
//         "PylonMissile_Missile_AA_R77_INT_x1",
//         "PylonMissile_Missile_AA_R73_x1",
//         "PylonMissile_Missile_AA_R77_x1"
//     };
//     hasHMD = 1;
//     hasReconOptics = 1;
//     offset[] = {0, 12, 0};
//     rearm = 420;
//     requirements[] = {"A"};
//     scanner = 1000;
//     showToEnemies = 1000;
//     threatDetection = 8000;
//     variant = 1;
// };

// class B_Scout_Wasp: Scout_Stealth {
//     ammoOverrides[] = {
//         {"M_Scalpel_AT", {"M_Sidearm", "AGM-122 Sidearm"}}
//     };
//     name = "SR-181 Scout Wasp";
//     nameShort = "SCOUT WASP";
//     side[] = {"west"};
//     spawn = "B_Plane_Fighter_01_F";

//     class Pilot: WLTurretDefaults {
//         addMagazines[] = {
//             "PylonRack_4Rnd_LG_scalpel"
//         };
//         addWeapons[] = {
//             "missiles_SCALPEL"
//         };
//         removeMagazines[] = {
//             "240Rnd_CMFlare_Chaff_Magazine"
//         };
//         removeWeapons[] = {
//             "CMFlareLauncher_Singles"
//         };
//         turret[] = {-1};
//     };
// };

// class O_Scout_Shikra: Scout_Stealth {
//     ammoOverrides[] = {
//         {"M_Scalpel_AT", {"M_Sidearm", "Kh-31P ARM"}}
//     };
//     name = "Yak-201 Scout Shikra";
//     nameShort = "SCOUT SHIKRA";
//     side[] = {"east"};
//     spawn = "O_Plane_Fighter_02_F";

//     class Pilot: WLTurretDefaults {
//         addMagazines[] = {
//             "PylonRack_4Rnd_LG_scalpel"
//         };
//         addWeapons[] = {
//             "missiles_SCALPEL"
//         };
//         removeMagazines[] = {
//             "240Rnd_CMFlare_Chaff_Magazine"
//         };
//         removeWeapons[] = {
//             "CMFlareLauncher"
//         };
//         turret[] = {-1};
//     };
// };

// Y-32 Xi'an (Vehicle Transport)
class O_Xian: Fixed_Wing {
    flares[] = WL_FLARE_MAIN_COMBAT;
    hasGunnerAction = 1;
    hasHMD = 1;
    hasSling = 1;
    hasTurretVisualizer = 1;
    nameShort = "XIAN";
    paradrops = 2;
    requirements[] = {"H"};
    side[] = {"east"};
    spawn = "O_T_VTOL_02_vehicle_dynamicLoadout_F";

    class Pilot: WLTurretDefaults {
        removeMagazines[] = {
            "168Rnd_CMFlare_Chaff_Magazine"
        };
        removeWeapons[] = {
            "CMFlareLauncher"
        };
        turret[] = {-1};
    };
};

class O_Xian_Supply: O_Xian {
    ammoOverrides[] = {
        {"Bo_Mk82", {"M_SupplyLayer", "STR_WL_ammoSupplyDrop"}}
    };
    cost = 4000;
    description = "$STR_WL_descXianSupply";
    disallowMagazines[] = {
        "PylonMissile_1Rnd_Bomb_03_F",
        "PylonRack_1Rnd_Missile_AA_03_F",
        "PylonRack_1Rnd_LG_scalpel",
        "PylonRack_3Rnd_LG_scalpel",
        "PylonRack_4Rnd_LG_scalpel",
        "PylonRack_1Rnd_Missile_AGM_01_F",
        "PylonRack_19Rnd_Rocket_Skyfire",
        "PylonRack_20Rnd_Rocket_03_HE_F",
        "PylonRack_20Rnd_Rocket_03_AP_F"
    };
    flares[] = WL_FLARE_LIGHT_COMBAT;
    hasSling = 0;
    name = "STR_WL_assetXianSupply";
    nameShort = "STR_WL_assetXianSupplyShort";
    rearm = 900;
    requirements[] = {"H", "NF", "S"};

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "2Rnd_Mk82"
        };
        addWeapons[] = {
            "Mk82BombLauncher"
        };
        removeMagazines[] = {
            "168Rnd_CMFlare_Chaff_Magazine"
        };
        removeWeapons[] = {
            "CMFlareLauncher"
        };
        turret[] = {-1};
    };
    class Gunner : WLTurretDefaults {
        removeMagazines[] = {
            "250Rnd_30mm_HE_shells_Tracer_Green",
            "250Rnd_30mm_APDS_shells_Tracer_Green"
        };
        removeWeapons[] = {
            "gatling_30mm_VTOL_02"
        };
        turret[] = {0};
    };
};

class O_Xian_MineLayer: O_Xian_Supply {
    ammoOverrides[] = {
        {"Bo_Mk82", {"M_MineLayerSmall", "STR_WL_ammoMineLayerTM82"}}
    };
    hasSling = 1;
    name = "STR_WL_assetXianMineLayer";
    nameShort = "STR_WL_assetXianMinesShort";
    rearm = 120;
    requirements[] = {"H"};
};

class O_Xian_Armed: O_Xian {
    allowPylonMagazines[] = {
        "PylonRack_12Rnd_PG_missiles",
        "PylonRack_12Rnd_PGM_missiles",
        "PylonMissile_Missile_KH58_INT_x1",
        "PylonMissile_Missile_AA_R73_x1",
        "PylonMissile_Missile_AA_R77_x1",
        "PylonRack_Missile_BIM9X_x1",
        "PylonRack_Missile_BIM9X_x2"
    };
    ammoOverrides[] = {
        {"Missile_AGM_02_F", {"Missile_AGM_02_Laser_F", "STR_WL_ammoAkf98Laser"}},
        {"M_SPG9_HE", {"M_DroneDeployer", "STR_WL_ammoDroneDeployerCanister"}}
    };
    cost = 11000;
    name = "STR_WL_assetXianArmed";
    rearm = 300;

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AA_R73_x1",
            "magazine_Missile_AA_R73_x1",
            "SPG9_HE",
            "SPG9_HE",
            "Laserbatteries"
        };
        addWeapons[] = {
            "weapon_AGM_65Launcher",
            "weapon_R73Launcher",
            "launcher_SPG9",
            "Laserdesignator_pilotCamera"
        };
        removeMagazines[] = {
            "168Rnd_CMFlare_Chaff_Magazine"
        };
        removeWeapons[] = {
            "CMFlareLauncher"
        };
        turret[] = {-1};
    };
    class Gunner : WLTurretDefaults {
        addMagazines[] = {
            "500Rnd_Cannon_30mm_Plane_CAS_02_F",
            "500Rnd_Cannon_30mm_Plane_CAS_02_F",
            "500Rnd_Cannon_30mm_Plane_CAS_02_F",
            "500Rnd_Cannon_30mm_Plane_CAS_02_F"
        };
        addWeapons[] = {
            "Cannon_30mm_Plane_CAS_02_F"
        };
        removeMagazines[] = {
            "250Rnd_30mm_HE_shells_Tracer_Green",
            "250Rnd_30mm_APDS_shells_Tracer_Green"
        };
        removeWeapons[] = {
            "gatling_30mm_VTOL_02"
        };
        turret[] = {0};
    };
};

// A-164 Wipeout (CAS)
class B_Plane_CAS_01_dynamicLoadout_F: Fixed_Wing {
    allowPylonMagazines[] = {
        "PylonRack_12Rnd_PGM_missiles",
        {"PylonMissile_1Rnd_Bomb_03_F", {"Pylons4", "Pylons5", "Pylons6", "Pylons7"}},
        {"PylonRack_Bomb_SDB_x4", {"Pylons5", "Pylons6"}},
        {"PylonRack_1Rnd_Missile_AGM_02_F", {"Pylons4", "Pylons7"}},
        {"PylonRack_3Rnd_Missile_AGM_02_F", {"Pylons4", "Pylons7"}},
        "PylonRadarPod_01_F",
        "PylonCameraPod_01_F"
    };
    ammoOverrides[] = {
        {"Bomb_03_F", {"Bomb_03_BLU_F", "STR_WL_ammoBlu12Bunker"}},
        {"Missile_AGM_02_F", {"Missile_AGM_02_Laser_F", "STR_WL_ammoMaverickLaser"}}
    };
    cost = 11000;
    disallowMagazines[] = {
        "PylonRack_1Rnd_Missile_AGM_02_F",
        "PylonRack_3Rnd_Missile_AGM_02_F"
    };
    flares[] = WL_FLARE_MAIN_COMBAT;
    hasHMD = 1;
    nameShort = "WIPEOUT";
    rearm = 420;
    side[] = {"west"};

    class Pilot: WLTurretDefaults {
        removeMagazines[] = {
            "120Rnd_CMFlare_Chaff_Magazine"
        };
        removeWeapons[] = {
            "CMFlareLauncher"
        };
        turret[] = {-1};
    };
};

// A-143 Buzzard (CAS)
class Buzzard_CAS: Fixed_Wing {
    flares[] = WL_FLARE_MAIN_COMBAT;
    hasHMD = 1;
    name = "A-143 Buzzard (CAS)";
    nameShort = "BUZZARD";
    rearm = 420;
    spawn = "I_Plane_Fighter_03_dynamicLoadout_F";

    class Pilot: WLTurretDefaults {
        removeMagazines[] = {
            "120Rnd_CMFlare_Chaff_Magazine"
        };
        removeWeapons[] = {
            "CMFlareLauncher"
        };
        turret[] = {-1};
    };
};
class O_Buzzard_CAS: Buzzard_CAS {
    allowPylonMagazines[] = {
        "PylonRack_12Rnd_PGM_missiles",
        {"PylonMissile_1Rnd_Mk82_F", {"Pylons4"}},
        {"PylonRack_1Rnd_Missile_AGM_02_F", {"Pylons2", "Pylons3", "Pylons5", "Pylons6"}},
        {"PylonRack_3Rnd_Missile_AGM_02_F", {"Pylons3", "Pylons5"}},
        "PylonRadarPod_01_F",
        "PylonCameraPod_01_F"
    };
    ammoOverrides[] = {
        {"Bo_Mk82", {"Bomb_04_PR_F", "STR_WL_ammoKab250LPBunker"}},
        {"Missile_AGM_02_F", {"Missile_AGM_02_Laser_F", "STR_WL_ammoKh29LLaser"}}
    };
    cost = 13000;
    description = "$STR_WL_descBuzzardCAS";
    disallowMagazines[] = {
        "PylonRack_Missile_AGM_02_x1",
        "PylonRack_Missile_AGM_02_x2"
    };
    side[] = {"east"};
    textures[] = {
        "\a3\Air_F_Gamma\Plane_Fighter_03\Data\Plane_Fighter_03_body_1_brownhex_CO.paa",
        "\a3\Air_F_Gamma\Plane_Fighter_03\Data\Plane_Fighter_03_body_2_brownhex_CO.paa"
    };
};

class I_Buzzard_CAS: Buzzard_CAS {
    aircraftSpawn = 1;
    cost = 8000;
    side[] = {"guer"};
};

// To-199 Neophron (CAS)
class O_Plane_CAS_02_dynamicLoadout_F: Fixed_Wing {
    allowPylonMagazines[] = {
        "PylonRack_12Rnd_PG_missiles",
        "PylonRack_12Rnd_PGM_missiles",
        {"PylonMissile_1Rnd_Mk82_F", {"Pylons4", "Pylons5", "Pylons6", "Pylons7"}},
        {"PylonMissile_Missile_AA_R73_x1", {"Pylons1", "Pylons10"}},
        {"PylonMissile_Missile_AA_R77_x1", {"Pylons1", "Pylons10"}},
        {"PylonRack_Bomb_SDB_x4", {"Pylons5", "Pylons6"}},
        "PylonRack_1Rnd_Missile_AGM_02_F",
        "PylonRack_3Rnd_Missile_AGM_02_F"
    };
    ammoOverrides[] = {
        {"Bo_Mk82", {"Bomb_04_PR_F", "STR_WL_ammoKab250LPBunker"}},
        {"Missile_AGM_02_F", {"Missile_AGM_02_Laser_F", "STR_WL_ammoKh29LLaser"}}
    };
    cost = 16000;
    flares[] = WL_FLARE_MAIN_COMBAT;
    hasHMD = 1;
    nameShort = "NEO";
    rearm = 420;
    side[] = {"east"};

    class Pilot: WLTurretDefaults {
        removeMagazines[] = {
            "120Rnd_CMFlare_Chaff_Magazine"
        };
        removeWeapons[] = {
            "CMFlareLauncher"
        };
        turret[] = {-1};
    };
};

// A-149 Gryphon (Interceptor)
class Gryphon: Fixed_Wing {
    allowPylonMagazines[] = {
        "PylonRack_Missile_AMRAAM_C_x2",
        "PylonMissile_Bomb_GBU12_x1",
        {"PylonRack_Bomb_GBU12_x2", {"pylon3", "Pylon4", "pylon5", "Pylon6"}},
        "PylonRack_1Rnd_Missile_AGM_02_F",
        {"PylonRack_3Rnd_Missile_AGM_02_F", {"pylon5", "Pylon6"}},
        "PylonRack_Missile_HARM_x1",
        "PylonRack_3Rnd_LG_scalpel",
        {"PylonRack_Bomb_SDB_x4", {"pylon5", "Pylon6"}},
        "PylonRadarPod_01_F",
        "PylonCameraPod_01_F"
    };
    ammoOverrides[] = {
        {"Bomb_04_F", {"ammo_gbu12_gps", "STR_WL_ammoGbu12Gps"}},
        {"Missile_AGM_02_F", {"Missile_AGM_02_Laser_F", "STR_WL_ammoMaverickLaser"}}
    };
    disallowMagazines[] = {
        "PylonRack_Missile_AGM_02_x1",
        "PylonRack_Missile_AGM_02_x2"
    };
    flares[] = WL_FLARE_ADVANCED_COMBAT;
    hasHMD = 1;
    name = "A-149 Gryphon";
    nameShort = "GRYPHON";
    rearm = 420;
    spawn = "I_Plane_Fighter_04_F";

    class Pilot: WLTurretDefaults {
        removeMagazines[] = {
            "240Rnd_CMFlare_Chaff_Magazine"
        };
        removeWeapons[] = {
            "CMFlareLauncher"
        };
        turret[] = {-1};
    };
};

class I_Gryphon: Gryphon {
    aircraftSpawn = 1;
    cost = 12000;
};

class B_Gryphon: Gryphon {
    cost = 15000;
    description = "STR_WL_descGryphon";
    side[] = {"west"};
    spawn = "I_Plane_Fighter_04_F";
    textures[] = {
        "a3\air_f_jets\plane_fighter_04\data\Fighter_04_fuselage_01_gray_co.paa",
        "a3\air_f_jets\plane_fighter_04\data\Fighter_04_fuselage_02_gray_co.paa",
        "a3\air_f_jets\plane_fighter_04\data\fighter_04_misc_01_co.paa",
        "a3\air_f_jets\plane_fighter_04\data\Numbers\Fighter_04_number_04_ca.paa",
        "a3\air_f_jets\plane_fighter_04\data\Numbers\Fighter_04_number_04_ca.paa",
        "a3\air_f_jets\plane_fighter_04\data\Numbers\Fighter_04_number_08_ca.paa"
    };
};

class B_Strike_Wasp: Fixed_Wing {
    allowPylonMagazines[] = {
        "PylonRack_12Rnd_PG_missiles",
        "PylonRack_12Rnd_PGM_missiles",
        "PylonRack_4Rnd_LG_scalpel",
        {"PylonRack_3Rnd_Missile_AGM_02_F", {"pylonBayCenter3", "pylonBayCenter4", "pylonBayCenter5", "pylonBayCenter6"}},
        {"PylonMissile_1Rnd_Bomb_03_F", {"pylonBayCenter3", "pylonBayCenter4", "pylonBayCenter5", "pylonBayCenter6"}}
    };
    ammoOverrides[] = {
        {"Bomb_03_F", {"Bomb_03_BLU_F", "STR_WL_ammoBlu12Bunker"}},
        {"Missile_AGM_02_F", {"Missile_AGM_02_Laser_F", "STR_WL_ammoMaverickLaser"}}
    };
    cost = 19000;
    disallowMagazines[] = {
        "PylonMissile_Missile_AMRAAM_D_x1",
        "PylonRack_Missile_AMRAAM_D_x1",
        "PylonRack_Missile_AMRAAM_D_x2"
    };
    flares[] = WL_FLARE_ADVANCED_COMBAT;
    hasHMD = 1;
    name = "A-181 Strike Wasp";
    nameShort = "STRIKE WASP";
    rearm = 420;
    side[] = {"west"};
    spawn = "B_Plane_Fighter_01_F";
    variant = 1;

    class Pilot: WLTurretDefaults {
        removeMagazines[] = {
            "240Rnd_CMFlare_Chaff_Magazine"
        };
        removeWeapons[] = {
            "CMFlareLauncher_Singles"
        };
        turret[] = {-1};
    };
};

class B_Growler: Fixed_Wing {
    airRadar = 12000;
    allowPylonMagazines[] = {
        "PylonRack_Missile_AMRAAM_C_x1",
        "PylonRack_Missile_AMRAAM_D_x2",
        "PylonRack_Missile_HARM_x1",
        "PylonRack_4Rnd_LG_scalpel"
    };
    ammoOverrides[] = {
        {"M_Scalpel_AT", {"M_Sidearm", "AGM-122 Sidearm"}},
        {"ammo_Missile_AMRAAM_C", {"ammo_Missile_malice", "AIM-424 Malice"}}
    };
    cost = 19000;
    disallowMagazines[] = {
        "PylonRack_Bomb_SDB_x4",
        "PylonRack_Bomb_GBU12_x2",
        "PylonMissile_Missile_BIM9X_x1",
        "PylonMissile_Bomb_GBU12_x1",
        "PylonRack_Missile_AGM_02_x1",
        "PylonRack_Missile_AGM_02_x2"
    };
    flares[] = WL_FLARE_GROWLER;
    hasHMD = 1;
    name = "EF/A-181 Growler";
    nameShort = "GROWLER";
    rearm = 420;
    side[] = {};
    spawn = "B_Plane_Fighter_01_F";
    threatDetection = 20000;

    class Pilot: WLTurretDefaults {
        removeMagazines[] = {
            "240Rnd_CMFlare_Chaff_Magazine"
        };
        removeWeapons[] = {
            "CMFlareLauncher_Singles"
        };
        turret[] = {-1};
    };
};

// To-201 Shikra
class O_Plane_Fighter_02_F: Fixed_Wing {
    allowPylonMagazines[] = {
        {"PylonMissile_Missile_KH58_x1", {"pylons1", "pylons2", "pylons3", "pylons4", "pylons5", "pylons6"}},
        {"PylonRack_Bomb_SDB_x4", {"pylonBayCenter2", "pylonBayCenter3"}}
    };
    cost = 25000;
    disallowMagazines[] = {
        "PylonMissile_Missile_KH58_INT_x1"
    };
    flares[] = WL_FLARE_TOP_FIGHTER;
    hasHMD = 1;
    nameShort = "SHIKRA";
    rearm = 420;
    side[] = {"east"};
    threatDetection = 16000;

    class Pilot: WLTurretDefaults {
        removeMagazines[] = {
            "240Rnd_CMFlare_Chaff_Magazine"
        };
        removeWeapons[] = {
            "CMFlareLauncher"
        };
        turret[] = {-1};
    };
};

// F/A-181 Black Wasp II
class B_Plane_Fighter_01_F: Fixed_Wing {
    allowPylonMagazines[] = {
        {"PylonRack_Missile_HARM_x1", {"pylon1", "pylon2"}},
        {"PylonRack_Bomb_SDB_x4", {"pylonBayCenter2"}}
    };
    cost = 26000;
    flares[] = WL_FLARE_TOP_FIGHTER;
    hasHMD = 1;
    nameShort = "WASP";
    rearm = 420;
    side[] = {"west"};
    threatDetection = 12000;

    class Pilot: WLTurretDefaults {
        removeMagazines[] = {
            "240Rnd_CMFlare_Chaff_Magazine"
        };
        removeWeapons[] = {
            "CMFlareLauncher_Singles"
        };
        turret[] = {-1};
    };
};

class B_Plane_Fighter_01_Stealth_F: Fixed_Wing {
    allowPylonMagazines[] = {
        {"PylonRack_Missile_HARM_x1", {"pylonBayLeft1", "pylonBayRight1"}},
        {"PylonRack_Bomb_SDB_x4", {"pylonBayCenter2"}},
        {"PylonRack_4Rnd_LG_scalpel", {"pylonBayCenter1", "pylonBayCenter3", "pylonBayCenter4"}},
        {"PylonRack_Missile_AMRAAM_D_x2", {"pylonBayCenter5", "pylonBayCenter6"}}
    };
    ammoOverrides[] = {
        {"Bomb_04_F", {"ammo_gbu12_gps", "STR_WL_ammoGbu12Gps"}},
        {"ammo_Bomb_SDB", {"ammo_stormbreaker", "GBU-58 Stormbreaker"}},
        {"M_Scalpel_AT", {"M_Sidearm", "AGM-122 Sidearm"}}
    };
    cost = 28000;
    flares[] = WL_FLARE_TOP_FIGHTER;
    hasHMD = 1;
    hasReconOptics = 1;
    name = "STR_WL_assetWaspStealth";
    nameShort = "STR_WL_assetWaspStealthShort";
    rearm = 420;
    side[] = {"west"};
    variant = 1;

    class Pilot: WLTurretDefaults {
        removeMagazines[] = {
            "240Rnd_CMFlare_Chaff_Magazine"
        };
        removeWeapons[] = {
            "CMFlareLauncher_Singles"
        };
        turret[] = {-1};
    };
};

class O_Plane_Fighter_02_Stealth_F: Fixed_Wing {
    allowPylonMagazines[] = {
        {"PylonMissile_Missile_AA_R77_INT_x1", {"pylonBayLeft1", "pylonBayRight1"}},
        {"PylonMissile_Bomb_KAB250_x1", {"pylonBayCenter1", "pylonBayCenter2", "pylonBayCenter3", "pylonBayLeft2", "pylonBayRight2"}},
        {"PylonMissile_Missile_KH58_x1", {"pylonBayLeft1", "pylonBayRight1"}},
        {"PylonRack_Bomb_SDB_x4", {"pylonBayCenter1", "pylonBayCenter2", "pylonBayLeft2", "pylonBayRight2"}},
        {"PylonRack_4Rnd_LG_scalpel", {"pylonBayCenter1", "pylonBayCenter2", "pylonBayCenter3", "pylonBayLeft2", "pylonBayRight2"}}
    };
    ammoOverrides[] = {
        {"ammo_Bomb_SDB", {"ammo_upmk_d30", "STR_WL_ammoUpmkGps"}},
        {"Bomb_03_F", {"ammo_kab250se", "STR_WL_ammoKab250SeGps"}},
        {"M_Scalpel_AT", {"M_Sidearm", "Kh-31P ARM"}}
    };
    cost = 28000;
    description = "STR_WL_descShikraStealth";
    disallowMagazines[] = {
        "PylonMissile_Missile_KH58_INT_x1"
    };
    flares[] = WL_FLARE_TOP_FIGHTER;
    hasHMD = 1;
    hasReconOptics = 1;
    name = "STR_WL_assetShikraStealth";
    nameShort = "STR_WL_assetShikraStealthShort";
    rearm = 420;
    side[] = {"east"};
    threatDetection = 8000;
    variant = 1;

    class Pilot: WLTurretDefaults {
        removeMagazines[] = {
            "240Rnd_CMFlare_Chaff_Magazine"
        };
        removeWeapons[] = {
            "CMFlareLauncher"
        };
        turret[] = {-1};
    };
};