class RemoteControl {
    class O_UGV_02_Demining_F {
        cost = 100;
        loadable[] = {0, -1, -0.5};
        offset[] = {0, 3, 0};
        rearm = 120;
    };  // "UGAS demining"

    class O_UGV_01_F {
        cost = 150;
        loadable[] = {-0.4, -1, 1.1};
        offset[] = {0, 5, 0};
    };  // "UGV Stomper"

    class O_UAV_01_F {
        cost = 500;
        hasHMD = 1;
        offset[] = {0, 3, 0};
    };  // "AR-2"

    class O_UGV_01_rcws_F {
        cost = 500;
        loadable[] = {-0.4, -1, 1.1};
        offset[] = {0, 5, 0};
        rearm = 120;
    };  // "UGV Stomper RCWS"

    class O_UAV_06_F {
        cost = 1000;
        offset[] = {0, 3, 0};
    };  // "AR-6"

    class O_UAV_06_grenade_F {
        cost = 3500;
        description = "AL-6 Jinaah UP is a variant of the AL-6 Jinaah armed with a grenade dropper.";
        hasHMD = 1;
        name = "AL-6 Jinaah UP";
        offset[] = {0, 3, 0};
        rearm = 300;
        spawn = "O_UAV_06_F";
        variant = 1;

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "PylonRack_4Rnd_BombDemine_01_F",
                "PylonRack_4Rnd_BombDemine_01_F"
            };
            addWeapons[] = {
                "BombDemine_01_F"
            };
            turret[] = { -1 };
        };
    };

    // class O_UAV_01_UP_F {
    //     cost = 1200;
    //     description = "AR-2 Darter UP is a variant of the AR-2 Darter armed with a 45ACP SMG.";
    //     hasHMD = 1;
    //     name = "AR-2 Darter UP";
    //     offset[] = {0, 3, 0};
    //     rearm = 300;
    //     requirements[] = {};
    //     spawn = "O_UAV_01_F";
    //     variant = 1;

    //     class Gunner: WLTurretDefaults {
    //         addMagazines[] = {
    //             "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
    //             "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
    //             "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
    //             "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
    //             "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
    //             "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
    //             "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
    //             "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
    //             "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
    //             "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow"
    //         };
    //         addWeapons[] = {
    //             "SMG_01_F"
    //         };
    //         removeMagazines[] = {};
    //         removeWeapons[] = {};
    //         turret[] = { 0 };
    //     };
    // };

    // class O_UGV_01_rcws_up_F {
    //     cost = 1200;
    //     description = "UGV Stomper UP is a variant of the UGV Stomper armed with a 30mm autocannon.";
    //     name = "UGV Stomper UP";
    //     offset[] = {0, 5, 0};
    //     rearm = 300;
    //     requirements[] = {};
    //     spawn = "O_UGV_01_rcws_F";
    //     variant = 1;

    //     class Gunner: WLTurretDefaults {
    //         addMagazines[] = {
    //             "60Rnd_20mm_HE_shells",
    //             "60Rnd_20mm_HE_shells",
    //             "60Rnd_20mm_AP_shells",
    //             "60Rnd_20mm_AP_shells"
    //         };
    //         addWeapons[] = {
    //             "cannon_20mm"
    //         };
    //         removeMagazines[] = {
    //             "96Rnd_40mm_G_belt"
    //         };
    //         removeWeapons[] = {
    //             "GMG_40mm"
    //         };
    //         turret[] = { 0 };
    //     };
    // };

    // class O_UAV_02_recon_F {
    //     cost = 2000;
    //     description = "K40R (Recon) is an unarmed variant of the K40 Ababil-3 with a powerful scanner.";
    //     disallowMagazines[] = {
    //         "PylonRack_12Rnd_PG_missiles",
    //         "PylonRack_1Rnd_Missile_AA_04_F",
    //         "PylonRack_1Rnd_AAA_missiles",
    //         "PylonRack_1Rnd_LG_scalpel",
    //         "PylonRack_3Rnd_LG_scalpel",
    //         "PylonRack_7Rnd_Rocket_04_HE_F",
    //         "PylonRack_7Rnd_Rocket_04_AP_F",
    //         "PylonRack_12Rnd_missiles",
    //         "PylonMissile_1Rnd_Bomb_04_F",
    //         "PylonMissile_1Rnd_Mk82_F",
    //         "PylonRack_20Rnd_Rocket_03_HE_F",
    //         "PylonRack_20Rnd_Rocket_03_AP_F",
    //         "PylonMissile_1Rnd_LG_scalpel",
    //         "PylonRack_19Rnd_Rocket_Skyfire",
    //         "PylonMissile_1Rnd_Bomb_03_F",
    //         "PylonRack_1Rnd_Missile_AA_03_F"
    //     };
    //     hasHMD = 1;
    //     hasScanner = 1;
    //     name = "K40R (Recon)";
    //     rearm = 300;
    //     requirements[] = {"H"};
    //     spawn = "O_UAV_02_dynamicLoadout_F";
    // };

    class O_UGV_01_bomb_F {
        ammoOverrides[] = {
            {"Bo_Mk82", {"Bo_Mk82_BLU", "BLU-116 (Bunker Buster)"}}
        };
        aps = 4;
        cost = 3500;
        description = "UGV Stomper (Bomb) is a variant of the UGV Stomper that goes boom.";
        loadable[] = {-0.4, -1, 1.1};
        name = "UGV Stomper (Bomb)";
        offset[] = {0, 5, 0};
        rearm = 900;
        requirements[] = {};
        spawn = "O_UGV_01_F";
        variant = 1;

        class Driver: WLTurretDefaults {
            addMagazines[] = {
                "PylonMissile_1Rnd_Mk82_F"
            };
            addWeapons[] = {
                "Mk82BombLauncher"
            };
            turret[] = { -1 };
        };
    };

    class O_T_UAV_04_CAS_F {
        cost = 5500;
        hasHMD = 1;
        rearm = 300;
        requirements[] = {"H"};

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
        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "4Rnd_LG_Jian"
            };
            addWeapons[] = {};
            removeMagazines[] = {};
            removeWeapons[] = {};
            turret[] = { 0 };
        };
    }; // "KH-3A Fenghuang"

    class O_UAV_02_dynamicLoadout_F {
        allowPylonMagazines[] = {
            "PylonRack_12Rnd_PG_missiles",
            "PylonRack_12Rnd_PGM_missiles"
        };
        cost = 6500;
        hasHMD = 1;
        rearm = 300;
        requirements[] = {"H"};
    }; // "K40 Ababil-3"

    // class B_Ship_MRLS_01_F {
    //     cost = 30000;
    //     requirements[] = {};
    //     offset[] = {0, 7, 0};
    //     rearm = 2700;
    // };  // "Mk41 VLS"
};