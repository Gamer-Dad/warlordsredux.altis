class LightVehicles {
    class B_Quadbike_01_F {
        capValue = 1;
        cost = 20;
        loadable[] = {0, -1, 0.6};
        offset[] = {0, 3, 0};
    }; // "Quad Bike"

    class B_G_Offroad_01_armed_F {
        capValue = 1;
        cost = 150;
        loadable[] = {0, -1.7, 1.3};
        offset[] = {0, 5, 0};
        rearm = 120;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "100Rnd_127x99_mag_Tracer_Yellow",
                "100Rnd_127x99_mag_Tracer_Yellow",
                "100Rnd_127x99_mag_Tracer_Yellow",
                "100Rnd_127x99_mag_Tracer_Yellow"
            };
            addWeapons[] = {
                "HMG_M2_Mounted"
            };
            removeMagazines[] = {};
            removeWeapons[] = {
                "HMG_M2_Mounted"
            };
            turret[] = { 0 };
        };
    }; // "Offroad (HMG)"

    class B_LSV_01_armed_F {
        capValue = 1;
        cost = 200;
        loadable[] = {0, -1.3, 1.25};
        offset[] = {0, 5, 0};
        rearm = 120;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "100Rnd_127x99_mag_Tracer_Red",
                "100Rnd_127x99_mag_Tracer_Red",
                "100Rnd_127x99_mag_Tracer_Red"
            };
            addWeapons[] = {
                "HMG_127_LSV_01"
            };
            removeMagazines[] = {};
            removeWeapons[] = {
                "HMG_127_LSV_01"
            };
            turret[] = { 0 };
        };
    }; // "Prowler (HMG)"

    class B_Truck_01_transport_F {
        capValue = 1;
        cost = 200;
        hasFastTravel = 1;
        loaded = "Land_BagBunker_Small_F";
    }; // "HEMTT Transport"

    class B_Truck_01_medical_F {
        capValue = 1;
        cost = 250;
        hasFastTravel = 1;
        loaded = "Land_BagBunker_Small_F";
    }; // "HEMMT Medical"

    class B_MRAP_01_F {
        capValue = 1;
        cost = 300;
        loadable[] = {0, -0.8, 1.25};
    }; // "Hunter"

    class B_Truck_01_flatbed_F {
        capValue = 1;
        cost = 300;
        hasFastTravel = 1;
        isLight = 1;
    }; // "HEMTT Flatbed"

    class B_G_Offroad_01_AT_F {
        capValue = 1;
        cost = 500;
        loadable[] = {0, -1.7, 0.7};
        offset[] = {0, 5, 0};
        rearm = 180;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "12Rnd_SPG9_HEAT"
            };
            addWeapons[] = {
                "launcher_SPG9"
            };
            removeMagazines[] = {};
            removeWeapons[] = {
                "launcher_SPG9"
            };
            turret[] = { 0 };
        };
    }; // "Offroad (AT)"

    class B_LSV_01_AT_F {
        capValue = 1;
        cost = 750;
        loadable[] = {0, -1.3, 0.95};
        offset[] = {0, 5, 0};
        rearm = 180;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "1Rnd_GAT_missiles",
                "1Rnd_GAT_missiles",
                "1Rnd_GAT_missiles",
                "1Rnd_GAT_missiles"
            };
            addWeapons[] = {
                "missiles_titan_static"
            };
            removeMagazines[] = {};
            removeWeapons[] = {
                "missiles_titan_static"
            };
            turret[] = { 0 };
        };
    }; // "Prowler (AT)"

    class B_MRAP_01_hmg_F {
        aps = 1;
        capValue = 2;
        cost = 900;
        loadable[] = {0, -0.8, 1.8};
        rearm = 120;
    }; // "Hunter HMG"

    class B_MRAP_01_gmg_F {
        aps = 1;
        capValue = 2;
        cost = 950;
        loadable[] = {0, -0.8, 1.8};
        rearm = 120;
    }; // "Hunter GMG"

    class B_Truck_01_ammo_F {
        capValue = 1;
        cost = 1000;
        hasRearm = 1;
    }; // "HEMTT Ammo"

    class B_Truck_01_fuel_F {
        capValue = 1;
        cost = 1000;
        hasRefuel = 1;
    }; // "HEMTT Fuel"

    class B_Truck_01_Repair_F {
        capValue = 1;
        cost = 1000;
        hasRepair = 1;
    }; // "HEMTT Repair"

    // class B_LSV_01_AT_UP_F {
    //     capValue = 1;
    //     cost = 1100;
    //     description = "Prowler (AT UP) is a variant of the Prowler AT.";
    //     name = "Prowler (AT UP)";
    //     offset[] = {0, 5, 0};
    //     rearm = 200;
    //     spawn = "B_LSV_01_AT_F";
    //     variant = 1;

    //     class Gunner: WLTurretDefaults {
    //         addMagazines[] = {
    //             "2Rnd_127mm_Firefist_missiles",
    //             "2Rnd_127mm_Firefist_missiles",
    //             "2Rnd_127mm_Firefist_missiles",
    //             "2Rnd_127mm_Firefist_missiles",
    //             "2Rnd_127mm_Firefist_missiles"
    //         };
    //         addWeapons[] = {
    //             "missiles_Firefist"
    //         };
    //         reloadOverride = 6;
    //         removeMagazines[] = {
    //             "1Rnd_GAT_missiles"
    //         };
    //         removeWeapons[] = {
    //             "missiles_titan_static"
    //         };
    //         turret[] = { 0 };
    //     };
    // };

    class B_MRAP_01_afv_F {
        aps = 2;
        capValue = 2;
        cost = 1200;
        loadable[] = {0, -0.8, 1.8};
        name = "Hunter AFV";
        rearm = 120;
        spawn = "B_MRAP_01_gmg_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "450Rnd_127x108_Ball",
                "450Rnd_127x108_Ball",
                "200Rnd_40mm_G_belt"
            };
            addWeapons[] = {
                "HMG_NSVT"
            };
            removeMagazines[] = {
                "96Rnd_40mm_G_belt"
            };
            turret[] = { 0 };
        };
    };

    class B_T_Truck_03_device_F {
        aps = 4;
        capValue = 1;
        cost = 1500;
        name = "Tempest (Device)";
        rearm = 120;
        spawn = "O_T_Truck_03_device_ghex_F";
        textures[] = {
            "#(argb,8,8,3)color(0.80,0.76,0.66,0.15)",
            "#(argb,8,8,3)color(0.2,0.25,0.25,0.15)",
            "#(argb,8,8,3)color(0.2,0.25,0.3,0.15)",
            "#(argb,8,8,3)color(0.6,0.6,0.4,0.15)"
        };
    }; // "Tempest Device"

    class B_MRAP_01_afv_up_F {
        aps = 2;
        capValue = 3;
        cost = 2000;
        disallowMagazines[] = {
            "5Rnd_GAT_missiles",
            "4Rnd_GAA_missiles"
        };
        hasHMD = 1;
        loadable[] = {0, -0.8, 1.8};
        name = "Hunter Apex";
        rearm = 120;
        spawn = "B_MRAP_01_gmg_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "60Rnd_30mm_MP_shells_Tracer_Green",
                "60Rnd_30mm_MP_shells_Tracer_Green",
                "450Rnd_127x108_Ball",
                "450Rnd_127x108_Ball",
                "2Rnd_GAT_missiles",
                "2Rnd_GAT_missiles"
            };
            addWeapons[] = {
                "autocannon_30mm_RCWS",
                "HMG_NSVT",
                "missiles_titan"
            };
            removeMagazines[] = {
                "96Rnd_40mm_G_belt"
            };
            removeWeapons[] = {
                "GMG_40mm"
            };
            turret[] = { 0 };
        };
    };

    // class B_LSV_01_AT_TV_F {
    //     ammoOverrides[] = {
    //         {"M_127mm_Firefist_AT", {"M_Spike", "Spike (TV-Guided)"}}
    //     };
    //     capValue = 1;
    //     cost = 6000;
    //     description = "Prowler (Spike AT) is a variant of the Prowler AT.";
    //     loadable[] = {0, -1.3, 0.95};
    //     name = "Prowler (Spike AT)";
    //     offset[] = {0, 5, 0};
    //     rearm = 240;
    //     spawn = "B_LSV_01_AT_F";
    //     variant = 1;

    //     class Gunner: WLTurretDefaults {
    //         addMagazines[] = {
    //             "2Rnd_127mm_Firefist_missiles",
    //             "2Rnd_127mm_Firefist_missiles"
    //         };
    //         addWeapons[] = {
    //             "missiles_Firefist"
    //         };
    //         removeMagazines[] = {
    //             "1Rnd_GAT_missiles"
    //         };
    //         removeWeapons[] = {
    //             "missiles_titan_static"
    //         };
    //         turret[] = { 0 };
    //     };
    // };
};