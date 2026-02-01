class FixedWing {
    class B_Plane_Civil_01_F {
        cost = 800;
        description = "Caesar BTT is a light unarmed aircraft.";
        loadable[] = {0, -2.2, 0.9};
        name = "Caesar BTT";
        requirements[] = {"A"};
        spawn = "C_Plane_Civil_01_F";
    };

    // class B_Plane_Caesar_hmggmg_01_F {
    //     cost = 1500;
    //     description = "Caesar BTT (HMG/GMG) is a variant of the Caesar BTT armed with a HMG and GMG.";
    //     name = "Caesar BTT (HMG/GMG)";
    //     rearm = 300;
    //     requirements[] = {"A"};
    //     spawn = "C_Plane_Civil_01_F";
    //     variant = 1;
    //
    //     class Pilot: WLTurretDefaults {
    //         turret[] = { -1 };
    //         removeMagazines[] = {};
    //         removeWeapons[] = {};
    //         addMagazines[] = {
    //             "500Rnd_127x99_mag_Tracer_Yellow",
    //             "500Rnd_127x99_mag_Tracer_Yellow",
    //             "96Rnd_40mm_G_belt",
    //             "96Rnd_40mm_G_belt",
    //             "240Rnd_CMFlare_Chaff_Magazine"
    //         };
    //         addWeapons[] = {
    //             "HMG_127",
    //             "GMG_40mm",
    //             "CMFlareLauncher"
    //         };
    //     };
    // };

    // class B_Plane_Caesar_rocket_01_F {
    //     cost = 1800;
    //     description = "Caesar BTT (Rocket) is a variant of the Caesar BTT armed with rockets.";
    //     name = "Caesar BTT (Rocket)";
    //     rearm = 400;
    //     requirements[] = {"A"};
    //     spawn = "C_Plane_Civil_01_F";
    //     variant = 1;

    //     class Pilot: WLTurretDefaults {
    //         turret[] = { -1 };
    //         removeMagazines[] = {};
    //         removeWeapons[] = {};
    //         addMagazines[] = {
    //             "14Rnd_80mm_rockets",
    //             "14Rnd_80mm_rockets",
    //             "240Rnd_CMFlare_Chaff_Magazine"
    //         };
    //         addWeapons[] = {
    //             "rockets_Skyfire",
    //             "CMFlareLauncher"
    //         };
    //     };
    // };

    class B_Plane_Caesar_bomb_01_F {
        ammoOverrides[] = {
            {"Bomb_04_F", {"ammo_gbu12_gps", "GBU-15 (GPS-Guided)"}}
        };
        cost = 1500;
        description = "Caesar BTT (Bomb) is a variant of the Caesar BTT armed with a pair of GPS-guided GBU-15 bombs.";
        hasHMD = 1;
        loadable[] = {0, -2.2, 0.9};
        name = "Caesar BTT (Bomb)";
        rearm = 300;
        requirements[] = {"A"};
        spawn = "C_Plane_Civil_01_F";
        variant = 1;

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "magazine_Bomb_GBU12_x1"
            };
            addWeapons[] = {
                "weapon_GBU12Launcher"
            };
            turret[] = { -1 };
        };
    };

    class B_T_VTOL_01_infantry_F {
        cost = 2000;
        hasAirRearm = 1;
        hasHMD = 1;
        requirements[] = {"H"};
    }; // "V-44 X Blackfish (Inf)"

    class B_T_VTOL_01_vehicle_F {
        cost = 2000;
        hasAirRearm = 1;
        hasHMD = 1;
        requirements[] = {"H"};
    }; // "V-44 X Blackfish (Vic)"

    // class B_T_VTOL_01_recon_F {
    //     cost = 3800;
    //     description = "V-44 X Blackfish (AWACS) is a variant of the V-44 X Blackfish with a powerful air radar and device jammer.";
    //     hasAirRadar = 20000;
    //     hasHMD = 1;
    //     name = "V-44 X Blackfish (AWACS)";
    //     requirements[] = {"A"};
    //     spawn = "B_T_VTOL_01_infantry_F";

    //     class Pilot: WLTurretDefaults {
    //         addMagazines[] = {
    //             "240Rnd_CMFlare_Chaff_Magazine"
    //         };
    //         addWeapons[] = {
    //             "CMFlareLauncher_Singles"
    //         };
    //         removeMagazines[] = {};
    //         removeWeapons[] = {
    //             "CMFlareLauncher_Triples"
    //         };
    //         turret[] = { -1 };
    //     };

    //     class Copilot: WLTurretDefaults {
    //         deviceJammer = 1;
    //         turret[] = { 0 };
    //     };
    // };

    class B_T_VTOL_01_armed_F {
        cost = 8000;
        hasHMD = 1;
        hasTurretVisualizer = 1;
        rearm = 300;
        requirements[] = {"A"};

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "300Rnd_CMFlare_Chaff_Magazine"
            };
            removeMagazines[] = {
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            turret[] = { -1 };
        };
    }; // "V-44 X Blackfish (Armed)"

    class B_T_VTOL_01_armed_up_F {
        cost = 10000;
        hasHMD = 1;
        hasTurretVisualizer = 1;
        name = "V-44 J Archerfish";
        rearm = 300;
        requirements[] = {"A"};
        spawn = "B_T_VTOL_01_armed_F";
        variant = 1;

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "300Rnd_CMFlare_Chaff_Magazine",
                "300Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {
                "CMFlareLauncher_Singles"
            };
            removeMagazines[] = {
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            removeWeapons[] = {
                "CMFlareLauncher_Triples"
            };
            turret[] = { -1 };
        };

        class Copilot: WLTurretDefaults {
            addMagazines[] = {
                "300Rnd_CMFlare_Chaff_Magazine",
                "300Rnd_CMFlare_Chaff_Magazine",
                "magazine_Bomb_SDB_x1",
                "magazine_Bomb_SDB_x1",
                "magazine_Bomb_SDB_x1",
                "magazine_Bomb_SDB_x1",
                "magazine_Bomb_SDB_x1",
                "magazine_Bomb_SDB_x1"
            };
            addWeapons[] = {
                "weapon_SDBLauncher",
                "CMFlareLauncher_Singles"
            };
            removeMagazines[] = {
                "Laserbatteries"
            };
            removeWeapons[] = {
                "Laserdesignator_mounted"
            };
            turret[] = { 0 };
        };

        class RightGunner: WLTurretDefaults {
            addMagazines[] = {
                "60Rnd_30mm_MP_shells_Tracer_Green",
                "60Rnd_30mm_MP_shells_Tracer_Green",
                "60Rnd_30mm_MP_shells_Tracer_Green",
                "60Rnd_30mm_MP_shells_Tracer_Green",
                "60Rnd_30mm_MP_shells_Tracer_Green",
                "60Rnd_30mm_MP_shells_Tracer_Green"
            };
            addWeapons[] = {
                "autocannon_30mm_RCWS"
            };
            removeMagazines[] = {
                "240Rnd_40mm_GPR_Tracer_Red_shells",
                "160Rnd_40mm_APFSDS_Tracer_Red_shells"
            };
            removeWeapons[] = {
                "autocannon_40mm_VTOL_01"
            };
            turret[] = { 2 };
        };
    };

    class B_Plane_CAS_01_dynamicLoadout_F {
        allowPylonMagazines[] = {
            "PylonRack_12Rnd_PGM_missiles",
            {"PylonMissile_1Rnd_Bomb_03_F", {"Pylons4", "Pylons5", "Pylons6", "Pylons7"}},
            {"PylonRack_Bomb_SDB_x4", {"Pylons5", "Pylons6"}},
            {"PylonRack_1Rnd_Missile_AGM_02_F", {"Pylons4", "Pylons7"}},
            {"PylonRack_3Rnd_Missile_AGM_02_F", {"Pylons4", "Pylons7"}}
        };
        ammoOverrides[] = {
            {"Bomb_03_F", {"Bomb_03_BLU_F", "BLU-12 (Bunker Buster)"}},
            {"Missile_AGM_02_F", {"Missile_AGM_02_Laser_F", "AGM-65 Maverick (Laser-Guided)"}}
        };
        cost = 13000;
        disallowMagazines[] = {
            "PylonRack_1Rnd_Missile_AGM_02_F",
            "PylonRack_3Rnd_Missile_AGM_02_F"
        };
        hasHMD = 1;
        loadable[] = {0, -2.2, 1.5};
        rearm = 420;
        requirements[] = {"A"};

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "300Rnd_CMFlare_Chaff_Magazine"
            };
            removeMagazines[] = {
                "120Rnd_CMFlare_Chaff_Magazine"
            };
            turret[] = { -1 };
        };
    }; // "A-164 Wipeout (CAS)"

    class B_Plane_Fighter_04_F {
        allowPylonMagazines[] = {
            "PylonRack_Missile_AMRAAM_C_x2",
            "PylonMissile_Bomb_GBU12_x1",
            {"PylonRack_Bomb_GBU12_x2", {"pylon3", "Pylon4", "pylon5", "Pylon6"}},
            "PylonRack_1Rnd_Missile_AGM_02_F",
            {"PylonRack_3Rnd_Missile_AGM_02_F", {"pylon5", "Pylon6"}},
            "PylonRack_Missile_HARM_x1",
            "PylonRack_3Rnd_LG_scalpel",
            {"PylonRack_Bomb_SDB_x4", {"pylon5", "Pylon6"}}
        };
        ammoOverrides[] = {
            {"Bomb_04_F", {"ammo_gbu12_gps", "GBU-12 (GPS-Guided)"}},
            {"Missile_AGM_02_F", {"Missile_AGM_02_Laser_F", "AGM-65 Maverick (Laser-Guided)"}}
        };
        cost = 19000;
        description = "A-149 Gryphon is a light multirole aircraft. It can optionally be armed with GPS-guided GBU-12 bombs.";
        disallowMagazines[] = {
            "PylonRack_Missile_AGM_02_x1",
            "PylonRack_Missile_AGM_02_x2"
        };
        hasHMD = 1;
        loadable[] = {0, -2.2, 1.4};
        name = "A-149 Gryphon";
        rearm = 420;
        requirements[] = {"A"};
        spawn = "I_Plane_Fighter_04_F";
        textures[] = {
            "a3\air_f_jets\plane_fighter_04\data\Fighter_04_fuselage_01_gray_co.paa",
            "a3\air_f_jets\plane_fighter_04\data\Fighter_04_fuselage_02_gray_co.paa",
            "a3\air_f_jets\plane_fighter_04\data\fighter_04_misc_01_co.paa",
            "a3\air_f_jets\plane_fighter_04\data\Numbers\Fighter_04_number_04_ca.paa",
            "a3\air_f_jets\plane_fighter_04\data\Numbers\Fighter_04_number_04_ca.paa",
            "a3\air_f_jets\plane_fighter_04\data\Numbers\Fighter_04_number_08_ca.paa"
        };

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "300Rnd_CMFlare_Chaff_Magazine",
                "120Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {
                "CMFlareLauncher_Singles"
            };
            removeMagazines[] = {
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            removeWeapons[] = {
                "CMFlareLauncher"
            };
            turret[] = { -1 };
        };
    };

    class B_Plane_Fighter_01_Growler_F {
        allowPylonMagazines[] = {
            "PylonRack_Missile_AMRAAM_D_x2",
            "PylonRack_Missile_HARM_x1",
            {"PylonRack_4Rnd_LG_scalpel", {"pylonBayCenter1", "pylonBayCenter2", "pylonBayCenter3", "pylonBayCenter4"}}
        };
        ammoOverrides[] = {
            {"M_Scalpel_AT", {"M_Sidearm", "AGM-122 Sidearm"}}
        };
        cost = 19000;
        disallowMagazines[] = {
            "PylonRack_Bomb_SDB_x4",
            "PylonRack_Bomb_GBU12_x2",
            "PylonMissile_Missile_BIM9X_x1",
            "PylonMissile_Bomb_GBU12_x1",
            "PylonRack_Missile_AGM_02_x1",
            "PylonRack_Missile_AGM_02_x2"
        };
        ecm[] = {{"MissileCore"}, 0, 30000, 1, 2, 120};
        hasAirRadar = 14000;
        hasHMD = 1;
        loadable[] = {0, -2.2, 1.6};
        name = "EF/A-181 Growler";
        rearm = 420;
        requirements[] = {"A"};
        spawn = "B_Plane_Fighter_01_F";
        threatDetection = 8000;
        variant = 1;

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "300Rnd_CMFlare_Chaff_Magazine",
                "300Rnd_CMFlare_Chaff_Magazine"
            };
            removeMagazines[] = {
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            turret[] = { -1 };
        };
    };

    class B_Plane_Fighter_01_F {
        allowPylonMagazines[] = {
            {"PylonRack_Missile_HARM_x1", {"pylon1", "pylon2"}},
            {"PylonRack_Bomb_SDB_x4", {"pylonBayCenter2"}}
        };
        cost = 26000;
        hasHMD = 1;
        loadable[] = {0, -2.2, 1.6};
        rearm = 420;
        requirements[] = {"A"};
        threatDetection = 12000;

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "300Rnd_CMFlare_Chaff_Magazine",
                "300Rnd_CMFlare_Chaff_Magazine"
            };
            removeMagazines[] = {
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            turret[] = { -1 };
        };
    }; // "F/A-181 Black Wasp II"

    class B_Plane_Fighter_01_Stealth_F {
        allowPylonMagazines[] = {
            {"PylonRack_Missile_HARM_x1", {"pylonBayLeft1", "pylonBayRight1"}},
            {"PylonRack_Bomb_SDB_x4", {"pylonBayCenter2"}},
            {"PylonRack_4Rnd_LG_scalpel", {"pylonBayCenter1", "pylonBayCenter3", "pylonBayCenter4"}},
            {"PylonRack_Missile_AMRAAM_D_x2", {"pylonBayCenter5", "pylonBayCenter6"}}
        };
        ammoOverrides[] = {
            {"Bomb_04_F", {"ammo_gbu12_gps", "GBU-12 (GPS-Guided)"}},
            {"ammo_Bomb_SDB", {"ammo_stormbreaker", "GBU-58 Stormbreaker"}},
            {"M_Scalpel_AT", {"M_Sidearm", "AGM-122 Sidearm"}}
        };
        cost = 28000;
        hasHMD = 1;
        hasReconOptics = 1;
        loadable[] = {0, -2.2, 1.6};
        name = "F/A-181 Black Wasp II (Stealth/Recon)";
        rearm = 420;
        requirements[] = {"A"};
        variant = 1;

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "300Rnd_CMFlare_Chaff_Magazine",
                "300Rnd_CMFlare_Chaff_Magazine"
            };
            removeMagazines[] = {
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            turret[] = { -1 };
        };
    };

    // class B_Plane_Fighter_01_Remote_F {
    //     allowPylonMagazines[] = {
    //         "PylonRack_Missile_HARM_x1",
    //         {"PylonMissile_Bomb_GBU12_x1", {"pylonBayCenter1", "pylonBayCenter2", "pylonBayCenter3", "pylonBayCenter4"}}
    //     };
    //     ammoOverrides[] = {
    //         {"Bomb_04_F", {"ammo_gbu15", "GBU-15 (TV-Guided)"}}
    //     };
    //     cost = 32000;
    //     description = "F/A-181 Black Wasp II (Land Attack) is a variant of the F/A-181 Black Wasp II with TV-guided GBU-15 bombs, which can be linked to and controlled at ground support terminals after release. Remote bombs can be controlled at ground support terminals in Buy Menu >> Remote Control >> Ground Support Terminal.";
    //     disallowMagazines[] = {
    //         "PylonMissile_Bomb_GBU12_x1"
    //     };
    //     hasHMD = 1;
    //     name = "F/A-181 Black Wasp II (Land Attack)";
    //     rearm = 1200;
    //     requirements[] = {"A"};
    //     spawn = "B_Plane_Fighter_01_F";
    //     variant = 1;
    // };

    // class B_Plane_Fighter_01_GPS_F {
    //     allowPylonMagazines[] = {
    //         "PylonRack_Missile_HARM_x1",
    //         {"PylonMissile_Bomb_GBU12_x1", {"pylonBayCenter1", "pylonBayCenter2", "pylonBayCenter3", "pylonBayCenter4"}}
    //     };
    //     ammoOverrides[] = {
    //         {"Bomb_04_F", {"ammo_gbu12_gps", "GBU-12 (GPS-Guided)"}}
    //     };
    //     cost = 31000;
    //     description = "F/A-181 Black Wasp II (Standoff) is a variant of the F/A-181 Black Wasp II with a GPS-guided GBU-12 launcher.";
    //     disallowMagazines[] = {
    //         "PylonMissile_Bomb_GBU12_x1"
    //     };
    //     hasHMD = 1;
    //     name = "F/A-181 Black Wasp II (Standoff)";
    //     rearm = 1200;
    //     requirements[] = {"A"};
    //     spawn = "B_Plane_Fighter_01_F";
    //     variant = 1;
    // };
};