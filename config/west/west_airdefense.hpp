class AirDefense {
    class B_static_AA_F {
        cost = 300;
        hasTurretVisualizer = 1;
        loadable[] = {0, -2.5, 0.2};
        offset[] = {0, 3, 0};
        rearm = 180;

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

    // class B_static_AA_UP_F {
    //     cost = 800;
    //     description = "Static AA Launcher (UP) is an upgraded variant of the Static AA launcher.";
    //     disallowMagazines[] = {
    //         "4Rnd_GAA_missiles",
    //         "5Rnd_GAT_missiles",
    //         "2Rnd_GAT_missiles",
    //         "2Rnd_GAT_missiles_O"
    //     };
    //     loadable[] = {0, -2.5, 0.2};
    //     name = "Static AA Launcher (UP)";
    //     offset[] = {0, 3, 0};
    //     rearm = 180;
    //     spawn = "B_static_AA_F";
    //     variant = 1;

    //     class Gunner: WLTurretDefaults {
    //         addMagazines[] = {
    //             "4Rnd_Titan_long_missiles_O",
    //             "4Rnd_Titan_long_missiles_O",
    //             "4Rnd_Titan_long_missiles_O",
    //             "4Rnd_Titan_long_missiles_O",
    //             "4Rnd_Titan_long_missiles_O"
    //         };
    //         addWeapons[] = {
    //             "missiles_titan"
    //         };
    //         reloadOverride = 6;
    //         removeMagazines[] = {
    //             "1Rnd_GAT_missiles"
    //         };
    //         removeWeapons[] = {
    //             "missiles_titan_static"
    //         };
    //         turret[] = { 0 };
    //     };
    // };

    class B_Radar_System_01_F {
        cost = 1000;
        description = "Long range radar system, capable of detecting and tracking vehicles within line of sight at up to 16km.";
        loadable[] = {0, 0, 1};
        offset[] = {0, 7, 0};
    }; // "AN/MPQ-105 Radar"

    class B_MRAP_03_AA_F {
        ammoOverrides[] = {
            {"ammo_Missile_AMRAAM_C", {"ammo_Missile_AMRAAM_ground", "SL-AMRAAM"}},
            {"ammo_Missile_AMRAAM_D", {"ammo_Missile_AMRAAM_ground", "SL-AMRAAM"}}
        };
        aps = 1;
        capValue = 2;
        cost = 2000;
        description = "Strider (SAM) is a variant of the Strider with a surface-to-air missile system. Lethal range: 2.5km.";
        hasHMD = 1;
        hasReconOptics = 2;
        loadable[] = {0, -0.8, 1.8};
        name = "Strider (SAM)";
        rearm = 180;
        spawn = "I_MRAP_03_gmg_F";
        textures[] = {
            "a3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa",
            "a3\data_f\vehicles\turret_co.paa"
        };
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "PylonMissile_Missile_AMRAAM_D_x1",
                "PylonMissile_Missile_AMRAAM_D_x1",
                "PylonMissile_Missile_AMRAAM_D_x1"
            };
            addWeapons[] = {
                "weapon_AMRAAMLauncher"
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

    class B_AAA_System_01_F {
        cost = 3500;
        description = "Short-range point defense artillery with a high rate of fire.";
        loadable[] = {0, -1, 1.7};
        offset[] = {0, 5.3, 0};
        rearm = 180;
    }; // "Praetorian 1C"

    class B_APC_Tracked_01_AA_F {
        ammoOverrides[] = {
            {"M_Zephyr", {"M_Zephyr_SAM", "Zephyr (SAM)"}}
        };
        aps = 2;
        capValue = 4;
        cost = 3750;
        hasHMD = 1;
        rearm = 240;

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
        cost = 4800;
        description = "Short range surface-to-air missile system, capable of engaging aircraft and helicopters. Lethal range: 3.5km.";
        hasHMD = 1;
        loadable[] = {0, -2, 0.8};
        offset[] = {0, 5.3, 0};
        rearm = 240;
    }; // "Mk49 Spartan"

    class B_SAM_System_03_F {
        cost = 5500;
        description = "Long range surface-to-air missile system, capable of engaging aircraft and helicopters. Lethal range: 3.5km.";
        hasHMD = 1;
        loadable[] = {0, 0, 1};
        offset[] = {0, 6, 0};
        rearm = 240;
    }; // "MIM-145 Defender"

    // class B_APC_Tracked_01_AA_UP_F {
    //     aps = 2;
    //     capValue = 4;
    //     cost = 7500;
    //     description = "IFV-6X Puma is a variant of the IFV-6a Cheetah armed with Defender missiles.";
    //     hasHMD = 1;
    //     name = "IFV-6X Puma";
    //     rearm = 240;
    //     spawn = "B_APC_Tracked_01_AA_F";
    //     variant = 1;

    //     class Gunner: WLTurretDefaults {
    //         addMagazines[] = {
    //             "magazine_Missile_mim145_x4",
    //             "680Rnd_35mm_AA_shells_Tracer_Red"
    //         };
    //         addWeapons[] = {
    //             "autocannon_35mm",
    //             "weapon_mim145Launcher"
    //         };
    //         removeMagazines[] = {
    //             "4Rnd_Titan_long_missiles"
    //         };
    //         removeWeapons[] = {
    //             "missiles_titan_AA",
    //             "autocannon_35mm"
    //         };
    //         turret[] = { 0 };
    //     };
    // };

    class B_SAM_System_02_F {
        cost = 6800;
        description = "Medium range surface-to-air missile system, capable of engaging aircraft and helicopters. Lethal range: 3.5km.";
        hasHMD = 1;
        loadable[] = {0, -2, 1};
        offset[] = {0, 5.3, 0};
        rearm = 240;
    }; // "Mk21 Centurion"

    // class B_APC_Tracked_01_AA_E_F {
    //     aps = 2;
    //     capValue = 4;
    //     cost = 8500;
    //     description = "IFV-6C Jaguar is a variant of the IFV-6a Cheetah armed with LOAL-capable AMRAAM missiles.";
    //     hasHMD = 1;
    //     name = "IFV-6C Jaguar";
    //     rearm = 240;
    //     spawn = "B_APC_Tracked_01_AA_F";
    //     variant = 1;

    //     class Gunner: WLTurretDefaults {
    //         addMagazines[] = {
    //             "PylonMissile_Missile_AMRAAM_D_x1",
    //             "PylonMissile_Missile_AMRAAM_D_x1",
    //             "PylonMissile_Missile_AMRAAM_D_x1",
    //             "PylonMissile_Missile_AMRAAM_D_x1",
    //             "680Rnd_35mm_AA_shells_Tracer_Red"
    //         };
    //         addWeapons[] = {
    //             "autocannon_35mm",
    //             "weapon_AMRAAMLauncher"
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

    // class B_SAM_System_01_Advanced_F {
    //     ammoOverrides[] = {
    //         {"ammo_Missile_rim116", {"M_RIM116B", "Hercules AA"}}
    //     };
    //     cost = 10000;
    //     description = "Advanced surface-to-air missile system, capable of aggressively engaging aircraft and helicopters. Lethal range: 6.5km.";
    //     hasASAM = 1;
    //     hasHMD = 1;
    //     loadable[] = {0, -2, 0.8};
    //     name = "Mk59 Hercules";
    //     offset[] = {0, 5.3, 0};
    //     rearm = 300;
    //     spawn = "B_SAM_System_01_F";
    //     variant = 1;
    // };

    // class B_SAM_System_LRAA_F {
    //     ammoOverrides[] = {
    //         {"ammo_Missile_Cruise_01", {"M_SM6", "Standard Missile 6 Block II"}}
    //     };
    //     cost = 42000;
    //     description = "Extended range air-defense system, capable of aggressively engaging aircraft and helicopters. Effective range: >50km.";
    //     disallowMagazines[] = {
    //         "magazine_Missiles_Cruise_01_Cluster_x18"
    //     };
    //     hasESAM = 1;
    //     hasHMD = 1;
    //     name = "RIM-174 Standard ERAM";
    //     rearm = 2700;
    //     requirements[] = {};
    //     spawn = "B_Ship_MRLS_01_F";

    //     class Gunner: WLTurretDefaults {
    //         addMagazines[] = {};
    //         addWeapons[] = {};
    //         turret[] = { 0 };
    //         removeMagazines[] = {
    //             "magazine_Missiles_Cruise_01_Cluster_x18"
    //         };
    //         removeWeapons[] = {};
    //     };
    // };
};