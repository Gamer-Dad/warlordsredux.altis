class HeavyVehicles {
    class I_LT_01_AT_F {
        aps = 1;
        capValue = 4;
        cost = 1500;
        killReward = 240;
        rearm = 300;
        requirements[] = {};
        vehicleSpawn = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "2Rnd_127mm_Firefist_missiles",
                "2Rnd_127mm_Firefist_missiles",
                "2Rnd_127mm_Firefist_missiles",
                "2Rnd_127mm_Firefist_missiles",
                "2Rnd_127mm_Firefist_missiles"
            };
            addWeapons[] = {
                "missiles_Firefist"
            };
            reloadOverride = 6;
            removeMagazines[] = {
                "100Rnd_127x99_mag_Tracer_Red"
            };
            removeWeapons[] = {
                "HMG_127"
            };
            turret[] = { 0 };
        };
    };  // "AWC Nyx (AT)"

    class I_LT_01_cannon_F {
        aps = 1;
        capValue = 4;
        cost = 1500;
        killReward = 240;
        rearm = 300;
        requirements[] = {};
        vehicleSpawn = 1;
        // class Gunner: WLTurretDefaults {
        //     addMagazines[] = {
        //         "140Rnd_30mm_MP_shells",
        //         "60Rnd_30mm_APFSDS_shells"
        //     };
        //     addWeapons[] = {
        //         "autocannon_30mm_CTWS"
        //     };
        //     reloadOverride = 10;
        //     removeMagazines[] = {
        //         "60Rnd_20mm_HE_shells",
        //         "60Rnd_20mm_AP_shells"
        //     };
        //     removeWeapons[] = {
        //         "cannon_20mm"
        //     };
        //     turret[] = { 0 };
        // };
    };  // "AWC Nyx (Autocannon)"

    class I_MBT_03_cannon_F {
        aps = 3;
        capValue = 5;
        killReward = 400;
        vehicleSpawn = 1;
    };  // "MBT-52 Kuma"

    class I_APC_Wheeled_03_cannon_F {
        aps = 2;
        capValue = 5;
        killReward = 400;
        vehicleSpawn = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "5Rnd_GAT_missiles",
                "5Rnd_GAT_missiles"
            };
            addWeapons[] = {
                "missiles_titan"
            };
            removeMagazines[] = {
                "2Rnd_GAT_missiles"
            };
            removeWeapons[] = {
                "missiles_titan"
            };
            turret[] = { 0 };
        };
    };  // "AFV-4 Gorgon"

    class I_APC_tracked_03_cannon_F {
        aps = 3;
        capValue = 5;
        killReward = 400;
        vehicleSpawn = 1;
    };  // "FV-720 Mora"
};