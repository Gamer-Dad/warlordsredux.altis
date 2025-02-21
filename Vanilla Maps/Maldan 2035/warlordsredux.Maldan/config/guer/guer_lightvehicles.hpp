class LightVehicles {
    class I_Quadbike_01_F {
        capValue = 1;
        cost = 20;
        killReward = 20;
        requirements[] = {};
    }; // "Quad Bike"

    class I_G_Offroad_01_armed_F {
        capValue = 1;
        cost = 150;
        killReward = 150;
        rearm = 120;
        requirements[] = {};

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "100Rnd_127x99_mag_Tracer_Yellow",
                "100Rnd_127x99_mag_Tracer_Yellow",
                "100Rnd_127x99_mag_Tracer_Yellow",
                "100Rnd_127x99_mag_Tracer_Yellow"
            };
            addWeapons[] = {};
            removeMagazines[] = {};
            removeWeapons[] = {};
            turret[] = { 0 };
        };
    }; // "Offroad (HMG)"

    class I_C_Offroad_02_LMG_F {
        capValue = 1;
        cost = 200;
        killReward = 150;
        rearm = 120;
        requirements[] = {};

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "200Rnd_556x45_Box_Tracer_F",
                "200Rnd_556x45_Box_Tracer_F",
                "200Rnd_556x45_Box_Tracer_F",
                "200Rnd_556x45_Box_Tracer_F",
                "200Rnd_556x45_Box_Tracer_F",
                "200Rnd_556x45_Box_Tracer_F",
                "200Rnd_556x45_Box_Tracer_F"
            };
            addWeapons[] = {};
            removeMagazines[] = {};
            removeWeapons[] = {};
            turret[] = { 0 };
        };
    }; // "MB 4WD (LMG)"

    class I_MRAP_03_F {
        capValue = 1;
        cost = 300;
        killReward = 70;
        requirements[] = {};
    }; // "Strider"

    class B_Truck_01_flatbed_F {
        capValue = 1;
        cost = 500;
        killReward = 80;
        requirements[] = {};
    }; // "HEMTT Flatbed"

    class I_C_Offroad_02_AT_F {
        capValue = 1;
        cost = 500;
        killReward = 180;
        rearm = 180;
        requirements[] = {};

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "12Rnd_SPG9_HEAT"
            };
            addWeapons[] = {};
            removeMagazines[] = {};
            removeWeapons[] = {};
            turret[] = { 0 };
        };
    }; // "MB 4WD (AT)"

    class I_MRAP_03_hmg_F {
        aps = 1;
        capValue = 3;
        cost = 900;
        killReward = 250;
        rearm = 300;
        requirements[] = {};
        vehicleSpawn = 1;
    };

    class I_MRAP_03_gmg_F {
        aps = 1;
        capValue = 3;
        cost = 1200;
        killReward = 250;
        rearm = 300;
        requirements[] = {};
        vehicleSpawn = 1;
    };
};