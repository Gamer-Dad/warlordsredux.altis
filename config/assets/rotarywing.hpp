class Rotary_Wing {
    category = "Rotary Wing";
    requirements[] = {"H"};
};

// MH-9 Hummingbird
class Hummingbird: Rotary_Wing {
    cost = 300;
    hasFastTravel = 1;
    nameShort = "HUMMINGBIRD";
    rearm = 120;
    requirements[] = {};
};
class B_Heli_Light_01_F: Hummingbird {
    loaded = "Land_MedicalTent_01_NATO_generic_open_F";
    side[] = {"west"};
};
class C_Heli_Light_01_civil_F: Hummingbird {
    loaded = "Land_MedicalTent_01_CSAT_brownhex_generic_open_F";
    side[] = {"east"};
};

// Mi-290 Taru
class Taru: Rotary_Wing {
    ammoOverrides[] = {
        {"BombDemine_01_DummyAmmo_F", {"M_BunkerDeployer", "Bunker Deployer"}}
    };
    cost = 400;
    hasFastTravel = 1;
    hasSling = 1;
    loaded = "Land_MedicalTent_01_CSAT_brownhex_generic_open_F";
    nameShort = "TARU";
    offset[] = {0, 10, 0};
    rearm = 120;

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "PylonRack_4Rnd_BombDemine_01_Dummy_F"
        };
        addWeapons[] = {
            "BombDemine_01_F"
        };
        turret[] = {-1};
    };
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
    loaded = "Land_MedicalTent_01_CSAT_brownhex_generic_open_F";
    nameShort = "ORCA";
    offset[] = {0, 10, 0};
    rearm = 120;
    side[] = {"east"};
};
class O_Heli_Light_02_dynamicLoadout_F: O_Heli_Light_02_unarmed_F {
    allowPylonMagazines[] = {
        "PylonRack_12Rnd_PGM_missiles",
        "PylonRack_3Rnd_LG_scalpel",
        "PylonRack_4Rnd_LG_scalpel",
        "PylonMissile_Missile_AA_R73_x1",
        "PylonRack_Missile_BIM9X_x2",
        "PylonRadarPod_01_F",
        "PylonCameraPod_01_F"
    };
    ammoOverrides[] = {
        {"M_Scalpel_AT", {"M_Sidearm", "Kh-31P ARM"}}
    };
    cost = 3500;
    nameShort = "ORCA ARMED";
    rearm = 240;
    requirements[] = {"H"};

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
class O_Orca_Bunker: O_Heli_Light_02_dynamicLoadout_F {
    allowPylonMagazines[] = {
        "PylonRadarPod_01_F",
        "PylonCameraPod_01_F",
        {"PylonRack_3Rnd_Missile_AGM_02_F", {"PylonLeft1"}}
    };
    ammoOverrides[] = {
        {"Missile_AGM_02_F", {"M_RedArrow", "HJ-9 Red Arrow"}}
    };
    cost = 4500;
    disallowMagazines[] = {
        "PylonRack_1Rnd_AAA_missiles",
        "PylonRack_1Rnd_LG_scalpel",
        "PylonRack_12Rnd_PG_missiles",
        "PylonRack_12Rnd_PG_missiles_black",
        "PylonRack_12Rnd_missiles",
        "PylonRack_12Rnd_missiles_black",
        "PylonWeapon_300Rnd_20mm_shells",
        "PylonRack_19Rnd_Rocket_Skyfire"
    };
    name = "PO-30 Orca (Bunker Buster)";
    nameShort = "ORCA BOMBER";
    replacePylons[] = {
        {"PylonLeft1", {-1}, "PylonRack_3Rnd_Missile_AGM_02_F"},
        {"PylonRight1", {-1}, "PylonCameraPod_01_F"}
    };
    spawn = "O_Heli_Light_02_dynamicLoadout_F";
    threatDetection = 2500;
    variant = 1;

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "300Rnd_CMFlare_Chaff_Magazine"
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
// class O_Orca_AA: O_Orca_Bunker {
//     allowPylonMagazines[] = {
//         "PylonRadarPod_01_F",
//         "PylonCameraPod_01_F"
//     };
//     ammoOverrides[] = {
//         {"ammo_Missile_AA_R77", {"ammo_Missile_tianlong", "Tianlong-30"}}
//     };
//     disallowMagazines[] = {
//         "PylonRack_1Rnd_AAA_missiles",
//         "PylonRack_1Rnd_LG_scalpel",
//         "PylonRack_12Rnd_PG_missiles",
//         "PylonRack_12Rnd_PG_missiles_black",
//         "PylonRack_12Rnd_missiles",
//         "PylonRack_12Rnd_missiles_black",
//         "PylonWeapon_300Rnd_20mm_shells",
//         "PylonWeapon_2000Rnd_65x39_belt",
//         "PylonRack_19Rnd_Rocket_Skyfire"
//     };
//     name = "PO-30 Orca (Air Superiority)";
//     nameShort = "ORCA AA";
//     replacePylons[] = {
//         {"PylonLeft1", {-1}, "PylonRadarPod_01_F"},
//         {"PylonRight1", {-1}, "PylonCameraPod_01_F"}
//     };
//     threatDetection = 2500;
//     variant = 1;

//     class Pilot: WLTurretDefaults {
//         addMagazines[] = {
//             "magazine_Missile_AA_R77_x1",
//             "magazine_Missile_AA_R77_x1",
//             "300Rnd_CMFlare_Chaff_Magazine"
//         };
//         addWeapons[] = {
//             "weapon_R77Launcher",
//             "CMFlareLauncher_Singles"
//         };
//         removeMagazines[] = {
//             "168Rnd_CMFlare_Chaff_Magazine"
//         };
//         removeWeapons[] = {
//             "CMFlareLauncher"
//         };
//         turret[] = {-1};
//     };
// };

// UH-80 Ghost Hawk
class B_Heli_Transport_01_F: Rotary_Wing {
    cost = 800;
    hasFastTravel = 1;
    hasHMD = 1;
    hasSling = 1;
    hasTurretVisualizer = 1;
    loaded = "Land_MedicalTent_01_NATO_generic_open_F";
    nameShort = "GHOSTHAWK";
    offset[] = {0, 11, 0};
    rearm = 120;
    side[] = {"west"};
};
class B_Heli_Transport_01_pylons_F: B_Heli_Transport_01_F {
    allowPylonMagazines[] = {
        "PylonRack_Missile_BIM9X_x2",
        "PylonRack_12Rnd_PG_missiles",
        "PylonRadarPod_01_F",
        "PylonCameraPod_01_F"
    };
    ammoOverrides[] = {
        {"Bo_Mk82", {"M_MineLayer", "M139 Volcano Mine Dispenser"}}
    };
    cost = 5000;
    disallowMagazines[] = {
        "PylonFuelTank_UH80"
    };
    name = "UH-80 Ghost Hawk Block II";
    nameShort = "GHOSTHAWK II";
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

class B_BunkerHawk: B_Heli_Transport_01_pylons_F {
    allowPylonMagazines[] = {
        {"PylonRack_3Rnd_Missile_AGM_02_F", {"pylon2"}},
        {"PylonWeapon_500Rnd_127mm_HEIAP_belt_right", {"pylon3"}}
    };
    ammoOverrides[] = {
        {"Missile_AGM_02_F", {"M_TOW2", "BGM-71H TOW Bunker Buster"}}
    };
    cost = 4700;
    disallowMagazines[] = {
        "PylonRack_1Rnd_LG_scalpel",
        "PylonRack_1Rnd_AAA_missiles",
        "PylonRack_12Rnd_PG_missiles",
        "PylonRack_12Rnd_PGM_missiles",
        "PylonRack_12Rnd_PGM_missiles_black",
        "PylonRack_12Rnd_PG_missiles_black",
        "PylonRack_12Rnd_missiles",
        "PylonRack_12Rnd_missiles_black",
        "PylonMissile_1Rnd_Bomb_04_F",
        "PylonMissile_1Rnd_Mk82_F"
    };
    name = "AH-80 Bunker Hawk";
    nameShort = "HAWK BOMBER";
    replacePylons[] = {
        {"pylon1", {-1}, "PylonRadarPod_01_F"},
        {"pylon2", {-1}, "PylonRack_3Rnd_Missile_AGM_02_F"},
        {"pylon3", {-1}, "PylonWeapon_500Rnd_127mm_HEIAP_belt_right"},
        {"pylon4", {-1}, "PylonCameraPod_01_F"}
    };
    spawn = "B_Heli_Transport_01_pylons_F";
    threatDetection = 2500;
};

class B_CTRG_Heli_Transport_01_DAP_F: B_Heli_Transport_01_pylons_F {
    allowPylonMagazines[] = {
        "PylonRack_Missile_BIM9X_x2",
        "PylonRack_12Rnd_PG_missiles",
        {"PylonRack_Bomb_SDB_x4", {"camera"}},
        "PylonRadarPod_01_F",
        "PylonCameraPod_01_F"
    };
    cost = 6500;
    name = "MH-80 Direct Action Penetrator";
    nameShort = "GHOSTHAWK DAP";
    replacePylons[] = {
        {"pylon1", {-1}, "PylonRack_12Rnd_PG_missiles"},
        {"pylon2", {-1}, "PylonRack_12Rnd_PG_missiles"},
        {"pylon3", {-1}, "PylonRack_12Rnd_PG_missiles"},
        {"pylon4", {-1}, "PylonRack_12Rnd_PG_missiles"},
        {"wingtip1", {-1}, "PylonRadarPod_01_F"},
        {"wingtip2", {-1}, "PylonCameraPod_01_F"},
        {"camera", {-1}, "PylonRack_Bomb_SDB_x4"}
    };
};

class Transport_Helicopter: Rotary_Wing {
    cost = 700;
    hasSling = 1;
    loaded = "Static_Cannon";
    offset[] = {0, 10, 0};
    rearm = 240;
};

// CH-67 Huron
class B_Heli_Transport_03_F: Transport_Helicopter {
    hasTurretVisualizer = 1;
    nameShort = "HURON";
    side[] = {"west"};
};
class O_Mohawk: Transport_Helicopter {
    hasHMD = 1;
    isHeavyLift = 1;
    name = "CH-49 Mohawk";
    nameShort = "MOHAWK";
    side[] = {"east"};
    spawn = "I_Heli_Transport_02_F";
    textures[] = {
        "src\img\camo\mohawk1.jpg",
        "src\img\camo\mohawk2.jpg",
        "src\img\camo\mohawk3.jpg",
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

// AH-9 Pawnee
class B_Heli_Light_01_dynamicLoadout_F: Rotary_Wing {
    allowPylonMagazines[] = {
        "PylonRack_Missile_BIM9X_x2",
        "PylonRadarPod_01_F",
        "PylonCameraPod_01_F"
    };
    cost = 4000;
    hasHMD = 1;
    hasReconOptics = 1;
    nameShort = "PAWNEE";
    rearm = 240;
    side[] = {"west"};

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "PylonWeapon_500Rnd_127mm_HEIAP_belt_left",
            "PylonWeapon_500Rnd_127mm_HEIAP_belt_left"
        };
        addWeapons[] = {
            "Gatling_127mm_HeliPylon_F"
        };
        removeMagazines[] = {
            "5000Rnd_762x51_Belt"
        };
        removeWeapons[] = {
            "M134_minigun"
        };
        turret[] = {-1};
    };
};
class O_Beluga: B_Heli_Light_01_dynamicLoadout_F {
    name = "Ka-9 Beluga";
    nameShort = "BELUGA";
    side[] = {"east"};
    spawn = "B_Heli_Light_01_dynamicLoadout_F";
    textures[] = {
        "src\img\camo\beluga.jpg"
    };
};

class Hellcat: Rotary_Wing {
    allowPylonMagazines[] = {
        "PylonRack_Missile_HARM_x1",
        "PylonRack_19Rnd_Rocket_Skyfire",
        "PylonRack_12Rnd_PGM_missiles",
        "PylonRack_Missile_BIM9X_x2",
        "PylonRadarPod_01_F",
        "PylonCameraPod_01_F"
    };
    ammoOverrides[] = {
        {"M_Scalpel_AT", {"M_Sidearm", "AGM-122 Sidearm"}}
    };
    cost = 4200;
    description = "WY-55 Hellcat is a light attack helicopter.";
    hasHMD = 1;
    hasSling = 1;
    name = "WY-55 Hellcat";
    nameShort = "HELLCAT";
    offset[] = {0, 9, 0};
    rearm = 240;
    spawn = "I_Heli_light_03_dynamicLoadout_F";

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "PylonWeapon_500Rnd_127mm_HEIAP_belt_left",
            "300Rnd_CMFlare_Chaff_Magazine"
        };
        addWeapons[] = {
            "Gatling_127mm_HeliPylon_F",
            "CMFlareLauncher_Singles"
        };
        removeMagazines[] = {
            "168Rnd_CMFlare_Chaff_Magazine",
            "5000Rnd_762x51_Yellow_Belt"
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

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "magazine_Missile_BIM9X_x1",
            "magazine_Missile_BIM9X_x1",
            "magazine_Missile_BIM9X_x1",
            "magazine_Missile_BIM9X_x1",
            "300Rnd_CMFlare_Chaff_Magazine"
        };
        addWeapons[] = {
            "weapon_BIM9xLauncher",
            "CMFlareLauncher_Singles"
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
        {"M_Scalpel_AT", {"M_Sidearm", "Kh-31P ARM"}}
    };
    cost = 8000;
    hasGunnerAction = 1;
    hasHMD = 1;
    hasSling = 1;
    hasTurretVisualizer = 1;
    loaded = "Land_MedicalTent_01_CSAT_brownhex_generic_open_F";
    nameShort = "KAJMAN";
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
        {"PylonRack_3Rnd_LG_scalpel", {"PylonLeft1", "PylonLeft3", "PylonRight1", "PylonRight3"}},
        {"PylonRack_Missile_AMRAAM_D_x1", {"PylonLeft2", "PylonRight2"}},
        {"PylonRack_3Rnd_Missile_AGM_02_F", {"PylonLeft1", "PylonRight1"}}
    };
    ammoOverrides[] = {
        {"M_Scalpel_AT", {"M_Sidearm", "AGM-122 Sidearm"}},
        {"Missile_AGM_02_F", {"Missile_AGM_02_Laser_F", "AGM-158 JASSM (Laser-Guided)"}}
    };
    cost = 10000;
    hasGunnerAction = 1;
    hasHMD = 1;
    hasSling = 1;
    hasTurretVisualizer = 1;
    nameShort = "BLACKFOOT";
    offset[] = {0, 10, 0};
    rearm = 300;
    side[] = {"west"};

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "300Rnd_CMFlare_Chaff_Magazine",
            "Laserbatteries"
        };
        addWeapons[] = {
            "CMFlareLauncher_Singles",
            "Laserdesignator_pilotCamera"
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
        turret[] = {0};
    };
};
class B_Heli_Attack_01_pylons_dynamicLoadout_F: B_Heli_Attack_01_dynamicLoadout_F {
    allowPylonMagazines[] = {
        "PylonRack_Missile_BIM9X_x1",
        {"PylonRack_Missile_BIM9X_x2", {"PylonExternalLeft", "PylonExternalRight", "PylonLeft1", "PylonLeft3", "PylonRight1", "PylonRight3"}},
        {"PylonRack_Missile_HARM_x1", {"PylonExternalLeft", "PylonLeft1", "PylonLeft3", "PylonExternalRight", "PylonRight1", "PylonRight3"}},
        {"PylonRack_12Rnd_PGM_missiles", {"PylonExternalLeft", "PylonLeft1", "PylonLeft3", "PylonExternalRight", "PylonRight1", "PylonRight3"}},
        {"PylonRack_3Rnd_LG_scalpel", {"PylonLeft1", "PylonLeft3", "PylonRight1", "PylonRight3"}},
        {"PylonRack_Missile_AMRAAM_D_x1", {"PylonLeft2", "PylonRight2"}},
        {"PylonRack_Missile_AMRAAM_D_x2", {"PylonExternalLeft", "PylonExternalRight"}},
        {"PylonRack_3Rnd_Missile_AGM_02_F", {"PylonLeft1", "PylonRight1"}},
        {"PylonRack_3Rnd_Missile_AGM_02_F", {"PylonExternalLeft", "PylonExternalRight"}}
    };
    cost = 12000;
    name = "AH-99 Blackfoot Block II";
    nameShort = "BLACKFOOT II";
};