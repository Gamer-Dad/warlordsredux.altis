class HeavyVehicles {
    class O_APC_Wheeled_02_rcws_v2_F {
        aps = 2;
        capValue = 2;
        cost = 1500;
        killReward = 300;
        rearm = 400;
        requirements[] = {};
    }; // "MSE-3 Marid"

    class O_APC_Wheeled_02_rcws_v2_m_F {
        aps = 2;
        capValue = 3;
        cost = 2600;
        description = "MSE-3M Marid is a variant of the MSE-3 Marid armed with a 30mm autocannon.";
        killReward = 300;
        name = "MSE-3M Marid Autocannon";
        rearm = 500;
        requirements[] = {};
        spawn = "O_APC_Wheeled_02_rcws_v2_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "250Rnd_30mm_HE_shells_Tracer_Red",
                "250Rnd_30mm_APDS_shells_Tracer_Red"
            };
            addWeapons[] = {
                "gatling_30mm"
            };
            removeMagazines[] = {
                "96Rnd_40mm_G_belt"
            };
            removeWeapons[] = {
                "GMG_40mm"
            };
            turret[] = { 0 };
        };
    };

    class O_APC_Tracked_02_recon_F {
        aps = 2;
        capValue = 1;
        cost = 2700;
        description = "BTR-K Kamysh (Recon) is a variant of the BTR-K Kamysh armed with a powerful scanner.";
        hasHMD = 1;
        hasScanner = 1;
        killReward = 300;
        name = "BTR-K Kamysh (Recon)";
        rearm = 500;
        requirements[] = {};
        spawn = "O_APC_Tracked_02_cannon_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {};
            addWeapons[] = {};
            hideTurret = 1;
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
            turret[] = { 0 };
        };
    };

    class O_APC_Tracked_02_cannon_F {
        aps = 2;
        capValue = 3;
        cost = 3200;
        disallowMagazines[] = {
            "4Rnd_GAA_missiles"
        };
        killReward = 350;
        rearm = 500;
        requirements[] = {};

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "5Rnd_GAT_missiles",
                "5Rnd_GAT_missiles"
            };
            addWeapons[] = {
                "missiles_titan"
            };
            removeMagazines[] = {
                "2Rnd_GAT_missiles_O"
            };
            removeWeapons[] = {
                "missiles_titan"
            };
            turret[] = { 0 };
        };
    }; // "BTR-K Kamysh"

    // class O_APC_Tracked_02_heavy_F {
    //     aps = 2;
    //     capValue = 3;
    //     cost = 5500;
    //     description = "BMP-K Kamysh is a variant of the BTR-K Kamysh armed with a 105mm cannon.";
    //     disallowMagazines[] = {
    //         "4Rnd_GAA_missiles"
    //     };
    //     killReward = 350;
    //     name = "BMP-K Kamysh";
    //     rearm = 500;
    //     requirements[] = {};
    //     spawn = "O_APC_Tracked_02_cannon_F";
    //     variant = 1;
    //
    //     class Gunner: WLTurretDefaults {
    //         addMagazines[] = {
    //             "5Rnd_GAT_missiles",
    //             "5Rnd_GAT_missiles",
    //             "40Rnd_105mm_APFSDS_T_Red"
    //         };
    //         addWeapons[] = {
    //             "missiles_titan",
    //             "cannon_105mm_VTOL_01"
    //         };
    //         removeMagazines[] = {
    //             "2Rnd_GAT_missiles_O",
    //             "60Rnd_30mm_APFSDS_shells_Tracer_Green",
    //             "140Rnd_30mm_MP_shells_Tracer_Green"
    //         };
    //         removeWeapons[] = {
    //             "missiles_titan",
    //             "autocannon_30mm_CTWS"
    //         };
    //         turret[] = { 0 };
    //     };
    // };

    class O_MBT_02_cannon_export_F {
        aps = 3;
        capValue = 4;
        cost = 5500;
        description = "T-100E Badger is a downgraded export variant of the T-100 Varsuk.";
        killReward = 500;
        name = "T-100E Badger";
        rearm = 600;
        requirements[] = {};
        spawn = "O_MBT_02_cannon_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "40Rnd_105mm_APFSDS"
            };
            addWeapons[] = {
                "cannon_105mm"
            };
            removeMagazines[] = {
                "16Rnd_125mm_APFSDS_T_Green",
                "12Rnd_125mm_HE_T_Green",
                "12Rnd_125mm_HEAT_T_Green"
            };
            removeWeapons[] = {
                "cannon_125mm"
            };
            turret[] = { 0 };
        };
    };

    class O_MBT_02_cannon_F {
        aps = 3;
        capValue = 4;
        cost = 7500;
        killReward = 500;
        rearm = 600;
        requirements[] = {};
    }; // "T-100 Varsuk"

    class O_MBT_04_cannon_F {
        aps = 3;
        capValue = 4;
        cost = 11000;
        killReward = 550;
        rearm = 600;
        requirements[] = {};
    }; // "T-140 Angara"

    class O_MBT_04_command_F {
        aps = 3;
        capValue = 4;
        cost = 13000;
        killReward = 600;
        rearm = 600;
        requirements[] = {};
    }; // "T-140K Angara"

    class O_MBT_04_nato_F {
        aps = 3;
        capValue = 4;
        cost = 13500;
        description = "T-140N Yukon is a variant of the T-140 Angara armed with a NATO 120mm cannon.";
        flagOffset[] = {-0.69, -3.1, 1.8};
        killReward = 800;
        name = "T-140N Yukon";
        rearm = 600;
        requirements[] = {};
        spawn = "O_MBT_04_command_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "4Rnd_120mm_LG_cannon_missiles",
                "4Rnd_120mm_LG_cannon_missiles",
                "4Rnd_120mm_LG_cannon_missiles",
                "4Rnd_120mm_LG_cannon_missiles",
                "4Rnd_120mm_LG_cannon_missiles",
                "4Rnd_120mm_LG_cannon_missiles",
                "4Rnd_120mm_LG_cannon_missiles",
                "4Rnd_120mm_LG_cannon_missiles"
            };
            addWeapons[] = {
                "cannon_120mm"
            };
            removeMagazines[] = {
                "20Rnd_125mm_APFSDS_T_Green",
                "12Rnd_125mm_HEAT_T_Green",
                "12Rnd_125mm_HE_T_Green"
            };
            removeWeapons[] = {
                "cannon_125mm_advanced"
            };
            turret[] = { 0 };
        };
    };

    // class O_MBT_02_railgun_F {
    //     aps = 3;
    //     capValue = 4;
    //     cost = 15000;
    //     killReward = 500;
    //     rearm = 600;
    //     requirements[] = {};
    // }; // "T-100 Futura"

    class I_Truck_02_MRL_F {
        aps = 1;
        capValue = 4;
        cost = 18000;
        disallowMagazines[] = {
            "12Rnd_230mm_rockets_cluster"
        };
        killReward = 600;
        rearm = 1800;
        requirements[] = {};
        textures[] = {
            "\A3\soft_f_beta\Truck_02\Data\Truck_02_kab_opfor_co.paa",
            "\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa",
            "\a3\soft_f_gamma\truck_02\data\truck_02_mrl_OPFOR_co.paa"
        };
    }; // "Zamak MRL"

    class O_MBT_02_arty_F {
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
    }; // "2S9 Sochor"
};