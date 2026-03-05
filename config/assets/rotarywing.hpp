class Rotary_Wing {
    category = "Rotary Wing";
    requirements[] = {"H"};
};

// MH-9 Hummingbird
class B_Heli_Light_01_F: Rotary_Wing {
    cost = 300;
    loadable[] = {0, -2.2, 0.9};
    side[] = {"west"};
};

// Mi-290 Taru
class Taru: Rotary_Wing {
    cost = 400;
    hasFastTravel = 1;
    hasSling = 1;
    loadable[] = {0, -2.2, 2.2};
    offset[] = {0, 10, 0};
};
class O_Heli_Transport_04_covered_F: Taru {
    side[] = {"east"};
};
class O_Heli_Transport_04_F: Taru {
    side[] = {"east"};
};
class O_Heli_Transport_04_medevac_F: Taru {
    side[] = {"east"};
};

// PO-30 Orca
class O_Heli_Light_02_unarmed_F: Rotary_Wing {
    cost = 500;
    hasHMD = 1;
    hasSling = 1;
    loadable[] = {0, -2.2, 1.3};
    offset[] = {0, 10, 0};
    rearm = 240;
    side[] = {"east"};
};
class O_Heli_Light_02_dynamicLoadout_F: O_Heli_Light_02_unarmed_F {
    allowPylonMagazines[] = {
        "PylonRack_12Rnd_PGM_missiles",
        "PylonRack_3Rnd_LG_scalpel",
        "PylonRack_4Rnd_LG_scalpel",
        "PylonMissile_Missile_AA_R73_x1",
        "PylonRack_Missile_BIM9X_x2"
    };
    ammoOverrides[] = {
        {"M_Scalpel_AT", {"M_Sidearm", "AGM-122 Sidearm"}}
    };
    cost = 3500;

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "300Rnd_CMFlare_Chaff_Magazine",
            "1000Rnd_20mm_shells"
        };
        addWeapons[] = {
            "CMFlareLauncher_Singles",
            "Twin_Cannon_20mm_gunpod"
        };
        removeMagazines[] = {
            "168Rnd_CMFlare_Chaff_Magazine"
        };
        removeWeapons[] = {
            "CMFlareLauncher"
        };
        turret[] = {-1};
    };
};

// UH-80 Ghost Hawk
class B_Heli_Transport_01_F: Rotary_Wing {
    cost = 800;
    hasHMD = 1;
    hasSling = 1;
    hasTurretVisualizer = 1;
    loadable[] = {0, -2.2, 1.5};
    offset[] = {0, 11, 0};
    rearm = 240;
    side[] = {"west"};
};
class B_Heli_Transport_01_pylons_F: B_Heli_Transport_01_F {
    allowPylonMagazines[] = {
        "PylonRack_Missile_BIM9X_x2"
    };
    cost = 5000;
    name = "UH-80 Ghost Hawk Block II";
    rearm = 300;

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "300Rnd_CMFlare_Chaff_Magazine"
        };
        addWeapons[] = {
            "CMFlareLauncher"
        };
        removeMagazines[] = {
            "168Rnd_CMFlare_Chaff_Magazine"
        };
        removeWeapons[] = {
            "CMFlareLauncher"
        };
        turret[] = {-1};
    };
};

class Transport_Helicopter: Rotary_Wing {
    hasSling = 1;
    loaded = "Static_Cannon";
    offset[] = {0, 10, 0};
    rearm = 240;
};

// CH-67 Huron
class B_Heli_Transport_03_F: Transport_Helicopter {
    cost = 1000;
    hasTurretVisualizer = 1;
    loadable[] = {0, -2.2, 2.1};
    side[] = {"west"};
};
class B_Heli_Transport_03_supply_F: B_Heli_Transport_03_F {
    loaded = "Land_Cargo20_blue_F";
    name = "CH-67 Huron Supply";
    requirements[] = {"H", "S"};
    spawn = "B_Heli_Transport_03_F";
    variant = 1;
};
class O_Mohawk: Transport_Helicopter {
    cost = 500;
    hasHMD = 1;
    loadable[] = {0, -2.2, 2.1};
    name = "CH-49 Mohawk";
    side[] = {"east"};
    spawn = "I_Heli_Transport_02_F";
    textures[] = {
        "A3\Air_F_Beta\Heli_Transport_02\Data\Skins\Heli_Transport_02_1_DAHOMAN_CO.paa",
        "A3\Air_F_Beta\Heli_Transport_02\Data\Skins\Heli_Transport_02_2_DAHOMAN_CO.paa",
        "A3\Air_F_Beta\Heli_Transport_02\Data\Skins\Heli_Transport_02_3_DAHOMAN_CO.paa",
        "A3\Air_F_Beta\Heli_Transport_02\Data\Heli_Transport_02_int_02_CO.paa"
    };
    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "240Rnd_CMFlare_Chaff_Magazine"
        };
        addWeapons[] = {
            "CMFlareLauncher_Singles"
        };
        removeMagazines[] = {
            "168Rnd_CMFlare_Chaff_Magazine"
        };
        removeWeapons[] = {
            "CMFlareLauncher"
        };
        turret[] = {-1};
    };
};
class O_Mohawk_Supply: O_Mohawk {
    loaded = "Land_Cargo20_brick_red_F";
    name = "CH-49 Mohawk Supply";
    requirements[] = {"H", "S"};
    spawn = "I_Heli_Transport_02_F";
    variant = 1;
};

// AH-9 Pawnee
class B_Heli_Light_01_dynamicLoadout_F: Rotary_Wing {
    cost = 3500;
    hasHMD = 1;
    hasReconOptics = 1;
    loadable[] = {0, -2.2, 0.9};
    rearm = 240;
    side[] = {"west"};
};

class Hellcat: Rotary_Wing {
    allowPylonMagazines[] = {
        "PylonRack_Missile_HARM_x1",
        "PylonRack_19Rnd_Rocket_Skyfire",
        "PylonRack_12Rnd_PGM_missiles",
        "PylonRack_Missile_BIM9X_x2"
    };
    ammoOverrides[] = {
        {"M_Scalpel_AT", {"M_Sidearm", "AGM-122 Sidearm"}}
    };
    cost = 4200;
    description = "WY-55 Hellcat is a light attack helicopter.";
    hasHMD = 1;
    hasSling = 1;
    loadable[] = {0, -2.2, 0.3};
    name = "WY-55 Hellcat";
    offset[] = {0, 9, 0};
    rearm = 240;
    spawn = "I_Heli_light_03_dynamicLoadout_F";

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "300Rnd_CMFlare_Chaff_Magazine",
            "2000Rnd_20mm_shells"
        };
        addWeapons[] = {
            "CMFlareLauncher_Singles",
            "Twin_Cannon_20mm_gunpod"
        };
        removeMagazines[] = {
            "168Rnd_CMFlare_Chaff_Magazine",
            "5000Rnd_762x51_Belt"
        };
        removeWeapons[] = {
            "CMFlareLauncher",
            "M134_minigun"
        };
        turret[] = {-1};
    };
};
class B_Hellcat: Hellcat {
    side[] = {"west"};
    textures[] = {
        "\A3\Air_F_Enoch\Heli_Light_03\data\Heli_Light_03_base_EAF_CO.paa",
        "\a3\Supplies_F_Enoch\Ammoboxes\Data\AmmoBox_EAF_CO.paa",
        "\a3\Supplies_F_Enoch\Ammoboxes\Data\AmmoBox_signs_EAF_CA.paa"
    };
};
class I_Hellcat: Hellcat {
    aircraftSpawn = 1;
    side[] = {"guer"};
};

// Mi-48 Kajman
class O_Heli_Attack_02_dynamicLoadout_F: Rotary_Wing {
    allowPylonMagazines[] = {
        "PylonRack_12Rnd_PG_missiles",
        "PylonRack_12Rnd_PGM_missiles",
        "PylonMissile_Missile_KH58_INT_x1",
        "PylonMissile_Missile_AA_R73_x1",
        {"PylonMissile_Missile_AA_R77_x1", {"PylonLeft1", "PylonRight1"}}
    };
    ammoOverrides[] = {
        {"M_Scalpel_AT", {"M_Sidearm", "AGM-122 Sidearm"}}
    };
    cost = 8000;
    hasGunnerAction = 1;
    hasHMD = 1;
    hasSling = 1;
    hasTurretVisualizer = 1;
    loadable[] = {0, -2.2, 2.0};
    offset[] = {0, 11, 0};
    rearm = 300;
    side[] = {"east"};

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "300Rnd_CMFlare_Chaff_Magazine"
        };
        addWeapons[] = {
            "CMFlareLauncher_Singles"
        };
        removeMagazines[] = {
            "192Rnd_CMFlare_Chaff_Magazine"
        };
        removeWeapons[] = {
            "CMFlareLauncher"
        };
        turret[] = {-1};
    };
    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "250Rnd_30mm_HE_shells_Tracer_Green",
            "250Rnd_30mm_HE_shells_Tracer_Green"
        };
        deviceJammer = 1;
        turret[] = {0};
    };
};

// AH-99 Blackfoot
class B_Heli_Attack_01_dynamicLoadout_F: Rotary_Wing {
    allowPylonMagazines[] = {
        "PylonRack_Missile_BIM9X_x1",
        {"PylonRack_Missile_BIM9X_x2", {"PylonLeft1", "PylonLeft3", "PylonRight1", "PylonRight3"}},
        {"PylonRack_Missile_HARM_x1", {"PylonLeft1", "PylonLeft3", "PylonRight1", "PylonRight3"}},
        {"PylonRack_12Rnd_PGM_missiles", {"PylonLeft1", "PylonLeft3", "PylonRight1", "PylonRight3"}},
        {"PylonRack_3Rnd_LG_scalpel", {"PylonLeft1", "PylonLeft3", "PylonRight1", "PylonRight3"}}
    };
    ammoOverrides[] = {
        {"M_Scalpel_AT", {"M_Sidearm", "AGM-122 Sidearm"}}
    };
    cost = 11000;
    hasGunnerAction = 1;
    hasHMD = 1;
    hasSling = 1;
    hasTurretVisualizer = 1;
    loadable[] = {0, -2.2, 0.9};
    offset[] = {0, 10, 0};
    rearm = 300;
    side[] = {"west"};

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "300Rnd_CMFlare_Chaff_Magazine"
        };
        addWeapons[] = {
            "CMFlareLauncher_Singles"
        };
        removeMagazines[] = {
            "240Rnd_CMFlare_Chaff_Magazine"
        };
        removeWeapons[] = {
            "CMFlareLauncher"
        };
        turret[] = {-1};
    };

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "1000Rnd_20mm_shells"
        };
        deviceJammer = 1;
        turret[] = {0};
    };
};
class B_Heli_Attack_01_pylons_dynamicLoadout_F: B_Heli_Attack_01_dynamicLoadout_F {
    allowPylonMagazines[] = {
        "PylonRack_Missile_BIM9X_x1",
        {"PylonRack_Missile_BIM9X_x2", {"PylonExternalLeft", "PylonExternalRight", "PylonLeft1", "PylonLeft3", "PylonRight1", "PylonRight3"}},
        {"PylonRack_Missile_HARM_x1", {"PylonExternalLeft", "PylonLeft1", "PylonLeft3", "PylonExternalRight", "PylonRight1", "PylonRight3"}},
        {"PylonRack_12Rnd_PGM_missiles", {"PylonExternalLeft", "PylonLeft1", "PylonLeft3", "PylonExternalRight", "PylonRight1", "PylonRight3"}},
        {"PylonRack_3Rnd_LG_scalpel", {"PylonLeft1", "PylonLeft3", "PylonRight1", "PylonRight3"}}
    };
    cost = 13000;
    name = "AH-99 Blackfoot Block II";
};