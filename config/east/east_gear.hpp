class Gear {
    class O_supplyCrate_launchers_F {
        container[] = {
            { "launch_O_Vorona_brown_F", 2 },
            { "launch_RPG32_F", 2 },
            { "launch_O_Titan_F", 2 },
            { "launch_O_Titan_short_F", 2 },

            { "RPG32_F", 8 },
            { "RPG32_HE_F", 2 },
            { "Titan_AA", 8 },
            { "Titan_AP", 2 },
            { "Titan_AT", 8 },
            { "Vorona_HE", 2 },
            { "Vorona_HEAT", 8 },

            { "B_FieldPack_ocamo", 5 }
        };
        cost = 200;
        demolishable = 1;
        killReward = 200;
        loadable[] = { 0, 0, 0 };
        name = "CSAT Supply Crate";
        offset[] = { 0, 3, 0};
        spawn = "CargoNet_01_box_F";
        requirements[] = {};
    };

    class Box_East_AmmoVeh_F {
        cost = 250;
        killReward = 70;
        loadable[] = { 0, 0, 0 };
        offset[] = { 0, 3, 0};
        requirements[] = {};
    }; // "Vehicle Ammo [CSAT]"

    class Land_Pod_Heli_Transport_04_fuel_F {
        cost = 300;
        killReward = 150;
        loadable[] = { 0, 0, 0 };
        requirements[] = {};
    }; // "Taru Fuel Pod"

    class Land_Pod_Heli_Transport_04_ammo_F {
        cost = 500;
        killReward = 150;
        loadable[] = { 0, 0, 0 };
        requirements[] = {};
    }; // "Taru Ammo Pod"

    class Land_Pod_Heli_Transport_04_repair_F {
        cost = 500;
        killReward = 150;
        loadable[] = { 0, 0, 0 };
        requirements[] = {};
    }; // "Taru Repair Pod"
};