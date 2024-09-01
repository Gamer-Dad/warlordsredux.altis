class Defences {
    class Land_BagFence_Round_F {
        cost = 50;
        requirements[] = {};
        offset[] = {0, 2, 0};
        killReward = 30;
        demolishable = 1;
    }; // "Semi Circle Sand bags"

    class Land_Razorwire_F {
        cost = 50;
        requirements[] = {};
        offset[] = {0, 5, 0};
        killReward = 30;
    }; // "Razor Wire Fence"

    class Land_DragonsTeeth_01_4x2_new_F {
        cost = 50;
        requirements[] = {};
        offset[] = {0, 5, 0};
        killReward = 30;
        demolishable = 1;
    }; // "Tank barrier"

    class CamoNet_BLUFOR_big_F {
        cost = 100;
        requirements[] = {};
        offset[] = {0, 6, 0};
        killReward = 30;
        garbageCollect = 1;
    }; // "Camouflage Vehicle Cover (Green)"

    class Land_IRMaskingCover_01_F {
        cost = 200;
        requirements[] = {};
        offset[] = {0, 8, 0};
        killReward = 30;
        garbageCollect = 1;
    }; // "IR Masking Tent (Large)"

    class Land_Communication_F {
        name = "Jamming Tower";
        cost = 2500;
        requirements[] = {};
        offset[] = {0, 6, 0};
        killReward = 400;
        garbageCollect = 1;
        demolishable = 1;
    };

    class B_HMG_01_F {
        cost = 150;
        requirements[] = {};
        rearm = 300;
        killReward = 100;

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {};
            removeWeapons[] = {
                "HMG_static"
            };
            addMagazines[] = {
                "100Rnd_127x99_mag_Tracer_Red",
                "100Rnd_127x99_mag_Tracer_Red",
                "100Rnd_127x99_mag_Tracer_Red",
                "100Rnd_127x99_mag_Tracer_Red"
            };
            addWeapons[] = {
                "HMG_static"
            };
        };
    }; // "Mk30 HMG .50"

    class B_HMG_01_high_F {
        cost = 200;
        requirements[] = {};
        rearm = 300;
        killReward = 100;

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {};
            removeWeapons[] = {
                "HMG_static"
            };
            addMagazines[] = {
                "100Rnd_127x99_mag_Tracer_Red",
                "100Rnd_127x99_mag_Tracer_Red",
                "100Rnd_127x99_mag_Tracer_Red",
                "100Rnd_127x99_mag_Tracer_Red"
            };
            addWeapons[] = {
                "HMG_static"
            };
        };
    }; // "Mk30 HMG .50 (Raised)"

    class B_GMG_01_F {
        cost = 200;
        requirements[] = {};
        rearm = 300;
        killReward = 100;
    }; // "Mk32 GMG 20mm"

    class B_GMG_01_high_F {
        cost = 250;
        requirements[] = {};
        rearm = 300;
        killReward = 100;
    }; // "Mk32 GMG 20mm (Raised)"

    class B_HMG_01_A_F {
        name = "Mk30 HMG Auto Turret";
        cost = 500;
        requirements[] = {};
        rearm = 300;
        killReward = 150;

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {};
            removeWeapons[] = {
                "HMG_static"
            };
            addMagazines[] = {
                "100Rnd_127x99_mag_Tracer_Red",
                "100Rnd_127x99_mag_Tracer_Red",
                "100Rnd_127x99_mag_Tracer_Red",
                "100Rnd_127x99_mag_Tracer_Red"
            };
            addWeapons[] = {
                "HMG_static"
            };
        };
    };

    class B_GMG_01_A_F {
        name = "Mk32 GMG Auto Turret";
        cost = 650;
        requirements[] = {};
        rearm = 300;
        killReward = 150;
    };

    class B_static_AT_F {
        cost = 300;
        requirements[] = {};
        rearm = 300;
        killReward = 100;

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {};
            removeWeapons[] = {
                "missiles_titan_static"
            };
            addMagazines[] = {
                "1Rnd_GAT_missiles",
                "1Rnd_GAT_missiles",
                "1Rnd_GAT_missiles",
                "1Rnd_GAT_missiles",
                "1Rnd_GAT_missiles",
                "1Rnd_GAT_missiles"
            };
            addWeapons[] = {
                "missiles_titan_static"
            };
        };
    }; // "Static Titan Launcher (AT) [NATO]"

    class B_static_AA_F {
        cost = 300;
        requirements[] = {};
        rearm = 300;
        killReward = 100;

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {};
            removeWeapons[] = {
                "missiles_titan_static"
            };
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
        };
    }; // "Static Titan Launcher (AA) [NATO]"

    class B_Mortar_01_F {
        cost = 4000;
        requirements[] = {};
        rearm = 900;
        killReward = 125;
    }; // "Mortar"

    class B_UGV_02_Demining_F {
        cost = 100;
        requirements[] = {};
        offset[] = {0, 3, 0};
        rearm = 200;
        killReward = 100;
    }; // "UGAS demining"

    class B_UGV_01_F {
        cost = 150;
        requirements[] = {};
        offset[] = {0, 3, 0};
        killReward = 50;
    }; // "UGV Stomper"

    class B_UGV_01_rcws_F {
        cost = 500;
        requirements[] = {};
        offset[] = {0, 3, 0};
        rearm = 300;
        killReward = 100;
    }; // "UGAS"

    class B_UAV_01_F {
        cost = 500;
        requirements[] = {};
        killReward = 100;
    }; // AR-2

    class B_UAV_06_F {
        cost = 1000;
        requirements[] = {};
        killReward = 200;
    }; // "AR-6"

    class B_Ship_Gun_01_F {
        cost = 10000;
        requirements[] = {};
        offset[] = {0, 9, 0};
        rearm = 2700;
        killReward = 600;
    }; // "MK45 Hammer"

    class B_Radar_System_01_F {
        cost = 1000;
        requirements[] = {};
        offset[] = {0, 7, 0};
        killReward = 350;
    }; // "AN/MPQ-105 Radar"

    class B_AAA_System_01_F {
        cost = 3500;
        requirements[] = {};
        offset[] = {0, 5.3, 0};
        rearm = 300;
        killReward = 400;
    }; // "Praetorian 1C"

    class B_SAM_System_01_F {
        cost = 10000;
        requirements[] = {};
        offset[] = {0, 5.3, 0};
        rearm = 600;
        killReward = 500;
    }; // "Mk49 Spartan"

    class B_SAM_System_03_F {
        cost = 8000;
        requirements[] = {};
        offset[] = {0, 6, 0};
        rearm = 450;
        killReward = 500;
    }; // "MIM-145 Defender"

    class B_SAM_System_02_F {
        cost = 15000;
        requirements[] = {};
        offset[] = {0, 5.3, 0};
        rearm = 600;
        killReward = 600;
    }; // "Mk21 Centurion"

    class B_Ship_MRLS_01_F {
        cost = 30000;
        requirements[] = {};
        offset[] = {0, 7, 0};
        rearm = 2700;
        killReward = 700;
    }; // "Mk41 VLS"
};