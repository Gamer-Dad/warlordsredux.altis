class FixedWing {
    class O_Plane_Civil_01_F {
        cost = 800;
        description = "Caesar BTT is a light unarmed aircraft.";
        name = "Caesar BTT";
        requirements[] = {"A"};
        spawn = "C_Plane_Civil_01_F";
    };

    // class O_Plane_Caesar_hmggmg_01_F {
    //     cost = 1500;
    //     description = "Caesar BTT (HMG/GMG) is a variant of the Caesar BTT armed with a HMG and GMG.";
    //     name = "Caesar BTT (HMG/GMG)";
    //     rearm = 300;
    //     requirements[] = {"A"};
    //     spawn = "C_Plane_Civil_01_F";
    //     variant = 1;
    //
    //     class Gunner: WLTurretDefaults {
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
    //         removeMagazines[] = {};
    //         removeWeapons[] = {};
    //         turret[] = { -1 };
    //     };
    // };

    // class O_Plane_Caesar_rocket_01_F {
    //     cost = 1800;
    //     description = "Caesar BTT (Rocket) is a variant of the Caesar BTT armed with rockets.";
    //     name = "Caesar BTT (Rocket)";
    //     rearm = 400;
    //     requirements[] = {"A"};
    //     spawn = "C_Plane_Civil_01_F";
    //     variant = 1;

    //     class Pilot: WLTurretDefaults {
    //         addMagazines[] = {
    //             "14Rnd_80mm_rockets",
    //             "14Rnd_80mm_rockets",
    //             "240Rnd_CMFlare_Chaff_Magazine"
    //         };
    //         addWeapons[] = {
    //             "rockets_Skyfire",
    //             "CMFlareLauncher"
    //         };
    //         removeMagazines[] = {};
    //         removeWeapons[] = {};
    //         turret[] = { -1 };
    //     };
    // };

    class O_Plane_Caesar_bomb_01_F {
        ammoOverrides[] = {
            {"Bomb_03_F", {"ammo_kab250se", "KAB-250SE (GPS-Guided)"}}
        };
        cost = 1500;
        description = "Caesar BTT (Bomb) is a variant of the Caesar BTT armed with a pair of GPS-guided KAB-250SE bombs. How to use:<br/>1. Use scroll wheel menu to configure GPS munition target.<br/>2. Launch KAB-250SE.";
        hasGPSMunition = 1;
        hasHMD = 1;
        name = "Caesar BTT (Bomb)";
        rearm = 300;
        requirements[] = {"A"};
        spawn = "C_Plane_Civil_01_F";
        variant = 1;

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "2Rnd_Bomb_03_F",
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {
                "Bomb_03_Plane_CAS_02_F",
                "CMFlareLauncher"
            };
            turret[] = { -1 };
        };
    };

    // class O_T_VTOL_02_recon_F {
    //     cost = 3800;
    //     description = "Y-32 Xi'an (AWACS) is a variant of the Y-32 Xi'an with a powerful air radar.";
    //     disallowMagazines[] = {
    //         "PylonMissile_1Rnd_LG_scalpel",
    //         "PylonRack_3Rnd_LG_scalpel",
    //         "PylonRack_4Rnd_LG_scalpel",
    //         "PylonWeapon_300Rnd_20mm_shells",
    //         "PylonRack_20Rnd_Rocket_03_HE_F",
    //         "PylonRack_20Rnd_Rocket_03_AP_F",
    //         "PylonRack_19Rnd_Rocket_Skyfire",
    //         "PylonRack_1Rnd_Missile_AA_03_F",
    //         "PylonRack_1Rnd_Missile_AGM_01_F",
    //         "PylonMissile_1Rnd_Bomb_03_F",
    //         "PylonMissile_1Rnd_BombCluster_02_F"
    //     };
    //     hasAWACS = 1;
    //     hasHMD = 1;
    //     name = "Y-32 Xi'an (AWACS)";
    //     requirements[] = {"A"};
    //     spawn = "O_T_VTOL_02_infantry_dynamicLoadout_F";

    //     class Pilot: WLTurretDefaults {
    //         addMagazines[] = {
    //             "240Rnd_CMFlare_Chaff_Magazine",
    //             "Laserbatteries"
    //         };
    //         addWeapons[] = {
    //             "CMFlareLauncher_Singles",
    //             "Laserdesignator_mounted"
    //         };
    //         deviceJammer = 1;
    //         removeMagazines[] = {
    //             "168Rnd_CMFlare_Chaff_Magazine"
    //         };
    //         removeWeapons[] = {
    //             "CMFlareLauncher_Triples"
    //         };
    //         turret[] = { -1 };
    //     };

    //     class Gunner: WLTurretDefaults {
    //         addMagazines[] = {};
    //         addWeapons[] = {};
    //         removeMagazines[] = {
    //             "250Rnd_30mm_HE_shells_Tracer_Green",
    //             "250Rnd_30mm_APDS_shells_Tracer_Green",
    //             "Laserbatteries"
    //         };
    //         removeWeapons[] = {
    //             "gatling_30mm_VTOL_02",
    //             "Laserdesignator_mounted"
    //         };
    //         turret[] = { 0 };
    //     };
    // };

    class O_T_VTOL_02_infantry_dynamicLoadout_F {
        allowPylonMagazines[] = {
            "PylonRack_12Rnd_PG_missiles",
            "PylonRack_12Rnd_PGM_missiles",
            "PylonMissile_Missile_KH58_INT_x1",
            "PylonFuelTank_UH80"
        };
        ammoOverrides[] = {
            {"DummyPylonAmmo", {"M_ECMPod", "ECM Jammer Pod"}}
        };
        cost = 12000;
        ecm[] = {{"MissileCore"}, 1, 10000, 1, 4, 15};
        hasHMD = 1;
        rearm = 300;
        requirements[] = {"A"};

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {
                "CMFlareLauncher_Singles"
            };
            removeMagazines[] = {
                "168Rnd_CMFlare_Chaff_Magazine"
            };
            removeWeapons[] = {
                "CMFlareLauncher_Triples"
            };
            turret[] = { -1 };
        };
    }; // "Y-32 Xi'an (Infantry Transport)"

    class O_Plane_Fighter_03_dynamicLoadout_F {
        allowPylonMagazines[] = {
            "PylonRack_12Rnd_PGM_missiles",
            {"PylonMissile_Bomb_KAB250_x1", {"Pylons2", "Pylons3", "Pylons4", "Pylons5", "Pylons6"}}
        };
        ammoOverrides[] = {
            {"Bomb_03_F", {"ammo_kab250kr", "KAB-250KR (TV-Guided)"}}
        };
        cost = 13000;
        description = "A-143 Buzzard (CAS) is a light CAS aircraft. It can optionally be armed with TV-guided KAB-250KR bombs, which can be linked to and controlled at ground support terminals after release. Remote bombs can be controlled at ground support terminals in Buy Menu >> Remote Control >> Ground Support Terminal.";
        hasHMD = 1;
        hasRemoteBomb = 1;
        name = "A-143 Buzzard (CAS)";
        rearm = 420;
        requirements[] = {"A"};
        spawn = "I_Plane_Fighter_03_dynamicLoadout_F";
        textures[] = {
            "\a3\Air_F_Gamma\Plane_Fighter_03\Data\Plane_Fighter_03_body_1_brownhex_CO.paa",
            "\a3\Air_F_Gamma\Plane_Fighter_03\Data\Plane_Fighter_03_body_2_brownhex_CO.paa"
        };

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {};
            removeMagazines[] = {
                "120Rnd_CMFlare_Chaff_Magazine"
            };
            removeWeapons[] = {};
            turret[] = { -1 };
        };
    };

    class O_Plane_CAS_02_dynamicLoadout_F {
        allowPylonMagazines[] = {
            "PylonRack_12Rnd_PG_missiles",
            "PylonRack_12Rnd_PGM_missiles"
        };
        cost = 17000;
        hasHMD = 1;
        rearm = 420;
        requirements[] = {"A"};

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {};
            removeMagazines[] = {
                "120Rnd_CMFlare_Chaff_Magazine"
            };
            removeWeapons[] = {};
            turret[] = { -1 };
        };
    }; // "To-199 Neophron (CAS)"

    // class O_Plane_Fighter_02_Gyrfalcon_F {
    //     allowPylonMagazines[] = {
    //         {"PylonMissile_Missile_KH58_INT_x1", {"pylons1", "pylons2", "pylons3", "pylons4", "pylons5", "pylons6", "pylonBayCenter1", "pylonBayCenter2", "pylonBayCenter3", "pylonBayLeft1", "pylonBayRight1", "pylonBayLeft2", "pylonBayRight2"}},
    //         {"PylonMissile_Missile_AA_R77_INT_x1", {"pylonBayCenter1", "pylonBayCenter2", "pylonBayCenter3", "pylonBayLeft1", "pylonBayRight1"}}
    //     };
    //     cost = 25000;
    //     disallowMagazines[] = {
    //         "PylonMissile_Missile_KH58_x1",
    //         "PylonMissile_Missile_AGM_KH25_x1",
    //         "PylonMissile_Missile_AGM_KH25_INT_x1",
    //         "PylonMissile_Bomb_KAB250_x1"
    //     };
    //     hasAWACS = 1;
    //     hasHMD = 1;
    //     name = "J-30 Gyrfalcon";
    //     rearm = 720;
    //     requirements[] = {"A"};
    //     spawn = "O_Plane_Fighter_02_F";
    //     variant = 1;

    //     class Pilot: WLTurretDefaults {
    //         addMagazines[] = {
    //             "240Rnd_CMFlare_Chaff_Magazine"
    //         };
    //         addWeapons[] = {
    //             "CMFlareLauncher_Singles"
    //         };
    //         removeMagazines[] = {};
    //         removeWeapons[] = {
    //             "CMFlareLauncher"
    //         };
    //         turret[] = { -1 };
    //     };
    // };

    class O_Plane_Fighter_02_F {
        allowPylonMagazines[] = {
            "PylonMissile_Missile_KH58_INT_x1",
            {"PylonRack_Bomb_SDB_x4", {"pylonBayCenter3"}}
        };
        cost = 25000;
        disallowMagazines[] = {
            "PylonMissile_Missile_KH58_x1"
        };
        hasHMD = 1;
        rearm = 420;
        requirements[] = {"A"};

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {
                "CMFlareLauncher_Singles"
            };
            removeMagazines[] = {};
            removeWeapons[] = {
                "CMFlareLauncher"
            };
            turret[] = { -1 };
        };
    }; // "To-201 Shikra"

    class O_Plane_Fighter_02_Stealth_F {
        allowLoal = 1;
        allowPylonMagazines[] = {
            {"PylonMissile_Bomb_KAB250_x1", {"pylonBayCenter1", "pylonBayCenter2", "pylonBayLeft2", "pylonBayRight2"}},
            "PylonMissile_Missile_KH58_INT_x1",
            {"PylonRack_Bomb_SDB_x4", {"pylonBayCenter2", "pylonBayCenter3"}},
            {"PylonRack_4Rnd_LG_scalpel", {"pylonBayCenter1", "pylonBayCenter2", "pylonBayCenter3", "pylonBayLeft2", "pylonBayRight2"}}
        };
        ammoOverrides[] = {
            {"ammo_Bomb_SDB", {"ammo_upmk_d30", "UMPK D-30SN (GPS-Guided)"}},
            {"Bomb_03_F", {"ammo_kab250se", "KAB-250S-E (GPS-Guided)"}},
            {"M_Scalpel_AT", {"M_Sidearm", "AGM-122 Sidearm"}}
        };
        cost = 25000;
        description = "To-201 Shikra (Stealth/Recon) is a stealthy variant of the To-201 Shikra armed with a GPS-guided KAB-250S-E launcher. How to use:<br/>1. Use scroll wheel menu to configure GPS munition target.<br/>2. Launch KAB-250.";
        disallowMagazines[] = {
            "PylonMissile_Missile_KH58_x1"
        };
        hasGPSMunition = 1;
        hasHMD = 1;
        hasReconOptics = 1;
        name = "To-201 Shikra (Stealth/Recon)";
        rearm = 420;
        requirements[] = {"A"};
        variant = 1;

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {
                "CMFlareLauncher_Singles"
            };
            removeMagazines[] = {};
            removeWeapons[] = {
                "CMFlareLauncher"
            };
            turret[] = { -1 };
        };
    };

    // class O_Plane_Fighter_02_Remote_F {
    //     allowPylonMagazines[] = {
    //         {"PylonMissile_Bomb_KAB250_x1", {"pylonBayCenter1", "pylonBayCenter2", "pylonBayLeft2", "pylonBayRight2"}},
    //         "PylonMissile_Missile_KH58_INT_x1"
    //     };
    //     ammoOverrides[] = {
    //         {"Bomb_03_F", {"ammo_kab250kr", "KAB-250KR (TV-Guided)"}}
    //     };
    //     cost = 32000;
    //     description = "To-201 Shikra (Land Attack) is a variant of the To-201 Shikra armed with TV-guided KAB-250KR bombs, which can be linked to and controlled at ground support terminals after release. Remote bombs can be controlled at ground support terminals in Buy Menu >> Remote Control >> Ground Support Terminal.";
    //     disallowMagazines[] = {
    //         "PylonMissile_Missile_KH58_x1"
    //     };
    //     hasHMD = 1;
    //     hasRemoteBomb = 1;
    //     name = "To-201 Shikra (Land Attack)";
    //     rearm = 1200;
    //     requirements[] = {"A"};
    //     spawn = "O_Plane_Fighter_02_F";
    //     variant = 1;

    //     class Pilot: WLTurretDefaults {
    //         addMagazines[] = {};
    //         addWeapons[] = {
    //             "CMFlareLauncher_Singles"
    //         };
    //         removeMagazines[] = {};
    //         removeWeapons[] = {
    //             "CMFlareLauncher"
    //         };
    //         turret[] = { -1 };
    //     };
    // };

    // class O_Plane_Fighter_02_GPS_F {
    //     allowPylonMagazines[] = {
    //         {"PylonMissile_Bomb_KAB250_x1", {"pylonBayCenter1", "pylonBayCenter2", "pylonBayLeft2", "pylonBayRight2"}},
    //         "PylonMissile_Missile_KH58_INT_x1"
    //     };
    //     ammoOverrides[] = {
    //         {"Bomb_03_F", {"ammo_kab250se", "KAB-250S-E (GPS-Guided)"}}
    //     };
    //     cost = 30000;
    //     description = "To-201 Shikra (Standoff) is a variant of the To-201 Shikra armed with a GPS-guided KAB-250S-E launcher. How to use:<br/>1. Use scroll wheel menu to configure GPS munition target.<br/>2. Launch KAB-250.";
    //     disallowMagazines[] = {
    //         "PylonMissile_Missile_KH58_x1"
    //     };
    //     hasGPSMunition = 1;
    //     hasHMD = 1;
    //     name = "To-201 Shikra (Standoff)";
    //     rearm = 1200;
    //     requirements[] = {"A"};
    //     spawn = "O_Plane_Fighter_02_F";
    //     variant = 1;

    //     class Pilot: WLTurretDefaults {
    //         addMagazines[] = {};
    //         addWeapons[] = {
    //             "CMFlareLauncher_Singles"
    //         };
    //         removeMagazines[] = {};
    //         removeWeapons[] = {
    //             "CMFlareLauncher"
    //         };
    //         turret[] = { -1 };
    //     };
    // };
};