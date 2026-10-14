class Structures {
    category = "Structures";
    hideMap = 1;
    nameShort = "DEF";
};

// Camouflage Vehicle Cover
// class CamoNet: Structures {
//     cost = 100;
//     demolishable = 1;
//     demolishStepTime = 3;
//     offset[] = {0, 6, 0};
// };
// class CamoNet_BLUFOR_big_F: CamoNet {
//     side[] = {"west"};
// };
// class CamoNet_OPFOR_big_F: CamoNet {
//     side[] = {"east"};
// };
// class CamoNet_INDP_big_F: CamoNet {
//     side[] = {"guer"};
// };

// IR Masking Tent (Large)
class Land_IRMaskingCover_01_F: Structures {
    cost = 200;
    demolishable = 1;
    demolishStepTime = 3;
    offset[] = {0, 8, 0};
    side[] = {"west", "east", "guer"};
};

class Land_BagBunker_Small_F: Structures {
    attachments[] = {
        {"\A3\Supplies_F_Heli\CargoNets\CargoNet_01_barrels_F.p3d", {-2.8, 0, -0.5}, 0, ""},
        {"\A3\Supplies_F_Heli\CargoNets\CargoNet_01_barrels_F.p3d", {-2.8, -1.5, -0.5}, 0, ""},
        {"\A3\Structures_F_Heli\Civ\Constructions\ToolTrolley_02_F.p3d", {2.5, -1.5, -0.5}, 180, ""},
        {"\A3\Weapons_F_Bootcamp\Ammoboxes\Ammobox_02_F.p3d", {3.0, 0, 0.3}, 0, ""}
    };
    container[] = {
        { "Toolkit", 1 }
    };
    cost = 1000;
    demolishable = 1;
    demolishStepTime = 1;
    disableDamage = 1;
    hasFastTravel = 1;
    hasRearm = 1;
    hasRefuel = 1;
    hasRepair = 1;
    hideMap = 0;
    name = "Fighting Position";
    nameShort = "BUNKER";
    offset[] = {0, 5, 0};
    showToEnemies = 500;
    side[] = {"west", "east", "guer"};
};

class Defensive_Kits: Structures {
    demolishable = 1;
    demolishStepTime = 7;
    obstacle = 1;
    offset[] = {0, 5, 0};
    reward = 5;
};

// class Land_BagFence_Long_F: Defensive_Kits {
//     cost = 500;
//     fragile = 3000;
//     loaded = "Land_BagFence_Long_F";
//     name = "Sandbag Wall Kit";
//     nameShort = "SANDBAG";
//     offset[] = {0, 3, 0};
//     side[] = {"west", "east", "guer"};
// };

// class Land_SandbagBarricade_01_hole_F: Defensive_Kits {
//     cost = 750;
//     fragile = 5000;
//     loaded = "Land_SandbagBarricade_01_hole_F";
//     name = "Sandbag Barricade Kit";
//     nameShort = "SANDBAG";
//     offset[] = {0, 4, 0};
//     side[] = {"west", "east", "guer"};
// };

// class Land_HBarrier_5_F: Defensive_Kits {
//     cost = 1200;
//     fragile = 10000;
//     loaded = "Land_HBarrier_5_F";
//     name = "H-Barrier Kit";
//     nameShort = "HESCO";
//     offset[] = {0, 3, 0};
//     side[] = {"west", "east", "guer"};
// };

class Land_HBarrierWall6_F: Defensive_Kits {
    cost = 1500;
    fragile = 10000;
    loaded = "Land_HBarrierWall6_F";
    name = "H-Barrier Wall Kit";
    nameShort = "HESCO";
    offset[] = {0, 3, 0};
    side[] = {"west", "east", "guer"};
};

class Land_HBarrierWall_corridor_F: Defensive_Kits {
    cost = 1500;
    fragile = 50000;
    loaded = "Land_HBarrierWall_corridor_F";
    name = "H-Barrier Wall Corridor Kit";
    nameShort = "HESCO";
    offset[] = {0, 5, 0};
    side[] = {"west", "east", "guer"};
};

class Land_DragonsTeeth_01_4x2_new_F: Defensive_Kits {
    cost = 1500;
    loaded = "Land_DragonsTeeth_01_4x2_new_F";
    name = "Dragon's Teeth Kit";
    nameShort = "TANK TRAP";
    obstacle = 2;
    side[] = {"west", "east", "guer"};
};

class Vehicle_Decoy: Structures {
    cost = 1000;
    decoy = 1;
    demolishable = 3;
    demolishStepTime = 5;
    disableDamage = 1;
    obstacle = 1;
    variant = 1;
};
class B_Vehicle_Decoy: Vehicle_Decoy {
    textures[] = {
        "#(rgb,8,8,3)color(1,1,1,0.1)",
        "#(rgb,8,8,3)color(1,1,1,0.1)",
        "#(rgb,8,8,3)color(1,1,1,0.1)",
        "#(rgb,8,8,3)color(1,1,1,0.1)"
    };
};
class B_Gorgon_Decoy: B_Vehicle_Decoy {
    name = "AFV-4 Gorgon";
    nameShort = "GORGON";
    side[] = {"west"};
    spawn = "B_APC_Wheeled_03_cannon_F";
};
class B_Rhino_Decoy: B_Vehicle_Decoy {
    name = "Rhino MGS";
    nameShort = "RHINO";
    side[] = {"west"};
    spawn = "B_AFV_Wheeled_01_cannon_F";
};
class B_Slammer_Decoy: B_Vehicle_Decoy {
    name = "M2A1 Slammer UP";
    nameShort = "SLAMMER UP";
    side[] = {"west"};
    spawn = "B_MBT_01_TUSK_F";
};
class O_Vehicle_Decoy: Vehicle_Decoy {
    textures[] = {
        "#(rgb,8,8,3)color(1,1,1,0.02)",
        "#(rgb,8,8,3)color(1,1,1,0.02)",
        "#(rgb,8,8,3)color(1,1,1,0.02)",
        "#(rgb,8,8,3)color(1,1,1,0.02)"
    };
};
class O_Kamysh_Decoy: O_Vehicle_Decoy {
    name = "BTR-K Kamysh";
    nameShort = "BTR";
    side[] = {"east"};
    spawn = "O_APC_Tracked_02_cannon_F";
};
class O_Angara_Decoy: O_Vehicle_Decoy {
    name = "T-140K Angara";
    nameShort = "ANGARA-K";
    side[] = {"east"};
    spawn = "O_MBT_04_command_F";
};
class O_Kajman_Decoy: O_Vehicle_Decoy {
    name = "Mi-48 Kajman";
    nameShort = "KAJMAN";
    side[] = {"east"};
    spawn = "O_Heli_Attack_02_black_F";
};

class Land_CzechHedgehog_01_new_F: Defensive_Kits {
    cost = 2000;
    loaded = "Land_CzechHedgehog_01_new_F";
    name = "Czech Hedgehog Kit";
    nameShort = "TANK TRAP";
    obstacle = 2;
    side[] = {"west", "east", "guer"};
};

class Land_CraneRail_01_F: Structures {
    cost = 5000;
    demolishable = 3;
    description = "Aircraft Catapult can be used to launch jets and drones.";
    hideMap = 0;
    name = "Aircraft Catapult";
    nameShort = "CATAPULT";
    offset[] = {0, 14, 0};
    side[] = {"west", "east", "guer"};
};