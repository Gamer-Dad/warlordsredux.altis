class RotaryWing {
    class B_Heli_Light_01_F {
        cost = 300;
        requirements[] = {"H"};
    }; // "MH-9 Hummingbird"

    class B_Heli_Transport_01_F {
        cost = 800;
        hasHMD = 1;
        hasTurretVisualizer = 1;
        offset[] = {0, 11, 0};
        rearm = 240;
        requirements[] = {"H"};
    }; // "UH-80 Ghost Hawk"

    class B_Heli_Transport_03_F {
        cost = 1000;
        hasTurretVisualizer = 1;
        offset[] = {0, 10, 0};
        rearm = 240;
        requirements[] = {"H"};
    }; // "CH-67 Huron"

    class B_Heli_Light_01_dynamicLoadout_F {
        allowPylonMagazines[] = {
            "PylonRack_3Rnd_LG_scalpel",
            "PylonRack_19Rnd_Rocket_Skyfire",
            "PylonRack_12Rnd_PGM_missiles"
        };
        cost = 2500;
        hasHMD = 1;
        rearm = 240;
        requirements[] = {"H"};

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "168Rnd_CMFlare_Chaff_Magazine",
                "PylonWeapon_300Rnd_20mm_shells",
                "PylonWeapon_300Rnd_20mm_shells"
            };
            addWeapons[] = {
                "CMFlareLauncher_Singles",
                "Twin_Cannon_20mm_gunpod"
            };
            removeMagazines[] = {
                "5000Rnd_762x51_Belt"
            };
            removeWeapons[] = {
                "M134_minigun"
            };
            turret[] = { -1 };
        };
    }; // "AH-9 Pawnee"

    // class B_Heli_Transport_01_UP_F {
    //     ammoOverrides[] = {
    //         {"M_127mm_Firefist_AT", {"M_Spike", "Spike (TV-Guided)"}}
    //     };
    //     cost = 3200;
    //     description = "UH-80 Ghost Hawk UP is a variant of the UH-80 Ghost Hawk armed with autocannons (gunners) and Spike missiles (copilot).";
    //     hasHMD = 1;
    //     name = "UH-80 Ghost Hawk UP";
    //     offset[] = {0, 11, 0};
    //     rearm = 400;
    //     requirements[] = {"H"};
    //     spawn = "B_Heli_Transport_01_F";
    //     variant = 1;

    //     class Copilot: WLTurretDefaults {
    //         addMagazines[] = {
    //             "2Rnd_127mm_Firefist_missiles",
    //             "2Rnd_127mm_Firefist_missiles"
    //         };
    //         addWeapons[] = {
    //             "missiles_Firefist"
    //         };
    //         turret[] = { 0 };
    //     };

    //     class LeftGunner: WLTurretDefaults {
    //         addMagazines[] = {
    //             "250Rnd_30mm_HE_shells_Tracer_Green",
    //             "250Rnd_30mm_HE_shells_Tracer_Green",
    //             "250Rnd_30mm_APDS_shells_Tracer_Green",
    //             "250Rnd_30mm_APDS_shells_Tracer_Green"
    //         };
    //         addWeapons[] = {
    //             "gatling_30mm"
    //         };
    //         removeMagazines[] = {
    //             "2000Rnd_65x39_Belt_Tracer_Red"
    //         };
    //         removeWeapons[] = {
    //             "LMG_Minigun_Transport"
    //         };
    //         turret[] = { 1 };
    //     };

    //     class RightGunner: WLTurretDefaults {
    //         addMagazines[] = {
    //             "250Rnd_30mm_HE_shells_Tracer_Green",
    //             "250Rnd_30mm_HE_shells_Tracer_Green",
    //             "250Rnd_30mm_APDS_shells_Tracer_Green",
    //             "250Rnd_30mm_APDS_shells_Tracer_Green"
    //         };
    //         addWeapons[] = {
    //             "gatling_30mm"
    //         };
    //         removeMagazines[] = {
    //             "2000Rnd_65x39_Belt_Tracer_Red"
    //         };
    //         removeWeapons[] = {
    //             "LMG_Minigun_Transport2"
    //         };
    //         turret[] = { 2 };
    //     };
    // };

    // class B_Heli_Light_01_hmd_F {
    //     allowPylonMagazines[] = {
    //         "PylonRack_3Rnd_LG_scalpel",
    //         "PylonRack_19Rnd_Rocket_Skyfire",
    //         "PylonRack_12Rnd_PGM_missiles"
    //     };
    //     cost = 4000;
    //     description = "AH-9 Pawnee Block II is a variant of the AH-9 Pawnee with advanced avionics.";
    //     hasHMD = 1;
    //     name = "AH-9 Pawnee Block II";
    //     rearm = 300;
    //     requirements[] = {"H"};
    //     spawn = "B_Heli_Light_01_dynamicLoadout_F";
    //     textures[] = {
    //         "A3\air_f\Heli_Light_01\Data\Skins\Heli_Light_01_ext_digital_co.paa"
    //     };
    //     variant = 1;

    //     class Pilot: WLTurretDefaults {
    //         addMagazines[] = {
    //             "168Rnd_CMFlare_Chaff_Magazine",
    //             "PylonWeapon_300Rnd_20mm_shells",
    //             "PylonWeapon_300Rnd_20mm_shells"
    //         };
    //         addWeapons[] = {
    //             "CMFlareLauncher",
    //             "Twin_Cannon_20mm_gunpod"
    //         };
    //         removeMagazines[] = {
    //             "5000Rnd_762x51_Belt"
    //         };
    //         removeWeapons[] = {
    //             "M134_minigun"
    //         };
    //         turret[] = { -1 };
    //     };
    // };

    class B_Heli_light_03_dynamicLoadout_F {
        allowPylonMagazines[] = {
            "PylonRack_Missile_HARM_x1",
            "PylonRack_19Rnd_Rocket_Skyfire",
            "PylonRack_12Rnd_PGM_missiles",
            "PylonFuelTank_UH80"
        };
        ammoOverrides[] = {
            {"DummyPylonAmmo", {"M_ECMPod", "ECM Jammer Pod"}},
            {"M_Scalpel_AT", {"M_Sidearm", "AGM-122 Sidearm"}}
        };
        cost = 5000;
        description = "WY-55 Hellcat is a light attack helicopter.";
        hasHMD = 1;
        name = "WY-55 Hellcat";
        offset[] = {0, 9, 0};
        rearm = 240;
        requirements[] = {"H"};
        spawn = "I_Heli_light_03_dynamicLoadout_F";
        textures[] = {
            "\A3\Air_F_Enoch\Heli_Light_03\data\Heli_Light_03_base_EAF_CO.paa",
            "\a3\Supplies_F_Enoch\Ammoboxes\Data\AmmoBox_EAF_CO.paa",
            "\a3\Supplies_F_Enoch\Ammoboxes\Data\AmmoBox_signs_EAF_CA.paa"
        };

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "300Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {
                "CMFlareLauncher_Singles"
            };
            removeMagazines[] = {
                "168Rnd_CMFlare_Chaff_Magazine"
            };
            removeWeapons[] = {
                "CMFlareLauncher"
            };
            turret[] = { -1 };
        };
    };

    class B_Heli_Transport_01_pylons_F {
        ammoOverrides[] = {
            {"DummyPylonAmmo", {"M_ECMPod", "ECM Jammer Pod"}}
        };
        cost = 5500;
        ecm[] = {{"MissileCore"}, 1, 10000, 1, 4, 15};
        hasHMD = 1;
        name = "UH-80 Ghost Hawk Block II";
        offset[] = {0, 11, 0};
        rearm = 300;
        requirements[] = {"H"};

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "300Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {
                "CMFlareLauncher"
            };
            removeMagazines[] = {
                "168Rnd_CMFlare_Chaff_Magazine"
            };
            removeWeapons[] = {
                "CMFlareLauncher"
            };
            turret[] = { -1 };
        };
    };

    class B_Heli_Attack_01_dynamicLoadout_F {
        allowPylonMagazines[] = {
            "PylonRack_Missile_BIM9X_x1",
            {"PylonRack_Missile_BIM9X_x2", {"PylonLeft1", "PylonLeft3", "PylonRight1", "PylonRight3"}},
            {"PylonRack_Missile_HARM_x1", {"PylonLeft1", "PylonLeft3", "PylonRight1", "PylonRight3"}},
            {"PylonRack_12Rnd_PGM_missiles", {"PylonLeft1", "PylonLeft3", "PylonRight1", "PylonRight3"}},
            {"PylonRack_3Rnd_LG_scalpel", {"PylonLeft1", "PylonLeft3", "PylonRight1", "PylonRight3"}}
        };
        ammoOverrides[] = {
            {"M_Scalpel_AT", {"M_Sidearm", "AGM-122 Sidearm"}}
        };
        cost = 11000;
        hasGunnerAction = 1;
        hasHMD = 1;
        hasTurretVisualizer = 1;
        offset[] = {0, 10, 0};
        rearm = 300;
        requirements[] = {"H"};

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "300Rnd_CMFlare_Chaff_Magazine"
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

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "1000Rnd_20mm_shells"
            };
            deviceJammer = 1;
            turret[] = { 0 };
        };
    }; // "AH-99 Blackfoot"

    class B_Heli_Attack_01_pylons_dynamicLoadout_F {
        allowPylonMagazines[] = {
            "PylonRack_Missile_BIM9X_x1",
            {"PylonRack_Missile_BIM9X_x2", {"PylonExternalLeft", "PylonExternalRight", "PylonLeft1", "PylonLeft3", "PylonRight1", "PylonRight3"}},
            {"PylonRack_Missile_HARM_x1", {"PylonExternalLeft", "PylonLeft1", "PylonLeft3", "PylonExternalRight", "PylonRight1", "PylonRight3"}},
            {"PylonRack_12Rnd_PGM_missiles", {"PylonExternalLeft", "PylonLeft1", "PylonLeft3", "PylonExternalRight", "PylonRight1", "PylonRight3"}},
            {"PylonRack_3Rnd_LG_scalpel", {"PylonLeft1", "PylonLeft3", "PylonRight1", "PylonRight3"}},
            {"PylonFuelTank_UH80", {"PylonExternalLeft", "PylonExternalRight"}}
        };
        ammoOverrides[] = {
            {"DummyPylonAmmo", {"M_ECMPod", "ECM Jammer Pod"}},
            {"M_Scalpel_AT", {"M_Sidearm", "AGM-122 Sidearm"}}
        };
        cost = 13000;
        ecm[] = {{"MissileCore"}, 1, 10000, 1, 4, 15};
        hasGunnerAction = 1;
        hasHMD = 1;
        hasTurretVisualizer = 1;
        name = "AH-99 Blackfoot Block II";
        offset[] = {0, 10, 0};
        rearm = 300;
        requirements[] = {"H"};

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "300Rnd_CMFlare_Chaff_Magazine"
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

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "1000Rnd_20mm_shells"
            };
            deviceJammer = 1;
            turret[] = { 0 };
        };
    };

    // class B_Heli_Attack_01_sead_F: B_Heli_Attack_01_dynamicLoadout_F {
    //     cost = 18000;
    //     description = "AH-99 Blackfoot Block II is a variant of the AH-99 Blackfoot with a powerful device jammer. Gunner seat must be player-operated.";
    //     name = "AH-99 Blackfoot Block II";
    //     spawn = "B_Heli_Attack_01_dynamicLoadout_F";
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

    //     class Gunner: WLTurretDefaults {
    //         addMagazines[] = {};
    //         addWeapons[] = {};
    //         deviceJammer = 1;
    //         removeMagazines[] = {
    //             "1000Rnd_20mm_shells"
    //         };
    //         removeWeapons[] = {
    //             "gatling_20mm"
    //         };
    //         turret[] = { 0 };
    //     };
    // };
};