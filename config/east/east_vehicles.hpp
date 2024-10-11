class Vehicles {
    class O_Quadbike_01_F {
        cost = 20;
        requirements[] = {};
        killReward = 20;
        capValue = 1;
    }; // "Quad Bike"

    class O_MRAP_02_F {
        cost = 300;
        requirements[] = {};
        killReward = 70;
        capValue = 1;
    }; // "Ifrit"

    class O_Truck_03_transport_F {
        cost = 200;
        requirements[] = {};
        killReward = 80;
        capValue = 1;
    }; // "Tempest Transport"

    class O_Truck_03_Fuel_F {
        cost = 1000;
        requirements[] = {};
        killReward = 80;
        capValue = 1;
    }; // "Tempest Fuel"

    class O_LSV_02_armed_F {
        cost = 200;
        requirements[] = {};
        rearm = 120;
        killReward = 150;
        capValue = 1;

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {};
            removeWeapons[] = {
                "LMG_Minigun_Transport"
            };
            addMagazines[] = {
                "500Rnd_65x39_Belt_Tracer_Green_Splash",
                "500Rnd_65x39_Belt_Tracer_Green_Splash",
                "500Rnd_65x39_Belt_Tracer_Green_Splash"
            };
            addWeapons[] = {
                "LMG_Minigun_Transport"
            };
        };
    }; // "Qilin (Minigun)"

    class O_G_Offroad_01_armed_F {
        cost = 150;
        requirements[] = {};
        rearm = 120;
        killReward = 150;
        capValue = 1;

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {};
            removeWeapons[] = {
                "HMG_M2_Mounted"
            };
            addMagazines[] = {
                "100Rnd_127x99_mag_Tracer_Yellow",
                "100Rnd_127x99_mag_Tracer_Yellow",
                "100Rnd_127x99_mag_Tracer_Yellow",
                "100Rnd_127x99_mag_Tracer_Yellow"
            };
            addWeapons[] = {
                "HMG_M2_Mounted"
            };
        };
    }; // "Offroad (HMG)"

    class O_LSV_02_AT_F {
        cost = 750;
        requirements[] = {};
        rearm = 200;
        killReward = 200;
        capValue = 1;

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {};
            removeWeapons[] = {
                "missiles_Vorona"
            };
            addMagazines[] = {
                "Vorona_HEAT",
                "Vorona_HEAT",
                "Vorona_HEAT",
                "Vorona_HEAT"
            };
            addWeapons[] = {
                "missiles_Vorona"
            };
        };
    }; // "Qilin (AT)"

    class O_T_LSV_02_AT_F {
        name = "Qilin (AT-M)";
        cost = 750;
        requirements[] = {};
        rearm = 200;
        killReward = 220;
        capValue = 1;

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {
                "Vorona_HEAT"
            };
            removeWeapons[] = {
                "missiles_Vorona"
            };
            addMagazines[] = {
                "2Rnd_127mm_Firefist_missiles",
                "2Rnd_127mm_Firefist_missiles",
                "2Rnd_127mm_Firefist_missiles",
                "2Rnd_127mm_Firefist_missiles"
            };
            addWeapons[] = {
                "missiles_Firefist"
            };
        };
    };

    class O_G_Offroad_01_AT_F {
        cost = 500;
        requirements[] = {};
        rearm = 180;
        killReward = 180;
        capValue = 1;

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {};
            removeWeapons[] = {
                "launcher_SPG9"
            };
            addMagazines[] = {
                "12Rnd_SPG9_HEAT"
            };
            addWeapons[] = {
                "launcher_SPG9"
            };
        };
    }; // "Offroad (AT)"

    class B_Truck_01_flatbed_F {
        cost = 500;
        requirements[] = {};
        killReward = 80;
        capValue = 1;
    }; // "HEMTT Flatbed"

    class O_MRAP_02_hmg_F {
        cost = 900;
        requirements[] = {};
        rearm = 300;
        killReward = 250;
        capValue = 2;
        aps = 1;
    }; // "Ifrit HMG"

    class O_MRAP_02_gmg_F {
        cost = 1250;
        requirements[] = {};
        rearm = 300;
        killReward = 250;
        capValue = 2;
        aps = 1;
    }; // "Ifrit GMG"

    class O_T_MRAP_02_gmg_ghex_F {
        name = "Ifrit-M Autocannon";
        cost = 1700;
        requirements[] = {};
        rearm = 300;
        killReward = 300;
        capValue = 2;
        aps = 2;

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {
                "96Rnd_40mm_G_belt"
            };
            removeWeapons[] = {
                "GMG_40mm"
            };
            addMagazines[] = {
                "140Rnd_30mm_MP_shells_Tracer_Red",
                "140Rnd_30mm_MP_shells_Tracer_Red",
                "60Rnd_30mm_APFSDS_shells_Tracer_Red",
                "60Rnd_30mm_APFSDS_shells_Tracer_Red"
            };
            addWeapons[] = {
                "autocannon_30mm_CTWS"
            };
        };
    };

    class O_Truck_03_Repair_F {
        cost = 1000;
        requirements[] = {};
        killReward = 80;
        capValue = 1;
    }; // "Tempest Repair"

    class O_Truck_03_device_F {
        cost = 1500;
        requirements[] = {};
        killReward = 200;
        capValue = 1;
        aps = 4;
    }; // "Tempest Device"

    class O_Truck_03_ammo_F {
        cost = 1000;
        requirements[] = {};
        killReward = 80;
        capValue = 1;
    }; // "Tempest Ammo"

    class O_APC_Wheeled_02_rcws_v2_F {
        cost = 1500;
        requirements[] = {};
        rearm = 400;
        killReward = 300;
        capValue = 2;
        aps = 2;
    }; // "MSE-3 Marid"

    class O_T_APC_Wheeled_02_rcws_v2_ghex_F {
        name = "MSE-3M Marid Autocannon";
        cost = 3700;
        requirements[] = {};
        rearm = 500;
        killReward = 300;
        capValue = 3;
        aps = 2;

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {
                "96Rnd_40mm_G_belt"
            };
            removeWeapons[] = {
                "GMG_40mm"
            };
            addMagazines[] = {
                "250Rnd_30mm_HE_shells_Tracer_Red",
                "250Rnd_30mm_APDS_shells_Tracer_Red"
            };
            addWeapons[] = {
                "gatling_30mm"
            };
        };
    };

    class O_APC_Tracked_02_cannon_F {
        cost = 3200;
        requirements[] = {};
        rearm = 500;
        killReward = 350;
        capValue = 3;
        aps = 2;

        disallowMagazines[] = {
            "4Rnd_GAA_missiles"
        };

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {
                "2Rnd_GAT_missiles_O"
            };
            removeWeapons[] = {
                "missiles_titan"
            };
            addMagazines[] = {
                "5Rnd_GAT_missiles",
                "5Rnd_GAT_missiles"
            };
            addWeapons[] = {
                "missiles_titan"
            };
        };
    }; // "BTR-K Kamysh"

    class O_APC_Tracked_02_AA_F {
        cost = 5000;
        requirements[] = {};
        rearm = 500;
        killReward = 350;
        capValue = 4;
        aps = 2;

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {
                "4Rnd_Titan_long_missiles_O"
            };
            removeWeapons[] = {
                "missiles_titan_AA"
            };
            addMagazines[] = {
                "4Rnd_GAA_missiles",
                "4Rnd_GAA_missiles"
            };
            addWeapons[] = {
                "missiles_titan_AA"
            };
        };
    }; // "ZSU-39 Tigris"

    class O_T_APC_Tracked_02_AA_ghex_F {
        name = "ZSU-49 Euphrates";
        cost = 9000;
        requirements[] = {};
        rearm = 450;
        killReward = 600;
        capValue = 4;
        aps = 2;

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {
                "4Rnd_Titan_long_missiles_O",
                "680Rnd_35mm_AA_shells_Tracer_Green"
            };
            removeWeapons[] = {
                "missiles_titan_AA",
                "autocannon_35mm"
            };
            addMagazines[] = {
                "magazine_Missile_s750_x4",
                "magazine_Cannon_Phalanx_x1550"
            };
            addWeapons[] = {
                "weapon_s750Launcher",
                "weapon_Cannon_Phalanx"
            };
        };
    };

    class O_MBT_02_cannon_F {
        cost = 7500;
        requirements[] = {};
        rearm = 600;
        killReward = 500;
        capValue = 4;
        aps = 3;
    }; // "T-100 Varsuk"

    class O_MBT_04_cannon_F {
        cost = 11000;
        requirements[] = {};
        rearm = 600;
        killReward = 550;
        capValue = 4;
        aps = 3;
    }; // "T-140 Angara"

    class O_MBT_04_command_F {
        cost = 13000;
        requirements[] = {};
        rearm = 600;
        killReward = 600;
        capValue = 4;
        aps = 3;
    }; // "T-140K Angara"
/* Disabled as it is broken since disabling SETWEAPONRELOADINGTIME
    class O_MBT_02_railgun_F {
        cost = 15000;
        requirements[] = {};
        rearm = 600;
        killReward = 500;
        capValue = 4;
        aps = 3;
    }; // "T-100 Futura"
*/
    class O_MBT_02_arty_F {
        cost = 20000;
        requirements[] = {};
        rearm = 1800;
        killReward = 600;
        capValue = 4;
        aps = 1;
    }; // "2S9 Sochor"

    class I_Truck_02_MRL_F {
        cost = 18000;
        requirements[] = {};
        rearm = 1800;
        killReward = 600;
        capValue = 4;
        aps = 1;
    }; // "Zamak MRL"

    class O_Truck_03_medical_F {
        killReward = 100;
        capValue = 1;
    }; // Tempest Spawn Truck
};