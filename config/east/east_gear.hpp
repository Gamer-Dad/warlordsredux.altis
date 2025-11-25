class Gear {
    class O_crate_F {
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

            { "B_FieldPack_ocamo", 5 },
            { "B_Carryall_ocamo", 5 }
        };
        cost = 200;
        demolishable = 2;
        demolishStepTime = 5;
        description = "CSAT gear crate that contains various AT weapons, ammo, and explosives. Can be used to restock infantry units for a price.";
        loadable[] = { 0, -1, 0.5 };
        name = "CSAT Supply Crate";
        offset[] = { 0, 3, 0};
        spawn = "VirtualReammoBox_camonet_F";
    };

    class Box_East_AmmoVeh_F {
        cost = 250;
        hasRearm = 1;
        loadable[] = { 0, 0, 0 };
        offset[] = { 0, 3, 0};
    }; // "Vehicle Ammo [CSAT]"

    class Land_Pod_Heli_Transport_04_fuel_F {
        cost = 300;
        hasRefuel = 1;
        loadable[] = {0, -1.8, 0.5};
    }; // "Taru Fuel Pod"

    class Land_Pod_Heli_Transport_04_ammo_F {
        cost = 500;
        hasRearm = 1;
        loadable[] = {0, -1.8, 0.4};
    }; // "Taru Ammo Pod"

    class Land_Pod_Heli_Transport_04_repair_F {
        cost = 500;
        hasRepair = 1;
        loadable[] = {0, -1.8, 0.4};
    }; // "Taru Repair Pod"

    class Land_Pod_Heli_Transport_04_medevac_F {
        cost = 500;
        hasFastTravel = 1;
        loadable[] = {0, -1.8, 0.5};
    }; // "Taru Medical Pod"
};