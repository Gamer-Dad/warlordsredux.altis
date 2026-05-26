class Fixed_Wing {
    category = "Fixed Wing";
    requirements[] = {"A"};
};

class Caesar_Dronehunter: Fixed_Wing {
    cost = 800;
    description = "Caesar Drone Hunter is a light unarmed aircraft used to find and destroy enemy drones.";
    hasDroneHunter = 1;
    name = "Caesar Drone Hunter";
    nameShort = "CAESAR";
    spawn = "C_Plane_Civil_01_F";
};
class B_Caesar: Caesar_Dronehunter {
    side[] = {"west"};
};
class O_Caesar: Caesar_Dronehunter {
    side[] = {"east"};
};
class I_Caesar: Caesar_Dronehunter {
    side[] = {"guer"};
};

// V-44 X Blackfish
class Blackfish: Fixed_Wing {
    cost = 1000;
    hasAirRearm = 1;
    hasFastTravel = 1;
    hasHMD = 1;
    nameShort = "BLACKFISH";
    paradrops = 1;
    rearm = 120;
    requirements[] = {"H"};
};
class B_T_VTOL_01_infantry_F: Blackfish {
    side[] = {"west"};
};
class B_T_VTOL_01_vehicle_F: Blackfish {
    hasLoader = 1;
    isHeavyLift = 1;
    side[] = {"west"};
};

// V-44 X Blackfish (Armed)
class B_T_VTOL_01_armed_F: Blackfish {
    cost = 8000;
    hasHMD = 1;
    hasTurretVisualizer = 1;
    rearm = 300;
    requirements[] = {"A"};
    side[] = {"west"};

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "300Rnd_CMFlare_Chaff_Magazine"
        };
        removeMagazines[] = {
            "240Rnd_CMFlare_Chaff_Magazine"
        };
        turret[] = {-1};
    };
};

class B_Archerfish: Blackfish {
    ammoOverrides[] = {
        {"Missile_AGM_02_F", {"Missile_AGM_02_Laser_F", "AGM-158 JASSM (Laser-Guided)"}}
    };
    cost = 11000;
    hasHMD = 1;
    hasLoader = 1;
    name = "V-44 J Archerfish";
    rearm = 420;
    requirements[] = {"A"};
    side[] = {"west"};
    spawn = "B_T_VTOL_01_vehicle_F";
    variant = 1;

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "300Rnd_CMFlare_Chaff_Magazine",
            "300Rnd_CMFlare_Chaff_Magazine",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_AGM_02_x1",
            "magazine_Missile_BIM9X_x1",
            "magazine_Missile_BIM9X_x1",
            "Laserbatteries"
        };
        addWeapons[] = {
            "CMFlareLauncher_Singles",
            "weapon_AGM_65Launcher",
            "weapon_BIM9xLauncher",
            "Laserdesignator_vehicle"
        };
        removeMagazines[] = {
            "240Rnd_CMFlare_Chaff_Magazine"
        };
        removeWeapons[] = {
            "CMFlareLauncher_Triples"
        };
        turret[] = {-1};
    };
};

// Scout Stealth
class Scout_Stealth: Fixed_Wing {
    cost = 14000;
    disallowMagazines[] = {
        "PylonRack_Bomb_SDB_x4",
        "PylonRack_Bomb_GBU12_x2",
        "PylonMissile_Missile_BIM9X_x1",
        "PylonMissile_Bomb_GBU12_x1",
        "PylonRack_Missile_AGM_02_x1",
        "PylonRack_Missile_AGM_02_x2",
        "PylonRack_Missile_AMRAAM_D_x1",
        "PylonRack_Missile_AMRAAM_D_x2",
        "PylonRack_Missile_HARM_x1",
        "PylonRack_Missile_BIM9X_x1",
        "PylonRack_Missile_BIM9X_x2",
        "PylonMissile_Missile_AMRAAM_D_INT_x1",
        "PylonMissile_Missile_KH58_x1",
        "PylonMissile_Missile_AGM_KH25_x1",
        "PylonMissile_Missile_AGM_KH25_INT_x1",
        "PylonMissile_Bomb_KAB250_x1",
        "PylonMissile_Missile_KH58_INT_x1",
        "PylonMissile_Missile_AA_R77_INT_x1",
        "PylonMissile_Missile_AA_R73_x1",
        "PylonMissile_Missile_AA_R77_x1"
    };
    hasHMD = 1;
    hasReconOptics = 1;
    offset[] = {0, 12, 0};
    scanner = 1000;
    rearm = 420;
    requirements[] = {"A"};
    threatDetection = 8000;
    variant = 1;
};

class B_Scout_Wasp: Scout_Stealth {
    ammoOverrides[] = {
        {"M_Scalpel_AT", {"M_Sidearm", "AGM-122 Sidearm"}}
    };
    name = "SR-181 Scout Wasp";
    nameShort = "SCOUT WASP";
    side[] = {"west"};
    spawn = "B_Plane_Fighter_01_F";

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "PylonRack_4Rnd_LG_scalpel",
            "4Rnd_AAA_missiles"
        };
        addWeapons[] = {
            "missiles_SCALPEL",
            "missiles_ASRAAM"
        };
        removeMagazines[] = {
            "240Rnd_CMFlare_Chaff_Magazine"
        };
        removeWeapons[] = {
            "CMFlareLauncher_Singles"
        };
        turret[] = {-1};
    };
};

class O_Scout_Shikra: Scout_Stealth {
    ammoOverrides[] = {
        {"M_Scalpel_AT", {"M_Sidearm", "Kh-31P ARM"}}
    };
    name = "Yak-201 Scout Shikra";
    nameShort = "SCOUT SHIKRA";
    side[] = {"east"};
    spawn = "O_Plane_Fighter_02_F";

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "PylonRack_4Rnd_LG_scalpel",
            "PylonRack_1Rnd_Missile_AA_03_F",
            "PylonRack_1Rnd_Missile_AA_03_F",
            "PylonRack_1Rnd_Missile_AA_03_F",
            "PylonRack_1Rnd_Missile_AA_03_F"
        };
        addWeapons[] = {
            "missiles_SCALPEL",
            "Missile_AA_03_Plane_CAS_02_F"
        };
        removeMagazines[] = {
            "240Rnd_CMFlare_Chaff_Magazine"
        };
        removeWeapons[] = {
            "CMFlareLauncher"
        };
        turret[] = {-1};
    };
};

// Y-32 Xi'an (Vehicle Transport)
class O_Xian: Fixed_Wing {
    hasGunnerAction = 1;
    hasHMD = 1;
    hasLoader = 1;
    hasTurretVisualizer = 1;
    nameShort = "XIAN";
    paradrops = 2;
    requirements[] = {"H"};
    side[] = {"east"};
    spawn = "O_T_VTOL_02_vehicle_dynamicLoadout_F";
};

class O_Xian_Transport: O_Xian {
    cost = 3000;
    disallowMagazines[] = {
        "PylonMissile_1Rnd_Bomb_03_F",
        "PylonRack_1Rnd_Missile_AA_03_F",
        "PylonRack_1Rnd_LG_scalpel",
        "PylonRack_3Rnd_LG_scalpel",
        "PylonRack_4Rnd_LG_scalpel",
        "PylonRack_1Rnd_Missile_AGM_01_F",
        "PylonRack_19Rnd_Rocket_Skyfire",
        "PylonRack_20Rnd_Rocket_03_HE_F",
        "PylonRack_20Rnd_Rocket_03_AP_F"
    };
    name = "Y-32 Xi'an (Transport)";
    rearm = 120;

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
            "CMFlareLauncher_Triples"
        };
        turret[] = {-1};
    };
    class Gunner : WLTurretDefaults {
        removeMagazines[] = {
            "250Rnd_30mm_HE_shells_Tracer_Green",
            "250Rnd_30mm_APDS_shells_Tracer_Green"
        };
        removeWeapons[] = {
            "gatling_30mm_VTOL_02"
        };
        turret[] = {0};
    };
};

class O_Xian_Armed: O_Xian {
    allowPylonMagazines[] = {
        "PylonRack_12Rnd_PG_missiles",
        "PylonRack_12Rnd_PGM_missiles",
        "PylonMissile_Missile_KH58_INT_x1",
        "PylonMissile_Missile_AA_R73_x1",
        "PylonMissile_Missile_AA_R77_x1",
        "PylonRack_3Rnd_Missile_AGM_02_F",
        "PylonRack_Missile_BIM9X_x1",
        "PylonRack_Missile_BIM9X_x2"
    };
    ammoOverrides[] = {
        {"Missile_AGM_02_F", {"Missile_AGM_02_Laser_F", "Kh-29L (Laser-Guided)"}}
    };
    cost = 9000;
    name = "Y-32 Xi'an (Armed)";
    rearm = 300;

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "300Rnd_CMFlare_Chaff_Magazine",
            "magazine_Bomb_SDB_x1",
            "magazine_Bomb_SDB_x1",
            "magazine_Bomb_SDB_x1",
            "magazine_Bomb_SDB_x1"
        };
        addWeapons[] = {
            "CMFlareLauncher_Singles",
            "weapon_SDBLauncher"
        };
        removeMagazines[] = {
            "168Rnd_CMFlare_Chaff_Magazine"
        };
        removeWeapons[] = {
            "CMFlareLauncher_Triples"
        };
        turret[] = {-1};
    };
    class Gunner : WLTurretDefaults {
        addMagazines[] = {
            "500Rnd_Cannon_30mm_Plane_CAS_02_F",
            "500Rnd_Cannon_30mm_Plane_CAS_02_F",
            "500Rnd_Cannon_30mm_Plane_CAS_02_F",
            "500Rnd_Cannon_30mm_Plane_CAS_02_F"
        };
        addWeapons[] = {
            "Cannon_30mm_Plane_CAS_02_F"
        };
        removeMagazines[] = {
            "250Rnd_30mm_HE_shells_Tracer_Green",
            "250Rnd_30mm_APDS_shells_Tracer_Green"
        };
        removeWeapons[] = {
            "gatling_30mm_VTOL_02"
        };
        turret[] = {0};
    };
};

// A-164 Wipeout (CAS)
class B_Plane_CAS_01_dynamicLoadout_F: Fixed_Wing {
    allowPylonMagazines[] = {
        "PylonRack_12Rnd_PGM_missiles",
        {"PylonMissile_1Rnd_Bomb_03_F", {"Pylons4", "Pylons5", "Pylons6", "Pylons7"}},
        {"PylonRack_Bomb_SDB_x4", {"Pylons5", "Pylons6"}},
        {"PylonRack_1Rnd_Missile_AGM_02_F", {"Pylons4", "Pylons7"}},
        {"PylonRack_3Rnd_Missile_AGM_02_F", {"Pylons4", "Pylons7"}}
    };
    ammoOverrides[] = {
        {"Bomb_03_F", {"Bomb_03_BLU_F", "BLU-12 (Bunker Buster)"}},
        {"Missile_AGM_02_F", {"Missile_AGM_02_Laser_F", "AGM-65 Maverick (Laser-Guided)"}}
    };
    cost = 11000;
    disallowMagazines[] = {
        "PylonRack_1Rnd_Missile_AGM_02_F",
        "PylonRack_3Rnd_Missile_AGM_02_F"
    };
    hasHMD = 1;
    nameShort = "WIPEOUT";
    rearm = 420;
    side[] = {"west"};

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "300Rnd_CMFlare_Chaff_Magazine"
        };
        removeMagazines[] = {
            "120Rnd_CMFlare_Chaff_Magazine"
        };
        turret[] = {-1};
    };
};

// A-143 Buzzard (CAS)
class Buzzard_CAS: Fixed_Wing {
    hasHMD = 1;
    name = "A-143 Buzzard (CAS)";
    nameShort = "BUZZARD";
    rearm = 420;
    spawn = "I_Plane_Fighter_03_dynamicLoadout_F";

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "300Rnd_CMFlare_Chaff_Magazine"
        };
        removeMagazines[] = {
            "120Rnd_CMFlare_Chaff_Magazine"
        };
        turret[] = {-1};
    };
};
class O_Buzzard_CAS: Buzzard_CAS {
    allowPylonMagazines[] = {
        "PylonRack_12Rnd_PGM_missiles",
        {"PylonMissile_1Rnd_Mk82_F", {"Pylons4"}},
        {"PylonRack_1Rnd_Missile_AGM_02_F", {"Pylons2", "Pylons3", "Pylons5", "Pylons6"}},
        {"PylonRack_3Rnd_Missile_AGM_02_F", {"Pylons3", "Pylons5"}}
    };
    ammoOverrides[] = {
        {"Bo_Mk82", {"Bomb_04_PR_F", "KAB-250-L-Pr (Bunker Buster)"}},
        {"Missile_AGM_02_F", {"Missile_AGM_02_Laser_F", "Kh-29L (Laser-Guided)"}}
    };
    cost = 13000;
    description = "A-143 Buzzard (CAS) is a light CAS aircraft. It can optionally be armed with TV-guided KAB-250KR bombs, which can be linked to and controlled at ground support terminals after release. Remote bombs can be controlled at ground support terminals in Buy Menu >> Remote Control >> Ground Support Terminal.";
    disallowMagazines[] = {
        "PylonRack_Missile_AGM_02_x1",
        "PylonRack_Missile_AGM_02_x2"
    };
    side[] = {"east"};
    textures[] = {
        "\a3\Air_F_Gamma\Plane_Fighter_03\Data\Plane_Fighter_03_body_1_brownhex_CO.paa",
        "\a3\Air_F_Gamma\Plane_Fighter_03\Data\Plane_Fighter_03_body_2_brownhex_CO.paa"
    };
};

class I_Buzzard_CAS: Buzzard_CAS {
    aircraftSpawn = 1;
    cost = 8000;
    side[] = {"guer"};
};

// To-199 Neophron (CAS)
class O_Plane_CAS_02_dynamicLoadout_F: Fixed_Wing {
    allowPylonMagazines[] = {
        "PylonRack_12Rnd_PG_missiles",
        "PylonRack_12Rnd_PGM_missiles",
        {"PylonMissile_1Rnd_Mk82_F", {"Pylons4", "Pylons5", "Pylons6", "Pylons7"}},
        {"PylonMissile_Missile_AA_R73_x1", {"Pylons1", "Pylons10"}},
        {"PylonMissile_Missile_AA_R77_x1", {"Pylons1", "Pylons10"}},
        {"PylonRack_Bomb_SDB_x4", {"Pylons5", "Pylons6"}},
        "PylonRack_1Rnd_Missile_AGM_02_F",
        "PylonRack_3Rnd_Missile_AGM_02_F"
    };
    ammoOverrides[] = {
        {"Bo_Mk82", {"Bomb_04_PR_F", "KAB-250-L-Pr (Bunker Buster)"}},
        {"Missile_AGM_02_F", {"Missile_AGM_02_Laser_F", "Kh-29L (Laser-Guided)"}}
    };
    cost = 16000;
    hasHMD = 1;
    nameShort = "NEO";
    rearm = 420;
    side[] = {"east"};

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "300Rnd_CMFlare_Chaff_Magazine"
        };
        removeMagazines[] = {
            "120Rnd_CMFlare_Chaff_Magazine"
        };
        turret[] = {-1};
    };
};

// A-149 Gryphon (Interceptor)
class Gryphon: Fixed_Wing {
    hasHMD = 1;
    name = "A-149 Gryphon";
    nameShort = "GRYPHON";
    rearm = 420;
    spawn = "I_Plane_Fighter_04_F";
};

// class O_Gryphon_Interceptor: Gryphon {
//     allowPylonMagazines[] = {
//         "PylonMissile_Missile_KH58_x1",
//         "PylonRack_1Rnd_LG_scalpel",
//         "PylonRack_3Rnd_LG_scalpel",
//         "PylonRack_4Rnd_LG_scalpel",
//         "PylonRack_Missile_AMRAAM_D_x1",
//         "PylonRack_Missile_AMRAAM_D_x2",
//         "PylonMissile_Missile_AA_R77_x1",
//         "PylonMissile_Missile_AA_R73_x1"
//     };
//     ammoOverrides[] = {
//         {"M_Scalpel_AT", {"M_Sidearm", "AGM-122 Sidearm"}}
//     };
//     cost = 15500;
//     description = "A-149 Gryphon (Interceptor) is a multirole aircraft designed for air superiority.";
//     disallowMagazines[] = {
//         "PylonRack_Missile_AMRAAM_C_x1",
//         "PylonRack_Missile_AMRAAM_C_x2",
//         "PylonRack_Missile_AGM_02_x1",
//         "PylonRack_Missile_AGM_02_x2",
//         "PylonMissile_Bomb_GBU12_x1"
//     };
//     name = "A-149 Gryphon (Interceptor)";
//     side[] = {"east"};
//     textures[] = {
//         "a3\air_f_jets\plane_fighter_04\data\Fighter_04_fuselage_01_co.paa",
//         "a3\air_f_jets\plane_fighter_04\data\Fighter_04_fuselage_02_co.paa",
//         "a3\air_f_jets\plane_fighter_04\data\fighter_04_misc_01_co.paa",
//         "a3\air_f_jets\plane_fighter_04\data\Numbers\Fighter_04_number_04_ca.paa",
//         "a3\air_f_jets\plane_fighter_04\data\Numbers\Fighter_04_number_04_ca.paa",
//         "a3\air_f_jets\plane_fighter_04\data\Numbers\Fighter_04_number_08_ca.paa"
//     };
//     threatDetection = 16000;
//     variant = 1;

//     class Pilot: WLTurretDefaults {
//         addMagazines[] = {
//             "300Rnd_CMFlare_Chaff_Magazine",
//             "300Rnd_CMFlare_Chaff_Magazine"
//         };
//         addWeapons[] = {
//             "CMFlareLauncher_Singles"
//         };
//         removeMagazines[] = {
//             "240Rnd_CMFlare_Chaff_Magazine"
//         };
//         removeWeapons[] = {
//             "CMFlareLauncher"
//         };
//         turret[] = {-1};
//     };
// };

class I_Gryphon: Gryphon {
    aircraftSpawn = 1;
    cost = 12000;
};

class B_Gryphon: Gryphon {
    allowPylonMagazines[] = {
        "PylonRack_Missile_AMRAAM_C_x2",
        "PylonMissile_Bomb_GBU12_x1",
        {"PylonRack_Bomb_GBU12_x2", {"pylon3", "Pylon4", "pylon5", "Pylon6"}},
        "PylonRack_1Rnd_Missile_AGM_02_F",
        {"PylonRack_3Rnd_Missile_AGM_02_F", {"pylon5", "Pylon6"}},
        "PylonRack_Missile_HARM_x1",
        "PylonRack_3Rnd_LG_scalpel",
        {"PylonRack_Bomb_SDB_x4", {"pylon5", "Pylon6"}}
    };
    ammoOverrides[] = {
        {"Bomb_04_F", {"ammo_gbu12_gps", "GBU-12 (GPS-Guided)"}},
        {"Missile_AGM_02_F", {"Missile_AGM_02_Laser_F", "AGM-65 Maverick (Laser-Guided)"}}
    };
    cost = 15000;
    description = "A-149 Gryphon is a light multirole aircraft. It can optionally be armed with GPS-guided GBU-12 bombs.";
    disallowMagazines[] = {
        "PylonRack_Missile_AGM_02_x1",
        "PylonRack_Missile_AGM_02_x2"
    };
    side[] = {"west"};
    spawn = "I_Plane_Fighter_04_F";
    textures[] = {
        "a3\air_f_jets\plane_fighter_04\data\Fighter_04_fuselage_01_gray_co.paa",
        "a3\air_f_jets\plane_fighter_04\data\Fighter_04_fuselage_02_gray_co.paa",
        "a3\air_f_jets\plane_fighter_04\data\fighter_04_misc_01_co.paa",
        "a3\air_f_jets\plane_fighter_04\data\Numbers\Fighter_04_number_04_ca.paa",
        "a3\air_f_jets\plane_fighter_04\data\Numbers\Fighter_04_number_04_ca.paa",
        "a3\air_f_jets\plane_fighter_04\data\Numbers\Fighter_04_number_08_ca.paa"
    };

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "300Rnd_CMFlare_Chaff_Magazine",
            "120Rnd_CMFlare_Chaff_Magazine"
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
};

class B_Strike_Wasp: Fixed_Wing {
    allowPylonMagazines[] = {
        "PylonRack_12Rnd_PG_missiles",
        "PylonRack_12Rnd_PGM_missiles",
        "PylonRack_4Rnd_LG_scalpel",
        {"PylonRack_3Rnd_Missile_AGM_02_F", {"pylonBayCenter3", "pylonBayCenter4", "pylonBayCenter5", "pylonBayCenter6"}},
        {"PylonMissile_1Rnd_Bomb_03_F", {"pylonBayCenter3", "pylonBayCenter4", "pylonBayCenter5", "pylonBayCenter6"}}
    };
    ammoOverrides[] = {
        {"Bomb_03_F", {"Bomb_03_BLU_F", "BLU-12 (Bunker Buster)"}},
        {"Missile_AGM_02_F", {"Missile_AGM_02_Laser_F", "AGM-65 Maverick (Laser-Guided)"}}
    };
    cost = 19000;
    disallowMagazines[] = {
        "PylonMissile_Missile_AMRAAM_D_x1",
        "PylonRack_Missile_AMRAAM_D_x1",
        "PylonRack_Missile_AMRAAM_D_x2"
    };
    hasHMD = 1;
    name = "A-181 Strike Wasp";
    nameShort = "STRIKE WASP";
    rearm = 420;
    side[] = {"west"};
    spawn = "B_Plane_Fighter_01_F";
    variant = 1;

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "300Rnd_CMFlare_Chaff_Magazine",
            "300Rnd_CMFlare_Chaff_Magazine"
        };
        removeMagazines[] = {
            "240Rnd_CMFlare_Chaff_Magazine"
        };
        turret[] = {-1};
    };
};

class B_Growler: Fixed_Wing {
    airRadar = 12000;
    allowPylonMagazines[] = {
        "PylonRack_Missile_AMRAAM_D_x2",
        "PylonRack_Missile_HARM_x1",
        "PylonRack_4Rnd_LG_scalpel"
    };
    ammoOverrides[] = {
        {"M_Scalpel_AT", {"M_Sidearm", "AGM-122 Sidearm"}}
    };
    cost = 19000;
    disallowMagazines[] = {
        "PylonRack_Bomb_SDB_x4",
        "PylonRack_Bomb_GBU12_x2",
        "PylonMissile_Missile_BIM9X_x1",
        "PylonMissile_Bomb_GBU12_x1",
        "PylonRack_Missile_AGM_02_x1",
        "PylonRack_Missile_AGM_02_x2"
    };
    hasHMD = 1;
    name = "EF/A-181 Growler";
    rearm = 420;
    side[] = {};
    spawn = "B_Plane_Fighter_01_F";
    threatDetection = 20000;

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "300Rnd_CMFlare_Chaff_Magazine",
            "300Rnd_CMFlare_Chaff_Magazine"
        };
        removeMagazines[] = {
            "240Rnd_CMFlare_Chaff_Magazine"
        };
        turret[] = {-1};
    };
};

// To-201 Shikra
class O_Plane_Fighter_02_F: Fixed_Wing {
    allowPylonMagazines[] = {
        {"PylonMissile_Missile_KH58_x1", {"pylons1", "pylons2", "pylons3", "pylons4", "pylons5", "pylons6"}},
        {"PylonRack_Bomb_SDB_x4", {"pylonBayCenter2", "pylonBayCenter3"}}
    };
    cost = 25000;
    disallowMagazines[] = {
        "PylonMissile_Missile_KH58_INT_x1"
    };
    hasHMD = 1;
    nameShort = "SHIKRA";
    rearm = 420;
    side[] = {"east"};
    threatDetection = 16000;

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "300Rnd_CMFlare_Chaff_Magazine",
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
};

// F/A-181 Black Wasp II
class B_Plane_Fighter_01_F: Fixed_Wing {
    allowPylonMagazines[] = {
        {"PylonRack_Missile_HARM_x1", {"pylon1", "pylon2"}},
        {"PylonRack_Bomb_SDB_x4", {"pylonBayCenter2"}}
    };
    cost = 26000;
    hasHMD = 1;
    nameShort = "WASP";
    rearm = 420;
    side[] = {"west"};
    threatDetection = 12000;

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "300Rnd_CMFlare_Chaff_Magazine",
            "300Rnd_CMFlare_Chaff_Magazine"
        };
        removeMagazines[] = {
            "240Rnd_CMFlare_Chaff_Magazine"
        };
        turret[] = {-1};
    };
};

class B_Plane_Fighter_01_Stealth_F: Fixed_Wing {
    allowPylonMagazines[] = {
        {"PylonRack_Missile_HARM_x1", {"pylonBayLeft1", "pylonBayRight1"}},
        {"PylonRack_Bomb_SDB_x4", {"pylonBayCenter2"}},
        {"PylonRack_4Rnd_LG_scalpel", {"pylonBayCenter1", "pylonBayCenter3", "pylonBayCenter4"}},
        {"PylonRack_Missile_AMRAAM_D_x2", {"pylonBayCenter5", "pylonBayCenter6"}}
    };
    ammoOverrides[] = {
        {"Bomb_04_F", {"ammo_gbu12_gps", "GBU-12 (GPS-Guided)"}},
        {"ammo_Bomb_SDB", {"ammo_stormbreaker", "GBU-58 Stormbreaker"}},
        {"M_Scalpel_AT", {"M_Sidearm", "AGM-122 Sidearm"}}
    };
    cost = 28000;
    hasHMD = 1;
    hasReconOptics = 1;
    name = "F/A-181 Black Wasp II (Stealth/Recon)";
    nameShort = "STEALTH WASP";
    rearm = 420;
    side[] = {"west"};
    variant = 1;

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "300Rnd_CMFlare_Chaff_Magazine",
            "300Rnd_CMFlare_Chaff_Magazine"
        };
        removeMagazines[] = {
            "240Rnd_CMFlare_Chaff_Magazine"
        };
        turret[] = {-1};
    };
};

class O_Plane_Fighter_02_Stealth_F: Fixed_Wing {
    allowPylonMagazines[] = {
        {"PylonMissile_Missile_AA_R77_INT_x1", {"pylonBayLeft1", "pylonBayRight1"}},
        {"PylonMissile_Bomb_KAB250_x1", {"pylonBayCenter1", "pylonBayCenter2", "pylonBayCenter3", "pylonBayLeft2", "pylonBayRight2"}},
        {"PylonMissile_Missile_KH58_x1", {"pylonBayLeft1", "pylonBayRight1"}},
        {"PylonRack_Bomb_SDB_x4", {"pylonBayCenter1", "pylonBayCenter2", "pylonBayLeft2", "pylonBayRight2"}},
        {"PylonRack_4Rnd_LG_scalpel", {"pylonBayCenter1", "pylonBayCenter2", "pylonBayCenter3", "pylonBayLeft2", "pylonBayRight2"}}
    };
    ammoOverrides[] = {
        {"ammo_Bomb_SDB", {"ammo_upmk_d30", "UMPK D-30SN (GPS-Guided)"}},
        {"Bomb_03_F", {"ammo_kab250se", "KAB-250S-E (GPS-Guided)"}},
        {"M_Scalpel_AT", {"M_Sidearm", "Kh-31P ARM"}}
    };
    cost = 28000;
    description = "To-201 Shikra (Stealth/Recon) is a stealthy variant of the To-201 Shikra armed with a GPS-guided KAB-250S-E launcher.";
    disallowMagazines[] = {
        "PylonMissile_Missile_KH58_INT_x1"
    };
    hasHMD = 1;
    hasReconOptics = 1;
    name = "To-201 Shikra (Stealth/Recon)";
    nameShort = "STEALTH SHIKRA";
    rearm = 420;
    side[] = {"east"};
    threatDetection = 8000;
    variant = 1;

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "300Rnd_CMFlare_Chaff_Magazine",
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
};