class AirDefense {
    class O_static_AA_F {
        cost = 300;
        killReward = 100;
        loadable[] = {0, -2.5, 0.2};
        offset[] = {0, 3, 0};
        rearm = 180;
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

    class O_static_AA_UP_F {
        cost = 800;
        demolishable = 1;
        description = "Static AA Launcher (UP) is an upgraded variant of the Static AA launcher.";
        disallowMagazines[] = {
            "4Rnd_GAA_missiles",
            "5Rnd_GAT_missiles",
            "2Rnd_GAT_missiles",
            "2Rnd_GAT_missiles_O"
        };
        killReward = 200;
        loadable[] = {0, -2.5, 0.2};
        name = "Static AA Launcher (UP)";
        offset[] = {0, 3, 0};
        rearm = 300;
        requirements[] = {};
        spawn = "O_static_AA_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "4Rnd_Titan_long_missiles_O",
                "4Rnd_Titan_long_missiles_O",
                "4Rnd_Titan_long_missiles_O",
                "4Rnd_Titan_long_missiles_O",
                "4Rnd_Titan_long_missiles_O"
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

    class O_Radar_System_02_F {
        cost = 1000;
        description = "Long range radar system, capable of detecting and tracking vehicles within line of sight at up to 16km.";
        killReward = 350;
        loadable[] = {0, 0, 1};
        offset[] = {0, 7, 0};
        requirements[] = {};
    };  // "R-750 Cronus Radar"

    class O_APC_Tracked_02_AA_F {
        aps = 2;
        capValue = 4;
        cost = 5000;
        hasHMD = 1;
        killReward = 350;
        rearm = 300;
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

    class O_SAM_System_01_F {
        cost = 6500;
        description = "Short range surface-to-air missile system, capable of engaging aircraft and helicopters. Effective range: 4km.";
        hasHMD = 1;
        killReward = 500;
        loadable[] = {0, -2, 0.8};
        name = "Mk49 Spartan";
        offset[] = {0, 5.3, 0};
        rearm = 360;
        requirements[] = {};
        spawn = "B_SAM_System_01_F";
        textures[] = {
            "A3\Static_F_Jets\SAM_System_01\Data\SAM_system_01_olive_co.paa"
        };
    };

    class O_SAM_System_04_F {
        cost = 8000;
        description = "Long range surface-to-air missile system, capable of engaging aircraft and helicopters. Effective range: >10km.";
        hasHMD = 1;
        killReward = 500;
        loadable[] = {0, 0, 1};
        offset[] = {0, 6, 0};
        rearm = 270;
        requirements[] = {};
    };  // "S-750 Rhea"

    class O_APC_Tracked_02_AA_M_F {
        aps = 2;
        capValue = 4;
        cost = 10000;
        description = "ZSU-49 Euphrates is a variant of the ZSU-39 Tigris armed with Rhea missiles.";
        hasHMD = 1;
        killReward = 600;
        name = "ZSU-49 Euphrates";
        rearm = 270;
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

    class O_SAM_System_02_F {
        cost = 15000;
        description = "Medium range surface-to-air missile system, capable of engaging aircraft and helicopters. Effective range: ~10km.";
        hasHMD = 1;
        killReward = 600;
        loadable[] = {0, -2, 1};
        name = "Mk21 Centurion";
        offset[] = {0, 5.3, 0};
        rearm = 360;
        requirements[] = {};
        spawn = "B_SAM_System_02_F";
        textures[] = {
            "A3\Static_F_Jets\SAM_System_02\Data\SAM_system_02_olive_co.paa"
        };
    };

    class O_APC_Tracked_02_AA_E_F {
        aps = 2;
        capValue = 4;
        cost = 17000;
        description = "ZSU-59 Yangtze is a variant of the ZSU-39 Tigris armed with Mk21 Centurion missiles.";
        hasHMD = 1;
        killReward = 600;
        name = "ZSU-59 Yangtze";
        rearm = 360;
        requirements[] = {};
        spawn = "O_APC_Tracked_02_AA_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "magazine_Missile_rim162_x8",
                "680Rnd_35mm_AA_shells_Tracer_Green"
            };
            addWeapons[] = {
                "autocannon_35mm",
                "weapon_rim162Launcher"
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

    class O_SAM_System_LRAA_F {
        ammoOverrides[] = {
            {"ammo_Missile_Cruise_01", {"M_HHQ9", "HHQ-9 Surface-to-Air Missile"}}
        };
        cost = 42000;
        description = "Extended range air-defense system, capable of aggressively engaging aircraft and helicopters. Effective range: >50km.";
        disallowMagazines[] = {
            "magazine_Missiles_Cruise_01_Cluster_x18"
        };
        hasESAM = 1;
        hasHMD = 1;
        killReward = 1200;
        name = "HHQ-9 Vertical Launch System";
        rearm = 2700;
        requirements[] = {};
        spawn = "B_Ship_MRLS_01_F";

        class Gunner: WLTurretDefaults {
            addMagazines[] = {};
            addWeapons[] = {};
            turret[] = { 0 };
            removeMagazines[] = {
                "magazine_Missiles_Cruise_01_Cluster_x18"
            };
            removeWeapons[] = {};
        };
    };
};