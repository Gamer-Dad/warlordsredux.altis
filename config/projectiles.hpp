// APS projectile block lists (heavy contains everything medium, medium contains everything light)

class WLProjectile {
    ammo[] = {};
    aps[] = {};
    camera = 0;
    consumption = 0;
    sam = 0;
    sead = 0;
};

class WLProjectilesConfig {
    class WLProjectiles_SDB: WLProjectile {
        ammo[] = {
            "ammo_Bomb_SDB"                     // SDB
        };
        camera = 1;
    };

    class WLProjectile_SAM: WLProjectile {
        ammo[] = {
            "ammo_Missile_rim116",              // Spartan
            "M_70mm_SAAMI"                      // SAAMI
        };
        camera = 1;
        immunity = 3000;
        sam = 0.6;
        speed = 2;
    };

    class WLProjectile_Centurion: WLProjectile {
        ammo[] = {
            "ammo_Missile_rim162"               // Centurion
        };
        camera = 1;
        immunity = 3500;
        sam = 1;
        speed = 1.1;
    };

    class WLProjectile_ManSAM: WLProjectile {
        ammo[] = {
            "ammo_Missile_sosna",               // Sosna
            "ammo_Missile_starstreak"           // Starstreak
        };
        camera = 1;
        manualSam[] = {500, 5000, 6000, 25, 0.5};
    };

    class WLProjectile_ManSAMUpgraded: WLProjectile {
        ammo[] = {
            "ammo_Missile_starstreak2"          // Starstreak Mark II
        };
        camera = 1;
        manualSam[] = {1000, 2500, 12000, 25, 0.8};
    };

    class WLProjectile_VLRSAM: WLProjectile {
        ammo[] = {
            "ammo_Missile_tianlong"             // Tianlong
        };
        camera = 1;
        manualSam[] = {1250, 500, 18000, 25, 1.0};
    };

    class WLProjectile_LRSAM: WLProjectile {
        ammo[] = {
            "ammo_Missile_s750",                // Rhea
            "ammo_Missile_mim145"               // Defender
        };
        camera = 1;
        immunity = 3800;
        sam = 1;
        speed = 1.1;
    };

    class WLProjectile_A2A: WLProjectile {
        ammo[] = {
            "ammo_Missile_AMRAAM_C",            // AMRAAM C
            "ammo_Missile_AMRAAM_D",            // AMRAAM D
            "ammo_Missile_AA_R77"               // R-77
        };
        camera = 1;
        immunity = 4000;
        loal = 1;
        sam = 1;
        speed = 3;
    };

    class WLProjectile_MANPADS: WLProjectile {
        ammo[] = {
            "M_Titan_AA",                       // Titan AA
            "M_Titan_AA_static",                // Titan AA (Static)
            "M_Titan_AA_long"                   // Titan AA (Long)
        };
        camera = 1;
        immunity = 100;
        sam = 0.4;
        speed = 0.4;
    };

    class WLProjectile_A2AGround: WLProjectile {
        ammo[] = {
            "M_Zephyr_SAM",                     // Zephyr (SAM)
            "ammo_Missile_AMRAAM_ground",
            "ammo_Missile_AA_R77_ground"
        };
        camera = 1;
        immunity = 2000;
        sam = 0.8;
        speed = 0.8;
    };

    class WLProjectile_A2ANoLoal: WLProjectile {
        ammo[] = {
            "M_Zephyr"                          // Zephyr
        };
        camera = 1;
        immunity = 1500;
        sam = 1;
        speed = 3;
    };

    class WLProjectile_A2AInfrared: WLProjectile {
        ammo[] = {
            "ammo_Missile_AA_R73",              // R-73
            "ammo_Missile_BIM9X",               // BIM-9X
            "M_Air_AA",                         // ASRAAM
            "Missile_AA_03_F"                   // Sahr-3
        };
        immunity = 1500;
        sam = 0.6;
        speed = 2;
    };

    class WLProjectile_AntiShip: WLProjectile {
        ammo[] = {
            "M_Harpoon",                        // Harpoon
            "M_Silkworm"                        // Silkworm
        };
        bunker = 13;
        speed = 450;
        tv = 1;
    };

    class WLProjectile_SEAD: WLProjectile {
        ammo[] = {
            "ammo_Missile_HARM",                // AGM-88 HARM
            "ammo_Missile_KH58"                 // Kh-58
        };
        aps[] = {2, 3};
        camera = 1;
        consumption = 25;
        sead = 1;
    };

    class WLProjectile_LightSEAD: WLProjectile {
        ammo[] = {
            "M_Sidearm"                         // AGM-122 Sidearm
        };
        aps[] = {2, 3, 4};
        camera = 1;
        consumption = 13;
        sead = 1;
    };

    class WLProjectile_TVGuided: WLProjectile {
        ammo[] = {
            "M_Lancet",
            "M_Switchblade"
        };
        aps[] = {1, 2, 3};
        consumption = 1;
        speed = 300;
        tv = 1;
    };

    class WLProjectile_BunkerBuster: WLProjectile {
        ammo[] = {
            "Bomb_03_BLU_F",
            "Bomb_04_PR_F"
        };
        camera = 1;
        bunker = 8;
        remote = 1;
    };

    class WLProjectile_DumbBunkerBuster: WLProjectile {
        ammo[] = {
            "Bomb_03_BLU_F",
            "Bomb_04_PR_F"
        };
        camera = 1;
        bunker = 8;
        remote = 1;
    };

    class WLProjectile_NonRunwayBomb: WLProjectile {
        ammo[] = {
            "Bo_Mk82_norunway"
        };
        bunker = 4;
    };

    class WLProjectile_RunwayBomb: WLProjectile {
        ammo[] = {
            "Bo_Mk82"
        };
        camera = 1;
        runway = 8;
    };

    class WLProjectile_RunwayRocket: WLProjectile {
        ammo[] = {
            "Rocket_03_HE_F",                   // Tratnyr HE
            "Rocket_04_HE_F"                    // Shrieker HE
        };
        runway = 1;
    };

    class WLProjectile_TVGuidedHeavy: WLProjectile {
        ammo[] = {
            "M_Spike",
            "M_HJ12"
        };
        aps[] = {1, 2, 3, 4};
        consumption = 2;
        speed = 100;
        tv = 1;
    };

    class WLProjectile_TVGuidedBomb: WLProjectile {
        ammo[] = {
            "ammo_gbu15",
            "ammo_kab250kr"
        };
        camera = 1;
        remote = 1;
    };

    class WLProjectile_TVGuidedBombRoot: WLProjectile {
        ammo[] = {
            "Missile_AGM_02_TV_F"
        };
    };

    class WLProjectile_LaserGuidedBomb: WLProjectile {
        ammo[] = {
            "Missile_AGM_02_Laser_F"
        };
        aps[] = {2, 3, 5};
        camera = 1;
        consumption = 3;
        laser = 1;
    };

    class WLProjectile_SmartMineAT: WLProjectile {
        ammo[] = {
            "ammo_SmartMineAT"
        };
        aps[] = {2, 3, 4, 5};
        consumption = 1;
    };

    class WLProjectile_SmartMineAP: WLProjectile {
        ammo[] = {
            "ammo_SmartMineAP"
        };
        aps[] = {4};
        consumption = 1;
    };

    class WLProjectile_GPSGuidedBomb: WLProjectile {
        ammo[] = {
            "ammo_stormbreaker",
            "ammo_upmk_d30"
        };
        aps[] = {5};
        camera = 1;
        consumption = 9;
        gps = 1;
    };

    class WLProjectile_GPSGuidedBombHeavy: WLProjectile {
        ammo[] = {
            "ammo_gbu12_gps",
            "ammo_kab250se"
        };
        camera = 1;
        gps = 1;
    };

    class WLProjectile_APKWS: WLProjectile {
        ammo[] = {
            "M_APKWS"
        };
        aps[] = {2, 3, 4, 5};
        consumption = 1;
        laser = 1;
    };

    class WLProjectile_TVGuidedArtillery: WLProjectile {
        ammo[] = {
            "M_Excalibur",
            "M_Krasnopol"
        };
        aps[] = {1, 2, 3};
        consumption = 6;
        terminal = 1;
    };

    class WLProjectile_DroneDeployer: WLProjectile {
        ammo[] = {
            "M_DroneDeployer"
        };
        deployDrone = 1;
    };

    class WLProjectile_MineLayer: WLProjectile {
        ammo[] = {
            "M_MineLayer"
        };
        mineLayer = "AT_DeployedMinefield";
    };

    class WLProjectile_MineLayerSmall: WLProjectile {
        ammo[] = {
            "M_MineLayerSmall"
        };
        mineLayer = "AT_DeployedMinefieldSmall";
    };

    class WLProjectile_MineLayerDense: WLProjectile {
        ammo[] = {
            "M_MineLayerDense"
        };
        mineLayer = "AT_DeployedMinefieldDense";
    };

    class WLProjectile_SupplyLayer: WLProjectile {
        ammo[] = {
            "M_SupplyLayer"
        };
        mineLayer = "Land_Cargo10_military_green_F";
    };

    class WLProjectile_RallyLayer: WLProjectile {
        ammo[] = {
            "M_RallyDeployer_O"
        };
        mineLayer = "Land_MedicalTent_01_CSAT_brownhex_generic_open_F";
    };

    class WLProjectile_ExtendedSAM: WLProjectile {
        ammo[] = {
            "M_SM6",
            "M_HHQ9"
        };
        camera = 1;
        esam = 1;
    };

    class WLProjectile_AdvancedSAM: WLProjectile {
        ammo[] = {
            "M_RIM116B"
        };
        asam = 1;
        camera = 1;
        speed = 1.5;
    };

    class WLProjectile_MediumGuided: WLProjectile {
        ammo[] = {
            "M_Titan_AT_long",                  // Titan AT (Vehicle)

            "M_PG_AT",                          // DAGR
            "M_PGM_AT",                         // DAGR-M
            "M_Scalpel_AT",                     // Scalpel
            "M_Scalpel_AT_hidden",              // Scalpel

            "M_NLAW_AT_F",                      // NLAW
            "M_Titan_AP",                       // Titan AP
            "M_Titan_AT",                       // Titan AT
            "M_Titan_AT_static",                // Titan AT (Static)
            "M_Vorona_HE",                      // Vorona HE
            "M_Vorona_HEAT"                     // Vorona HEAT
        };
        aps[] = {2, 3, 4, 5};
        consumption = 1;
    };

    class WLProjectile_CannonLaunchedLG: WLProjectile {
        ammo[] = {
            "M_120mm_cannon_ATGM_LG"            // 120mm Cannon ATGM (Laser Guided)
        };
        aps[] = {2, 3, 4, 5};
        camera = 1;
        consumption = 1;
    };

    class WLProjectile_CannonLaunched: WLProjectile {
        ammo[] = {
            "M_120mm_cannon_ATGM",              // 120mm Cannon ATGM
            "M_125mm_cannon_ATGM"               // 125mm Cannon ATGM
        };
        aps[] = {5};
        consumption = 8;
    };

    class WLProjectile_DoubleGuided: WLProjectile {
        ammo[] = {
            "M_127mm_Firefist_AT",              // Firefist AT

            "M_Jian_AT",                        // Jian - Max loadout: 4
            "Missile_AGM_02_F"                  // Macer I && II (same mag) - Max loadout: 20
        };
        aps[] = {2, 3, 4, 5};
        camera = 1;
        consumption = 2;
    };

    class WLProjectile_TripleGuided: WLProjectile {
        ammo[] = {
            "Missile_AGM_01_F"                 // Sharur && KH25 - Max loadout: 8
        };
        aps[] = {2, 3, 4, 5};
        consumption = 3;
    };

    class WLProjectile_TandemWired: WLProjectile {
        ammo[] = {
            "M_Vorona_HEAT_Tandem"
        };
        aps[] = {2, 3, 5};
        consumption = 3;
    };

    class WLProjectile_LightUnguided: WLProjectile {
        ammo[] = {
            "R_MRAAWS_HE_F",                    // MAAWS HE
            "R_MRAAWS_HEAT_F",                  // MAAWS HEAT
            "R_MRAAWS_HEAT55_F",                // MAAWS HEAT55
            "R_PG32V_F",                        // RPG-42 AT
            "R_PG7_F",                          // RPG-7 HEAT
            "R_TBG32V_F"                        // RPG-42 HE
        };
        aps[] = {1, 2, 3, 5};
        consumption = 1;
    };

    class WLProjectile_MediumUnguided: WLProjectile {
        ammo[] = {
            "M_SPG9_HE",                        // SPG-9 HE
            "M_SPG9_HEAT",                      // SPG-9 HEAT

            "M_AT",                             // DAR
            "R_80mm_HE",                        // Skyfire
            "Rocket_03_AP_F",                   // Tratnyr AP
            "Rocket_04_AP_F"                    // Shrieker AP
        };
        aps[] = {1, 2, 3, 5};
        consumption = 1;
    };

    class WLProjectile_Incendiary: WLProjectile {
        ammo[] = {
            "82mm_Incendiary",
            "R_Incendiary"
        };
        incendiary = 1;
    };

    class WLProjectile_Mines: WLProjectile {
        ammo[] = {
            "APERSBoundingMine_Range_Ammo",
            "APERSMine_Range_Ammo",
            "APERSMineDispenser_Ammo",
            "APERSMineDispenser_Mine_Ammo",
            "APERSTripMine_Wire_Ammo",
            "ATMine_Range_Ammo",
            "ClaymoreDirectionalMine_Remote_Ammo",
            "SLAMDirectionalMine_Wire_Ammo"
        };
        mine = 1;
    };

    class WLProjectile_Explosive: WLProjectile {
        ammo[] = {
            "DemoCharge_Remote_Ammo",
            "SatchelCharge_Remote_Ammo"
        };
        explosive = 1;
        mine = 1;
        bunker = 2;
    };

    class WLProjectile_Shell: WLProjectile {
        ammo[] = {
            "Sh_140mm_APFSDS"
        };
        shell = "M_125mm_cannon_ATGM";
    };

    class WLProjectile_Railgun: WLProjectile {
        ammo[] = {
            "Sh_75mm_Railgun_APFSDS"
        };
        shell = "R_80mm_HE";
    };
};