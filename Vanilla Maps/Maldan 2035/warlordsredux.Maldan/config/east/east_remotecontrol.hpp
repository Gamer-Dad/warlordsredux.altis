class RemoteControl {
    class O_UGV_02_Demining_F {
        cost = 100;
        killReward = 100;
        offset[] = {0, 3, 0};
        rearm = 200;
        requirements[] = {};
    };  // "UGAS demining"

    class O_UGV_01_F {
        cost = 150;
        killReward = 50;
        offset[] = {0, 5, 0};
        requirements[] = {};
    };  // "UGV Stomper"

    class O_UAV_01_F {
        cost = 500;
        hasHMD = 1;
        killReward = 100;
        offset[] = {0, 3, 0};
        requirements[] = {};
    };  // "AR-2"

    class O_UGV_01_rcws_F {
        cost = 500;
        killReward = 100;
        offset[] = {0, 5, 0};
        rearm = 300;
        requirements[] = {};
    };  // "UGAV rcws"

    class O_UAV_06_F {
        cost = 1000;
        killReward = 200;
        offset[] = {0, 3, 0};
        requirements[] = {};
    };  // "AR-6"

    class O_UAV_01_UP_F {
        cost = 1200;
        description = "AR-2 Darter UP is a variant of the AR-2 Darter armed with a 45ACP SMG.";
        hasHMD = 1;
        killReward = 200;
        name = "AR-2 Darter UP";
        offset[] = {0, 3, 0};
        rearm = 300;
        requirements[] = {};
        spawn = "O_UAV_01_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow"
            };
            addWeapons[] = {
                "SMG_01_F"
            };
            removeMagazines[] = {};
            removeWeapons[] = {};
            turret[] = { 0 };
        };
    };

    class O_UGV_01_rcws_up_F {
        cost = 1200;
        description = "UGV Stomper UP is a variant of the UGV Stomper armed with a 30mm autocannon.";
        killReward = 300;
        name = "UGV Stomper UP";
        offset[] = {0, 5, 0};
        rearm = 300;
        requirements[] = {};
        spawn = "O_UGV_01_rcws_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "60Rnd_20mm_HE_shells",
                "60Rnd_20mm_HE_shells",
                "60Rnd_20mm_AP_shells",
                "60Rnd_20mm_AP_shells"
            };
            addWeapons[] = {
                "cannon_20mm"
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

    class O_UAV_02_recon_F {
        cost = 2000;
        description = "K40R (Recon) is an unarmed variant of the K40 Ababil-3 with a powerful scanner.";
        disallowMagazines[] = {
            "PylonRack_12Rnd_PG_missiles",
            "PylonRack_1Rnd_Missile_AA_04_F",
            "PylonRack_1Rnd_AAA_missiles",
            "PylonRack_1Rnd_LG_scalpel",
            "PylonRack_3Rnd_LG_scalpel",
            "PylonRack_7Rnd_Rocket_04_HE_F",
            "PylonRack_7Rnd_Rocket_04_AP_F",
            "PylonRack_12Rnd_missiles",
            "PylonMissile_1Rnd_Bomb_04_F",
            "PylonMissile_1Rnd_Mk82_F",
            "PylonRack_20Rnd_Rocket_03_HE_F",
            "PylonRack_20Rnd_Rocket_03_AP_F",
            "PylonMissile_1Rnd_LG_scalpel",
            "PylonRack_19Rnd_Rocket_Skyfire",
            "PylonMissile_1Rnd_Bomb_03_F",
            "PylonRack_1Rnd_Missile_AA_03_F"
        };
        hasHMD = 1;
        hasScanner = 1;
        killReward = 400;
        name = "K40R (Recon)";
        rearm = 300;
        requirements[] = {"A"};
        spawn = "O_UAV_02_dynamicLoadout_F";
    };

    class O_T_UAV_04_CAS_F {
        cost = 6000;
        hasHMD = 1;
        killReward = 600;
        rearm = 300;
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
    }; // "KH-3A Fenghuang"

    class O_UAV_02_dynamicLoadout_F {
        allowPylonMagazines[] = {
            "PylonRack_12Rnd_PG_missiles"
        };
        cost = 8000;
        hasHMD = 1;
        killReward = 600;
        rearm = 300;
        requirements[] = {"A"};
    }; // "K40 Ababil-3"

    // class B_Ship_MRLS_01_F {
    //     cost = 30000;
    //     requirements[] = {};
    //     offset[] = {0, 7, 0};
    //     rearm = 2700;
    //     killReward = 700;
    // };  // "Mk41 VLS"
};