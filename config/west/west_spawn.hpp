class Spawn {
    class Land_BagFence_Long_F {
        cost = 200;
        demolishable = 1;
        demolishStepTime = 1;
        name = "Temporary Sandbag Wall";
        lifetime = 180;
    };

    class B_Slingload_01_Cargo_F {
        cost = 500;
        empty = 1;
        loadable[] = {0, -1.5, 0.5};
        name = "Forward Base Supplies (NATO)";
    };

    class Land_Destroyer_01_base_F {
        cost = 40000;
        name = "Destroyer";
    };

    class Land_MedicalTent_01_NATO_generic_open_F {
        cost = 5000;
        demolishStepTime = 10;
        hasFastTravel = 1;
        name = "Team Rally Point (NATO)";
    };

    class Land_TentA_F {
        cost = 300;
        demolishStepTime = 2;
        name = "Tent";
    };

    class Land_TentDome_F {
        cost = 300;
        demolishStepTime = 2;
        name = "Tent";
    };

    class Land_TentSolar_01_bluewhite_F {
        cost = 300;
        demolishStepTime = 2;
        name = "Tent";
    };

    class Land_TentSolar_01_redwhite_F {
        cost = 300;
        demolishStepTime = 2;
        name = "Tent";
    };

    class RuggedTerminal_01_communications_hub_F {
        name = "Forward Base";
    };

    class B_Mortar_01_Integral_F {
        cost = -1;
        name = "Integral Mortar System";
    };

    class B_Ship_MRLS_01_F {
        cost = 20000;
        hasHMD = 1;
    };

    class B_UAV_02_F {
        cost = 1000;
    };
};