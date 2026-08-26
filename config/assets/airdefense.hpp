class Air_Defense {
    category = "Air Defense";
    loadable = 1;
};

class Radar: Air_Defense {
    cost = 500;
    description = "Long range radar system, capable of detecting and tracking vehicles within line of sight.";
    isRadar = 1;
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

class LR_Radar: Air_Defense {
    airRadar = 20000;
    attachments[] = {
        {"\A3\Props_F_Enoch\Military\Camps\SatelliteAntenna_01_F.p3d", {0, 3, 2}, 0, "", 5}
    };
    cost = 2500;
    demolishable = 3;
    description = "Directional radar that passively tracks enemy air and hostile missile launches. Team max: 5.";
    loadable = 0;
    name = "AN/FPS-124 LR Radar";
    nameShort = "LR RADAR";
    offset[] = {0, 7, 0};
    spawn = "Land_MobileRadar_01_generator_F";
    showToEnemies = 8000;
    side[] = {"west", "east", "guer"};
    teamLimit = 5;
    threatDetection = 20000;
};

class Light_SAM: Air_Defense {
    aps = 1;
    capValue = 2;
    cost = 3000;
    description = "Mobile short-range, surface-to-air missile system, capable of engaging aircraft and helicopters.";
    hasHMD = 1;
    hasReconOptics = 2;
    rearm = 180;
};

class Nyx_SAM: Light_SAM {
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
            "PylonMissile_Missile_AMRAAM_D_x1",
            "PylonMissile_Missile_AMRAAM_D_x1",
            "PylonMissile_Missile_AMRAAM_D_x1",
            "Laserbatteries"
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
    cost = 6000;
    description = "Short-range point-defense artillery with a high rate of fire.";
    name = "Praetorian 1C";
    nameShort = "CIWS";
    offset[] = {0, 5.3, 0};
    rearm = 180;
    requirements[] = {"S"};
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
class I_Praetorian: Praetorian {
    capValueEmpty = 100;
    demolishable = 2;
    demolishStepTime = 4;
    side[] = {"guer"};

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "PylonWeapon_500Rnd_127mm_HEIAP_belt_right"
        };
        addWeapons[] = {
            "Gatling_127mm_HeliPylon_F"
        };
        turret[] = {0};
    };
};

class SPAAG: Air_Defense {
    aps = 2;
    capValue = 4;
    cost = 4000;
    hasHMD = 1;
    loadable = 0;
    rearm = 240;
};

// IFV-6a Cheetah
class B_APC_Tracked_01_AA_F: SPAAG {
    ammoOverrides[] = {
        {"ammo_Missile_AMRAAM_D", {"ammo_Missile_starstreak", "Starstreak HVM"}}
    };
    nameShort = "CHEETAH";
    side[] = {"west"};

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "PylonMissile_Missile_AMRAAM_D_x1",
            "PylonMissile_Missile_AMRAAM_D_x1",
            "PylonMissile_Missile_AMRAAM_D_x1",
            "PylonMissile_Missile_AMRAAM_D_x1",
            "PylonMissile_Missile_AMRAAM_D_x1",
            "PylonMissile_Missile_AMRAAM_D_x1",
            "680Rnd_35mm_AA_shells_Tracer_Red",
            "6Rnd_LG_scalpel"
        };
        addWeapons[] = {
            "autocannon_35mm",
            "weapon_AMRAAMLauncher",
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
    ammoOverrides[] = {
        {"ammo_Missile_AA_R77", {"ammo_Missile_sosna", "9M337 Sosna-R"}}
    };
    nameShort = "TIGRIS";
    side[] = {"east"};

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "magazine_Missile_AA_R77_x1",
            "magazine_Missile_AA_R77_x1",
            "magazine_Missile_AA_R77_x1",
            "magazine_Missile_AA_R77_x1",
            "magazine_Missile_AA_R77_x1",
            "magazine_Missile_AA_R77_x1",
            "680Rnd_35mm_AA_shells_Tracer_Green",
            "6Rnd_LG_scalpel"
        };
        addWeapons[] = {
            "autocannon_35mm",
            "weapon_R77Launcher",
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
    description = "Short-range surface-to-air missile system, capable of engaging aircraft and helicopters.";
    hasAutoSam = 1;
    hasHMD = 1;
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
    description = "Long-range surface-to-air missile system, capable of engaging aircraft and helicopters.";
    hasAutoSam = 1;
    hasHMD = 1;
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
    description = "Medium-range surface-to-air missile system, capable of engaging aircraft and helicopters.";
    hasAutoSam = 1;
    hasHMD = 1;
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

class Mobile_Starstreak: Air_Defense {
    aps = 5;
    capValue = 3;
    cost = 6500;
    description = "Mobile medium-range, surface-to-air missile system, capable of engaging aircraft and helicopters.";
    hasHMD = 1;
    hideTurret = 1;
    loaded = "Land_VR_Slope_01_F";
    rearm = 240;
};
class B_Gorgon_AA: Mobile_Starstreak {
    integralWeapon[] = {16, {0.35, -1.5, 1.5}, "B_SAM_System_02_F", "B_Integral_Centurion", "weapon_rim162Launcher", "magazine_Missile_rim162_x8", 8};
    isLight = 1;
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
class O_Marid_AA: Mobile_Starstreak {
    integralWeapon[] = {16, {0.2, -1.5, 1.7}, "B_SAM_System_02_F", "B_Integral_Centurion", "weapon_rim162Launcher", "magazine_Missile_rim162_x8", 8};
    name = "9K41 Ghost";
    nameShort = "GHOST";
    side[] = {"east"};
    spawn = "O_APC_Wheeled_02_rcws_v2_F";

    class Gunner: WLTurretDefaults {
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

class B_Integral_Centurion: Air_Defense {
    ammoOverrides[] = {
        {"ammo_Missile_rim162", {"ammo_Missile_starstreak2", "Starstreak Mark II"}}
    };
    cost = -1;
    hasHMD = 1;
    loadable = 0;
    name = "Starstreak-II Launcher";
    nameShort = "STARSTREAK";
};

class O_Euphrates: SPAAG {
    ammoOverrides[] = {
        {"ammo_Missile_AA_R77", {"ammo_Missile_tianlong", "Tianlong-30"}}
    };
    aps = 5;
    cost = 12000;
    name = "ZSU-49 Euphrates";
    nameShort = "EUPHRATES";
    side[] = {};
    spawn = "O_APC_Tracked_02_AA_F";

    class Gunner: WLTurretDefaults {
        addMagazines[] = {
            "magazine_Missile_AA_R77_x1",
            "magazine_Missile_AA_R77_x1",
            "magazine_Missile_AA_R77_x1",
            "magazine_Missile_AA_R77_x1",
            "magazine_Missile_AA_R77_x1",
            "magazine_Missile_AA_R77_x1",
            "magazine_Missile_AA_R77_x1",
            "magazine_Missile_AA_R77_x1",
            "680Rnd_35mm_AA_shells_Tracer_Green"
        };
        addWeapons[] = {
            "autocannon_35mm",
            "weapon_R77Launcher"
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