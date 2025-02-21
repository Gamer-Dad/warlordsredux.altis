class HeavyVehicles {
    class B_APC_Tracked_01_rcws_F {
        aps = 2;
        capValue = 3;
        cost = 1300;
        killReward = 300;
        rearm = 400;
        requirements[] = {};

        // class Gunner: WLTurretDefaults {
        //     addMagazines[] = {
        //         "60Rnd_30mm_APFSDS_shells_Tracer_Red",
        //         "60Rnd_30mm_APFSDS_shells_Tracer_Red",
        //         "140Rnd_30mm_MP_shells_Tracer_Red",
        //         "140Rnd_30mm_MP_shells_Tracer_Red"
        //     };
        //     addWeapons[] = {
        //         "autocannon_30mm_CTWS"
        //     };
        //     removeMagazines[] = {
        //         "96Rnd_40mm_G_belt"
        //     };
        //     removeWeapons[] = {
        //         "GMG_40mm"
        //     };
        //     turret[] = { 0 };
        // };
    }; // "IFV-6c Panther"

    class B_APC_Tracked_01_CRV_F {
        aps = 2;
        capValue = 2;
        cost = 1700;
        killReward = 300;
        rearm = 400;
        requirements[] = {};
    }; // "CRV-6e Bobcat"

    class B_APC_tracked_03_cannon_F {
        aps = 2;
        capValue = 4;
        cost = 2500;
        killReward = 400;
        name = "FV-720 Mora";
        rearm = 500;
        requirements[] = {};
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
        killReward = 300;
        rearm = 500;
        requirements[] = {};
    }; // "AMV-7 Marshall"

    class B_APC_Wheeled_01_recon_F {
        aps = 2;
        capValue = 1;
        cost = 2700;
        description = "AMV-7 Marshall (Recon) is a variant of the AMV-7 Marshall armed with a powerful scanner.";
        hasHMD = 1;
        hasScanner = 1;
        killReward = 300;
        name = "AMV-7 Marshall (Recon)";
        rearm = 500;
        requirements[] = {};
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

    class B_APC_Wheeled_03_cannon_F {
        aps = 2;
        capValue = 3;
        cost = 2900;
        disallowMagazines[] = {
            "4Rnd_GAA_missiles"
        };
        killReward = 300;
        rearm = 500;
        requirements[] = {};
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
        killReward = 300;
        name = "AMV-7 Marshall UP";
        rearm = 500;
        requirements[] = {};
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
                "autocannon_40mm_VTOL_01"
            };
            removeMagazines[] = {
                "60Rnd_40mm_GPR_Tracer_Red_shells",
                "40Rnd_40mm_APFSDS_Tracer_Red_shells"
            };
            removeWeapons[] = {
                "autocannon_40mm_CTWS"
            };
            turret[] = { 0 };
        };
    };

    class B_AFV_Wheeled_01_export_cannon_F {
        aps = 2;
        capValue = 4;
        cost = 3700;
        description = "Rhino MGS-E is a variant of the Rhino MGS armed with a weaker 105mm cannon.";
        killReward = 400;
        name = "Rhino MGS-E";
        rearm = 500;
        requirements[] = {};
        spawn = "B_AFV_Wheeled_01_up_cannon_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "40Rnd_105mm_APFSDS_T_Red"
            };
            addWeapons[] = {
                "cannon_105mm"
            };
            removeMagazines[] = {
                "12Rnd_120mm_APFSDS_shells_Tracer_Red",
                "8Rnd_120mm_HE_shells_Tracer_Red",
                "8Rnd_120mm_HEAT_MP_T_Red",
                "4Rnd_120mm_LG_cannon_missiles"
            };
            removeWeapons[] = {
                "cannon_120mm"
            };
            turret[] = { 0 };
        };
    };

    class B_AFV_Wheeled_01_cannon_F {
        aps = 2;
        capValue = 4;
        cost = 4500;
        killReward = 450;
        rearm = 500;
        requirements[] = {};
    }; // "Rhino MGS"

    class B_AFV_Wheeled_01_up_cannon_F {
        aps = 2;
        capValue = 4;
        cost = 5000;
        killReward = 500;
        rearm = 500;
        requirements[] = {};
    }; // "Rhino MGS UP"

    class B_MBT_01_cannon_F {
        aps = 3;
        capValue = 4;
        cost = 5800;
        disallowMagazines[] = {
            "4Rnd_120mm_LG_cannon_missiles"
        };
        killReward = 450;
        rearm = 600;
        requirements[] = {};
    }; // "M2A1 Slammer"

    class B_MBT_01_TUSK_F {
        aps = 3;
        capValue = 4;
        cost = 6500;
        disallowMagazines[] = {
            "4Rnd_120mm_LG_cannon_missiles"
        };
        killReward = 500;
        rearm = 600;
        requirements[] = {};
    }; // "M2A1 Slammer UP"

    class B_MBT_03_cannon_F {
        aps = 3;
        capValue = 4;
        cost = 8000;
        disallowMagazines[] = {
            "4Rnd_120mm_LG_cannon_missiles"
        };
        killReward = 500;
        name = "M52 Kuma";
        rearm = 600;
        requirements[] = {};
        spawn = "I_MBT_03_cannon_F";
        textures[] = {
            "Img\camo\kuma01.jpg",
            "Img\camo\kuma02.jpg",
            "Img\camo\kuma03.jpg",
            "\a3\Armor_F\Data\camonet_NATO_Desert_CO.paa"
        };
    };

    // class B_MBT_01_TUSK_Railgun_F {
    //     aps = 3;
    //     capValue = 4;
    //     cost = 13000;
    //     description = "M2X Slammer (Railgun) is a variant of the M2A1 Slammer armed with a railgun.";
    //     killReward = 550;
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
        killReward = 600;
        rearm = 1800;
        requirements[] = {};
    }; // "M4 Scorcher"

    class B_MBT_01_mlrs_F {
        aps = 1;
        capValue = 4;
        cost = 20000;
        disallowMagazines[] = {
            "12Rnd_230mm_rockets_cluster"
        };
        killReward = 600;
        rearm = 1800;
        requirements[] = {};
    }; // "M5 Sandstorm MLRS"
};