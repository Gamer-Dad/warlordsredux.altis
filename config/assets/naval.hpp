class Naval {
    category = "Naval";
    requirements[] = {"W"};
};

// Water scooter
class Scooter: Naval {
    cost = 50;
    name = "Water scooter";
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
    hasStabilize = 1;
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

// Upgraded Speedboat
class Speedboat_Upgraded: Naval {
    cost = 1000;
    disallowMagazines[] = {
        "4Rnd_GAA_missiles"
    };
    hasHMD = 1;
    hasStabilize = 1;
    rearm = 120;
    variant = 1;
};
class B_Speedboat_Upgraded: Speedboat_Upgraded {
    ammoOverrides[] = {
        {"ammo_Missile_AMRAAM_C", {"ammo_Missile_AMRAAM_ground", "SL-AMRAAM"}},
        {"ammo_Missile_AMRAAM_D", {"ammo_Missile_AMRAAM_ground", "SL-AMRAAM"}}
    };
    description = "Riverine Command Boat is an upgraded, heavily-armed variant of the Speedboat.";
    name = "Riverine Command Boat";
    side[] = {"west"};
    spawn = "B_Boat_Armed_01_minigun_F";

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "60Rnd_30mm_MP_shells_Tracer_Green",
            "60Rnd_30mm_MP_shells_Tracer_Green",
            "60Rnd_30mm_MP_shells_Tracer_Green",
            "5Rnd_GAT_missiles",
            "5Rnd_GAT_missiles",
            "PylonMissile_Missile_AMRAAM_D_x1",
            "PylonMissile_Missile_AMRAAM_D_x1"
        };
        addWeapons[] = {
            "autocannon_30mm_RCWS",
            "missiles_titan",
            "weapon_AMRAAMLauncher"
        };
        removeMagazines[] = {
            "96Rnd_40mm_G_belt"
        };
        removeWeapons[] = {
            "GMG_40mm"
        };
        turret[] = {0};
    };
};
class O_Speedboat_Upgraded: Speedboat_Upgraded {
    ammoOverrides[] = {
        {"ammo_Missile_AA_R77", {"ammo_Missile_AA_R77_ground", "R-77-ZRK"}}
    };
    description = "Alligator Attack Boat is an upgraded, heavily-armed variant of the Speedboat.";
    name = "Alligator Attack Boat";
    side[] = {"east"};
    spawn = "O_Boat_Armed_01_hmg_F";

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "60Rnd_30mm_MP_shells_Tracer_Green",
            "60Rnd_30mm_MP_shells_Tracer_Green",
            "60Rnd_30mm_MP_shells_Tracer_Green",
            "5Rnd_GAT_missiles",
            "5Rnd_GAT_missiles",
            "magazine_Missile_AA_R77_x1",
            "magazine_Missile_AA_R77_x1"
        };
        addWeapons[] = {
            "autocannon_30mm_RCWS",
            "missiles_titan",
            "weapon_R77Launcher"
        };
        removeMagazines[] = {
            "96Rnd_40mm_G_belt"
        };
        removeWeapons[] = {
            "GMG_40mm"
        };
        turret[] = {0};
    };
};

// Supply RHIB
class Supply_Boat: Naval {
    cost = 1500;
    description = "The Supply RHIB is a fast, agile transport boat that can deploy a supply crate.";
    hasFastTravel = 1;
    loaded = "Land_Cargo20_blue_F";
    name = "Supply RHIB";
    spawn = "I_C_Boat_Transport_02_F";
};
class B_Supply_Boat: Supply_Boat {
    side[] = {"west"};
};
class O_Supply_Boat: Supply_Boat {
    side[] = {"east"};
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
    spawn = "C_Boat_Civil_01_F";
};
class B_Bomb_Boat: Bomb_Boat {
    side[] = {"west"};
};
class O_Bomb_Boat: Bomb_Boat {
    side[] = {"east"};
};