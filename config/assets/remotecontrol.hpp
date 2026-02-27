class Remote_Control {
    category = "Remote Control";
};

// UGAS demining
class UAGS_Demining: Remote_Control {
    cost = 100;
    loadable[] = {0, -1, -0.5};
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
    loadable[] = {-0.4, -1, 1.1};
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
    offset[] = {0, 3, 0};
    requirements[] = {"S"};
};
class B_UAV_06_F: AR6 {
    side[] = {"west"};
};
class O_UAV_06_F: AR6 {
    side[] = {"east"};
};

// Offroad (IED)
class Offroad_IED: Remote_Control {
    aps = 4;
    cost = 4000;
    description = "Offroad (IED) is a variant of the Offroad that goes boom.";
    detonate = 13;
    drone = 1;
    loadable[] = {0, -1.7, 1.3};
    name = "Offroad (IED)";
    offset[] = {0, 5, 0};
    rearm = 900;
    requirements[] = {"S"};
    variant = 1;
};
class B_GEN_Offroad_01_comms_F: Offroad_IED {
    side[] = {"west"};
};
class I_E_Offroad_01_comms_F: Offroad_IED {
    side[] = {"east"};
};

// KH-3A Fenghuang
class O_T_UAV_04_CAS_F: Remote_Control {
    cost = 5500;
    hasHMD = 1;
    loadable[] = {0, -1.0, 0};
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

class Scout_Drone: Remote_Control {
    cost = 6500;
    hasHMD = 1;
    loadable[] = {0, -1.0, 0};
    rearm = 300;
    requirements[] = {"H"};
};
// Greyhawk
class B_UAV_02_dynamicLoadout_F: Scout_Drone {
    allowPylonMagazines[] = {
        "PylonRack_12Rnd_PGM_missiles"
    };
    side[] = {"west"};
};
// K40 Ababil-3
class O_UAV_02_dynamicLoadout_F: Scout_Drone {
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
    cost = 7000;
    hasHMD = 1;
    loadable[] = {0, -2.2, 0.1};
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
    loadable[] = {0, -2.2, -0.4};
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