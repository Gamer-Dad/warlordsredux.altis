class Naval {
    class C_Scooter_Transport_01_F {
        cost = 50;
        requirements[] = {"W"};
    };	// "Water scooter"

    class O_Boat_Transport_01_F {
        cost = 100;
        requirements[] = {"W"};
    };	// "Assault Boat"

    class O_SDV_01_F {
        cost = 250;
        requirements[] = {"W"};
    };	// "SDV"

    class O_Boat_Armed_01_hmg_F {
        cost = 500;
        rearm = 120;
        requirements[] = {"W"};
    };	// "Speedboat HMG"

    class O_Boat_Armed_01_autocannon_F {
        ammoOverrides[] = {
            {"ammo_Missile_AA_R77", {"ammo_Missile_AA_R77_ground", "R-77-ZRK"}}
        };
        cost = 1000;
        description = "Alligator Attack Boat is an upgraded, heavily-armed variant of the Speedboat.";
        disallowMagazines[] = {
            "4Rnd_GAA_missiles"
        };
        hasHMD = 1;
        name = "Alligator Attack Boat";
        rearm = 120;
        requirements[] = {"W"};
        spawn = "O_Boat_Armed_01_hmg_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "60Rnd_30mm_MP_shells_Tracer_Green",
                "60Rnd_30mm_MP_shells_Tracer_Green",
                "60Rnd_30mm_MP_shells_Tracer_Green",
                "5Rnd_GAT_missiles",
                "5Rnd_GAT_missiles",
                "magazine_Missile_AA_R77_x1",
                "magazine_Missile_AA_R77_x1"
            };
            addWeapons[] = {
                "autocannon_30mm_RCWS",
                "missiles_titan",
                "weapon_R77Launcher"
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

    class O_Boat_Transport_02_F {
        cost = 1500;
        description = "The Supply RHIB is a fast, agile transport boat that can deploy a supply crate.";
        hasFastTravel = 1;
        loaded = "Land_Cargo20_brick_red_F";
        name = "Supply RHIB";
        requirements[] = {"W"};
        spawn = "I_C_Boat_Transport_02_F";
    };

    class O_Boat_Bomb_01_F {
        cost = 1750;
        description = "The Bomb Boat is a fast, agile transport boat that goes boom.";
        detonate = 7;
        drone = 1;
        loadable[] = {0, -2.5, 0.5};
        loadableAngle = 180;
        name = "Bomb Boat";
        requirements[] = {"W"};
        spawn = "C_Boat_Civil_01_F";
    };
};