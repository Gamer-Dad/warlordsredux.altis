class SectorDefense {
    class Land_Razorwire_F {
        cost = 50;
        killReward = 30;
        offset[] = {0, 5, 0};
        requirements[] = {};
        structure = 1;
    }; // "Razor Wire Fence"

    class Land_BagFence_Round_F {
        cost = 50;
        demolishable = 1;
        killReward = 30;
        offset[] = {0, 2, 0};
        requirements[] = {};
        structure = 1;
    }; // "Semi Circle Sand bags"

    class Land_DragonsTeeth_01_4x2_new_F {
        cost = 50;
        demolishable = 1;
        killReward = 30;
        offset[] = {0, 5, 0};
        requirements[] = {};
        structure = 1;
    }; // "Tank barrier"

    class Land_HBarrierWall6_F {
        cost = 60;
        demolishable = 1;
        killReward = 30;
        offset[] = {0, 3, 0};
        requirements[] = {};
        structure = 1;
    }; // "H-barrier wall"

    class CamoNet_BLUFOR_big_F {
        cost = 100;
        garbageCollect = 1;
        killReward = 30;
        offset[] = {0, 6, 0};
        requirements[] = {};
        structure = 1;
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
        garbageCollect = 1;
        killReward = 30;
        offset[] = {0, 8, 0};
        requirements[] = {};
        structure = 1;
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

    class B_static_AT_UP_F {
        cost = 590;
        description = "Static AT Launcher (UP) is an upgraded variant of the Static AT Launcher.";
        disallowMagazines[] = {
            "4Rnd_GAA_missiles"
        };
        killReward = 200;
        loadable[] = {0, -2.5, 0.2};
        name = "Static AT Launcher (UP)";
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

    class B_GMG_01_A_F {
        cost = 650;
        killReward = 150;
        loadable[] = {0, -2.5, 0.4};
        name = "Mk32 GMG Auto Turret";
        offset[] = {0, 3, 0};
        rearm = 300;
        requirements[] = {};
    };

    class Land_Communication_F {
        cost = 2500;
        demolishable = 1;
        description = "Jamming Tower can be used to jam enemy autonomous assets. It must be placed outside the home base in an owned sector.";
        garbageCollect = 1;
        killReward = 400;
        name = "Jamming Tower";
        offset[] = {0, 6, 0};
        requirements[] = {};
        structure = 1;
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