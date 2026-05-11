class Naval {
    category = "Naval";
    requirements[] = {"W"};
};

// Water scooter
class Scooter: Naval {
    cost = 50;
    name = "Water scooter";
    nameShort = "SCOOTER";
    spawn = "C_Scooter_Transport_01_F";
};
class B_Scooter: Scooter {
    side[] = {"west"};
};
class O_Scooter: Scooter {
    side[] = {"east"};
};
class I_Scooter: Scooter {
    side[] = {"guer"};
};

// Assault Boat
class AssaultBoat: Naval {
    cost = 100;
    nameShort = "ZODIAC";
};
class B_Boat_Transport_01_F: AssaultBoat {
    side[] = {"west"};
};
class O_Boat_Transport_01_F: AssaultBoat {
    side[] = {"east"};
};

// SDV
class SDV: Naval {
    cost = 250;
    nameShort = "SUB";
};
class B_SDV_01_F: SDV {
    side[] = {"west"};
};
class O_SDV_01_F: SDV {
    side[] = {"east"};
};

// Armed Speedboat
class Speedboat: Naval {
    cost = 500;
    nameShort = "GMG BOAT";
    rearm = 120;
};
class B_Boat_Armed_01_minigun_F: Speedboat {
    side[] = {"west"};
};
class O_Boat_Armed_01_hmg_F: Speedboat {
    side[] = {"east"};
};
class I_Boat_Armed_01_minigun_F: Speedboat {
    side[] = {"guer"};
};

// Bomb Boat
class Bomb_Boat: Naval {
    cost = 1750;
    description = "The Bomb Boat is a fast, agile transport boat that goes boom.";
    detonate = 7;
    drone = 1;
    loadable[] = {0, -2.5, 0.5};
    loadableAngle = 180;
    name = "Bomb Boat";
    nameShort = "BOMB BOAT";
    spawn = "C_Boat_Civil_01_F";
};
class B_Bomb_Boat: Bomb_Boat {
    side[] = {"west"};
};
class O_Bomb_Boat: Bomb_Boat {
    side[] = {"east"};
};