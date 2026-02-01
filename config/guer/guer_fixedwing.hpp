class FixedWing {
    class I_Plane_Civil_01_F {
        cost = 800;
        description = "Caesar BTT is a light unarmed aircraft.";
        loadable[] = {0, -2.2, 0.9};
        name = "Caesar BTT";
        requirements[] = {"A"};
        spawn = "I_C_Plane_Civil_01_F";
    };

    class I_Plane_Fighter_03_CAS_F {
        cost = 13000;
        loadable[] = {0, -2.2, 1.6};
    };

    class I_Plane_Fighter_03_dynamicLoadout_F {
        aircraftSpawn = 1;
        cost = 15000;
        loadable[] = {0, -2.2, 1.6};
        rearm = 900;
        requirements[] = {"A"};
    };  // "A-143 Buzzard (CAS)"

    class I_Plane_Fighter_04_F {
        aircraftSpawn = 1;
        cost = 23000;
        loadable[] = {0, -2.2, 1.4};
        rearm = 900;
        requirements[] = {"A"};
    };  // "A-149 Gryphon"
};