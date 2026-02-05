class SectorDefense {
    class I_HMG_01_F {
        cost = 150;
        loadable[] = {0, -2.5, 0.4};
        offset[] = {0, 3, 0};
        rearm = 300;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "100Rnd_127x99_mag_Tracer_Green",
                "100Rnd_127x99_mag_Tracer_Green",
                "100Rnd_127x99_mag_Tracer_Green",
                "100Rnd_127x99_mag_Tracer_Green"
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
    };  // "Mk30 HMG .50"

    class Land_IRMaskingCover_01_F {
        cost = 200;
        demolishable = 2;
        offset[] = {0, 8, 0};
    };  // "IR Masking Tent (Large)"

    class I_HMG_01_high_F {
        cost = 200;
        loadable[] = {0, -2.5, 0.8};
        offset[] = {0, 3, 0};
        rearm = 300;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "100Rnd_127x99_mag_Tracer_Green",
                "100Rnd_127x99_mag_Tracer_Green",
                "100Rnd_127x99_mag_Tracer_Green",
                "100Rnd_127x99_mag_Tracer_Green"
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
    };  // "Mk30 HMG .50 (Raised)"

    class I_GMG_01_F {
        cost = 200;
        loadable[] = {0, -2.5, 0.4};
        offset[] = {0, 3, 0};
        rearm = 300;
    };  // "Mk32 GMG 20 mm"

    class I_GMG_01_high_F {
        cost = 250;
        loadable[] = {0, -2.5, 0.8};
        offset[] = {0, 3, 0};
        rearm = 300;
    };  // "Mk32 GMG 20 mm (Raised)"

    class I_static_AA_F {
        cost = 300;
        loadable[] = {0, -2.5, 0.2};
        offset[] = {0, 3, 0};
        rearm = 300;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "1Rnd_GAA_missiles",
                "1Rnd_GAA_missiles",
                "1Rnd_GAA_missiles",
                "1Rnd_GAA_missiles",
                "1Rnd_GAA_missiles",
                "1Rnd_GAA_missiles"
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
    };  // "Static Titan Launcher (AA) [AAF]"

    class I_static_AT_F {
        cost = 300;
        loadable[] = {0, -2.5, 0.2};
        offset[] = {0, 3, 0};
        rearm = 300;

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
    };  // "Static Titan Launcher (AT) [AAF]"

    class I_HMG_01_A_F {
        cost = 500;
        loadable[] = {0, -2.5, 0.4};
        name = "Mk30 HMG Auto Turret";
        offset[] = {0, 3, 0};
        rearm = 300;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "100Rnd_127x99_mag_Tracer_Green",
                "100Rnd_127x99_mag_Tracer_Green",
                "100Rnd_127x99_mag_Tracer_Green",
                "100Rnd_127x99_mag_Tracer_Green"
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

    class I_static_AT_UP_F {
        cost = 590;
        description = "Static AT Launcher (UP) is an upgraded variant of the Static AT Launcher.";
        disallowMagazines[] = {
            "4Rnd_GAA_missiles"
        };
        loadable[] = {0, -2.5, 0.2};
        name = "Static AT Launcher (UP)";
        offset[] = {0, 3, 0};
        rearm = 300;
        spawn = "I_static_AT_F";
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

    class I_static_AA_UP_F {
        cost = 600;
        description = "Static AA Launcher (UP) is an upgraded variant of the Static AA Launcher.";
        loadable[] = {0, -2.5, 0.2};
        name = "Static AA Launcher (UP)";
        offset[] = {0, 3, 0};
        rearm = 300;
        spawn = "I_static_AA_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "4Rnd_70mm_SAAMI_missiles",
                "4Rnd_70mm_SAAMI_missiles",
                "4Rnd_70mm_SAAMI_missiles"
            };
            addWeapons[] = {
                "missiles_SAAMI"
            };
            removeMagazines[] = {
                "1Rnd_GAA_missiles"
            };
            removeWeapons[] = {
                "missiles_titan_static"
            };
            turret[] = { 0 };
        };
    };

    class I_GMG_01_A_F {
        cost = 650;
        loadable[] = {0, -2.5, 0.4};
        name = "Mk32 GMG Auto Turret";
        offset[] = {0, 3, 0};
        rearm = 300;
    };

    class Land_Sign_MinesDanger_English_F {
        cost = 2000;
        demolishable = 3;
        demolishStepTime = 3;
        description = "";
        dumbMine = 15;
        name = "AT Minefield";
        offset[] = {0, 3, 0};
    };

    class I_SmartMine_01_F {
        cost = 3000;
        description = "XM205 Smart Mine System is a deployable anti-tank mine system that launches anti-tank top-attack mines at enemy vehicles. Must be placed outside. Mines: 6 AP, 2 AT. Limit 3 deployed.";
        empty = 1;
        immobile = 1;
        loadable[] = {-0.4, -1, 0.9};
        name = "XM205 Smart Mine System";
        offset[] = {0, 5, 0};
        rearm = 900;
        requirements[] = {"S"};
        smartMineAP = 6;
        smartMineAT = 2;
        spawn = "I_UGV_01_F";
        textures[] = {
            "#(rgb,8,8,3)color(1,0,0,1)",
            "#(rgb,8,8,3)color(1,0,0,1)",
            "#(rgb,8,8,3)color(1,0,0,1)"
        };
        vehicleSpawn = 1;
    };

    class I_Mortar_01_F {
        cost = 4000;
        loadable[] = {0, -2.5, 0};
        offset[] = {0, 3, 0};
        rearm = 900;
    };  // "Mortar"
};