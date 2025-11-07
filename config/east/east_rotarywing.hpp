class RotaryWing {
    class O_Heli_Transport_04_covered_F {
        cost = 400;
        hasFastTravel = 1;
        offset[] = {0, 10, 0};
        requirements[] = {"H"};
    }; // "Mi-290 Taru (Transport)"

    class O_Heli_Transport_04_F {
        cost = 500;
        hasFastTravel = 1;
        offset[] = {0, 10, 0};
        requirements[] = {"H"};
    }; // "Mi-290 Taru"

    class O_Heli_Transport_04_medevac_F {
        cost = 500;
        hasFastTravel = 1;
        offset[] = {0, 10, 0};
        requirements[] = {"H"};
    }; // "Mi-290 Taru (Medical)"

    class O_Heli_Light_02_unarmed_F {
        cost = 500;
        hasHMD = 1;
        offset[] = {0, 10, 0};
        requirements[] = {"H"};
    }; // "PO-30 Orca (Unarmed)"

    class O_Heli_Transport_02_F {
        cost = 500;
        hasHMD = 1;
        name = "CH-49 Mohawk";
        offset[] = {0, 10, 0};
        requirements[] = {"H"};
        spawn = "I_Heli_Transport_02_F";
        textures[] = {
            "A3\Air_F_Beta\Heli_Transport_02\Data\Skins\Heli_Transport_02_1_DAHOMAN_CO.paa",
            "A3\Air_F_Beta\Heli_Transport_02\Data\Skins\Heli_Transport_02_2_DAHOMAN_CO.paa",
            "A3\Air_F_Beta\Heli_Transport_02\Data\Skins\Heli_Transport_02_3_DAHOMAN_CO.paa",
            "A3\Air_F_Beta\Heli_Transport_02\Data\Heli_Transport_02_int_02_CO.paa"
        };
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
                "CMFlareLauncher"
            };
            turret[] = { -1 };
        };
    };

    // class O_Heli_Transport_04_recon_F {
    //     cost = 2500;
    //     description = "Mi-290 Taru (Recon) is a variant of the Mi-290 Taru with a recon scanner. Use the copilot camera to look for targets and use the fire (LMB) or lock target (T) buttons to mark them for your team.";
    //     hasHMD = 1;
    //     // hasScanner = 1;
    //     hasReconOptics = 1;
    //     name = "Mi-290 Taru (Recon)";
    //     offset[] = {0, 10, 0};
    //     requirements[] = {"H"};
    //     spawn = "O_Heli_Transport_04_box_F";
    //     variant = 1;

    //     class Pilot: WLTurretDefaults {
    //         addMagazines[] = {
    //             "240Rnd_CMFlare_Chaff_Magazine"
    //         };
    //         addWeapons[] = {
    //             "CMFlareLauncher_Singles"
    //         };
    //         removeMagazines[] = {
    //             "168Rnd_CMFlare_Chaff_Magazine"
    //         };
    //         removeWeapons[] = {
    //             "CMFlareLauncher"
    //         };
    //         turret[] = { -1 };
    //     };
    // };

    class O_Heli_Light_02_dynamicLoadout_F {
        allowPylonMagazines[] = {
            "PylonRack_12Rnd_PGM_missiles",
            "PylonRack_3Rnd_LG_scalpel",
            "PylonRack_4Rnd_LG_scalpel",
            "PylonMissile_Missile_AA_R73_x1",
            "PylonRack_Missile_BIM9X_x2",
            "PylonFuelTank_UH80"
        };
        ammoOverrides[] = {
            {"DummyPylonAmmo", {"M_ECMPod", "ECM Jammer Pod"}},
            {"M_Scalpel_AT", {"M_Sidearm", "AGM-122 Sidearm"}}
        };
        cost = 3500;
        ecm[] = {{"MissileCore"}, 1, 5000, 1, 4, 30};
        hasHMD = 1;
        offset[] = {0, 10, 0};
        rearm = 240;
        requirements[] = {"H"};

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "300Rnd_CMFlare_Chaff_Magazine",
                "1000Rnd_20mm_shells"
            };
            addWeapons[] = {
                "CMFlareLauncher_Singles",
                "Twin_Cannon_20mm_gunpod"
            };
            removeMagazines[] = {
                "168Rnd_CMFlare_Chaff_Magazine"
            };
            removeWeapons[] = {
                "CMFlareLauncher"
            };
            turret[] = { -1 };
        };
    }; // "PO-30 Orca"

    // class O_Heli_Transport_02_ATGM_F {
    //     ammoOverrides[] = {
    //         {"M_Vorona_HEAT", {"M_HJ12", "HJ-12 (TV-Guided)"}},
    //         {"M_Vorona_HE", {"M_HJ12", "HJ-12 HE (TV-Guided)"}}
    //     };
    //     cost = 5000;
    //     hasHMD = 1;
    //     name = "CH-49 Mohawk (ATGM)";
    //     offset[] = {0, 10, 0};
    //     requirements[] = {"H"};
    //     spawn = "I_Heli_Transport_02_F";
    //     textures[] = {
    //         "\A3\Air_F_beta\Heli_Transport_02\Data\Skins\Heli_Transport_02_1_ion_CO.paa",
    //         "\A3\Air_F_beta\Heli_Transport_02\Data\Skins\Heli_Transport_02_2_ion_CO.paa",
    //         "\A3\Air_F_beta\Heli_Transport_02\Data\Skins\Heli_Transport_02_3_ion_CO.paa",
    //         "\A3\Air_F_Beta\Heli_Transport_02\Data\Heli_Transport_02_int_02_CO.paa"
    //     };
    //     rearm = 400;
    //     variant = 1;

    //     class Pilot: WLTurretDefaults {
    //         addMagazines[] = {
    //             "240Rnd_CMFlare_Chaff_Magazine",
    //             "Vorona_HEAT",
    //             "Vorona_HEAT",
    //             "Vorona_HEAT",
    //             "Vorona_HEAT",
    //             "Vorona_HEAT",
    //             "Vorona_HEAT"
    //         };
    //         addWeapons[] = {
    //             "CMFlareLauncher_Singles",
    //             "missiles_Vorona"
    //         };
    //         removeMagazines[] = {
    //             "168Rnd_CMFlare_Chaff_Magazine"
    //         };
    //         removeWeapons[] = {
    //             "CMFlareLauncher"
    //         };
    //         turret[] = { -1 };
    //     };
    // };

    class O_Heli_Attack_02_dynamicLoadout_F {
        allowPylonMagazines[] = {
            "PylonRack_12Rnd_PG_missiles",
            "PylonRack_12Rnd_PGM_missiles",
            "PylonMissile_Missile_KH58_INT_x1",
            "PylonMissile_Missile_AA_R73_x1",
            "PylonFuelTank_UH80"
        };
        ammoOverrides[] = {
            {"DummyPylonAmmo", {"M_ECMPod", "ECM Jammer Pod"}},
            {"M_Scalpel_AT", {"M_Sidearm", "AGM-122 Sidearm"}}
        };
        cost = 8000;
        ecm[] = {{"MissileCore"}, 1, 6000, 1, 6, 30};
        hasGunnerAction = 1;
        hasHMD = 1;
        hasTurretVisualizer = 1;
        offset[] = {0, 11, 0};
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
                "192Rnd_CMFlare_Chaff_Magazine"
            };
            removeWeapons[] = {
                "CMFlareLauncher"
            };
            turret[] = { -1 };
        };
        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "250Rnd_30mm_HE_shells_Tracer_Green",
                "250Rnd_30mm_HE_shells_Tracer_Green"
            };
            deviceJammer = 1;
            turret[] = { 0 };
        };
    }; // "Mi-48 Kajman"
};