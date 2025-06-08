class AirDefense {
    class B_static_AA_F {
        cost = 300;
        description = "The Titan Multi-Purpose Rocket Launcher is a shoulder system for launching guided rockets against aerial targets.<br /><br />Basic Controls:<br />Press T to lock onto target.<br />(Keybinds may vary between players, the controls shown are based on the default controls for ArmA 3.)";
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
    }; // "Static Titan Launcher (AA) [NATO]"

    class B_static_AA_UP_F {
        cost = 800;
        demolishable = 1;
        description = "Static AA Launcher (UP) is an upgraded variant of the Static AA launcher.<br /><br />Basic Controls:<br />Press T to lock onto target.<br />(Keybinds may vary between players, the controls shown are based on the default controls for ArmA 3.)";
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
        spawn = "B_static_AA_F";
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

    class B_Radar_System_01_F {
        cost = 1000;
        description = "Long range radar system, capable of detecting and tracking vehicles within line of sight at up to 16km.<br /><br />Basic Controls:<br />Press Ctrl + R to toggle the radar on/off.<br />Press R to cycle between targets on sensors.<br />Press T to lock onto target and measure distance.<br />Press [ or ] to adjust system panels for the left or right side of your screen.<br />Press Right Ctrl + [ or Right Ctrl + ] to adjust modes (if available) for system panels.<br />(Keybinds may vary between players, the controls shown are based on the default controls for ArmA 3.)";
        killReward = 350;
        loadable[] = {0, 0, 1};
        offset[] = {0, 7, 0};
        requirements[] = {};
    }; // "AN/MPQ-105 Radar"

    class B_AAA_System_01_F {
        cost = 3500;
        description = "Short range air defense artillery with a high rate of fire. Effective range: 3km.<br /><br />Basic Controls:<br />Press Ctrl + R to toggle the radar on/off.<br />Press R to cycle between targets on sensors.<br />Press T to lock onto target, measure distance and adjust fire control system.<br />Press [ or ] to adjust system panels for the left or right side of your screen.<br />Press Right Ctrl + [ or Right Ctrl + ] to adjust modes (if available) for system panels.<br />(Keybinds may vary between players, the controls shown are based on the default controls for ArmA 3.)";
        killReward = 400;
        loadable[] = {0, -1, 1.7};
        offset[] = {0, 5.3, 0};
        rearm = 180;
        requirements[] = {};
    }; // "Praetorian 1C"

    class B_APC_Tracked_01_AA_F {
        ammoOverrides[] = {
            {"M_Zephyr", {"M_Zephyr_SAM", "Zephyr (SAM)"}}
        };
        aps = 2;
        capValue = 4;
        cost = 5000;
        description = "While both IFV-6c Panther and IFV-6a Cheetah are based on the Israeli armored personnel carrier chassis, they serve different roles in combat.<br /><br />Basic Controls:<br />Press Ctrl + R to toggle the radar on/off.<br />Press R to cycle between targets on sensors.<br />Press T to lock onto target and measure distance.<br />Press [ or ] to adjust system panels for the left or right side of your screen.<br />Press Right Ctrl + [ or Right Ctrl + ] to adjust modes (if available) for system panels.<br />(Keybinds may vary between players, the controls shown are based on the default controls for ArmA 3.)";
        hasHMD = 1;
        killReward = 350;
        rearm = 300;
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

    class B_SAM_System_01_F {
        cost = 6500;
        description = "Short range surface-to-air missile system, capable of engaging aircraft and helicopters. Effective range: 4km.<br /><br />Basic Controls:<br />Press Ctrl + R to toggle the radar on/off.<br />Press R to cycle between targets on sensors.<br />Press T to lock onto target and measure distance.<br />Press [ or ] to adjust system panels for the left or right side of your screen.<br />Press Right Ctrl + [ or Right Ctrl + ] to adjust modes (if available) for system panels.<br />(Keybinds may vary between players, the controls shown are based on the default controls for ArmA 3.)";
        hasHMD = 1;
        killReward = 500;
        loadable[] = {0, -2, 0.8};
        offset[] = {0, 5.3, 0};
        rearm = 360;
        requirements[] = {};
    }; // "Mk49 Spartan"

    class B_SAM_System_03_F {
        cost = 7000;
        description = "Long range surface-to-air missile system, capable of engaging aircraft and helicopters. Effective range: >10km.<br /><br />Basic Controls:<br />Press Ctrl + R to toggle the radar on/off.<br />Press R to cycle between targets on sensors.<br />Press T to lock onto target and measure distance.<br />Press [ or ] to adjust system panels for the left or right side of your screen.<br />Press Right Ctrl + [ or Right Ctrl + ] to adjust modes (if available) for system panels.<br />(Keybinds may vary between players, the controls shown are based on the default controls for ArmA 3.)";
        hasHMD = 1;
        killReward = 500;
        loadable[] = {0, 0, 1};
        offset[] = {0, 6, 0};
        rearm = 270;
        requirements[] = {};
    }; // "MIM-145 Defender"

    class B_APC_Tracked_01_AA_UP_F {
        aps = 2;
        capValue = 4;
        cost = 7500;
        description = "IFV-6X Puma is a variant of the IFV-6a Cheetah armed with Defender missiles.<br /><br />Basic Controls:<br />Press Ctrl + R to toggle the radar on/off.<br />Press R to cycle between targets on sensors.<br />Press T to lock onto target, measure distance and adjust fire control system.<br />Press F to cycle between weapons.<br />Press [ or ] to adjust system panels for the left or right side of your screen.<br />Press Right Ctrl + [ or Right Ctrl + ] to adjust modes (if available) for system panels.<br />(Keybinds may vary between players, the controls shown are based on the default controls for ArmA 3.)";
        hasHMD = 1;
        killReward = 600;
        name = "IFV-6X Puma";
        rearm = 270;
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

    class B_SAM_System_02_F {
        cost = 8000;
        description = "Medium range surface-to-air missile system, capable of engaging aircraft and helicopters. Effective range: ~10km.<br /><br />Basic Controls:<br />Press Ctrl + R to toggle the radar on/off.<br />Press R to cycle between targets on sensors.<br />Press T to lock onto target and measure distance.<br />Press [ or ] to adjust system panels for the left or right side of your screen.<br />Press Right Ctrl + [ or Right Ctrl + ] to adjust modes (if available) for system panels.<br />(Keybinds may vary between players, the controls shown are based on the default controls for ArmA 3.)";
        hasHMD = 1;
        killReward = 600;
        loadable[] = {0, -2, 1};
        offset[] = {0, 5.3, 0};
        rearm = 360;
        requirements[] = {};
    }; // "Mk21 Centurion"

    class B_APC_Tracked_01_AA_E_F {
        aps = 2;
        capValue = 4;
        cost = 8500;
        description = "IFV-6C Jaguar is a variant of the IFV-6a Cheetah armed with Mk21 Centurion missiles.<br /><br />Basic Controls:<br />Press Ctrl + R to toggle the radar on/off.<br />Press R to cycle between targets on sensors.<br />Press T to lock onto target, measure distance and adjust fire control system.<br />Press F to cycle between weapons.<br />Press [ or ] to adjust system panels for the left or right side of your screen.<br />Press Right Ctrl + [ or Right Ctrl + ] to adjust modes (if available) for system panels.<br />(Keybinds may vary between players, the controls shown are based on the default controls for ArmA 3.)";
        hasHMD = 1;
        killReward = 600;
        name = "IFV-6C Jaguar";
        rearm = 360;
        requirements[] = {};
        spawn = "B_APC_Tracked_01_AA_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "magazine_Missile_rim162_x8",
                "680Rnd_35mm_AA_shells_Tracer_Red"
            };
            addWeapons[] = {
                "autocannon_35mm",
                "weapon_rim162Launcher"
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

    class B_SAM_System_LRAA_F {
        ammoOverrides[] = {
            {"ammo_Missile_Cruise_01", {"M_SM6", "Standard Missile 6 Block II"}}
        };
        cost = 42000;
        description = "Extended range air-defense system, capable of aggressively engaging aircraft and helicopters. Effective range: >50km.<br /><br />Basic Controls:<br />Press Ctrl + R to toggle the radar on/off.<br />Press R to cycle between targets on sensors.<br />Press T to lock onto target and measure distance.<br />Press [ or ] to adjust system panels for the left or right side of your screen.<br />Press Right Ctrl + [ or Right Ctrl + ] to adjust modes (if available) for system panels.<br />(Keybinds may vary between players, the controls shown are based on the default controls for ArmA 3.)";
        disallowMagazines[] = {
            "magazine_Missiles_Cruise_01_Cluster_x18"
        };
        hasESAM = 1;
        hasHMD = 1;
        killReward = 1200;
        name = "RIM-174 Standard ERAM";
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