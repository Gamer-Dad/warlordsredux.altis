class Structures {
    category = "Structures";
    hideMap = 1;
};

// Guard Tower (H-barrier)
class Land_HBarrierTower_F: Structures {
    cost = 70;
    demolishable = 2;
    demolishStepTime = 10;
    offset[] = {0, 7, 0};
    side[] = {"west", "east", "guer"};
};

// Camouflage Vehicle Cover
class CamoNet: Structures {
    cost = 100;
    demolishable = 1;
    demolishStepTime = 3;
    offset[] = {0, 6, 0};
};
class CamoNet_BLUFOR_big_F: CamoNet {
    side[] = {"west"};
};
class CamoNet_OPFOR_big_F: CamoNet {
    side[] = {"east"};
};
class CamoNet_INDP_big_F: CamoNet {
    side[] = {"guer"};
};

// IR Masking Tent (Large)
class Land_IRMaskingCover_01_F: Structures {
    cost = 200;
    demolishable = 1;
    demolishStepTime = 3;
    offset[] = {0, 8, 0};
    side[] = {"west", "east", "guer"};
};

// Spawn Bunker
class Land_BagBunker_01_large_green_F: Structures {
    cost = 500;
    demolishable = 3;
    hasFastTravel = 1;
    hideMap = 0;
    name = "Spawn Bunker";
    offset[] = {0, 10, 0};
    requirements[] = {"F"};
    side[] = {"west", "east", "guer"};
};

class Defensive_Kits: Structures {
    demolishable = 1;
    demolishStepTime = 5;
    obstacle = 1;
    offset[] = {0, 5, 0};
};

class Land_BagFence_Long_F: Defensive_Kits {
    cost = 500;
    fragile = 500;
    loaded = "Land_BagFence_Long_F";
    name = "Sandbag Wall Kit";
    offset[] = {0, 3, 0};
    side[] = {"west", "east", "guer"};
};

class Land_SandbagBarricade_01_hole_F: Defensive_Kits {
    cost = 750;
    fragile = 1000;
    loaded = "Land_SandbagBarricade_01_hole_F";
    name = "Sandbag Barricade Kit";
    offset[] = {0, 4, 0};
    side[] = {"west", "east", "guer"};
};

class Land_New_WiredFence_10m_F: Defensive_Kits {
    cost = 1000;
    fragile = 200;
    loaded = "Land_New_WiredFence_10m_F";
    name = "Razor Wire Fence Kit";
    side[] = {"west", "east", "guer"};
};

class Land_HBarrier_5_F: Defensive_Kits {
    cost = 1200;
    fragile = 10000;
    loaded = "Land_HBarrier_5_F";
    name = "H-Barrier Kit";
    offset[] = {0, 3, 0};
    side[] = {"west", "east", "guer"};
};

// H-barrier wall
class Land_HBarrierWall6_F: Defensive_Kits {
    cost = 1500;
    fragile = 15000;
    loaded = "Land_HBarrierWall6_F";
    name = "H-Barrier Wall Kit";
    offset[] = {0, 3, 0};
    side[] = {"west", "east", "guer"};
};

class Land_DragonsTeeth_01_4x2_new_F: Defensive_Kits {
    cost = 2800;
    loaded = "Land_DragonsTeeth_01_4x2_new_F";
    name = "Dragon's Teeth Kit";
    side[] = {"west", "east", "guer"};
};

class Land_CzechHedgehog_01_new_F: Defensive_Kits {
    cost = 3000;
    loaded = "Land_CzechHedgehog_01_new_F";
    name = "Czech Hedgehog Kit";
    obstacle = 2;
    side[] = {"west", "east", "guer"};
};

// Cargo Tower
class Land_Cargo_Tower_V4_F: Structures {
    cost = 3500;
    demolishable = 2;
    demolishStepTime = 5;
    name = "Cargo Tower";
    offset[] = {0, 8, 0};
    side[] = {"west", "east", "guer"};
};

class Land_CraneRail_01_F: Structures {
    cost = 5000;
    demolishable = 3;
    description = "Aircraft Catapult can be used to launch fighter jets from your forward airbase.";
    hideMap = 0;
    name = "Aircraft Catapult";
    offset[] = {0, 14, 0};
    requirements[] = {"FA"};
    side[] = {"west", "east", "guer"};
};