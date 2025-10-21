class HeavyVehicles {
    class B_APC_Tracked_01_rcws_F {
        aps = 2;
        capValue = 3;
        cost = 1300;
        isLight = 1;
        loadable[] = {0, -1.5, 1.2};
        rearm = 180;

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
            turret[] = { 0 };
        };
    }; // "IFV-6c Panther"

    class B_LT_01_AT_F {
        aps = 1;
        capValue = 3;
        cost = 1500;
        loadable[] = {0, -1.5, 1.2};
        name = "AWC Nyx (AT)";
        rearm = 180;
        spawn = "I_LT_01_AT_F";
        textures[] = {
            "A3\armor_f_tank\lt_01\data\lt_01_main_olive_co.paa",
            "A3\armor_f_tank\lt_01\data\lt_01_at_olive_co.paa",
            "a3\Armor_F\Data\camonet_NATO_Desert_CO.paa",
            "A3\Armor_F_Tank\AFV_Wheeled_01\Data\afv_wheeled_01_EXT3_sand_CO.paa"
        };

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "2Rnd_127mm_Firefist_missiles",
                "2Rnd_127mm_Firefist_missiles",
                "2Rnd_127mm_Firefist_missiles",
                "2Rnd_127mm_Firefist_missiles",
                "2Rnd_127mm_Firefist_missiles"
            };
            turret[] = { 0 };
        };
    };

    class B_APC_Tracked_01_CRV_F {
        aps = 2;
        capValue = 2;
        cost = 1700;
        rearm = 180;
    }; // "CRV-6e Bobcat"

    class B_APC_Wheeled_01_light_F {
        aps = 2;
        capValue = 2;
        cost = 1700;
        description = "AMV-7 Marshall Light is a lighter, faster variant of the AMV-7 Marshall with a weaker armament.";
        isLight = 1;
        loadable[] = {0, -0.8, 1.7};
        name = "AMV-7 Marshall Light";
        rearm = 180;
        spawn = "B_APC_Wheeled_01_cannon_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "500Rnd_127x99_mag",
                "500Rnd_127x99_mag",
                "500Rnd_127x99_mag",
                "500Rnd_127x99_mag"
            };
            addWeapons[] = {
                "HMG_127_MBT"
            };
            removeMagazines[] = {
                "40Rnd_40mm_APFSDS_Tracer_Red_shells",
                "60Rnd_40mm_GPR_Tracer_Red_shells"
            };
            removeWeapons[] = {
                "LMG_coax",
                "autocannon_40mm_CTWS"
            };
            turret[] = { 0 };
        };
    };

    class B_APC_Wheeled_01_recon_F {
        aps = 4;
        capValue = 1;
        cost = 2200;
        description = "AMV-7 Marshall (Recon) is a variant of the AMV-7 Marshall armed with a powerful scanner.";
        isLight = 1;
        loadable[] = {0, -0.8, 1.7};
        hasHMD = 1;
        hasScanner = 1;
        name = "AMV-7 Marshall (Recon)";
        rearm = 120;
        spawn = "B_APC_Wheeled_01_cannon_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {};
            addWeapons[] = {};
            hideTurret = 1;
            removeMagazines[] = {
                "200Rnd_762x51_Belt_Red",
                "40Rnd_40mm_APFSDS_Tracer_Red_shells",
                "60Rnd_40mm_GPR_Tracer_Red_shells"
            };
            removeWeapons[] = {
                "LMG_coax",
                "autocannon_40mm_CTWS"
            };
            turret[] = { 0 };
        };
    };

    class B_APC_tracked_03_cannon_F {
        aps = 3;
        capValue = 4;
        cost = 2500;
        name = "FV-720 Mora";
        rearm = 180;
        spawn = "I_APC_tracked_03_cannon_F";
        textures[] = {
            "A3\Armor_F_Enoch\apc_tracked_03\data\apc_tracked_03_ext_eaf_co.paa",
            "A3\Armor_F_Enoch\apc_tracked_03\data\apc_tracked_03_ext2_eaf_co.paa",
            "A3\Armor_F_Enoch\apc_tracked_03\Data\camonet_EAF_green_CO.paa",
            "A3\Armor_F_Enoch\apc_tracked_03\data\cage_EAF_CO.paa"
        };
    };

    class B_APC_Wheeled_01_cannon_F {
        aps = 2;
        capValue = 3;
        cost = 2700;
        rearm = 180;
    }; // "AMV-7 Marshall"

    class B_APC_Wheeled_03_cannon_F {
        aps = 2;
        capValue = 3;
        cost = 2900;
        disallowMagazines[] = {
            "4Rnd_GAA_missiles"
        };
        rearm = 180;
        textures[] = {
            "\A3\armor_f_gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext_co.paa",
            "\A3\armor_f_gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext2_co.paa",
            "\A3\armor_f_gamma\APC_Wheeled_03\Data\rcws30_co.paa",
            "\A3\armor_f_gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext_alpha_co.paa"
        };

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
            turret[] = { 0 };
        };
    }; // "AFV-4 Gorgon"

    class B_APC_Wheeled_01_cannon_up_F {
        aps = 2;
        capValue = 3;
        cost = 3200;
        description = "AMV-7 Marshall UP is a variant of the AMV-7 Marshall armed with a larger magazine 40mm cannon.";
        name = "AMV-7 Marshall UP";
        rearm = 180;
        spawn = "B_APC_Wheeled_01_cannon_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "240Rnd_40mm_GPR_Tracer_Red_shells",
                "240Rnd_40mm_GPR_Tracer_Red_shells",
                "160Rnd_40mm_APFSDS_Tracer_Red_shells",
                "160Rnd_40mm_APFSDS_Tracer_Red_shells"
            };
            addWeapons[] = {
                "autocannon_40mm_VTOL_01",
                "LMG_coax"
            };
            removeMagazines[] = {
                "60Rnd_40mm_GPR_Tracer_Red_shells",
                "40Rnd_40mm_APFSDS_Tracer_Red_shells"
            };
            removeWeapons[] = {
                "autocannon_40mm_CTWS",
                "LMG_coax"
            };
            turret[] = { 0 };
        };
    };

    // class B_AFV_Wheeled_01_export_cannon_F {
    //     aps = 2;
    //     capValue = 4;
    //     cost = 3700;
    //     description = "Rhino MGS-E is a variant of the Rhino MGS armed with a weaker 105mm cannon.";
    //     name = "Rhino MGS-E";
    //     rearm = 500;
    //     requirements[] = {};
    //     spawn = "B_AFV_Wheeled_01_up_cannon_F";
    //     variant = 1;

    //     class Gunner: WLTurretDefaults {
    //         addMagazines[] = {
    //             "40Rnd_105mm_APFSDS_T_Red"
    //         };
    //         addWeapons[] = {
    //             "cannon_105mm"
    //         };
    //         removeMagazines[] = {
    //             "12Rnd_120mm_APFSDS_shells_Tracer_Red",
    //             "8Rnd_120mm_HE_shells_Tracer_Red",
    //             "8Rnd_120mm_HEAT_MP_T_Red",
    //             "4Rnd_120mm_LG_cannon_missiles"
    //         };
    //         removeWeapons[] = {
    //             "cannon_120mm"
    //         };
    //         turret[] = { 0 };
    //     };
    // };

    // class B_APC_Tracked_01_AT_F {
    //     aps = 2;
    //     capValue = 4;
    //     cost = 4500;
    //     description = "IFV-6d Ocelot is an AT capable variant of IFV-6 chassis";
    //     hasHMD = 1;
    //     name = "IFV-6d Ocelot";
    //     rearm = 240;
    //     spawn = "B_APC_Tracked_01_AA_F";
    //     variant = 1;

    //     class Gunner: WLTurretDefaults {
    //         addMagazines[] = {
    //             "2Rnd_127mm_Firefist_missiles",
    //             "2Rnd_127mm_Firefist_missiles",
    //             "2Rnd_127mm_Firefist_missiles",
    //             "2Rnd_127mm_Firefist_missiles",
    //             "680Rnd_35mm_AA_shells_Tracer_Red"
    //         };
    //         addWeapons[] = {
    //             "autocannon_35mm",
    //             "missiles_Firefist"
    //         };
    //         removeMagazines[] = {
    //             "4Rnd_Titan_long_missiles",
    //             "680Rnd_35mm_AA_shells_Tracer_Red"
    //         };
    //         removeWeapons[] = {
    //             "missiles_titan_AA",
    //             "autocannon_35mm"
    //         };
    //         turret[] = { 0 };
    //     };
    // };

    class B_AFV_Wheeled_01_cannon_F {
        aps = 2;
        capValue = 4;
        cost = 4500;
        isLight = 1;
        rearm = 240;
    }; // "Rhino MGS"

    class B_AFV_Wheeled_01_up_cannon_F {
        aps = 2;
        capValue = 4;
        cost = 5000;
        rearm = 240;

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
            turret[] = { 0 };
        };
    }; // "Rhino MGS UP"

    class B_MBT_01_cannon_F {
        aps = 3;
        capValue = 4;
        cost = 5800;
        disallowMagazines[] = {
            "4Rnd_120mm_LG_cannon_missiles"
        };
        isLight = 1;
        rearm = 300;
    }; // "M2A1 Slammer"

    class B_MBT_01_TUSK_F {
        aps = 3;
        capValue = 4;
        cost = 6200;
        disallowMagazines[] = {
            "4Rnd_120mm_LG_cannon_missiles"
        };
        isLight = 1;
        rearm = 300;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "450Rnd_127x108_Ball",
                "450Rnd_127x108_Ball",
                "450Rnd_127x108_Ball",
                "450Rnd_127x108_Ball"
            };
            addWeapons[] = {
                "HMG_NSVT"
            };
            removeMagazines[] = {
                "200Rnd_762x51_Belt_Red"
            };
            removeWeapons[] = {
                "LMG_coax"
            };
            turret[] = { 0 };
        };
    }; // "M2A1 Slammer UP"

    class B_MBT_03_cannon_F {
        aps = 3;
        capValue = 4;
        cost = 8000;
        disallowMagazines[] = {
            "4Rnd_120mm_LG_cannon_missiles"
        };
        name = "M52 Kuma";
        rearm = 300;
        spawn = "I_MBT_03_cannon_F";
        textures[] = {
            "src\img\camo\kuma01.jpg",
            "src\img\camo\kuma02.jpg",
            "src\img\camo\kuma03.jpg",
            "\a3\Armor_F\Data\camonet_NATO_Desert_CO.paa"
        };
    };

    class B_MBT_01_TUSK2_F {
        aps = 3;
        capValue = 4;
        cost = 8500;
        description = "M2A2 Slammer II is an advanced variant of the M2A1 Slammer armed with an advanced 125mm cannon.";
        disallowMagazines[] = {
            "4Rnd_120mm_LG_cannon_missiles"
        };
        hasHMD = 1;
        isLight = 1;
        name = "M2A2 Slammer II";
        rearm = 300;
        spawn = "B_MBT_01_TUSK_F";
        variant = 1;

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
            turret[] = { 0 };
        };
    };

    // class B_MBT_01_TUSK_Railgun_F {
    //     aps = 3;
    //     capValue = 4;
    //     cost = 13000;
    //     description = "M2X Slammer (Railgun) is a variant of the M2A1 Slammer armed with a railgun.";
    //     name = "M2X Slammer (Railgun)";
    //     rearm = 600;
    //     requirements[] = {};
    //     spawn = "B_MBT_01_TUSK_F";
    //     variant = 1;
    //
    //     class Gunner: WLTurretDefaults {
    //         addMagazines[] = {
    //             "RailGun_01_DummyMagazine",
    //             "60Rnd_75mm_RailGun_APFSDS_mag"
    //         };
    //         addWeapons[] = {
    //             "cannon_railgun",
    //             "cannon_railgun_fake"
    //         };
    //         removeMagazines[] = {
    //             "24Rnd_120mm_APFSDS_shells_Tracer_Red",
    //             "12Rnd_120mm_HE_shells_Tracer_Red",
    //             "12Rnd_120mm_HEAT_MP_T_Red"
    //         };
    //         removeWeapons[] = {
    //             "cannon_120mm"
    //         };
    //         turret[] = { 0 };
    //     };
    // };

    class B_MBT_01_arty_F {
        aps = 1;
        capValue = 4;
        cost = 20000;
        disallowMagazines[] = {
            "2Rnd_155mm_Mo_Cluster",
            "2Rnd_155mm_Mo_Cluster_O"
        };
        rearm = 1800;
    }; // "M4 Scorcher"

    class B_MBT_01_mlrs_F {
        aps = 1;
        capValue = 4;
        cost = 20000;
        disallowMagazines[] = {
            "12Rnd_230mm_rockets_cluster"
        };
        rearm = 1800;
    }; // "M5 Sandstorm MLRS"

    class B_MBT_01_mlrs_sdb_F {
        ammoOverrides[] = {
            {"ammo_Bomb_SDB", {"M_GLSDB", "Ground Launched SDB II"}}
        };
        aps = 1;
        capValue = 4;
        cost = 40000;
        description = "M5A2 Sandstorm II is a variant of the M5 Sandstorm MLRS armed with a launcher for GPS-guided Small Diameter Bombs.";
        name = "M5A2 Sandstorm II";
        rearm = 1800;
        spawn = "B_MBT_01_mlrs_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "PylonRack_Bomb_SDB_x4",
                "PylonRack_Bomb_SDB_x4",
                "PylonRack_Bomb_SDB_x4"
            };
            addWeapons[] = {
                "weapon_SDBLauncher"
            };
            removeMagazines[] = {
                "12Rnd_230mm_rockets"
            };
            removeWeapons[] = {
                "rockets_230mm_GAT"
            };
            turret[] = { 0 };
        };
    };

    // class B_MBT_01_arty_tv_F {
    //     ammoOverrides[] = {
    //         {"Sh_155mm_AMOS_guided", {"M_Excalibur", "Excalibur (Terminal Guidance)"}}
    //     };
    //     aps = 1;
    //     capValue = 4;
    //     cost = 30000;
    //     disallowMagazines[] = {
    //         "32Rnd_155mm_Mo_shells",
    //         "32Rnd_155mm_Mo_shells_O",
    //         "2Rnd_155mm_Mo_LG",
    //         "4Rnd_155mm_Mo_LG",
    //         "6Rnd_155mm_Mo_mine",
    //         "6Rnd_155mm_Mo_AT_mine",
    //         "2Rnd_155mm_Mo_Cluster",
    //         "6Rnd_155mm_Mo_smoke",
    //         "4Rnd_155mm_Mo_LG_O",
    //         "6Rnd_155mm_Mo_mine_O",
    //         "6Rnd_155mm_Mo_AT_mine_O",
    //         "2Rnd_155mm_Mo_Cluster_O",
    //         "6Rnd_155mm_Mo_smoke_O"
    //     };
    //     name = "M4 Scorcher UP";
    //     rearm = 1800;
    //     spawn = "B_MBT_01_arty_F";
    //     variant = 1;

    //     class Gunner: WLTurretDefaults {
    //         addMagazines[] = {
    //             "4Rnd_155mm_Mo_guided",
    //             "4Rnd_155mm_Mo_guided",
    //             "4Rnd_155mm_Mo_guided"
    //         };
    //         removeMagazines[] = {
    //             "32Rnd_155mm_Mo_shells",
    //             "6Rnd_155mm_Mo_smoke",
    //             "2Rnd_155mm_Mo_guided",
    //             "4Rnd_155mm_Mo_guided",
    //             "2Rnd_155mm_Mo_LG",
    //             "6Rnd_155mm_Mo_mine",
    //             "6Rnd_155mm_Mo_AT_mine",
    //             "2Rnd_155mm_Mo_Cluster"
    //         };
    //         turret[] = { 0 };
    //     };
    // };
};