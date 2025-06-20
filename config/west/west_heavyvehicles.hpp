class HeavyVehicles {
    class B_APC_Tracked_01_rcws_F {
        aps = 2;
        capValue = 3;
        cost = 1300;
        description = "While both IFV-6c Panther and IFV-6a Cheetah are based on the Israeli armored personnel carrier chassis, they serve different roles in combat.<br /><br />Basic Controls:<br />Press nextWeapon to cycle between weapons.<br />Press zoomIn and zoomOut to zoom in or out.<br />Press gunElevAuto to measure distance and automatically adjust gun elevation (Fire Control System).<br />Press ListLeftVehicleDisplay and ListRightVehicleDisplay to adjust system panels for the left or right side of your screen.<br />Press NextModeLeftVehicleDisplay or NextModeRightVehicleDisplay to adjust modes (if available) for system panels.";
        killReward = 300;
        rearm = 400;
        requirements[] = {};

        // class Gunner: WLTurretDefaults {
        //     addMagazines[] = {
        //         "60Rnd_30mm_APFSDS_shells_Tracer_Red",
        //         "60Rnd_30mm_APFSDS_shells_Tracer_Red",
        //         "140Rnd_30mm_MP_shells_Tracer_Red",
        //         "140Rnd_30mm_MP_shells_Tracer_Red"
        //     };
        //     addWeapons[] = {
        //         "autocannon_30mm_CTWS"
        //     };
        //     removeMagazines[] = {
        //         "96Rnd_40mm_G_belt"
        //     };
        //     removeWeapons[] = {
        //         "GMG_40mm"
        //     };
        //     turret[] = { 0 };
        // };
    }; // "IFV-6c Panther"

    class B_LT_01_AT_F {
        aps = 1;
        capValue = 3;
        cost = 1500;
        description = "The AWC 300 Nyx family consists of a number of light, fast and agile combat vehicles used by the AAF.<br /><br />Basic Controls:<br />Press nextWeapon to cycle between weapons.<br />Press zoomIn and zoomOut to zoom in or out.<br />Press gunElevAuto to measure distance and automatically adjust gun elevation (Fire Control System).<br />Press ListLeftVehicleDisplay and ListRightVehicleDisplay to adjust system panels for the left or right side of your screen.<br />Press lockTarget to lock onto target.<br />Press NextModeLeftVehicleDisplay or NextModeRightVehicleDisplay to adjust modes (if available) for system panels.";
        killReward = 240;
        loadable[] = {0, -1.5, 1.2};
        name = "AWC Nyx (AT)";
        rearm = 300;
        requirements[] = {};
        spawn = "I_LT_01_AT_F";
        textures[] = {
            "A3\armor_f_tank\lt_01\data\lt_01_main_olive_co.paa",
            "A3\armor_f_tank\lt_01\data\lt_01_at_olive_co.paa",
            "a3\Armor_F\Data\camonet_NATO_Desert_CO.paa",
            "A3\Armor_F_Tank\AFV_Wheeled_01\Data\afv_wheeled_01_EXT3_sand_CO.paa"
        };

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "2Rnd_127mm_Firefist_missiles",
                "2Rnd_127mm_Firefist_missiles",
                "2Rnd_127mm_Firefist_missiles",
                "2Rnd_127mm_Firefist_missiles",
                "2Rnd_127mm_Firefist_missiles"
            };
            addWeapons[] = {
                "missiles_Firefist"
            };
            reloadOverride = 10;
            removeMagazines[] = {
                "100Rnd_127x99_mag_Tracer_Red"
            };
            removeWeapons[] = {
                "HMG_127"
            };
            turret[] = { 0 };
        };
    };

    class B_APC_Tracked_01_CRV_F {
        aps = 2;
        capValue = 2;
        cost = 1700;
        description = "The CRV-6e Bobcat is a Combat Recovery Vehicle capable of acting mobile repair, refuel and rearm depot for other vehicles on the front lines, making it an ideal support vehicle.<br /><br />Basic Controls:<br />Press nextWeapon to cycle between weapons.<br />Press zoomIn and zoomOut to zoom in or out.<br />Press gunElevAuto to measure distance and automatically adjust gun elevation (Fire Control System).<br />Press ListLeftVehicleDisplay and ListRightVehicleDisplay to adjust system panels for the left or right side of your screen.<br />Press NextModeLeftVehicleDisplay or NextModeRightVehicleDisplay to adjust modes (if available) for system panels.";
        killReward = 300;
        rearm = 400;
        requirements[] = {};
    }; // "CRV-6e Bobcat"

    class B_APC_Wheeled_01_light_F {
        aps = 2;
        capValue = 2;
        cost = 1700;
        description = "AMV-7 Marshall Light is a lighter, faster variant of the AMV-7 Marshall with a weaker armament.<br /><br />Basic Controls:<br />Press nextWeapon to cycle between weapons.<br />Press zoomIn and zoomOut to zoom in or out.<br />Press gunElevAuto to measure distance and automatically adjust gun elevation (Fire Control System).<br />Press ListLeftVehicleDisplay and ListRightVehicleDisplay to adjust system panels for the left or right side of your screen.<br />Press NextModeLeftVehicleDisplay or NextModeRightVehicleDisplay to adjust modes (if available) for system panels.";
        isLight = 1;
        killReward = 300;
        loadable[] = {0, -0.8, 1.7};
        name = "AMV-7 Marshall Light";
        rearm = 500;
        requirements[] = {};
        spawn = "B_APC_Wheeled_01_cannon_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "5000Rnd_762x51_Yellow_Belt"
            };
            addWeapons[] = {
                "M134_minigun"
            };
            removeMagazines[] = {
                "40Rnd_40mm_APFSDS_Tracer_Red_shells",
                "60Rnd_40mm_GPR_Tracer_Red_shells"
            };
            removeWeapons[] = {
                "LMG_coax",
                "autocannon_40mm_CTWS"
            };
            turret[] = { 0 };
        };
    };

    class B_APC_Wheeled_01_recon_F {
        aps = 4;
        capValue = 1;
        cost = 2200;
        description = "AMV-7 Marshall (Recon) is a variant of the AMV-7 Marshall armed with a powerful scanner.<br /><br />How To Use:<br /> - Enter the vehicle or stand next to it.<br /> - Use your scroll wheel and select the ""Dazzler"" or ""Scanner"" option to enable the projectile dazzler or recon scanner.";
        isLight = 1;
        hasHMD = 1;
        hasScanner = 1;
        killReward = 300;
        name = "AMV-7 Marshall (Recon)";
        rearm = 500;
        requirements[] = {};
        spawn = "B_APC_Wheeled_01_cannon_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {};
            addWeapons[] = {};
            hideTurret = 1;
            removeMagazines[] = {
                "200Rnd_762x51_Belt_Red",
                "40Rnd_40mm_APFSDS_Tracer_Red_shells",
                "60Rnd_40mm_GPR_Tracer_Red_shells"
            };
            removeWeapons[] = {
                "LMG_coax",
                "autocannon_40mm_CTWS"
            };
            turret[] = { 0 };
        };
    };

    class B_APC_tracked_03_cannon_F {
        aps = 3;
        capValue = 4;
        cost = 2500;
        description = "The FV-720 Mora is an infantry fighting vehicle used by the AAF.<br /><br />Basic Controls:<br />Press nextWeapon to cycle between weapons.<br />Press zoomIn and zoomOut to zoom in or out.<br />Press gunElevAuto to measure distance and automatically adjust gun elevation (Fire Control System).<br />Press ListLeftVehicleDisplay and ListRightVehicleDisplay to adjust system panels for the left or right side of your screen.<br />Press NextModeLeftVehicleDisplay or NextModeRightVehicleDisplay to adjust modes (if available) for system panels.";
        killReward = 400;
        name = "FV-720 Mora";
        rearm = 500;
        requirements[] = {};
        spawn = "I_APC_tracked_03_cannon_F";
        textures[] = {
            "A3\Armor_F_Enoch\apc_tracked_03\data\apc_tracked_03_ext_eaf_co.paa",
            "A3\Armor_F_Enoch\apc_tracked_03\data\apc_tracked_03_ext2_eaf_co.paa",
            "A3\Armor_F_Enoch\apc_tracked_03\Data\camonet_EAF_green_CO.paa",
            "A3\Armor_F_Enoch\apc_tracked_03\data\cage_EAF_CO.paa"
        };
    };

    class B_APC_Wheeled_01_cannon_F {
        aps = 2;
        capValue = 3;
        cost = 2700;
        description = "APC (Armored Personnel Carrier) vehicles are used to deploy soldiers and exfiltrate them away from a battlezone.<br /><br />Basic Controls:<br />Press nextWeapon to cycle between weapons.<br />Press zoomIn and zoomOut to zoom in or out.<br />Press gunElevAuto to measure distance and automatically adjust gun elevation (Fire Control System).<br />Press ListLeftVehicleDisplay and ListRightVehicleDisplay to adjust system panels for the left or right side of your screen.<br />Press NextModeLeftVehicleDisplay or NextModeRightVehicleDisplay to adjust modes (if available) for system panels.";
        killReward = 300;
        rearm = 500;
        requirements[] = {};
    }; // "AMV-7 Marshall"

    class B_APC_Wheeled_03_cannon_F {
        aps = 2;
        capValue = 3;
        cost = 2900;
        description = "The AFV-4 Gorgon is an amphibious 8x8 all-wheel-drive armored person carrier vehicle, used to carry soldiers to the battlefield and provide fire support.<br /><br />Basic Controls:<br />Press nextWeapon to cycle between weapons.<br />Press zoomIn and zoomOut to zoom in or out.<br />Press gunElevAuto to measure distance and automatically adjust gun elevation (Fire Control System).<br />Press ListLeftVehicleDisplay and ListRightVehicleDisplay to adjust system panels for the left or right side of your screen.<br />Press lockTarget to lock onto target.<br />Press NextModeLeftVehicleDisplay or NextModeRightVehicleDisplay to adjust modes (if available) for system panels.";
        disallowMagazines[] = {
            "4Rnd_GAA_missiles"
        };
        killReward = 300;
        rearm = 500;
        requirements[] = {};
        textures[] = {
            "\A3\armor_f_gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext_co.paa",
            "\A3\armor_f_gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext2_co.paa",
            "\A3\armor_f_gamma\APC_Wheeled_03\Data\rcws30_co.paa",
            "\A3\armor_f_gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext_alpha_co.paa"
        };

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "5Rnd_GAT_missiles",
                "5Rnd_GAT_missiles"
            };
            addWeapons[] = {
                "missiles_titan"
            };
            removeMagazines[] = {
                "2Rnd_GAT_missiles"
            };
            removeWeapons[] = {
                "missiles_titan"
            };
            turret[] = { 0 };
        };
    }; // "AFV-4 Gorgon"

    class B_APC_Wheeled_01_cannon_up_F {
        aps = 2;
        capValue = 3;
        cost = 3200;
        description = "AMV-7 Marshall UP is a variant of the AMV-7 Marshall armed with a larger magazine 40mm cannon.<br /><br />Basic Controls:<br />Press nextWeapon to cycle between weapons.<br />Press zoomIn and zoomOut to zoom in or out.<br />Press gunElevAuto to measure distance and automatically adjust gun elevation (Fire Control System).<br />Press ListLeftVehicleDisplay and ListRightVehicleDisplay to adjust system panels for the left or right side of your screen.<br />Press NextModeLeftVehicleDisplay or NextModeRightVehicleDisplay to adjust modes (if available) for system panels.";
        killReward = 300;
        name = "AMV-7 Marshall UP";
        rearm = 500;
        requirements[] = {};
        spawn = "B_APC_Wheeled_01_cannon_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "240Rnd_40mm_GPR_Tracer_Red_shells",
                "240Rnd_40mm_GPR_Tracer_Red_shells",
                "160Rnd_40mm_APFSDS_Tracer_Red_shells",
                "160Rnd_40mm_APFSDS_Tracer_Red_shells"
            };
            addWeapons[] = {
                "autocannon_40mm_VTOL_01",
                "LMG_coax"
            };
            removeMagazines[] = {
                "60Rnd_40mm_GPR_Tracer_Red_shells",
                "40Rnd_40mm_APFSDS_Tracer_Red_shells"
            };
            removeWeapons[] = {
                "autocannon_40mm_CTWS",
                "LMG_coax"
            };
            turret[] = { 0 };
        };
    };

    // class B_AFV_Wheeled_01_export_cannon_F {
    //     aps = 2;
    //     capValue = 4;
    //     cost = 3700;
    //     description = "Rhino MGS-E is a variant of the Rhino MGS armed with a weaker 105mm cannon.";
    //     killReward = 400;
    //     name = "Rhino MGS-E";
    //     rearm = 500;
    //     requirements[] = {};
    //     spawn = "B_AFV_Wheeled_01_up_cannon_F";
    //     variant = 1;

    //     class Gunner: WLTurretDefaults {
    //         addMagazines[] = {
    //             "40Rnd_105mm_APFSDS_T_Red"
    //         };
    //         addWeapons[] = {
    //             "cannon_105mm"
    //         };
    //         removeMagazines[] = {
    //             "12Rnd_120mm_APFSDS_shells_Tracer_Red",
    //             "8Rnd_120mm_HE_shells_Tracer_Red",
    //             "8Rnd_120mm_HEAT_MP_T_Red",
    //             "4Rnd_120mm_LG_cannon_missiles"
    //         };
    //         removeWeapons[] = {
    //             "cannon_120mm"
    //         };
    //         turret[] = { 0 };
    //     };
    // };

    class B_APC_Tracked_01_AT_F {
        aps = 2;
        capValue = 4;
        cost = 4500;
        description = "IFV-6d Ocelot is an AT capable variant of IFV-6 chassis.<br /><br />Basic Controls:<br />Press ActiveSensorsToggle to toggle the radar on/off.<br />Press lockTarget to lock onto target.<br />Press vehLockTargets to cycle between targets detected on sensors.<br />Press nextWeapon to cycle between weapons.<br />Press zoomIn and zoomOut to zoom in or out.<br />Press gunElevAuto to measure distance and automatically adjust gun elevation (Fire Control System).<br />Press ListLeftVehicleDisplay and ListRightVehicleDisplay to adjust system panels for the left or right side of your screen.<br />Press NextModeLeftVehicleDisplay or NextModeRightVehicleDisplay to adjust modes (if available) for system panels.";
        hasHMD = 1;
        killReward = 340;
        name = "IFV-6d Ocelot";
        rearm = 280;
        requirements[] = {};
        spawn = "B_APC_Tracked_01_AA_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "2Rnd_127mm_Firefist_missiles",
                "2Rnd_127mm_Firefist_missiles",
                "2Rnd_127mm_Firefist_missiles",
                "2Rnd_127mm_Firefist_missiles",
                "680Rnd_35mm_AA_shells_Tracer_Red"
            };
            addWeapons[] = {
                "autocannon_35mm",
                "missiles_Firefist"
            };
            removeMagazines[] = {
                "4Rnd_Titan_long_missiles",
                "680Rnd_35mm_AA_shells_Tracer_Red"
            };
            removeWeapons[] = {
                "missiles_titan_AA",
                "autocannon_35mm"
            };
            turret[] = { 0 };
        };
    };

    class B_AFV_Wheeled_01_cannon_F {
        aps = 2;
        capValue = 4;
        cost = 4500;
        description = "The Rhino MGS is the latest wheeled tank destroyer in NATO armored forces, designed for easy transportation to crisis regions.<br /><br />Basic Controls:<br />Press nextWeapon to cycle between weapons.<br />Press zoomIn and zoomOut to zoom in or out.<br />Press gunElevAuto to measure distance and automatically adjust gun elevation (Fire Control System).<br />Press ListLeftVehicleDisplay and ListRightVehicleDisplay to adjust system panels for the left or right side of your screen.<br />Press lockTarget to lock onto target.<br />Press vehLockTargets to cycle between targets detected on sensors.<br />Press NextModeLeftVehicleDisplay or NextModeRightVehicleDisplay to adjust modes (if available) for system panels.";
        isLight = 1;
        killReward = 450;
        rearm = 500;
        requirements[] = {};
    }; // "Rhino MGS"

    class B_AFV_Wheeled_01_up_cannon_F {
        aps = 2;
        capValue = 4;
        cost = 5000;
        description = "The Rhino MGS is the latest wheeled tank destroyer in NATO armored forces, designed for easy transportation to crisis regions.<br /><br />Basic Controls:<br />Press nextWeapon to cycle between weapons.<br />Press zoomIn and zoomOut to zoom in or out.<br />Press gunElevAuto to measure distance and automatically adjust gun elevation (Fire Control System).<br />Press ListLeftVehicleDisplay and ListRightVehicleDisplay to adjust system panels for the left or right side of your screen.<br />Press lockTarget to lock onto target.<br />Press vehLockTargets to cycle between targets detected on sensors.<br />Press NextModeLeftVehicleDisplay or NextModeRightVehicleDisplay to adjust modes (if available) for system panels.";
        killReward = 500;
        rearm = 500;
        requirements[] = {};
    }; // "Rhino MGS UP"

    class B_MBT_01_cannon_F {
        aps = 3;
        capValue = 4;
        cost = 5800;
        description = "A licensed copy of an Israeli tank built in Central Europe.<br /><br />Basic Controls:<br />Press nextWeapon to cycle between weapons.<br />Press zoomIn and zoomOut to zoom in or out.<br />Press gunElevAuto to measure distance and automatically adjust gun elevation (Fire Control System).<br />Press ListLeftVehicleDisplay and ListRightVehicleDisplay to adjust system panels for the left or right side of your screen.<br />Press NextModeLeftVehicleDisplay or NextModeRightVehicleDisplay to adjust modes (if available) for system panels.";
        disallowMagazines[] = {
            "4Rnd_120mm_LG_cannon_missiles"
        };
        isLight = 1;
        killReward = 450;
        rearm = 600;
        requirements[] = {};
    }; // "M2A1 Slammer"

    class B_MBT_01_TUSK_F {
        aps = 3;
        capValue = 4;
        cost = 6200;
        description = "The M2A4 Slammer UP is the urban purpose variant of the M2A1 Slammer.<br /><br />Basic Controls:<br />Press nextWeapon to cycle between weapons.<br />Press zoomIn and zoomOut to zoom in or out.<br />Press gunElevAuto to measure distance and automatically adjust gun elevation (Fire Control System).<br />Press ListLeftVehicleDisplay and ListRightVehicleDisplay to adjust system panels for the left or right side of your screen.<br />Press NextModeLeftVehicleDisplay or NextModeRightVehicleDisplay to adjust modes (if available) for system panels.";
        disallowMagazines[] = {
            "4Rnd_120mm_LG_cannon_missiles"
        };
        killReward = 500;
        rearm = 600;
        requirements[] = {};

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "450Rnd_127x108_Ball",
                "450Rnd_127x108_Ball",
                "450Rnd_127x108_Ball",
                "450Rnd_127x108_Ball"
            };
            addWeapons[] = {
                "HMG_NSVT"
            };
            removeMagazines[] = {
                "200Rnd_762x51_Belt_Red"
            };
            removeWeapons[] = {
                "LMG_coax"
            };
            turret[] = { 0 };
        };
    }; // "M2A1 Slammer UP"

    class B_MBT_03_cannon_F {
        aps = 3;
        capValue = 4;
        cost = 8000;
        description = "The MBT-52 Kuma is the main battle tank used by Altian Armed Forces.<br /><br />Basic Controls:<br />Press nextWeapon to cycle between weapons.<br />Press zoomIn and zoomOut to zoom in or out.<br />Press gunElevAuto to measure distance and automatically adjust gun elevation (Fire Control System).<br />Press ListLeftVehicleDisplay and ListRightVehicleDisplay to adjust system panels for the left or right side of your screen.<br />Press NextModeLeftVehicleDisplay or NextModeRightVehicleDisplay to adjust modes (if available) for system panels.";
        disallowMagazines[] = {
            "4Rnd_120mm_LG_cannon_missiles"
        };
        killReward = 500;
        name = "M52 Kuma";
        rearm = 600;
        requirements[] = {};
        spawn = "I_MBT_03_cannon_F";
        textures[] = {
            "src\img\camo\kuma01.jpg",
            "src\img\camo\kuma02.jpg",
            "src\img\camo\kuma03.jpg",
            "\a3\Armor_F\Data\camonet_NATO_Desert_CO.paa"
        };
    };

    class B_MBT_01_TUSK2_F {
        aps = 3;
        capValue = 4;
        cost = 9000;
        description = "M2A2 Slammer II is an advanced variant of the M2A1 Slammer armed with an advanced 125mm cannon and a recon scanner.<br /><br />Basic Controls:<br />Press nextWeapon to cycle between weapons.<br />Press zoomIn and zoomOut to zoom in or out.<br />Press gunElevAuto to measure distance and automatically adjust gun elevation (Fire Control System).<br />Press ListLeftVehicleDisplay and ListRightVehicleDisplay to adjust system panels for the left or right side of your screen.<br />Press NextModeLeftVehicleDisplay or NextModeRightVehicleDisplay to adjust modes (if available) for system panels.";
        disallowMagazines[] = {
            "4Rnd_120mm_LG_cannon_missiles"
        };
        hasHMD = 1;
        hasReconOptics = 1;
        killReward = 600;
        name = "M2A2 Slammer II";
        rearm = 600;
        requirements[] = {};
        spawn = "B_MBT_01_TUSK_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "24Rnd_125mm_APFSDS_T_Red",
                "8Rnd_125mm_HE_T_Red",
                "8Rnd_125mm_HE_T_Red",
                "8Rnd_125mm_HE_T_Red",
                "450Rnd_127x108_Ball",
                "450Rnd_127x108_Ball",
                "450Rnd_127x108_Ball",
                "450Rnd_127x108_Ball",
                "450Rnd_127x108_Ball",
                "450Rnd_127x108_Ball"
            };
            addWeapons[] = {
                "cannon_125mm_advanced",
                "HMG_NSVT"
            };
            removeMagazines[] = {
                "200Rnd_762x51_Belt_Red",
                "24Rnd_120mm_APFSDS_shells_Tracer_Red",
                "12Rnd_120mm_HE_shells_Tracer_Red",
                "12Rnd_120mm_HEAT_MP_T_Red"
            };
            removeWeapons[] = {
                "cannon_120mm",
                "LMG_coax"
            };
            turret[] = { 0 };
        };
    };

    // class B_MBT_01_TUSK_Railgun_F {
    //     aps = 3;
    //     capValue = 4;
    //     cost = 13000;
    //     description = "M2X Slammer (Railgun) is a variant of the M2A1 Slammer armed with a railgun.";
    //     killReward = 550;
    //     name = "M2X Slammer (Railgun)";
    //     rearm = 600;
    //     requirements[] = {};
    //     spawn = "B_MBT_01_TUSK_F";
    //     variant = 1;
    //
    //     class Gunner: WLTurretDefaults {
    //         addMagazines[] = {
    //             "RailGun_01_DummyMagazine",
    //             "60Rnd_75mm_RailGun_APFSDS_mag"
    //         };
    //         addWeapons[] = {
    //             "cannon_railgun",
    //             "cannon_railgun_fake"
    //         };
    //         removeMagazines[] = {
    //             "24Rnd_120mm_APFSDS_shells_Tracer_Red",
    //             "12Rnd_120mm_HE_shells_Tracer_Red",
    //             "12Rnd_120mm_HEAT_MP_T_Red"
    //         };
    //         removeWeapons[] = {
    //             "cannon_120mm"
    //         };
    //         turret[] = { 0 };
    //     };
    // };

    class B_MBT_01_arty_F {
        aps = 1;
        capValue = 4;
        cost = 20000;
        description = "Based on the licensed version of an Israeli tank chassis, The Scorcher M4 is a 155 mm self-propelled artillery at the end of its lifetime cycle.<br /><br />Basic Controls:<br />Press nextWeapon to cycle between weapons.<br />Press gunElevUp and gunElevDown to adjust the elevation of your gun up or down.<br />Press zoomIn and zoomOut to zoom in or out.<br />Press ListLeftVehicleDisplay and ListRightVehicleDisplay to adjust system panels for the left or right side of your screen.<br />Press NextModeLeftVehicleDisplay or NextModeRightVehicleDisplay to adjust modes (if available) for system panels.";
        disallowMagazines[] = {
            "2Rnd_155mm_Mo_Cluster",
            "2Rnd_155mm_Mo_Cluster_O"
        };
        killReward = 600;
        rearm = 1800;
        requirements[] = {};
    }; // "M4 Scorcher"

    class B_MBT_01_mlrs_F {
        aps = 1;
        capValue = 4;
        cost = 20000;
        description = "The Swedish Multiple Launch Rocket System is a replacement of the original U.S.<br /><br />Basic Controls:<br />Press nextWeapon to cycle between weapons.<br />Press gunElevUp and gunElevDown to adjust the elevation of your gun up or down.<br />Press zoomIn and zoomOut to zoom in or out.<br />Press ListLeftVehicleDisplay and ListRightVehicleDisplay to adjust system panels for the left or right side of your screen.<br />Press NextModeLeftVehicleDisplay or NextModeRightVehicleDisplay to adjust modes (if available) for system panels.";
        disallowMagazines[] = {
            "12Rnd_230mm_rockets_cluster"
        };
        killReward = 600;
        rearm = 1800;
        requirements[] = {};
    }; // "M5 Sandstorm MLRS"

    class B_MBT_01_arty_tv_F {
        ammoOverrides[] = {
            {"Sh_155mm_AMOS", {"M_Excalibur", "Excalibur (TV-Guided)"}}
        };
        aps = 1;
        capValue = 4;
        cost = 30000;
        description = "Based on the licensed version of an Israeli tank chassis, The Scorcher M4 is a 155 mm self-propelled artillery at the end of its lifetime cycle.<br /><br />Basic Controls:<br />Press nextWeapon to cycle between weapons.<br />Press gunElevUp and gunElevDown to adjust the elevation of your gun up or down.<br />Press zoomIn and zoomOut to zoom in or out.<br />Press ListLeftVehicleDisplay and ListRightVehicleDisplay to adjust system panels for the left or right side of your screen.<br />Press NextModeLeftVehicleDisplay or NextModeRightVehicleDisplay to adjust modes (if available) for system panels.";
        disallowMagazines[] = {
            "2Rnd_155mm_Mo_guided",
            "4Rnd_155mm_Mo_guided",
            "2Rnd_155mm_Mo_LG",
            "4Rnd_155mm_Mo_LG",
            "6Rnd_155mm_Mo_mine",
            "6Rnd_155mm_Mo_AT_mine",
            "2Rnd_155mm_Mo_Cluster",
            "6Rnd_155mm_Mo_smoke",
            "2Rnd_155mm_Mo_guided_O",
            "4Rnd_155mm_Mo_guided_O",
            "4Rnd_155mm_Mo_LG_O",
            "6Rnd_155mm_Mo_mine_O",
            "6Rnd_155mm_Mo_AT_mine_O",
            "2Rnd_155mm_Mo_Cluster_O",
            "6Rnd_155mm_Mo_smoke_O"
        };
        killReward = 600;
        name = "M4 Scorcher UP";
        rearm = 1200;
        requirements[] = {};
        spawn = "B_MBT_01_arty_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {};
            addWeapons[] = {};
            removeMagazines[] = {
                "6Rnd_155mm_Mo_smoke",
                "2Rnd_155mm_Mo_guided",
                "4Rnd_155mm_Mo_guided",
                "2Rnd_155mm_Mo_LG",
                "6Rnd_155mm_Mo_mine",
                "6Rnd_155mm_Mo_AT_mine",
                "2Rnd_155mm_Mo_Cluster"
            };
            removeWeapons[] = {};
            turret[] = { 0 };
        };
    };
};