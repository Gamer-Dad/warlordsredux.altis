class LightVehicles {
    class B_Quadbike_01_F {
        capValue = 1;
        cost = 20;
        killReward = 20;
        offset[] = {0, 3, 0};
        requirements[] = {};
    }; // "Quad Bike"

    class B_G_Offroad_01_armed_F {
        capValue = 1;
        cost = 150;
        killReward = 150;
        offset[] = {0, 5, 0};
        rearm = 120;
        requirements[] = {};

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

    class B_Truck_01_transport_F {
        capValue = 1;
        cost = 200;
        killReward = 80;
        requirements[] = {};
    }; // "HEMTT Transport"

    class B_LSV_01_armed_F {
        capValue = 1;
        cost = 200;
        killReward = 150;
        offset[] = {0, 5, 0};
        rearm = 120;
        requirements[] = {};

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

    class B_MRAP_01_F {
        capValue = 1;
        cost = 300;
        killReward = 70;
        requirements[] = {};
    }; // "Hunter"

    class B_Truck_01_flatbed_F {
        capValue = 1;
        cost = 500;
        killReward = 80;
        requirements[] = {};
    }; // "HEMTT Flatbed"

    class B_G_Offroad_01_AT_F {
        capValue = 1;
        cost = 500;
        killReward = 180;
        offset[] = {0, 5, 0};
        rearm = 180;
        requirements[] = {};

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
        killReward = 200;
        offset[] = {0, 5, 0};
        rearm = 200;
        requirements[] = {};

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
        killReward = 250;
        rearm = 300;
        requirements[] = {};
    }; // "Hunter HMG"

    class B_Truck_01_ammo_F {
        capValue = 1;
        cost = 1000;
        killReward = 80;
        requirements[] = {};
    }; // "HEMTT Ammo"

    class B_Truck_01_fuel_F {
        capValue = 1;
        cost = 1000;
        killReward = 80;
        requirements[] = {};
    }; // "HEMTT Fuel"

    class B_Truck_01_Repair_F {
        capValue = 1;
        cost = 1000;
        killReward = 80;
        requirements[] = {};
    }; // "HEMTT Repair"

    class B_LSV_01_AT_UP_F {
        capValue = 1;
        cost = 1100;
        description = "Prowler (AT UP) is a variant of the Prowler AT.";
        killReward = 250;
        name = "Prowler (AT UP)";
        offset[] = {0, 5, 0};
        rearm = 200;
        requirements[] = {};
        spawn = "B_LSV_01_AT_F";
        variant = 1;

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
            reloadOverride = 6;
            removeMagazines[] = {
                "1Rnd_GAT_missiles"
            };
            removeWeapons[] = {
                "missiles_titan_static"
            };
            turret[] = { 0 };
        };
    };

    class B_MRAP_01_gmg_F {
        aps = 1;
        capValue = 2;
        cost = 1250;
        killReward = 250;
        rearm = 300;
        requirements[] = {};
    }; // "Hunter GMG"

    class B_MRAP_01_gmg_up_F {
        aps = 2;
        capValue = 2;
        cost = 1500;
        description = "Hunter UP is a variant of the Hunter armed with a 20mm autocannon.";
        killReward = 300;
        name = "Hunter UP Autocannon";
        rearm = 300;
        requirements[] = {};
        spawn = "B_MRAP_01_gmg_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "60Rnd_20mm_HE_shells",
                "60Rnd_20mm_HE_shells",
                "60Rnd_20mm_HE_shells",
                "60Rnd_20mm_AP_shells",
                "60Rnd_20mm_AP_shells",
                "200Rnd_338_Mag",
                "200Rnd_338_Mag"
            };
            addWeapons[] = {
                "cannon_20mm",
                "MMG_02_coax"
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

    class B_T_Truck_03_device_F {
        aps = 4;
        capValue = 1;
        cost = 1500;
        killReward = 200;
        name = "Tempest (Device)";
        requirements[] = {};
        spawn = "O_T_Truck_03_device_ghex_F";
        textures[] = {
            "#(argb,8,8,3)color(0.80,0.76,0.66,0.15)",
            "#(argb,8,8,3)color(0.2,0.25,0.25,0.15)",
            "#(argb,8,8,3)color(0.2,0.25,0.3,0.15)",
            "#(argb,8,8,3)color(0.6,0.6,0.4,0.15)"
        };
    }; // "Tempest Device"
};