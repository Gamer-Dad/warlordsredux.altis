class AirDefense {
    class B_static_AA_F {
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
    }; // "Static Titan Launcher (AA) [NATO]"

    class B_Radar_System_01_F {
        cost = 1000;
        description = "Long range radar system, capable of detecting and tracking vehicles within line of sight at up to 16km.";
        killReward = 350;
        loadable[] = {0, 0, 1};
        offset[] = {0, 7, 0};
        requirements[] = {};
    }; // "AN/MPQ-105 Radar"

    class B_AAA_System_01_F {
        cost = 3500;
        description = "Short range air defense artillery with a high rate of fire. Effective range: 3km.";
        killReward = 400;
        loadable[] = {0, -1, 1.7};
        offset[] = {0, 5.3, 0};
        rearm = 300;
        requirements[] = {};
    }; // "Praetorian 1C"

    class B_APC_Tracked_01_AA_E_F {
        aps = 2;
        capValue = 4;
        cost = 4500;
        description = "IFV-SAAMI Jaguar is a variant of the IFV-6a Cheetah armed with SAAMI missiles.";
        killReward = 300;
        name = "IFV-SAAMI Jaguar";
        rearm = 450;
        requirements[] = {};
        spawn = "B_APC_Tracked_01_AA_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "4Rnd_70mm_SAAMI_missiles",
                "4Rnd_70mm_SAAMI_missiles",
                "4Rnd_70mm_SAAMI_missiles",
                "4Rnd_70mm_SAAMI_missiles",
                "680Rnd_35mm_AA_shells_Tracer_Red"
            };
            addWeapons[] = {
                "autocannon_35mm",
                "missiles_SAAMI"
            };
            removeMagazines[] = {
                "4Rnd_Titan_long_missiles",
                "680Rnd_35mm_AA_shells_Tracer_Red"
            };
            removeWeapons[] = {
                "missiles_titan_AA",
                "autocannon_35mm"
            };
            turret[] = { 0 };
        };
    };

    class B_APC_Tracked_01_AA_F {
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
                "680Rnd_35mm_AA_shells_Tracer_Red"
            };
            addWeapons[] = {
                "autocannon_35mm",
                "missiles_titan_AA"
            };
            removeMagazines[] = {
                "4Rnd_Titan_long_missiles",
                "680Rnd_35mm_AA_shells_Tracer_Red"
            };
            removeWeapons[] = {
                "missiles_titan_AA",
                "autocannon_35mm"
            };
            turret[] = { 0 };
        };
    }; // "IFV-6a Cheetah"

    class B_SAM_System_03_F {
        cost = 8000;
        description = "Long range surface-to-air missile system, capable of engaging aircraft and helicopters. Effective range: >10km.";
        killReward = 500;
        loadable[] = {0, 0, 1};
        offset[] = {0, 6, 0};
        rearm = 450;
        requirements[] = {};
    }; // "MIM-145 Defender"

    class B_APC_Tracked_01_AA_UP_F {
        aps = 2;
        capValue = 4;
        cost = 9000;
        description = "IFV-6X Puma is a variant of the IFV-6a Cheetah armed with Defender missiles.";
        killReward = 600;
        name = "IFV-6X Puma";
        rearm = 450;
        requirements[] = {};
        spawn = "B_APC_Tracked_01_AA_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "magazine_Missile_mim145_x4",
                "680Rnd_35mm_AA_shells_Tracer_Red"
            };
            addWeapons[] = {
                "autocannon_35mm",
                "weapon_mim145Launcher"
            };
            removeMagazines[] = {
                "4Rnd_Titan_long_missiles"
            };
            removeWeapons[] = {
                "missiles_titan_AA",
                "autocannon_35mm"
            };
            turret[] = { 0 };
        };
    };

    class B_SAM_System_01_F {
        cost = 10000;
        description = "Short range surface-to-air missile system, capable of engaging aircraft and helicopters. Effective range: 4km.";
        killReward = 500;
        loadable[] = {0, -2, 0.8};
        offset[] = {0, 5.3, 0};
        rearm = 600;
        requirements[] = {};
    }; // "Mk49 Spartan"

    class B_SAM_System_02_F {
        cost = 15000;
        description = "Medium range surface-to-air missile system, capable of engaging aircraft and helicopters. Effective range: ~10km.";
        killReward = 600;
        loadable[] = {0, -2, 1};
        offset[] = {0, 5.3, 0};
        rearm = 600;
        requirements[] = {};
    }; // "Mk21 Centurion"
};