class Vehicles {
    class B_Quadbike_01_F {
        cost = 20;
        requirements[] = {};
        killReward = 20;
        capValue = 1;
    }; // "Quad Bike"

    class B_MRAP_01_F {
        cost = 300;
        requirements[] = {};
        killReward = 70;
        capValue = 1;
    }; // "Hunter"

    class B_LSV_01_armed_F {
        cost = 200;
        requirements[] = {};
        rearm = 120;
        killReward = 150;
        capValue = 1;

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {};
            removeWeapons[] = {
                "HMG_127_LSV_01"
            };
            addMagazines[] = {
                "100Rnd_127x99_mag_Tracer_Red",
                "100Rnd_127x99_mag_Tracer_Red",
                "100Rnd_127x99_mag_Tracer_Red"
            };
            addWeapons[] = {
                "HMG_127_LSV_01"
            };
        };
    }; // "Prowler (HMG)"

    class B_G_Offroad_01_armed_F {
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

    class B_LSV_01_AT_F {
        cost = 750;
        requirements[] = {};
        rearm = 200;
        killReward = 200;
        capValue = 1;

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {};
            removeWeapons[] = {
                "missiles_titan_static"
            };
            addMagazines[] = {
                "1Rnd_GAT_missiles",
                "1Rnd_GAT_missiles",
                "1Rnd_GAT_missiles",
                "1Rnd_GAT_missiles"
            };
            addWeapons[] = {
                "missiles_titan_static"
            };
        };
    }; // "Prowler (AT)"

    class B_G_Offroad_01_AT_F {
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

    class B_MRAP_01_hmg_F {
        cost = 900;
        requirements[] = {};
        rearm = 300;
        killReward = 250;
        capValue = 2;
    }; // "Hunter HMG"

    class B_MRAP_01_gmg_F {
        cost = 1250;
        requirements[] = {};
        rearm = 300;
        killReward = 250;
        capValue = 2;
    }; // "Hunter GMG"

    class B_Truck_01_ammo_F {
        cost = 1000;
        requirements[] = {};
        killReward = 80;
        capValue = 1;
    }; // "HEMTT Ammo"

    class B_Truck_01_Repair_F {
        cost = 1000;
        requirements[] = {};
        killReward = 80;
        capValue = 1;
    }; // "HEMTT Repair"

    class B_Truck_01_fuel_F {
        cost = 1000;
        requirements[] = {};
        killReward = 80;
        capValue = 1;
    }; // "HEMTT Fuel"

    class O_T_Truck_03_device_ghex_F {
        cost = 1500;
        requirements[] = {};
        killReward = 200;
        capValue = 1;
    }; // "Tempest Device"

    class B_Truck_01_transport_F {
        cost = 200;
        requirements[] = {};
        killReward = 80;
        capValue = 1;
    }; // "HEMTT Transport"

    class B_Truck_01_flatbed_F {
        cost = 500;
        requirements[] = {};
        killReward = 80;
        capValue = 1;
    }; // "HEMTT Flatbed"

    class B_APC_Tracked_01_CRV_F {
        cost = 1700;
        requirements[] = {};
        killReward = 300;
        capValue = 2;
    }; // "CRV-6e Bobcat"

    class B_APC_Wheeled_03_cannon_F {
        cost = 2900;
        requirements[] = {};
        rearm = 500;
        killReward = 300;
        capValue = 3;

        disallowMagazines[] = {
            "4Rnd_GAA_missiles"
        };

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {
                "2Rnd_GAT_missiles"
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
    }; // "BLUFOR Gorgon"

    class B_APC_Wheeled_01_cannon_F {
        cost = 3200;
        requirements[] = {};
        rearm = 500;
        killReward = 300;
        capValue = 3;
    }; // "AMV-7 Marshall"

    class B_APC_Tracked_01_rcws_F {
        cost = 1800;
        requirements[] = {};
        rearm = 400;
        killReward = 300;
        capValue = 3;
    }; // "IFV-6c Panther"

    class B_APC_Tracked_01_AA_F {
        cost = 5000;
        requirements[] = {};
        rearm = 500;
        killReward = 350;
        capValue = 4;

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {
                "4Rnd_Titan_long_missiles"
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
    }; // "IFV-6a Cheetah"

    class B_AFV_Wheeled_01_cannon_F {
        cost = 4500;
        requirements[] = {};
        rearm = 500;
        killReward = 450;
        capValue = 4;
    }; // "Rhino MGS"

    class B_AFV_Wheeled_01_up_cannon_F {
        cost = 5000;
        requirements[] = {};
        rearm = 500;
        killReward = 500;
        capValue = 4;
    }; // "Rhino MGS UP"

    class B_MBT_01_cannon_F {
        cost = 5800;
        requirements[] = {};
        rearm = 600;
        killReward = 450;
        capValue = 4;

        disallowMagazines[] = {
            "4Rnd_120mm_LG_cannon_missiles"
        };
    }; // "M2A1 Slammer"

    class B_MBT_01_TUSK_F {
        cost = 6500;
        requirements[] = {};
        rearm = 600;
        killReward = 500;
        capValue = 4;

        disallowMagazines[] = {
            "4Rnd_120mm_LG_cannon_missiles"
        };
    }; // "M2A1 Slammer UP"

    // class B_T_MBT_01_TUSK_F {
    //     name = "M2X Slammer (Railgun)";
    //     cost = 13000;
    //     requirements[] = {};
    //     rearm = 600;
    //     killReward = 550;
    //     capValue = 4;

    //     class Gunner: WLTurretDefaults {
    //         turret[] = { 0 };
    //         removeMagazines[] = {
    //             "24Rnd_120mm_APFSDS_shells_Tracer_Red",
    //             "12Rnd_120mm_HE_shells_Tracer_Red",
    //             "12Rnd_120mm_HEAT_MP_T_Red"
    //         };
    //         removeWeapons[] = {
    //             "cannon_120mm"
    //         };
    //         addMagazines[] = {
    //             "RailGun_01_DummyMagazine",
    //             "60Rnd_75mm_RailGun_APFSDS_mag"
    //         };
    //         addWeapons[] = {
    //             "cannon_railgun",
    //             "cannon_railgun_fake"
    //         };
    //     };
    // };

    class B_MBT_01_arty_F {
        cost = 20000;
        requirements[] = {};
        rearm = 1800;
        killReward = 600;
        capValue = 4;
    }; // "M4 Scorcher"

    class B_MBT_01_mlrs_F {
        cost = 20000;
        requirements[] = {};
        rearm = 1800;
        killReward = 600;
        capValue = 4;
    }; // "M5 Sandstorm MLRS"

    class B_Truck_01_medical_F {
        killReward = 100;
        capValue = 1;
    }; // HEMMT Spawn Truck
};