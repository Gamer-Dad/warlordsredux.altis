class LightVehicles {
    class I_Quadbike_01_F {
        capValue = 1;
        cost = 20;
    }; // "Quad Bike"

    class I_G_Offroad_01_armed_F {
        capValue = 1;
        cost = 150;
        rearm = 120;

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
        rearm = 120;

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
    }; // "Strider"

    class I_Truck_01_flatbed_F {
        capValue = 1;
        cost = 300;
        hasFastTravel = 1;
        isLight = 1;
        name = "HEMTT Flatbed";
        spawn = "B_Truck_01_flatbed_F";
    }; // "HEMTT Flatbed"

    class I_C_Offroad_02_AT_F {
        capValue = 1;
        cost = 500;
        rearm = 180;

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
        rearm = 300;
        vehicleSpawn = 1;
    };

    class I_MRAP_03_gmg_F {
        aps = 1;
        capValue = 3;
        cost = 1200;
        rearm = 300;
        vehicleSpawn = 1;
    };
};