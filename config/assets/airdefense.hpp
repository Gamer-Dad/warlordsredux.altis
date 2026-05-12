class Air_Defense {
    category = "Air Defense";
};

// Static Titan Launcher (AA)
class Static_Titan_AA: Air_Defense {
    cost = 300;
    hasTurretVisualizer = 1;
    loadable[] = {0, -2.5, 0.2};
    nameShort = "TITAN";
    offset[] = {0, 3, 0};
    rearm = 180;

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "1Rnd_GAA_missiles",
            "1Rnd_GAA_missiles",
            "1Rnd_GAA_missiles",
            "1Rnd_GAA_missiles",
            "1Rnd_GAA_missiles",
            "1Rnd_GAA_missiles"
        };
        addWeapons[] = {
            "missiles_titan_static"
        };
        removeMagazines[] = {};
        removeWeapons[] = {
            "missiles_titan_static"
        };
        turret[] = {0};
    };
};
class B_static_AA_F: Static_Titan_AA {
    side[] = {"west"};
};
class O_static_AA_F: Static_Titan_AA {
    side[] = {"east"};
};
class I_static_AA_F: Static_Titan_AA {
    side[] = {"guer"};
};

class Radar: Air_Defense {
    cost = 500;
    description = "Long range radar system, capable of detecting and tracking vehicles within line of sight at up to 16 km.";
    isRadar = 1;
    loadable[] = {0, 0, 1};
    nameShort = "RADAR";
    offset[] = {0, 7, 0};
};
class B_Radar_System_01_F: Radar {
    side[] = {"west"};
};
class O_Radar_System_02_F: Radar {
    side[] = {"east"};
};
class I_E_Radar_System_01_F: Radar {
    side[] = {"guer"};
};

class Radome: Air_Defense {
    cost = 1500;
    demolishable = 3;
    description = "Passively tracks hostile missile launches up to 9 km.";
    name = "AN/FPS-124 Radome";
    nameShort = "RADOME";
    offset[] = {0, 7, 0};
    spawn = "Land_Radar_Small_F";
    side[] = {"west", "east", "guer"};
    threatDetection = 9000;
};

class Light_SAM: Air_Defense {
    aps = 1;
    capValue = 2;
    cost = 3000;
    description = "Mobile short-range, surface-to-air missile system, capable of engaging aircraft and helicopters. Lethal range: 1.5 km.";
    hasHMD = 1;
    hasReconOptics = 2;
    rearm = 180;
    variant = 1;
};

class Nyx_SAM: Light_SAM {
    loadable[] = {0, -1.5, 1.2};
    name = "AWC Nyx (SAM)";
    nameShort = "NYX AA";
    spawn = "I_LT_01_scout_F";
    textures[] = {
        "A3\armor_f_tank\lt_01\data\lt_01_main_olive_co.paa",
        "A3\armor_f_tank\lt_01\data\lt_01_radar_olive_co.paa",
        "A3\Armor_F\Data\camonet_AAF_Digi_Green_CO.paa",
        "A3\armor_f\data\cage_olive_co.paa"
    };
};
class B_Nyx_SAM: Nyx_SAM {
    ammoOverrides[] = {
        {"ammo_Missile_AMRAAM_C", {"ammo_Missile_AMRAAM_ground", "SL-AMRAAM"}},
        {"ammo_Missile_AMRAAM_D", {"ammo_Missile_AMRAAM_ground", "SL-AMRAAM"}}
    };
    side[] = {"west"};

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "PylonMissile_Missile_AMRAAM_D_x1",
            "PylonMissile_Missile_AMRAAM_D_x1"
        };
        addWeapons[] = {
            "weapon_AMRAAMLauncher",
            "Laserdesignator_vehicle"
        };
        removeMagazines[] = {
            "Laserbatteries"
        };
        removeWeapons[] = {
            "Laserdesignator_vehicle"
        };
        turret[] = {0};
    };
};
class O_Nyx_SAM: Nyx_SAM {
    ammoOverrides[] = {
        {"ammo_Missile_AA_R77", {"ammo_Missile_AA_R77_ground", "R-77-ZRK"}}
    };
    side[] = {"east"};

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "magazine_Missile_AA_R77_x1",
            "magazine_Missile_AA_R77_x1",
            "Laserbatteries"
        };
        addWeapons[] = {
            "weapon_R77Launcher",
            "Laserdesignator_vehicle"
        };
        removeMagazines[] = {
            "Laserbatteries"
        };
        removeWeapons[] = {
            "Laserdesignator_vehicle"
        };
        turret[] = {0};
    };
};

class Praetorian: Air_Defense {
    cost = 3500;
    description = "Short-range point-defense artillery with a high rate of fire.";
    loadable[] = {0, -1, 1.7};
    name = "Praetorian 1C";
    nameShort = "CIWS";
    offset[] = {0, 5.3, 0};
    rearm = 180;
    spawn = "B_AAA_System_01_F";
    textures[] = {
        "a3\static_f_jets\aaa_system_01\data\aaa_system_01_olive_co.paa",
        "a3\static_f_jets\aaa_system_01\data\aaa_system_02_olive_co.paa"
    };
};
class B_Praetorian: Praetorian {
    side[] = {"west"};
};
class O_Praetorian: Praetorian {
    side[] = {"east"};
};

class SPAAG: Air_Defense {
    ammoOverrides[] = {
        {"M_Zephyr", {"M_Zephyr_SAM", "Zephyr (SAM)"}}
    };
    aps = 2;
    capValue = 4;
    cost = 3000;
    hasHMD = 1;
    rearm = 240;
};

// IFV-6a Cheetah
class B_APC_Tracked_01_AA_F: SPAAG {
    nameShort = "CHEETAH";
    side[] = {"west"};

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "4Rnd_GAA_missiles",
            "4Rnd_GAA_missiles",
            "680Rnd_35mm_AA_shells_Tracer_Red",
            "6Rnd_LG_scalpel"
        };
        addWeapons[] = {
            "autocannon_35mm",
            "missiles_titan_AA",
            "missiles_SCALPEL"
        };
        removeMagazines[] = {
            "4Rnd_Titan_long_missiles",
            "680Rnd_35mm_AA_shells_Tracer_Red"
        };
        removeWeapons[] = {
            "missiles_titan_AA",
            "autocannon_35mm"
        };
        turret[] = {0};
    };
};

// ZSU-39 Tigris
class O_APC_Tracked_02_AA_F: SPAAG {
    nameShort = "TIGRIS";
    side[] = {"east"};

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "4Rnd_GAA_missiles",
            "4Rnd_GAA_missiles",
            "680Rnd_35mm_AA_shells_Tracer_Green",
            "6Rnd_LG_scalpel"
        };
        addWeapons[] = {
            "autocannon_35mm",
            "missiles_titan_AA",
            "missiles_SCALPEL"
        };
        removeMagazines[] = {
            "4Rnd_Titan_long_missiles_O",
            "680Rnd_35mm_AA_shells_Tracer_Green"
        };
        removeWeapons[] = {
            "missiles_titan_AA",
            "autocannon_35mm"
        };
        turret[] = {0};
    };
};

// Mk49 Spartan
class Spartan: Air_Defense {
    cost = 5500;
    description = "Short-range surface-to-air missile system, capable of engaging aircraft and helicopters. Lethal range: 2.5 km.";
    hasHMD = 1;
    loadable[] = {0, -2, 0.8};
    name = "Mk49 Spartan";
    nameShort = "SPARTAN";
    offset[] = {0, 5.3, 0};
    rearm = 240;
    spawn = "B_SAM_System_01_F";
};
class B_Spartan: Spartan {
    side[] = {"west"};
};
class O_Spartan: Spartan {
    side[] = {"east"};
    textures[] = {
        "A3\Static_F_Jets\SAM_System_01\Data\SAM_system_01_olive_co.paa"
    };
};

// Defender/Rhea
class LR_AA: Air_Defense {
    cost = 5500;
    description = "Long-range surface-to-air missile system, capable of engaging aircraft and helicopters. Lethal range: 3.8 km.";
    hasHMD = 1;
    loadable[] = {0, 0, 1};
    offset[] = {0, 6, 0};
    rearm = 240;
};
class B_SAM_System_03_F: LR_AA {
    nameShort = "DEFENDER";
    side[] = {"west"};
};
class O_SAM_System_04_F: LR_AA {
    nameShort = "RHEA";
    side[] = {"east"};
};
class I_E_SAM_System_03_F: LR_AA {
    nameShort = "DEFENDER";
    side[] = {"guer"};
};

// Mk21 Centurion
class Centurion: Air_Defense {
    cost = 5500;
    description = "Medium-range surface-to-air missile system, capable of engaging aircraft and helicopters. Lethal range: 3.5 km.";
    hasHMD = 1;
    loadable[] = {0, -2, 1};
    loaded = "Centurion_Decoy";
    name = "Mk21 Centurion";
    nameShort = "CENT";
    offset[] = {0, 5.3, 0};
    rearm = 240;
    spawn = "B_SAM_System_02_F";
};
class B_Centurion: Centurion {
    side[] = {"west"};
};
class O_Centurion: Centurion {
    side[] = {"east"};
    textures[] = {
        "A3\Static_F_Jets\SAM_System_02\Data\SAM_system_02_olive_co.paa"
    };
};

// Centurion Decoy
class Centurion_Decoy: Air_Defense {
    cost = 100;
    decoy = 1;
    loadable[] = {0, -2, 1};
    name = "Mk21 Centurion";
    nameShort = "CENT";
    offset[] = {0, 5.3, 0};
    rearm = 240;
    spawn = "B_SAM_System_02_F";

    class Gunner: WLTurretDefaults {
        removeMagazines[] = {
            "magazine_Missile_rim162_x8"
        };
        removeWeapons[] = {
            "weapon_rim162Launcher"
        };
        turret[] = {0};
    };
};

class Mobile_Spartan: Air_Defense {
    aps = 5;
    capValue = 3;
    cost = 6500;
    hasHMD = 1;
    rearm = 240;
    variant = 1;
};
class B_Gorgon_AA: Mobile_Spartan {
    integralWeapon[] = {16, {0.35, -1.5, 1.5}, "B_SAM_System_01_F", "B_Integral_Spartan", "weapon_rim116Launcher", "magazine_Missile_rim116_x21", 21};
    loadable[] = {0, -0.8, 1.7};
    loaded = "B_Deployed_Spartan";
    name = "AFV-4 Medusa";
    nameShort = "MEDUSA";
    side[] = {"west"};
    spawn = "B_APC_Wheeled_03_cannon_F";
    textures[] = {
        "\A3\armor_f_gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext_co.paa",
        "\A3\armor_f_gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext2_co.paa",
        "\A3\armor_f_gamma\APC_Wheeled_03\Data\rcws30_co.paa",
        "\A3\armor_f_gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext_alpha_co.paa"
    };

    class Gunner: WLTurretDefaults {
        hideTurret = 1;
        removeMagazines[] = {
            "140Rnd_30mm_MP_shells_Tracer_Yellow",
            "60Rnd_30mm_APFSDS_shells_Tracer_Yellow",
            "200Rnd_762x51_Belt_Yellow",
            "2Rnd_GAT_missiles"
        };
        removeWeapons[] = {
            "autocannon_30mm_CTWS",
            "LMG_coax_ext",
            "missiles_titan"
        };
        turret[] = {0};
    };
};
class O_Marid_AA: Mobile_Spartan {
    integralWeapon[] = {16, {0.2, -1.5, 1.7}, "B_SAM_System_01_F", "B_Integral_Spartan", "weapon_rim116Launcher", "magazine_Missile_rim116_x21", 21};
    loadable[] = {0, -0.8, 1.65};
    loaded = "O_Deployed_Spartan";
    name = "9K41 Ghost";
    nameShort = "GHOST";
    side[] = {"east"};
    spawn = "O_APC_Wheeled_02_rcws_v2_F";

    class Gunner: WLTurretDefaults {
        hideTurret = 1;
        removeMagazines[] = {
            "96Rnd_40mm_G_belt",
            "200Rnd_127x99_mag_Tracer_Green"
        };
        removeWeapons[] = {
            "HMG_127_APC",
            "GMG_40mm"
        };
        turret[] = {0};
    };
};

class B_Integral_Spartan: Air_Defense {
    cost = -1;
    hasHMD = 1;
    name = "RIM-116 Missile Launcher";
    nameShort = "SPARTAN";
};
class B_Deployed_Spartan: B_Spartan {
    conversion = 1;
    side[] = {};
};
class O_Deployed_Spartan: O_Spartan {
    conversion = 1;
    side[] = {};
};