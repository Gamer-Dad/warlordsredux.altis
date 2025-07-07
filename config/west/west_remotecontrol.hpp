class RemoteControl {
    // class RuggedTerminal_01_communications_F {
    //     cost = 50;
    //     demolishable = 1;
    //     loadable[] = {0, 0, 0};
    //     name = "Ground Support Terminal";
    //     offset[] = {0, 3, 0};
    // };

    class B_UGV_02_Demining_F {
        cost = 100;
        loadable[] = {0, -1, -0.5};
        offset[] = {0, 3, 0};
        rearm = 120;
    }; // "UGAS demining"

    class B_UGV_01_F {
        cost = 150;
        loadable[] = {0, -1, 1.1};
        offset[] = {0, 5, 0};
    }; // "UGV Stomper"

    class B_UAV_01_F {
        cost = 500;
        hasHMD = 1;
        offset[] = {0, 3, 0};
    }; // AR-2

    class B_UGV_01_rcws_F {
        cost = 500;
        loadable[] = {0, -1, 1.1};
        offset[] = {0, 5, 0};
        rearm = 120;
    }; // "UGAS"

    class B_UAV_06_F {
        cost = 1000;
        offset[] = {0, 3, 0};
    }; // "AR-6"

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

    // class B_UGV_01_rcws_UP_F {
    //     cost = 1200;
    //     description = "UGV Stomper UP is a variant of the UGV Stomper armed with a 30mm autocannon.";
    //     name = "UGV Stomper UP";
    //     offset[] = {0, 5, 0};
    //     rearm = 300;
    //     requirements[] = {};
    //     spawn = "B_UGV_01_rcws_F";
    //     variant = 1;

    //     class Gunner: WLTurretDefaults {
    //         turret[] = { 0 };
    //         removeMagazines[] = {
    //             "96Rnd_40mm_G_belt"
    //         };
    //         removeWeapons[] = {
    //             "GMG_40mm"
    //         };
    //         addMagazines[] = {
    //             "60Rnd_20mm_HE_shells",
    //             "60Rnd_20mm_HE_shells",
    //             "60Rnd_20mm_AP_shells",
    //             "60Rnd_20mm_AP_shells"
    //         };
    //         addWeapons[] = {
    //             "cannon_20mm"
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
            "PylonRack_12Rnd_PGM_missiles"
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