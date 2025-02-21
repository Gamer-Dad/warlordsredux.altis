class Naval {
    class C_Scooter_Transport_01_F {
        cost = 50;
        killReward = 20;
        requirements[] = {"W"};
    };	// "Water scooter"

    class O_Boat_Transport_01_F {
        cost = 100;
        killReward = 20;
        requirements[] = {"W"};
    };	// "Assault Boat"

    class O_SDV_01_F {
        cost = 250;
        killReward = 20;
        requirements[] = {"W"};
    };	// "SDV"

    class O_Boat_Armed_01_hmg_F {
        cost = 500;
        killReward = 80;
        rearm = 400;
        requirements[] = {"W"};
    };	// "Speedboat HMG"

    class O_Boat_Armed_01_autocannon_F {
        cost = 1500;
        description = "Alligator Attack Boat is an upgraded, heavily-armed variant of the Speedboat.";
        disallowMagazines[] = {
            "4Rnd_GAA_missiles"
        };
        killReward = 100;
        name = "Alligator Attack Boat";
        rearm = 400;
        requirements[] = {"W"};
        spawn = "O_Boat_Armed_01_hmg_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "60Rnd_20mm_HE_shells",
                "60Rnd_20mm_HE_shells",
                "60Rnd_20mm_AP_shells",
                "60Rnd_20mm_AP_shells",
                "5Rnd_GAT_missiles",
                "5Rnd_GAT_missiles"
            };
            addWeapons[] = {
                "cannon_20mm",
                "missiles_titan"
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
};