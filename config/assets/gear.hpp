class Gear {
    category = "Gear";
    loadable = 1;
};

class Faction_Crate: Gear {
    cost = 200;
    demolishable = 1;
    demolishStepTime = 5;
    description = "Supply crate that can be used to restock infantry weapons or rearm vehicles. Automatically cleaned up. Use other gear containers for longer-term purposes.";
    hasRearm = 1;
    lifetime = 300;
    name = "Resupply Crate";
    nameShort = "CRATE";
    offset[] = {0, 3, 0};
    spawn = "VirtualReammoBox_camonet_F";
};

class B_Faction_Crate: Faction_Crate {
    container[] = {
        { "launch_O_Vorona_brown_F", 2 },
        { "launch_MRAWS_olive_F", 2 },
        { "launch_O_Titan_F", 2 },
        { "launch_O_Titan_short_F", 2 },

        { "MRAWS_HEAT_F", 8 },
        { "MRAWS_HE_F", 2 },
        { "Titan_AA", 8 },
        { "Titan_AP", 2 },
        { "Titan_AT", 8 },
        { "Vorona_HE", 2 },
        { "Vorona_HEAT", 8 },

        { "B_FieldPack_cbr", 5 },
        { "B_Carryall_mcamo", 5 }
    };
    side[] = {"west"};
};

class O_Faction_Crate: Faction_Crate {
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
    side[] = {"east"};
};

class Huron_Pod: Gear {
    container[] = {
        { "Toolkit", 1 }
    };
    cost = 500;
    nameShort = "POD";
    offset[] = {0, 8, 0};
};
class B_Slingload_01_Fuel_F: Huron_Pod {
    hasRefuel = 1;
    side[] = {"west"};
};
class B_Slingload_01_Ammo_F: Huron_Pod {
    hasRearm = 1;
    side[] = {"west"};
};
class B_Slingload_01_Repair_F: Huron_Pod {
    hasRepair = 1;
    side[] = {"west"};
};
class B_Slingload_01_Medevac_F: Huron_Pod {
    hasFastTravel = 1;
    loaded = "Land_BagBunker_Small_F";
    side[] = {"west"};
};

class Taru_Pod: Gear {
    container[] = {
        { "Toolkit", 1 }
    };
    cost = 500;
    nameShort = "POD";
    offset[] = {0, 8, 0};
};
class Land_Pod_Heli_Transport_04_fuel_F: Taru_Pod {
    hasRefuel = 1;
    side[] = {"east"};
};
class Land_Pod_Heli_Transport_04_ammo_F: Taru_Pod {
    hasRearm = 1;
    side[] = {"east"};
};
class Land_Pod_Heli_Transport_04_repair_F: Taru_Pod {
    hasRepair = 1;
    side[] = {"east"};
};
class Land_Pod_Heli_Transport_04_medevac_F: Taru_Pod {
    hasFastTravel = 1;
    loaded = "Land_BagBunker_Small_F";
    side[] = {"east"};
};

class Land_Cargo20_yellow_F: Gear {
    conversion = 1;
    cost = 1000;
    demolishable = 1;
    demolishStepTime = 3;
    description = "Purchases supplies that can be airlifted or deployed into a forward position or sector. It can be used to setup a base, add supplies to an existing one, or to add reinforcements to a defensive sector.";
    loaded = "Land_Cargo_HQ_V4_F";
    loadRotate = 1;
    name = "Supplies (Forward Base, Sector)";
    nameShort = "SUPPLIES";
    offset[] = {0, 5, 0};
    requirements[] = {"H", "NF"};
    side[] = {"west", "east"};
};