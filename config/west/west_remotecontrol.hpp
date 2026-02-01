class RemoteControl {
    class B_UGV_02_Demining_F {
        cost = 100;
        loadable[] = {0, -1, -0.5};
        offset[] = {0, 3, 0};
        rearm = 120;
    }; // "UGAS demining"

    class B_UGV_01_F {
        cost = 150;
        loadable[] = {-0.4, -1, 1.1};
        loaded = "B_crate_F";
        offset[] = {0, 5, 0};
    }; // "UGV Stomper"

    class B_UAV_01_F {
        cost = 500;
        hasHMD = 1;
        offset[] = {0, 3, 0};
    }; // AR-2

    class B_UGV_01_rcws_F {
        cost = 500;
        loadable[] = {-0.4, -1, 1.1};
        loaded = "B_crate_F";
        offset[] = {0, 5, 0};
        rearm = 120;
    }; // "UGV Stomper RCWS"

    class B_UAV_06_F {
        cost = 1000;
        detonate = 1;
        offset[] = {0, 3, 0};
    }; // "AR-6"

    // class B_UAV_06_grenade_F {
    //     cost = 3200;
    //     description = "AR-6 Pelican UP is a variant of the AR-6 Pelican armed with a grenade dropper.";
    //     hasHMD = 1;
    //     name = "AR-6 Pelican UP";
    //     offset[] = {0, 3, 0};
    //     rearm = 300;
    //     spawn = "B_UAV_06_F";
    //     variant = 1;

    //     class Pilot: WLTurretDefaults {
    //         addMagazines[] = {
    //             "PylonRack_4Rnd_BombDemine_01_F",
    //             "PylonRack_4Rnd_BombDemine_01_F"
    //         };
    //         addWeapons[] = {
    //             "BombDemine_01_F"
    //         };
    //         turret[] = { -1 };
    //     };
    // };

    // class B_UAV_01_UP_F {
    //     cost = 1200;
    //     description = "AR-2 Darter UP is a variant of the AR-2 Darter armed with a 45ACP SMG.";
    //     hasHMD = 1;
    //     name = "AR-2 Darter UP";
    //     offset[] = {0, 3, 0};
    //     rearm = 300;
    //     requirements[] = {};
    //     spawn = "B_UAV_01_F";
    //     variant = 1;

    //     class Gunner: WLTurretDefaults {
    //         turret[] = { 0 };
    //         removeMagazines[] = {};
    //         removeWeapons[] = {};
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
    //     };
    // };

    // class B_UAV_02_recon_F {
    //     cost = 2000;
    //     description = "Greyhawk (Recon) is an unarmed variant of the Greyhawk with a powerful scanner.";
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
    //         "PylonMissile_1Rnd_Mk82_F"
    //     };
    //     hasHMD = 1;
    //     hasScanner = 1;
    //     name = "MQ-4R Greyhawk (Recon)";
    //     rearm = 300;
    //     requirements[] = {"H"};
    //     spawn = "B_UAV_02_dynamicLoadout_F";
    // };

    class B_UGV_01_bomb_F {
        ammoOverrides[] = {
            {"Bo_Mk82", {"Bo_Mk82_BLU", "BLU-116 (Bunker Buster)"}}
        };
        aps = 4;
        cost = 3500;
        description = "UGV Stomper (Bomb) is a variant of the UGV Stomper that goes boom.";
        detonate = 13;
        loadable[] = {-0.4, -1, 1.1};
        name = "UGV Stomper (Bomb)";
        offset[] = {0, 5, 0};
        rearm = 900;
        spawn = "B_UGV_01_F";
        variant = 1;
    };

    class B_Offroad_01_bomb_F {
        aps = 4;
        cost = 4000;
        description = "Offroad (IED) is a variant of the Offroad that goes boom.";
        detonate = 13;
        drone = 1;
        loadable[] = {0, -1.7, 1.3};
        name = "Offroad (IED)";
        offset[] = {0, 5, 0};
        rearm = 900;
        spawn = "B_GEN_Offroad_01_comms_F";
        variant = 1;
    };

    class B_UAV_02_dynamicLoadout_F {
        allowPylonMagazines[] = {
            "PylonRack_12Rnd_PGM_missiles"
        };
        cost = 6500;
        hasHMD = 1;
        rearm = 300;
        requirements[] = {"H"};
    }; // "Greyhawk"

    class B_T_UAV_03_dynamicLoadout_F {
        allowPylonMagazines[] = {
            "PylonRack_12Rnd_PGM_missiles",
            "PylonRack_1Rnd_AAA_missiles"
        };
        cost = 7000;
        hasHMD = 1;
        rearm = 300;
        requirements[] = {"H"};

        class Pilot: WLTurretDefaults {
            turret[] = { -1 };
            removeMagazines[] = {
                "120Rnd_CMFlare_Chaff_Magazine"
            };
            removeWeapons[] = {};
            addMagazines[] = {
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {};
        };
    }; // "Falcon"

    class B_UAV_05_F {
        cost = 15000;
        hasHMD = 1;
        rearm = 420;
        requirements[] = {"A"};

        class Pilot: WLTurretDefaults {
            turret[] = { -1 };
            removeMagazines[] = {
                "120Rnd_CMFlare_Chaff_Magazine"
            };
            removeWeapons[] = {};
            addMagazines[] = {
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {};
        };
    }; // "UCAV Sentinel"
};