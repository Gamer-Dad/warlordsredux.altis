class LightVehicles {
    class O_Quadbike_01_F {
        capValue = 1;
        cost = 20;
        loadable[] = {0, -1, 0.6};
        offset[] = {0, 3, 0};
    }; // "Quad Bike"

    class O_G_Offroad_01_armed_F {
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

    class O_LSV_02_armed_F {
        capValue = 1;
        cost = 200;
        loadable[] = {0, -1.3, 0.8};
        offset[] = {0, 5, 0};
        rearm = 120;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "500Rnd_65x39_Belt_Tracer_Green_Splash",
                "500Rnd_65x39_Belt_Tracer_Green_Splash",
                "500Rnd_65x39_Belt_Tracer_Green_Splash"
            };
            addWeapons[] = {
                "LMG_Minigun_Transport"
            };
            removeMagazines[] = {};
            removeWeapons[] = {
                "LMG_Minigun_Transport"
            };
            turret[] = { 0 };
        };
    }; // "Qilin (Minigun)"

    class O_Truck_03_transport_F {
        capValue = 1;
        cost = 200;
        hasFastTravel = 1;
    }; // "Tempest Transport"

    class O_Truck_03_medical_F {
        capValue = 1;
        cost = 250;
        hasFastTravel = 1;
    }; // "Tempest Medical"

    class O_MRAP_02_F {
        capValue = 1;
        cost = 300;
        loadable[] = {0, -0.8, 1.5};
    }; // "Ifrit"

    class O_Truck_01_flatbed_F {
        capValue = 1;
        cost = 500;
        hasFastTravel = 1;
        name = "HEMTT Flatbed";
        spawn = "B_Truck_01_flatbed_F";
        textures[] = {
            "\a3\soft_f_Exp\truck_01\data\truck_01_ext_01_olive_co.paa",
            "\a3\soft_f_Exp\truck_01\data\truck_01_ext_02_olive_co.paa",
            "\a3\Soft_F_Enoch\Truck_01\Data\truck_01_ammo_pacific_co.paa",
            "\a3\Soft_F_Enoch\Truck_01\Data\Truck_01_cargo_pacific_CO.paa"
        };
    }; // "HEMTT Flatbed"

    class O_G_Offroad_01_AT_F {
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

    class O_LSV_02_AT_F {
        capValue = 1;
        cost = 750;
        loadable[] = {0, -1.3, 0.8};
        offset[] = {0, 5, 0};
        rearm = 180;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "Vorona_HEAT",
                "Vorona_HEAT",
                "Vorona_HEAT",
                "Vorona_HEAT"
            };
            addWeapons[] = {
                "missiles_Vorona"
            };
            removeMagazines[] = {};
            removeWeapons[] = {
                "missiles_Vorona"
            };
            turret[] = { 0 };
        };
    }; // "Qilin (AT)"

    class O_MRAP_02_hmg_F {
        aps = 1;
        capValue = 2;
        cost = 900;
        loadable[] = {0, -0.8, 1.8};
        rearm = 120;
    }; // "Ifrit HMG"

    class O_MRAP_02_gmg_F {
        aps = 1;
        capValue = 2;
        cost = 950;
        loadable[] = {0, -0.8, 1.8};
        rearm = 120;
    }; // "Ifrit GMG"

    class O_Truck_03_ammo_F {
        capValue = 1;
        cost = 1000;
    }; // "Tempest Ammo"

    class O_Truck_03_Fuel_F {
        capValue = 1;
        cost = 1000;
    }; // "Tempest Fuel"

    class O_Truck_03_Repair_F {
        capValue = 1;
        cost = 1000;
    }; // "Tempest Repair"

    // class O_LSV_02_AT_M_F {
    //     capValue = 1;
    //     cost = 1100;
    //     description = "Qilin (AT-M) is a variant of the Qilin armed with a Firefist AT missile launcher.";
    //     name = "Qilin (AT-M)";
    //     offset[] = {0, 5, 0};
    //     rearm = 200;
    //     requirements[] = {};
    //     spawn = "O_LSV_02_AT_F";
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
    //             "Vorona_HEAT"
    //         };
    //         removeWeapons[] = {
    //             "missiles_Vorona"
    //         };
    //         turret[] = { 0 };
    //     };
    // };

    // class O_MRAP_02_mini_F {
    //     aps = 2;
    //     capValue = 1;
    //     cost = 1100;
    //     description = "Ifrit is a variant of the Ifrit armed with a Minigun.";
    //     name = "Ifrit Minigun";
    //     rearm = 300;
    //     requirements[] = {};
    //     spawn = "O_MRAP_02_hmg_F";
    //     variant = 1;

    //     class Gunner: WLTurretDefaults {
    //         addMagazines[] = {
    //             "2000Rnd_65x39_Belt_Tracer_Red",
    //             "2000Rnd_65x39_Belt_Tracer_Red",
    //             "2000Rnd_65x39_Belt_Tracer_Red"
    //         };
    //         addWeapons[] = {
    //             "LMG_Minigun"
    //         };
    //         removeMagazines[] = {
    //             "200Rnd_127x99_mag_Tracer_Green"
    //         };
    //         removeWeapons[] = {
    //             "HMG_127"
    //         };
    //         turret[] = { 0 };
    //     };
    // };

    // class O_MRAP_02_gmg_m_F {
    //     aps = 2;
    //     capValue = 2;
    //     cost = 1500;
    //     description = "Ifrit-M is a variant of the Ifrit armed with a 20mm autocannon.";
    //     name = "Ifrit-M Autocannon";
    //     rearm = 300;
    //     requirements[] = {};
    //     spawn = "O_MRAP_02_gmg_F";
    //     variant = 1;

    //     class Gunner: WLTurretDefaults {
    //         addMagazines[] = {
    //             "60Rnd_20mm_HE_shells",
    //             "60Rnd_20mm_HE_shells",
    //             "60Rnd_20mm_HE_shells",
    //             "60Rnd_20mm_AP_shells",
    //             "60Rnd_20mm_AP_shells",
    //             "200Rnd_338_Mag",
    //             "200Rnd_338_Mag"
    //         };
    //         addWeapons[] = {
    //             "cannon_20mm",
    //             "MMG_02_coax"
    //         };
    //         removeMagazines[] = {
    //             "96Rnd_40mm_G_belt"
    //         };
    //         removeWeapons[] = {
    //             "GMG_40mm"
    //         };
    //         turret[] = { 0 };
    //     };
    // };

    class O_Truck_03_device_F {
        aps = 4;
        capValue = 1;
        cost = 1500;
        rearm = 120;
    }; // "Tempest Device"
};