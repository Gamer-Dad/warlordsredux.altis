class Gear {
    category = "Gear";
};

class Faction_Crate: Gear {
    cost = 200;
    demolishable = 2;
    demolishStepTime = 5;
    description = "Supply crate that contains various AT weapons, ammo, and explosives. Can be used to restock infantry units for a price.";
    lifetime = 300;
    loadable[] = {0, -1, 0.5};
    name = "Supply Crate";
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

class Vehicle_Ammo: Gear {
    cost = 250;
    hasRearm = 1;
    lifetime = 300;
    loadable[] = {0, 0, 0};
    offset[] = {0, 3, 0};
};
class Box_NATO_AmmoVeh_F: Vehicle_Ammo {
    side[] = {"west"};
};
class Box_East_AmmoVeh_F: Vehicle_Ammo {
    side[] = {"east"};
};
class Box_IND_AmmoVeh_F: Vehicle_Ammo {
    side[] = {"guer"};
};

class Huron_Pod: Gear {
    cost = 500;
    loadable[] = {0, -1.5, 0.5};
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
    cost = 500;
    loadable[] = {0, -1.8, 0.4};
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