class AirDefense {
    class O_static_AA_F {
        cost = 300;
        killReward = 100;
        loadable[] = {0, -2.5, 0.2};
        offset[] = {0, 3, 0};
        rearm = 300;
        requirements[] = {};

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
    };  // "Static Titan Launcher (AA) [CSAT]"

    class O_Radar_System_02_F {
        cost = 1000;
        description = "Long range radar system, capable of detecting and tracking vehicles within line of sight at up to 16km.";
        killReward = 350;
        loadable[] = {0, 0, 1};
        offset[] = {0, 7, 0};
        requirements[] = {};
    };  // "R-750 Cronus Radar"

    class O_AAA_System_01_F {
        cost = 3500;
        description = "Short range air defense artillery with a high rate of fire. Effective range: 3km.";
        killReward = 400;
        loadable[] = {0, -1, 1.7};
        name = "Praetorian 1C";
        offset[] = {0, 5.3, 0};
        rearm = 300;
        requirements[] = {};
        spawn = "B_AAA_System_01_F";
        textures[] = {
            "a3\static_f_jets\aaa_system_01\data\aaa_system_01_olive_co.paa",
            "a3\static_f_jets\aaa_system_01\data\aaa_system_02_olive_co.paa"
        };
    };

    class O_APC_Tracked_02_AA_E_F {
        aps = 2;
        capValue = 4;
        cost = 4500;
        description = "ZSU-38 Yangtze is a variant of the ZSU-39 Tigris armed with SAAMI missiles.";
        killReward = 600;
        name = "ZSU-38 Yangtze";
        rearm = 450;
        requirements[] = {};
        spawn = "O_APC_Tracked_02_AA_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "4Rnd_70mm_SAAMI_missiles",
                "4Rnd_70mm_SAAMI_missiles",
                "4Rnd_70mm_SAAMI_missiles",
                "4Rnd_70mm_SAAMI_missiles",
                "680Rnd_35mm_AA_shells_Tracer_Green"
            };
            addWeapons[] = {
                "autocannon_35mm",
                "missiles_SAAMI"
            };
            removeMagazines[] = {
                "4Rnd_Titan_long_missiles_O",
                "680Rnd_35mm_AA_shells_Tracer_Green"
            };
            removeWeapons[] = {
                "missiles_titan_AA",
                "autocannon_35mm"
            };
            turret[] = { 0 };
        };
    };

    class O_APC_Tracked_02_AA_F {
        aps = 2;
        capValue = 4;
        cost = 5000;
        killReward = 350;
        rearm = 500;
        requirements[] = {};

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "4Rnd_GAA_missiles",
                "4Rnd_GAA_missiles",
                "680Rnd_35mm_AA_shells_Tracer_Green"
            };
            addWeapons[] = {
                "autocannon_35mm",
                "missiles_titan_AA"
            };
            removeMagazines[] = {
                "4Rnd_Titan_long_missiles_O",
                "680Rnd_35mm_AA_shells_Tracer_Green"
            };
            removeWeapons[] = {
                "missiles_titan_AA",
                "autocannon_35mm"
            };
            turret[] = { 0 };
        };
    }; // "ZSU-39 Tigris"

    class O_SAM_System_04_F {
        cost = 8000;
        description = "Long range surface-to-air missile system, capable of engaging aircraft and helicopters. Effective range: >10km.";
        killReward = 500;
        loadable[] = {0, 0, 1};
        offset[] = {0, 6, 0};
        rearm = 450;
        requirements[] = {};
    };  // "S-750 Rhea"

    class O_APC_Tracked_02_AA_M_F {
        aps = 2;
        capValue = 4;
        cost = 9000;
        description = "ZSU-49 Euphrates is a variant of the ZSU-39 Tigris armed with Rhea missiles.";
        killReward = 600;
        name = "ZSU-49 Euphrates";
        rearm = 450;
        requirements[] = {};
        spawn = "O_APC_Tracked_02_AA_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "magazine_Missile_s750_x4",
                "680Rnd_35mm_AA_shells_Tracer_Green"
            };
            addWeapons[] = {
                "autocannon_35mm",
                "weapon_s750Launcher"
            };
            removeMagazines[] = {
                "4Rnd_Titan_long_missiles_O"
            };
            removeWeapons[] = {
                "missiles_titan_AA",
                "autocannon_35mm"
            };
            turret[] = { 0 };
        };
    };

    class O_SAM_System_01_F {
        cost = 10000;
        description = "Short range surface-to-air missile system, capable of engaging aircraft and helicopters. Effective range: 4km.";
        killReward = 500;
        loadable[] = {0, -2, 0.8};
        name = "Mk49 Spartan";
        offset[] = {0, 5.3, 0};
        rearm = 600;
        requirements[] = {};
        spawn = "B_SAM_System_01_F";
        textures[] = {
            "A3\Static_F_Jets\SAM_System_01\Data\SAM_system_01_olive_co.paa"
        };
    };

    class O_SAM_System_02_F {
        cost = 15000;
        description = "Medium range surface-to-air missile system, capable of engaging aircraft and helicopters. Effective range: ~10km.";
        killReward = 600;
        loadable[] = {0, -2, 1};
        name = "Mk21 Centurion";
        offset[] = {0, 5.3, 0};
        rearm = 600;
        requirements[] = {};
        spawn = "B_SAM_System_02_F";
        textures[] = {
            "A3\Static_F_Jets\SAM_System_02\Data\SAM_system_02_olive_co.paa"
        };
    };
};