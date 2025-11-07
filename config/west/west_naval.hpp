class Naval {
    class C_Scooter_Transport_01_F {
        cost = 50;
        requirements[] = {"W"};
    };	// "Water scooter"

    class B_Boat_Transport_01_F {
        cost = 100;
        requirements[] = {"W"};
    };	// "Assault Boat"

    class B_SDV_01_F {
        cost = 250;
        requirements[] = {"W"};
    };	// "SDV"

    class B_Boat_Armed_01_minigun_F {
        cost = 500;
        rearm = 120;
        requirements[] = {"W"};
    };	// "Speedboat Minigun"

    class B_Boat_Armed_01_autocannon_F {
        cost = 1000;
        description = "Riverine Command Boat is an upgraded, heavily-armed variant of the Speedboat.";
        disallowMagazines[] = {
            "4Rnd_GAA_missiles"
        };
        hasHMD = 1;
        name = "Riverine Command Boat";
        rearm = 120;
        requirements[] = {"W"};
        spawn = "B_Boat_Armed_01_minigun_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "60Rnd_30mm_MP_shells_Tracer_Green",
                "60Rnd_30mm_MP_shells_Tracer_Green",
                "60Rnd_30mm_MP_shells_Tracer_Green",
                "5Rnd_GAT_missiles",
                "5Rnd_GAT_missiles",
                "PylonMissile_Missile_AMRAAM_D_x1",
                "PylonMissile_Missile_AMRAAM_D_x1"
            };
            addWeapons[] = {
                "autocannon_30mm_RCWS",
                "missiles_titan",
                "weapon_AMRAAMLauncher"
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

    class B_Boat_Transport_02_F {
        cost = 1500;
        description = "The Supply RHIB is a fast, agile transport boat that can deploy a supply crate.";
        hasFastTravel = 1;
        name = "Supply RHIB";
        requirements[] = {"W"};
        spawn = "I_C_Boat_Transport_02_F";
    };

    class B_Boat_Bomb_01_F {
        cost = 3000;
        description = "The Bomb Boat is a fast, agile transport boat that goes boom.";
        drone = 1;
        flipLoadable = 180;
        loadable[] = {0, -2.5, 0.5};
        name = "Bomb Boat";
        requirements[] = {"W"};
        spawn = "C_Boat_Civil_01_F";
    };
};