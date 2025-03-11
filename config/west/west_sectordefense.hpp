class SectorDefense {
    class Land_Scaffolding_New_F {
        cost = 10;
        demolishable = 1;
        killReward = 5;
        offset[] = {0, 2, 4};
        requirements[] = {};
    };  // "Scaffolding"

    class Land_Razorwire_F {
        cost = 50;
        demolishable = 1;
        killReward = 30;
        offset[] = {0, 5, 0};
        requirements[] = {};
    }; // "Razor Wire Fence"

    class Land_BagFence_Round_F {
        cost = 50;
        demolishable = 1;
        killReward = 30;
        offset[] = {0, 2, 0};
        requirements[] = {};
    }; // "Semi Circle Sand bags"

    class Land_DragonsTeeth_01_4x2_new_F {
        cost = 50;
        demolishable = 1;
        killReward = 30;
        offset[] = {0, 5, 0};
        requirements[] = {};
    }; // "Tank barrier"

    class Land_HBarrier_5_F {
        cost = 50;
        demolishable = 1;
        killReward = 30;
        offset[] = {0, 3, 0};
        requirements[] = {};
    }; // "H-barrier"

    class Land_HBarrierWall6_F {
        cost = 60;
        demolishable = 1;
        killReward = 30;
        offset[] = {0, 3, 0};
        requirements[] = {};
    }; // "H-barrier wall"

    class CamoNet_BLUFOR_big_F {
        cost = 100;
        demolishable = 1;
        garbageCollect = 1;
        killReward = 30;
        offset[] = {0, 6, 0};
        requirements[] = {};
    }; // "Camouflage Vehicle Cover (Green)"

    class B_HMG_01_F {
        cost = 150;
        killReward = 100;
        loadable[] = {0, -2.5, 0.4};
        offset[] = {0, 3, 0};
        rearm = 300;
        requirements[] = {};

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "100Rnd_127x99_mag_Tracer_Red",
                "100Rnd_127x99_mag_Tracer_Red",
                "100Rnd_127x99_mag_Tracer_Red",
                "100Rnd_127x99_mag_Tracer_Red"
            };
            addWeapons[] = {
                "HMG_static"
            };
            removeMagazines[] = {};
            removeWeapons[] = {
                "HMG_static"
            };
            turret[] = { 0 };
        };
    }; // "Mk30 HMG .50"

    class Land_IRMaskingCover_01_F {
        cost = 200;
        demolishable = 1;
        garbageCollect = 1;
        killReward = 30;
        offset[] = {0, 8, 0};
        requirements[] = {};
    }; // "IR Masking Tent (Large)"

    class B_HMG_01_high_F {
        cost = 200;
        killReward = 100;
        loadable[] = {0, -2.5, 0.8};
        offset[] = {0, 3, 0};
        rearm = 300;
        requirements[] = {};

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "100Rnd_127x99_mag_Tracer_Red",
                "100Rnd_127x99_mag_Tracer_Red",
                "100Rnd_127x99_mag_Tracer_Red",
                "100Rnd_127x99_mag_Tracer_Red"
            };
            addWeapons[] = {
                "HMG_static"
            };
            removeMagazines[] = {};
            removeWeapons[] = {
                "HMG_static"
            };
            turret[] = { 0 };
        };
    }; // "Mk30 HMG .50 (Raised)"

    class B_GMG_01_F {
        cost = 200;
        killReward = 100;
        loadable[] = {0, -2.5, 0.4};
        offset[] = {0, 3, 0};
        rearm = 300;
        requirements[] = {};
    }; // "Mk32 GMG 20mm"

    class B_GMG_01_high_F {
        cost = 250;
        killReward = 100;
        loadable[] = {0, -2.5, 0.8};
        offset[] = {0, 3, 0};
        rearm = 300;
        requirements[] = {};
    }; // "Mk32 GMG 20mm (Raised)"

    // class B_Minigun_01_high_F {
    //     name = "Mk30X Minigun (Raised)";
    //     cost = 250;
    //     spawn = "B_G_HMG_02_high_F";
    //     variant = 1;
    //     requirements[] = {};
    //     rearm = 300;
    //     killReward = 100;
    //     loadable[] = {0, -2.5, 0};
    //
    //     class Gunner: WLTurretDefaults {
    //         addMagazines[] = {
    //             "2000Rnd_65x39_Belt_Tracer_Yellow",
    //             "2000Rnd_65x39_Belt_Tracer_Yellow",
    //             "2000Rnd_65x39_Belt_Tracer_Yellow",
    //             "2000Rnd_65x39_Belt_Tracer_Yellow"
    //         };
    //         addWeapons[] = {
    //             "LMG_Minigun_Transport"
    //         };
    //         removeMagazines[] = {
    //             "100Rnd_127x99_mag_Tracer_Yellow",
    //         };
    //         removeWeapons[] = {
    //             "HMG_M2_Mounted"
    //         };
    //         turret[] = { 0 };
    //     };
    // };

    class B_static_AT_F {
        cost = 300;
        killReward = 100;
        loadable[] = {0, -2.5, 0.2};
        offset[] = {0, 3, 0};
        rearm = 300;
        requirements[] = {};

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "1Rnd_GAT_missiles",
                "1Rnd_GAT_missiles",
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
            turret[] = { 0 };
        };
    }; // "Static Titan Launcher (AT) [NATO]"

    class B_HMG_01_A_F {
        cost = 500;
        killReward = 150;
        loadable[] = {0, -2.5, 0.4};
        name = "Mk30 HMG Auto Turret";
        offset[] = {0, 3, 0};
        rearm = 300;
        requirements[] = {};

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "100Rnd_127x99_mag_Tracer_Red",
                "100Rnd_127x99_mag_Tracer_Red",
                "100Rnd_127x99_mag_Tracer_Red",
                "100Rnd_127x99_mag_Tracer_Red"
            };
            addWeapons[] = {
                "HMG_static"
            };
            removeMagazines[] = {};
            removeWeapons[] = {
                "HMG_static"
            };
            turret[] = { 0 };
        };
    };

    class B_GMG_01_A_F {
        cost = 650;
        killReward = 150;
        loadable[] = {0, -2.5, 0.4};
        name = "Mk32 GMG Auto Turret";
        offset[] = {0, 3, 0};
        rearm = 300;
        requirements[] = {};
    };

    class B_static_AT_UP_F {
        cost = 700;
        description = "Static AT/AA Launcher (UP) is an upgraded variant of the stationary launchers.";
        disallowMagazines[] = {
            "4Rnd_GAA_missiles",
            "5Rnd_GAT_missiles"
        };
        killReward = 200;
        loadable[] = {0, -2.5, 0.2};
        name = "Static AT/AA Launcher (UP)";
        offset[] = {0, 3, 0};
        rearm = 300;
        requirements[] = {};
        spawn = "B_static_AT_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "2Rnd_GAT_missiles",
                "2Rnd_GAT_missiles",
                "2Rnd_GAT_missiles",
                "2Rnd_GAT_missiles",
                "2Rnd_GAT_missiles",
                "2Rnd_GAT_missiles",
                "2Rnd_GAT_missiles",
                "2Rnd_GAT_missiles",
                "2Rnd_GAT_missiles",
                "2Rnd_GAT_missiles"
            };
            addWeapons[] = {
                "missiles_titan"
            };
            reloadOverride = 6;
            removeMagazines[] = {
                "1Rnd_GAT_missiles"
            };
            removeWeapons[] = {
                "missiles_titan_static"
            };
            turret[] = { 0 };
        };
    };

    class Land_MobileRadar_01_radar_F {
        cost = 2500;
        demolishable = 1;
        description = "EW Tower can be used to jam enemy autonomous assets and provide EW support to your team. It must be placed outside the home base in an owned sector.";
        garbageCollect = 1;
        killReward = 400;
        name = "EW Tower";
        offset[] = {0, 6, 0};
        requirements[] = {};
        // This is not loadable. It will break initialization code to load this.
    };

    class B_Mortar_01_F {
        cost = 4000;
        killReward = 125;
        loadable[] = {0, -2.5, 0};
        offset[] = {0, 3, 0};
        rearm = 900;
        requirements[] = {};
    }; // "Mortar"

    class B_Mortar_01_TV_F {
        ammoOverrides[] = {
            {"M_127mm_Firefist_AT", "M_Switchblade"}
        };
        cost = 6000;
        description = "Switchblade Launcher is a remote controlled loitering munition launcher. It can be used to effectively engage enemy ground vehicles.";
        killReward = 125;
        loadable[] = {0, -2.5, 0};
        name = "Switchblade Launcher";
        offset[] = {0, 3, 0};
        rearm = 900;
        requirements[] = {};
        spawn = "B_Mortar_01_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "2Rnd_127mm_Firefist_missiles",
                "2Rnd_127mm_Firefist_missiles",
                "2Rnd_127mm_Firefist_missiles",
                "2Rnd_127mm_Firefist_missiles",
                "2Rnd_127mm_Firefist_missiles"
            };
            addWeapons[] = {
                "missiles_Firefist"
            };
            removeMagazines[] = {
                "8Rnd_82mm_Mo_shells",
                "8Rnd_82mm_Mo_Flare_white",
                "8Rnd_82mm_Mo_Smoke_white",
                "8Rnd_82mm_Mo_guided",
                "8Rnd_82mm_Mo_LG"
            };
            removeWeapons[] = {
                "mortar_82mm"
            };
            turret[] = { 0 };
        };
    };

    class B_Ship_Gun_01_F {
        cost = 10000;
        disallowMagazines[] = {
            "magazine_ShipCannon_120mm_HE_cluster_shells_x2",
            "magazine_ShipCannon_120mm_mine_shells_x6",
            "magazine_ShipCannon_120mm_AT_mine_shells_x6"
        };
        killReward = 600;
        offset[] = {0, 9, 0};
        requirements[] = {};
        rearm = 2700;
    }; // "MK45 Hammer"

    // class B_Ship_MRLS_01_F {
    //     cost = 30000;
    //     requirements[] = {};
    //     offset[] = {0, 7, 0};
    //     rearm = 2700;
    //     killReward = 700;
    // }; // "Mk41 VLS"
};