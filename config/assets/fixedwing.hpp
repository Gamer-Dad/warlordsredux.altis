class Fixed_Wing {
    category = "Fixed Wing";
    requirements[] = {"A"};
};

class Caesar_BTT: Fixed_Wing {
    cost = 800;
    description = "Caesar BTT is a light unarmed aircraft.";
    loadable[] = {0, -2.2, 0.9};
    name = "Caesar BTT";
    spawn = "C_Plane_Civil_01_F";
};
class B_Caesar_BTT: Caesar_BTT {
    side[] = {"west"};
};
class O_Caesar_BTT: Caesar_BTT {
    side[] = {"east"};
};
class I_Caesar_BTT: Caesar_BTT {
    side[] = {"guer"};
};

// V-44 X Blackfish
class Blackfish: Fixed_Wing {
    cost = 2000;
    hasAirRearm = 1;
    hasHMD = 1;
    requirements[] = {"H"};
};
class B_T_VTOL_01_infantry_F: Blackfish {
    side[] = {"west"};
};
class B_T_VTOL_01_vehicle_F: Blackfish {
    hasLoader = 1;
    side[] = {"west"};
};

// Scout Superiority Fighter
class Scout_Stealth: Fixed_Wing {
    cost = 5000;
    disallowMagazines[] = {
        "PylonRack_Bomb_SDB_x4",
        "PylonRack_Bomb_GBU12_x2",
        "PylonMissile_Missile_BIM9X_x1",
        "PylonMissile_Bomb_GBU12_x1",
        "PylonRack_Missile_AGM_02_x1",
        "PylonRack_Missile_AGM_02_x2",
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
    hasAirburst = 1;
    hasHMD = 1;
    hasReconOptics = 1;
    offset[] = {0, 12, 0};
    rearm = 420;
    requirements[] = {"FA"};
    variant = 1;
};

class B_Scout_Wasp: Scout_Stealth {
    loadable[] = {0, -2.2, 1.6};
    name = "SR-181 Scout Wasp";
    side[] = {"west"};
    spawn = "B_Plane_Fighter_01_Stealth_F";

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "300Rnd_CMFlare_Chaff_Magazine",
            "300Rnd_CMFlare_Chaff_Magazine",
            "250Rnd_30mm_HE_shells_Tracer_Green",
            "250Rnd_30mm_HE_shells_Tracer_Green",
            "250Rnd_30mm_HE_shells_Tracer_Green",
            "4Rnd_Titan_long_missiles"
        };
        addWeapons[] = {
            "gatling_30mm_VTOL_02",
            "missiles_titan",
            "Laserdesignator_pilotCamera"
        };
        removeMagazines[] = {
            "240Rnd_CMFlare_Chaff_Magazine",
            "magazine_Fighter01_Gun20mm_AA_x450"
        };
        removeWeapons[] = {
            "weapon_Fighter_Gun20mm_AA",
            "Laserdesignator_pilotCamera"
        };
        turret[] = {-1};
    };
};

class O_Scout_Shikra: Scout_Stealth {
    loadable[] = {0, -2.2, 1.7};
    name = "Yak-201 Scout Shikra";
    side[] = {"east"};
    spawn = "O_Plane_Fighter_02_Stealth_F";

    class Pilot: WLTurretDefaults {
        addMagazines[] = {
            "300Rnd_CMFlare_Chaff_Magazine",
            "300Rnd_CMFlare_Chaff_Magazine",
            "250Rnd_30mm_HE_shells_Tracer_Green",
            "250Rnd_30mm_HE_shells_Tracer_Green",
            "250Rnd_30mm_HE_shells_Tracer_Green",
            "4Rnd_Titan_long_missiles"
        };
        addWeapons[] = {
            "gatling_30mm_VTOL_02",
            "missiles_titan",
            "Laserdesignator_pilotCamera",
            "CMFlareLauncher_Singles"
        };
        removeMagazines[] = {
            "240Rnd_CMFlare_Chaff_Magazine",
            "magazine_Fighter02_Gun30mm_AA_x180"
        };
        removeWeapons[] = {
            "weapon_Fighter_Gun_30mm",
            "Laserdesignator_pilotCamera",
            "CMFlareLauncher"
        };
        turret[] = {-1};
    };
};

// V-44 X Blackfish (Armed)
class Blackfish_Armed: Blackfish {
    hasHMD = 1;
    hasTurretVisualizer = 1;
    rearm = 300;
    requirements[] = {"A"};
    spawn = "B_T_VTOL_01_armed_F";
};

class B_T_VTOL_01_armed_F: Blackfish_Armed {
    cost = 8000;
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

class B_T_VTOL_01_armed_up_F: Blackfish_Armed {
    cost = 10000;
    name = "V-44 J Archerfish";
    side[] = {"west"};
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
            "CMFlareLauncher_Triples"
        };
        turret[] = {-1};
    };

    class Copilot: WLTurretDefaults {
        addMagazines[] = {
            "300Rnd_CMFlare_Chaff_Magazine",
            "300Rnd_CMFlare_Chaff_Magazine",
            "magazine_Bomb_SDB_x1",
            "magazine_Bomb_SDB_x1",
            "magazine_Bomb_SDB_x1",
            "magazine_Bomb_SDB_x1",
            "magazine_Bomb_SDB_x1",
            "magazine_Bomb_SDB_x1"
        };
        addWeapons[] = {
            "weapon_SDBLauncher",
            "CMFlareLauncher_Singles"
        };
        removeMagazines[] = {
            "Laserbatteries"
        };
        removeWeapons[] = {
            "Laserdesignator_mounted"
        };
        turret[] = {0};
    };

    class RightGunner: WLTurretDefaults {
        addMagazines[] = {
            "60Rnd_30mm_MP_shells_Tracer_Green",
            "60Rnd_30mm_MP_shells_Tracer_Green",
            "60Rnd_30mm_MP_shells_Tracer_Green",
            "60Rnd_30mm_MP_shells_Tracer_Green",
            "60Rnd_30mm_MP_shells_Tracer_Green",
            "60Rnd_30mm_MP_shells_Tracer_Green"
        };
        addWeapons[] = {
            "autocannon_30mm_RCWS"
        };
        removeMagazines[] = {
            "240Rnd_40mm_GPR_Tracer_Red_shells",
            "160Rnd_40mm_APFSDS_Tracer_Red_shells"
        };
        removeWeapons[] = {
            "autocannon_40mm_VTOL_01"
        };
        turret[] = {2};
    };
};

// Y-32 Xi'an (Infantry Transport)
class O_T_VTOL_02_infantry_dynamicLoadout_F: Fixed_Wing {
    allowPylonMagazines[] = {
        "PylonRack_12Rnd_PG_missiles",
        "PylonRack_12Rnd_PGM_missiles",
        "PylonMissile_Missile_KH58_INT_x1",
        "PylonMissile_Missile_AA_R73_x1",
        "PylonMissile_Missile_AA_R77_x1",
        "PylonRack_3Rnd_Missile_AGM_02_F",
        "PylonRack_Missile_BIM9X_x1",
        "PylonRack_Missile_BIM9X_x2",
        "PylonFuelTank_UH80"
    };
    ammoOverrides[] = {
        {"DummyPylonAmmo", {"M_ECMPod", "ECM Jammer Pod"}},
        {"Missile_AGM_02_F", {"Missile_AGM_02_Laser_F", "Kh-29L (Laser-Guided)"}}
    };
    cost = 12000;
    ecm[] = {{"MissileCore"}, 1, 10000, 1, 4, 15};
    hasAirRearm = 1;
    hasGunnerAction = 1;
    hasHMD = 1;
    hasTurretVisualizer = 1;
    loadable[] = {0, -2.2, 2.4};
    rearm = 300;
    requirements[] = {"H"};
    side[] = {"east"};

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
    cost = 13000;
    disallowMagazines[] = {
        "PylonRack_1Rnd_Missile_AGM_02_F",
        "PylonRack_3Rnd_Missile_AGM_02_F"
    };
    hasHMD = 1;
    loadable[] = {0, -2.2, 1.5};
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
    cost = 13000;
    hasHMD = 1;
    loadable[] = {0, -2.2, 1.6};
    name = "A-143 Buzzard (CAS)";
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
    side[] = {"guer"};
};

// To-199 Neophron (CAS)
class O_Plane_CAS_02_dynamicLoadout_F: Fixed_Wing {
    allowPylonMagazines[] = {
        "PylonRack_12Rnd_PG_missiles",
        "PylonRack_12Rnd_PGM_missiles",
        {"PylonMissile_1Rnd_Mk82_F", {"Pylons4", "Pylons5", "Pylons6", "Pylons7"}},
        {"PylonRack_Bomb_SDB_x4", {"Pylons5", "Pylons6"}},
        {"PylonRack_1Rnd_Missile_AGM_02_F", {"Pylons4", "Pylons7"}},
        {"PylonRack_3Rnd_Missile_AGM_02_F", {"Pylons4", "Pylons7"}}
    };
    ammoOverrides[] = {
        {"Bo_Mk82", {"Bomb_04_PR_F", "KAB-250-L-Pr (Bunker Buster)"}},
        {"Missile_AGM_02_F", {"Missile_AGM_02_Laser_F", "Kh-29L (Laser-Guided)"}}
    };
    cost = 15000;
    hasHMD = 1;
    loadable[] = {0, -2.2, 2.3};
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
    loadable[] = {0, -2.2, 1.4};
    name = "A-149 Gryphon";
    rearm = 420;
    spawn = "I_Plane_Fighter_04_F";
};

class O_Gryphon_Interceptor: Gryphon {
    allowPylonMagazines[] = {
        "PylonMissile_Missile_KH58_x1",
        "PylonRack_1Rnd_LG_scalpel",
        "PylonRack_3Rnd_LG_scalpel",
        "PylonRack_4Rnd_LG_scalpel",
        "PylonRack_Missile_AMRAAM_D_x1",
        "PylonRack_Missile_AMRAAM_D_x2",
        "PylonMissile_Missile_AA_R77_x1",
        "PylonMissile_Missile_AA_R73_x1"
    };
    ammoOverrides[] = {
        {"M_Scalpel_AT", {"M_Sidearm", "AGM-122 Sidearm"}}
    };
    cost = 15500;
    description = "A-149 Gryphon (Interceptor) is a multirole aircraft designed for air superiority.";
    disallowMagazines[] = {
        "PylonRack_Missile_AMRAAM_C_x1",
        "PylonRack_Missile_AMRAAM_C_x2",
        "PylonRack_Missile_AGM_02_x1",
        "PylonRack_Missile_AGM_02_x2",
        "PylonMissile_Bomb_GBU12_x1"
    };
    ecm[] = {{"ammo_Missile_AMRAAM_C", "ammo_Missile_AMRAAM_D", "ammo_Missile_AA_R77"}, 0, 30000, 5, 2, 30};
    hasAirRadar = 10000;
    name = "A-149 Gryphon (Interceptor)";
    side[] = {"east"};
    textures[] = {
        "a3\air_f_jets\plane_fighter_04\data\Fighter_04_fuselage_01_co.paa",
        "a3\air_f_jets\plane_fighter_04\data\Fighter_04_fuselage_02_co.paa",
        "a3\air_f_jets\plane_fighter_04\data\fighter_04_misc_01_co.paa",
        "a3\air_f_jets\plane_fighter_04\data\Numbers\Fighter_04_number_04_ca.paa",
        "a3\air_f_jets\plane_fighter_04\data\Numbers\Fighter_04_number_04_ca.paa",
        "a3\air_f_jets\plane_fighter_04\data\Numbers\Fighter_04_number_08_ca.paa"
    };
    threatDetection = 16000;
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

class I_Gryphon: Gryphon {
    aircraftSpawn = 1;
    cost = 23000;
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
    cost = 19000;
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

class B_Growler: Fixed_Wing {
    allowPylonMagazines[] = {
        "PylonRack_Missile_AMRAAM_D_x2",
        "PylonRack_Missile_HARM_x1",
        {"PylonRack_4Rnd_LG_scalpel", {"pylonBayCenter1", "pylonBayCenter2", "pylonBayCenter3", "pylonBayCenter4"}}
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
    ecm[] = {{"MissileCore"}, 0, 30000, 1, 2, 120};
    hasAirRadar = 14000;
    hasHMD = 1;
    loadable[] = {0, -2.2, 1.6};
    name = "EF/A-181 Growler";
    rearm = 420;
    side[] = {"west"};
    spawn = "B_Plane_Fighter_01_F";
    threatDetection = 8000;
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
    ecm[] = {{"MissileCore"}, 0, 30000, 1, 2, 120};
    hasHMD = 1;
    loadable[] = {0, -2.2, 1.7};
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
    loadable[] = {0, -2.2, 1.6};
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
    loadable[] = {0, -2.2, 1.6};
    name = "F/A-181 Black Wasp II (Stealth/Recon)";
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
        {"M_Scalpel_AT", {"M_Sidearm", "AGM-122 Sidearm"}}
    };
    cost = 28000;
    description = "To-201 Shikra (Stealth/Recon) is a stealthy variant of the To-201 Shikra armed with a GPS-guided KAB-250S-E launcher.";
    disallowMagazines[] = {
        "PylonMissile_Missile_KH58_INT_x1"
    };
    hasHMD = 1;
    hasReconOptics = 1;
    loadable[] = {0, -2.2, 1.7};
    name = "To-201 Shikra (Stealth/Recon)";
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