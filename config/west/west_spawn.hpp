class Spawn {
    class B_Truck_01_medical_F {
        capValue = 1;
        killReward = 100;
        name = "NATO Medical Truck";
    }; // HEMMT Spawn Truck

    class B_Slingload_01_Medevac_F {
        killReward = 300;
        loadable[] = { 0, 0, 0 };
        name = "NATO Medical Pod";
    }; // Huron Spawn

    class Land_Cargo10_blue_F {
        cost = 500;
        demolishable = 1;
        killReward = 1000;
        loadable[] = { 0, -2, 0.5 };
        name = "Forward Base Supplies (NATO)";
    };

    class Land_TentA_F {
        garbageCollector = 1;
        name = "Deployed Tent";
    };

    class RuggedTerminal_01_communications_hub_F {
        killReward = 500;
        name = "Forward Base";
    };
};