class RotaryWing {
    class I_C_Heli_Light_01_civil_F {
        cost = 300;
        loadable[] = {0, -2.2, 0.9};
        requirements[] = {"H"};
    }; // "M-900"

    class I_Heli_light_03_unarmed_F {
        cost = 500;
        loadable[] = {0, -2.2, 0.3};
        offset[] = {0, 11, 0};
        rearm = 300;
        requirements[] = {"H"};
    };  // "WY-55 Hellcat (Unarmed)"

    class I_Heli_Transport_02_F {
        cost = 500;
        loadable[] = {0, -2.2, 2.1};
        offset[] = {0, 14, 0};
        rearm = 300;
        requirements[] = {"H"};
    };  // "CH-49 Mohawk"

    class I_Heli_light_03_F {
        cost = 6000;
        loadable[] = {0, -2.2, 0.3};
    };  // "WY-55 Hellcat"

    class I_Heli_light_03_dynamicLoadout_F {
        aircraftSpawn = 1;
        cost = 6000;
        loadable[] = {0, -2.2, 0.3};
        rearm = 300;
        requirements[] = {"H"};
    };  // "WY-55 Hellcat"
};