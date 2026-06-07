class Sector_Defense {
    category = "Sector Defense";
};

// Remote Designator
class Static_Designator: Sector_Defense {
    cost = 50;
    loadable = 1;
    nameShort = "DESIGNATOR";
    offset[] = {0, 3, 0};
    rearm = 60;
};
class B_Static_Designator_01_F: Static_Designator {
    side[] = {"west"};
};
class O_Static_Designator_02_F: Static_Designator {
    side[] = {"east"};
};

// Mk30 HMG .50
class Static_HMG: Sector_Defense {
    cost = 150;
    loadable = 1;
    nameShort = "STATIC HMG";
    offset[] = {0, 3, 0};
    rearm = 120;

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "100Rnd_127x99_mag",
            "100Rnd_127x99_mag",
            "100Rnd_127x99_mag",
            "100Rnd_127x99_mag"
        };
        addWeapons[] = {
            "HMG_static"
        };
        removeWeapons[] = {
            "HMG_static"
        };
        turret[] = {0};
    };
};
class B_HMG_01_F: Static_HMG {
    side[] = {"west"};
};
class O_HMG_01_F: Static_HMG {
    side[] = {"east"};
};

// Mk30 HMG .50 (Raised)
class Static_HMG_Raised: Static_HMG {
    cost = 200;
    loadable = 1;
    nameShort = "STATIC HMG";

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "100Rnd_127x99_mag",
            "100Rnd_127x99_mag",
            "100Rnd_127x99_mag",
            "100Rnd_127x99_mag"
        };
        addWeapons[] = {
            "HMG_static"
        };
        removeWeapons[] = {
            "HMG_static"
        };
        turret[] = {0};
    };
};
class B_HMG_01_high_F: Static_HMG_Raised {
    side[] = {"west"};
};
class O_HMG_01_high_F: Static_HMG_Raised {
    side[] = {"east"};
};

// Mk32 GMG 20mm
class Static_GMG: Sector_Defense {
    cost = 200;
    loadable = 1;
    nameShort = "STATIC GMG";
    offset[] = {0, 3, 0};
    rearm = 120;
};
class B_GMG_01_F: Static_GMG {
    side[] = {"west"};
};
class O_GMG_01_F: Static_GMG {
    side[] = {"east"};
};

// Mk32 GMG 20mm (Raised)
class Static_GMG_Raised: Static_GMG {
    cost = 250;
    loadable = 1;
    nameShort = "STATIC GMG";
};
class B_GMG_01_high_F: Static_GMG_Raised {
    side[] = {"west"};
};
class O_GMG_01_high_F: Static_GMG_Raised {
    side[] = {"east"};
};

// Static Titan Launcher (AT)
class Static_AT: Sector_Defense {
    cost = 300;
    hasTurretVisualizer = 1;
    loadable = 1;
    nameShort = "TITAN";
    offset[] = {0, 3, 0};
    rearm = 180;

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "1Rnd_GAT_missiles",
            "1Rnd_GAT_missiles",
            "1Rnd_GAT_missiles",
            "1Rnd_GAT_missiles",
            "1Rnd_GAT_missiles",
            "1Rnd_GAT_missiles"
        };
        addWeapons[] = {
            "missiles_titan_static"
        };
        removeWeapons[] = {
            "missiles_titan_static"
        };
        turret[] = {0};
    };
};
class B_static_AT_F: Static_AT {
    side[] = {"west"};
};
class O_static_AT_F: Static_AT {
    side[] = {"east"};
};

class AT_Minefield: Sector_Defense {
    cost = 1000;
    demolishable = 1;
    demolishStepTime = 4;
    description = "Anti-tank minefield that contains hidden anti-tank mines.";
    dumbMine[] = {50, 10, 1};
    loadable = 1;
    name = "Minefield (AT)";
    nameShort = "MINEFIELD";
    obstacle = 2;
    offset[] = {0, 3, 0};
    requirements[] = {"S"};
    showToEnemies = 1200;
    spawn = "Land_Sign_MinesDanger_English_F";
};
class AT_MinefieldLarge: AT_Minefield {
    dumbMine[] = {100, 20, 1};
    name = "Minefield (AT, Rectangular)";
    side[] = {"west", "east", "guer"};
};
class AT_MinefieldCircular: AT_Minefield {
    dumbMine[] = {50, 50, 0};
    name = "Minefield (AT, Circular)";
    side[] = {"west"};
};
class AT_MinefieldHex: AT_Minefield {
    dumbMine[] = {-50, -50, 0};
    name = "Minefield (AT, Hex)";
    side[] = {"east"};
};
class AT_DeployedMinefield: AT_Minefield {
    cost = 2000;
    demolishable = 3;
    demolishStepTime = 60;
    dumbMine[] = {450, 450, 0};
    name = "Minefield (GATOR)";
    showToEnemies = 3000;
    singleton = 1;
};

// Mk30 HMG Auto Turret
class Static_HMG_Auto: Sector_Defense {
    cost = 500;
    loadable = 1;
    name = "Mk30 HMG Auto Turret";
    nameShort = "AUTO HMG";
    offset[] = {0, 3, 0};
    rearm = 120;
    requirements[] = {"S"};

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "100Rnd_127x99_mag",
            "100Rnd_127x99_mag",
            "100Rnd_127x99_mag",
            "100Rnd_127x99_mag"
        };
        addWeapons[] = {
            "HMG_static"
        };
        removeWeapons[] = {
            "HMG_static"
        };
        turret[] = {0};
    };
};
class B_HMG_01_A_F: Static_HMG_Auto {
    side[] = {"west"};
};
class O_HMG_01_A_F: Static_HMG_Auto {
    side[] = {"east"};
};

// Mk32 GMG Auto Turret
class Static_GMG_Auto: Sector_Defense {
    cost = 650;
    loadable = 1;
    name = "Mk32 GMG Auto Turret";
    nameShort = "AUTO GMG";
    offset[] = {0, 3, 0};
    rearm = 120;
    requirements[] = {"S"};
};
class B_GMG_01_A_F: Static_GMG_Auto {
    side[] = {"west"};
};
class O_GMG_01_A_F: Static_GMG_Auto {
    side[] = {"east"};
};

// Smart Mine System
class Smart_Mine: Sector_Defense {
    cost = 1500;
    description = "Smart anti-tank mine system that launches anti-tank top-attack mines at enemy vehicles. Must be placed outside. Mines: 6 AP, 2 AT. Limit 4 deployed.";
    empty = 1;
    immobile = 1;
    loadable = 1;
    nameShort = "SMART MINE";
    offset[] = {0, 5, 0};
    rearm = 900;
    requirements[] = {"S"};
    singleton = 4;
    showToEnemies = 100;
    smartMineAP = 6;
    smartMineAT = 2;
};
class B_Smart_Mine: Smart_Mine {
    name = "XM205 Smart Mine System";
    side[] = {"west"};
    spawn = "B_UGV_01_F";
};
class O_Smart_Mine: Smart_Mine {
    name = "PTKM-2 Smart Mine System";
    side[] = {"east"};
    spawn = "O_UGV_01_F";
};
class I_Smart_Mine: Smart_Mine {
    name = "XM205 Smart Mine System";
    side[] = {"guer"};
    spawn = "I_UGV_01_F";
};

class Mortar: Sector_Defense {
    cost = 5000;
    loadable = 1;
    nameShort = "MORTAR";
    offset[] = {0, 3, 0};
    rearm = 900;
};
class B_Mortar_01_F: Mortar {
    side[] = {"west"};
};
class O_Mortar_01_F: Mortar {
    side[] = {"east"};
};

// Hunter/Ifrit Mortar
class MRAP_Mortar: Sector_Defense {
    aps = 1;
    capValue = 2;
    cost = 6000;
    loadable = 1;
    rearm = 900;
    showToEnemies = 200;
    variant = 1;
};
class B_Hunter_Mortar: MRAP_Mortar {
    integralWeapon[] = {32, {0, -2.5, 1.3}, "B_Mortar_01_F", "Integral_Mortar", "mortar_82mm", "8Rnd_82mm_Mo_shells", 8};
    name = "Hunter Mortar";
    nameShort = "HUNTER MORTAR";
    side[] = {"west"};
    spawn = "B_MRAP_01_F";
};
class O_Ifrit_Mortar: MRAP_Mortar {
    integralWeapon[] = {32, {0, -2.6, 1.1}, "B_Mortar_01_F", "Integral_Mortar", "mortar_82mm", "8Rnd_82mm_Mo_shells", 8};
    name = "Ifrit Mortar";
    nameShort = "IFRIT MORTAR";
    side[] = {"east"};
    spawn = "O_MRAP_02_F";
};

// MK45 Hammer
class B_Ship_Gun_01_F: Sector_Defense {
    cost = 22000;
    demolishable = 3;
    disallowMagazines[] = {
        "magazine_ShipCannon_120mm_HE_cluster_shells_x2",
        "magazine_ShipCannon_120mm_mine_shells_x6",
        "magazine_ShipCannon_120mm_AT_mine_shells_x6"
    };
    nameShort = "HAMMER";
    offset[] = {0, 9, 0};
    rearm = 1800;
    side[] = {"west"};
};