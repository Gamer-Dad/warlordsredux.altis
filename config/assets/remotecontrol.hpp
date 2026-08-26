class Remote_Control {
    category = "Remote Control";
};

// Remote Designator
class Static_Designator: Remote_Control {
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

// UGAS demining
class UAGS_Demining: Remote_Control {
    cost = 100;
    loadable = 1;
    nameShort = "UGAS";
    offset[] = {0, 3, 0};
    rearm = 120;
};
class B_UGV_02_Demining_F: UAGS_Demining {
    side[] = {"west"};
};
class O_UGV_02_Demining_F: UAGS_Demining {
    side[] = {"east"};
};

// UGV Stomper
class UGV: Remote_Control {
    cost = 150;
    loadable = 1;
    nameShort = "STOMPER";
    offset[] = {0, 5, 0};
    rearm = 120;
};
class B_UGV_01_F: UGV {
    loaded =  "B_Faction_Crate";
    side[] = {"west"};
};
class O_UGV_01_F: UGV {
    loaded =  "O_Faction_Crate";
    side[] = {"east"};
};

// AR-2
class AR2: Remote_Control {
    cost = 500;
    fragileDrone = 1;
    hasHMD = 1;
    nameShort = "DARTER";
    offset[] = {0, 3, 0};
};
class B_UAV_01_F: AR2 {
    side[] = {"west"};
};
class O_UAV_01_F: AR2 {
    side[] = {"east"};
};

// UGV Stomper RCWS
class UGV_RCWS: UGV {
    cost = 500;
    nameShort = "STOMPER";
};
class B_UGV_01_rcws_F: UGV_RCWS {
    side[] = {"west"};
};
class O_UGV_01_rcws_F: UGV_RCWS {
    side[] = {"east"};
};

// AR-6
class AR6: Remote_Control {
    cost = 1000;
    detonate = 1;
    fragileDrone = 1;
    nameShort = "PELICAN";
    offset[] = {0, 3, 0};
    requirements[] = {"S"};
};
class B_UAV_06_F: AR6 {
    side[] = {"west"};
};
class O_UAV_06_F: AR6 {
    side[] = {"east"};
};

class Loitering_Munition: Remote_Control {
    cost = 1500;
    description = "Loitering munition that can be piloted to its target.";
    detonate = 7;
    loadable = 1;
    requirements[] = {"FA"};
    spawn = "O_T_UAV_04_CAS_F";
    variant = 1;

    class Pilot: WLTurretDefaults {
        removeMagazines[] = {
            "120Rnd_CMFlare_Chaff_Magazine"
        };
        removeWeapons[] = {
            "CMFlareLauncher"
        };
        turret[] = {-1};
    };
    class Gunner: WLTurretDefaults {
        removeMagazines[] = {
            "4Rnd_LG_Jian",
            "Laserbatteries"
        };
        removeWeapons[] = {
            "missiles_Jian",
            "Laserdesignator_mounted"
        };
        turret[] = {0};
    };
};
class B_Lucas: Loitering_Munition {
    name = "FLM-136 LUCAS";
    nameShort = "LUCAS";
    side[] = {"west"};
};
class O_Shahed: Loitering_Munition {
    name = "HESA Shahed-136";
    nameShort = "SHAHED";
    side[] = {"east"};
};

class AR7: Remote_Control {
    ammoOverrides[] = {
        {"BombDemine_01_Ammo_F", {"BombDemine_01_Ammo_F", "Grenade"}}
    };
    cost = 2000;
    fragileDrone = 1;
    hasHMD = 1;
    nameShort = "RAVEN";
    offset[] = {0, 3, 0};
    rearm = 240;

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "PylonRack_4Rnd_BombDemine_01_F",
            "PylonRack_4Rnd_BombDemine_01_F"
        };
        addWeapons[] = {
            "BombDemine_01_F"
        };
        turret[] = {-1};
    };
};
class B_AR7: AR7 {
    name = "AR-7 Raven";
    side[] = {"west"};
    spawn = "B_UAV_06_F";
};
class O_AR7: AR7 {
    name = "AR-7 Raven";
    side[] = {"east"};
    spawn = "O_UAV_06_F";
};

// Offroad (IED)
class Offroad_IED: Remote_Control {
    aps = 4;
    cost = 4000;
    description = "Offroad (IED) is a variant of the Offroad that goes boom.";
    detonate = 11;
    drone = 1;
    loadable = 1;
    name = "Offroad (IED)";
    nameShort = "VBIED";
    offset[] = {0, 5, 0};
    rearm = 900;
    requirements[] = {"S"};
};
class B_GEN_Offroad_01_comms_F: Offroad_IED {
    side[] = {"west"};
};
class I_E_Offroad_01_comms_F: Offroad_IED {
    side[] = {"east"};
};

// KH-3A Fenghuang
class O_T_UAV_04_CAS_F: Remote_Control {
    cost = 4500;
    hasHMD = 1;
    nameShort = "FENGHUANG";
    rearm = 300;
    requirements[] = {"H"};
    side[] = {"east"};

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "240Rnd_CMFlare_Chaff_Magazine"
        };
        removeMagazines[] = {
            "120Rnd_CMFlare_Chaff_Magazine"
        };
        turret[] = {-1};
    };
    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "4Rnd_LG_Jian"
        };
        turret[] = {0};
    };
};

// Scout Stealth Helo
// class Scout_Stealth_Helo: Remote_Control {
//     cost = 5000;
//     disallowMagazines[] = {
//         "PylonRack_12Rnd_PG_missiles",
//         "PylonRack_12Rnd_missiles",
//         "PylonRack_1Rnd_LG_scalpel",
//         "PylonRack_3Rnd_LG_scalpel",
//         "PylonRack_7Rnd_Rocket_04_AP_F"
//     };
//     hasHMD = 1;
//     hasReconOptics = 1;
//     rearm = 300;
//     requirements[] = {"FA"};
//     spawn = "B_T_UAV_03_dynamicLoadout_F";
//     variant = 1;

//     class Pilot: WLTurretDefaults {
//         addMagazines[] = {
//             "300Rnd_CMFlare_Chaff_Magazine"
//         };
//         addWeapons[] = {
//             "CMFlareLauncher_Singles"
//         };
//         removeMagazines[] = {
//             "120Rnd_CMFlare_Chaff_Magazine"
//         };
//         removeWeapons[] = {
//             "CMFlareLauncher"
//         };
//         turret[] = {-1};
//     };
// };

// class B_Scout_Falcon: Scout_Stealth_Helo {
//     allowPylonMagazines[] = {
//         "PylonRack_Missile_BIM9X_x2"
//     };
//     name = "RQ-12 Scout Falcon";
//     side[] = {"west"};
// };
// class O_Scout_Falcon: Scout_Stealth_Helo {
//     allowPylonMagazines[] = {
//         "PylonMissile_Missile_AA_R73_x1"
//     };
//     name = "SY-12 Meyu Arrow";
//     side[] = {"east"};
// };

class Predator_Drone: Remote_Control {
    cost = 5500;
    hasHMD = 1;
    nameShort = "PREDATOR";
    rearm = 300;
    requirements[] = {"H"};
};
// Greyhawk
class B_UAV_02_dynamicLoadout_F: Predator_Drone {
    allowPylonMagazines[] = {
        "PylonRack_12Rnd_PGM_missiles"
    };
    side[] = {"west"};
};
// K40 Ababil-3
class O_UAV_02_dynamicLoadout_F: Predator_Drone {
    allowPylonMagazines[] = {
        "PylonRack_12Rnd_PG_missiles",
        "PylonRack_12Rnd_PGM_missiles"
    };
    side[] = {"east"};
};

// Falcon
class B_T_UAV_03_dynamicLoadout_F: Remote_Control {
    allowPylonMagazines[] = {
        "PylonRack_12Rnd_PGM_missiles",
        "PylonRack_1Rnd_AAA_missiles"
    };
    cost = 6000;
    hasHMD = 1;
    nameShort = "FALCON";
    rearm = 300;
    requirements[] = {"H"};
    side[] = {"west"};

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "240Rnd_CMFlare_Chaff_Magazine"
        };
        removeMagazines[] = {
            "120Rnd_CMFlare_Chaff_Magazine"
        };
        turret[] = {-1};
    };
};

// UCAV Sentinel
class B_UAV_05_F: Remote_Control {
    cost = 15000;
    hasHMD = 1;
    nameShort = "SENTINEL";
    rearm = 420;
    requirements[] = {"A"};
    side[] = {"west"};

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "240Rnd_CMFlare_Chaff_Magazine"
        };
        removeMagazines[] = {
            "120Rnd_CMFlare_Chaff_Magazine"
        };
        turret[] = {-1};
    };
};

class B_Pegasus: B_UAV_05_F {
    ammoOverrides[] = {
        {"Bomb_04_F", {"ammo_gbu12_gps", "GBU-12 (GPS-Guided)"}},
        {"Bo_Mk82", {"M_MineLayerDense", "CBU-103/B Mine Layer"}}
    };
    disallowMagazines[] = {
        "PylonMissile_Bomb_GBU12_x1",
        "PylonMissile_Missile_HARM_INT_x1",
        "PylonRack_Bomb_SDB_x4",
        "PylonMissile_Missile_AGM_02_x2"
    };
    hasReconOptics = 1;
    name = "RQ-47 Pegasus";
    nameShort = "PEGASUS";
    rearm = 420;
    scanner = 1000;
    side[] = {};
    spawn = "B_UAV_05_F";
    threatDetection = 8000;

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "300Rnd_CMFlare_Chaff_Magazine",
            "PylonMissile_1Rnd_Mk82_F",
            "PylonMissile_1Rnd_Mk82_F",
            "magazine_Bomb_GBU12_x1",
            "magazine_Bomb_GBU12_x1",
            "magazine_Bomb_GBU12_x1",
            "magazine_Bomb_GBU12_x1",
            "magazine_Bomb_GBU12_x1",
            "magazine_Bomb_GBU12_x1",
            "magazine_Bomb_GBU12_x1",
            "magazine_Bomb_GBU12_x1",
            "magazine_Bomb_GBU12_x1",
            "magazine_Bomb_GBU12_x1",
            "magazine_Bomb_GBU12_x1",
            "magazine_Bomb_GBU12_x1",
            "magazine_Bomb_GBU12_x1",
            "magazine_Bomb_GBU12_x1",
            "magazine_Bomb_GBU12_x1",
            "magazine_Bomb_GBU12_x1",
            "magazine_Bomb_GBU12_x1",
            "magazine_Bomb_GBU12_x1",
            "magazine_Bomb_GBU12_x1",
            "magazine_Bomb_GBU12_x1"
        };
        addWeapons[] = {
            "Mk82BombLauncher",
            "weapon_GBU12Launcher"
        };
        turret[] = {-1};
    };
};
