class RemoteControl {
    class B_UGV_02_Demining_F {
        cost = 100;
        killReward = 100;
        offset[] = {0, 3, 0};
        rearm = 200;
        requirements[] = {};
    }; // "UGAS demining"

    class B_UGV_01_F {
        cost = 150;
        killReward = 50;
        offset[] = {0, 5, 0};
        requirements[] = {};
    }; // "UGV Stomper"

    class B_UAV_01_F {
        cost = 500;
        hasHMD = 1;
        killReward = 100;
        offset[] = {0, 3, 0};
        requirements[] = {};
    }; // AR-2

    class B_UGV_01_rcws_F {
        cost = 500;
        killReward = 100;
        offset[] = {0, 5, 0};
        rearm = 300;
        requirements[] = {};
    }; // "UGAS"

    class B_UAV_06_F {
        cost = 1000;
        killReward = 200;
        offset[] = {0, 3, 0};
        requirements[] = {};
    }; // "AR-6"

    class B_UAV_01_UP_F {
        cost = 1200;
        description = "AR-2 Darter UP is a variant of the AR-2 Darter armed with a 45ACP SMG.";
        hasHMD = 1;
        killReward = 200;
        name = "AR-2 Darter UP";
        offset[] = {0, 3, 0};
        rearm = 300;
        requirements[] = {};
        spawn = "B_UAV_01_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {};
            removeWeapons[] = {};
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
        };
    };

    class B_UGV_01_rcws_UP_F {
        cost = 1200;
        description = "UGV Stomper UP is a variant of the UGV Stomper armed with a 30mm autocannon.";
        killReward = 300;
        name = "UGV Stomper UP";
        offset[] = {0, 5, 0};
        rearm = 300;
        requirements[] = {};
        spawn = "B_UGV_01_rcws_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {
                "96Rnd_40mm_G_belt"
            };
            removeWeapons[] = {
                "GMG_40mm"
            };
            addMagazines[] = {
                "60Rnd_20mm_HE_shells",
                "60Rnd_20mm_HE_shells",
                "60Rnd_20mm_AP_shells",
                "60Rnd_20mm_AP_shells"
            };
            addWeapons[] = {
                "cannon_20mm"
            };
        };
    };

    class B_UAV_02_recon_F {
        cost = 2000;
        description = "Greyhawk (Recon) is an unarmed variant of the Greyhawk with a powerful scanner.";
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
            "PylonMissile_1Rnd_Mk82_F"
        };
        hasHMD = 1;
        hasScanner = 1;
        killReward = 400;
        name = "MQ-4R Greyhawk (Recon)";
        rearm = 300;
        requirements[] = {"A"};
        spawn = "B_UAV_02_dynamicLoadout_F";
    }; // "Greyhawk"

    class B_UAV_02_dynamicLoadout_F {
        cost = 8000;
        hasHMD = 1;
        killReward = 600;
        rearm = 300;
        requirements[] = {"A"};
    }; // "Greyhawk"

    class B_T_UAV_03_dynamicLoadout_F {
        cost = 11000;
        hasHMD = 1;
        killReward = 600;
        rearm = 600;
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
        cost = 22500;
        killReward = 650;
        rearm = 500;
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