class LightVehicles {
    class B_Quadbike_01_F {
        capValue = 1;
        cost = 20;
        loadable[] = {0, -1, 0.6};
        offset[] = {0, 3, 0};
        requirements[] = {};
    }; // "Quad Bike"

    class B_G_Offroad_01_armed_F {
        capValue = 1;
        cost = 150;
        description = "The 4x4 pickup by Generic Motors is a perfect choice for farmers and hunters.<br /><br />Basic Controls:<br />Press zoomIn and zoomOut to zoom in or out.<br />Press ListLeftVehicleDisplay and ListRightVehicleDisplay to adjust system panels for the left or right side of your screen.<br />Press NextModeLeftVehicleDisplay or NextModeRightVehicleDisplay to adjust modes (if available) for system panels.";
        loadable[] = {0, -1.7, 1.3};
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

    class B_LSV_01_armed_F {
        capValue = 1;
        cost = 200;
        description = "The Prowler is a light strike vehicle (LSV) which means it is agile and lightly armored.<br /><br />Basic Controls:<br />Press zoomIn and zoomOut to zoom in or out.<br />Press gunElevAuto to measure distance and automatically adjust gun elevation (Fire Control System).<br />Press ListLeftVehicleDisplay and ListRightVehicleDisplay to adjust system panels for the left or right side of your screen.<br />Press NextModeLeftVehicleDisplay or NextModeRightVehicleDisplay to adjust modes (if available) for system panels.";
        loadable[] = {0, -1.3, 1.25};
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

    class B_Truck_01_transport_F {
        capValue = 1;
        cost = 200;
        requirements[] = {};
    }; // "HEMTT Transport"

    class B_Truck_01_medical_F {
        capValue = 1;
        cost = 250;
        description = "The HEMTT Medical can be used fully heal infantry and can be teleported to.<br /><br />How To Use:<br /> - Place the HEMTT Medical anywhere or drive it to the desired location.<br /> - Press showMap to open the map.<br /> - Find the container on the map and left click on it, then press ""Fast Travel"" to teleport to the container.";
        rearm = 120;
        requirements[] = {};
    }; // "HEMMT Medical"

    class B_MRAP_01_F {
        capValue = 1;
        cost = 300;
        loadable[] = {0, -0.8, 1.25};
        requirements[] = {};
    }; // "Hunter"

    class B_Truck_01_flatbed_F {
        capValue = 1;
        cost = 500;
        description = "The HEMTT Flatbed can be used to transport various types of cargo anywhere on the map.<br /><br />How To Use:<br /> - Place your cargo next to the HEMTT Flatbed.<br /> - Look at the HEMTT Flatbed and use your scroll wheel to select the ""Load Deployable"" option.<br /> - To unload, look at your HEMTT Flatbed and select the ""Unload Deployable"" option.";
        requirements[] = {};
    }; // "HEMTT Flatbed"

    class B_G_Offroad_01_AT_F {
        capValue = 1;
        cost = 500;
        description = "The 4x4 pickup by Generic Motors is a perfect choice for farmers and hunters.<br /><br />Basic Controls:<br />Press zoomIn and zoomOut to zoom in or out.<br />Press ListLeftVehicleDisplay and ListRightVehicleDisplay to adjust system panels for the left or right side of your screen.<br />Press NextModeLeftVehicleDisplay or NextModeRightVehicleDisplay to adjust modes (if available) for system panels.";
        loadable[] = {0, -1.7, 0.7};
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
        description = "The Prowler is a light strike vehicle (LSV) which means it is agile and lightly armored.<br /><br />Basic Controls:<br />Press zoomIn and zoomOut to zoom in or out.<br />Press gunElevAuto to measure distance.<br />Press lockTarget to lock onto target.<br />Press ListLeftVehicleDisplay and ListRightVehicleDisplay to adjust system panels for the left or right side of your screen.<br />Press NextModeLeftVehicleDisplay or NextModeRightVehicleDisplay to adjust modes (if available) for system panels.";
        loadable[] = {0, -1.3, 0.95};
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
        description = "The Hunter is a Mine-Resistant Ambush Protected (MRAP) Vehicle manufactured by the US arms factories to provide troops with enhanced protection.<br /><br />Basic Controls:<br />Press zoomIn and zoomOut to zoom in or out.<br />Press gunElevAuto to measure distance and automatically adjust gun elevation (Fire Control System).<br />Press ListLeftVehicleDisplay and ListRightVehicleDisplay to adjust system panels for the left or right side of your screen.<br />Press NextModeLeftVehicleDisplay or NextModeRightVehicleDisplay to adjust modes (if available) for system panels.";
        loadable[] = {0, -0.8, 1.8};
        rearm = 300;
        requirements[] = {};
    }; // "Hunter HMG"

    class B_MRAP_01_gmg_F {
        aps = 1;
        capValue = 2;
        cost = 950;
        description = "The Hunter is a Mine-Resistant Ambush Protected (MRAP) Vehicle manufactured by the US arms factories to provide troops with enhanced protection.<br /><br />Basic Controls:<br />Press zoomIn and zoomOut to zoom in or out.<br />Press gunElevAuto to measure distance and automatically adjust gun elevation (Fire Control System).<br />Press ListLeftVehicleDisplay and ListRightVehicleDisplay to adjust system panels for the left or right side of your screen.<br />Press NextModeLeftVehicleDisplay or NextModeRightVehicleDisplay to adjust modes (if available) for system panels.";
        loadable[] = {0, -0.8, 1.8};
        rearm = 300;
        requirements[] = {};
    }; // "Hunter GMG"

    class B_Truck_01_ammo_F {
        capValue = 1;
        cost = 1000;
        description = "The HEMTT Ammo can be used to rearm and switch out ammunition for various types of vehicles.<br /><br />How To Use:<br /> - Place the HEMTT Ammo near your vehicle.<br /> - Look towards your vehicle and use your scroll wheel to select the ""Modify/Rearm"" option.<br /> - Modify the vehicles loadout as you see fit and select ""Apply"" to save your loadout and ""Rearm"" to restock it.<br /> - Reminder: After rearming your vehicle you can only rearm it again after a certain amount of time has elapsed, different vehicles have different rearm timers, only make changes to your vehicle once the rearm timer is done.";
        requirements[] = {};
    }; // "HEMTT Ammo"

    class B_Truck_01_fuel_F {
        capValue = 1;
        cost = 1000;
        description = "The HEMTT Fuel can be used to refuel various types of vehicles.<br /><br />How To Use:<br /> - Drive the HEMTT Fuel near your vehicle.<br /> - Look towards your vehicle and use your scroll wheel to select the ""Refuel"" option.";
        requirements[] = {};
    }; // "HEMTT Fuel"

    class B_Truck_01_Repair_F {
        capValue = 1;
        cost = 1000;
        description = "The HEMTT Repair can be used to fully repair damaged vehicles.<br /><br />How To Use:<br /> - Drive the HEMTT Repair near your vehicle.<br /> - Look towards your vehicle and use your scroll wheel to select the ""Repair"" option.<br /> - Reminder: After repairing your vehicle you can only repair it again after a certain amount of time has elapsed, different vehicles have different repair timers, only make changes to your vehicle once the repair timer is done.";
        requirements[] = {};
    }; // "HEMTT Repair"

    // class B_LSV_01_AT_UP_F {
    //     capValue = 1;
    //     cost = 1100;
    //     description = "Prowler (AT UP) is a variant of the Prowler AT.";
    //     name = "Prowler (AT UP)";
    //     offset[] = {0, 5, 0};
    //     rearm = 200;
    //     requirements[] = {};
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

    // class B_MRAP_01_gmg_up_F {
    //     aps = 2;
    //     capValue = 2;
    //     cost = 1500;
    //     description = "Hunter UP is a variant of the Hunter armed with a 20mm autocannon.";
    //     name = "Hunter UP Autocannon";
    //     rearm = 300;
    //     requirements[] = {};
    //     spawn = "B_MRAP_01_gmg_F";
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

    class B_T_Truck_03_device_F {
        aps = 4;
        capValue = 1;
        cost = 1500;
        description = "The Tempest Device can be used to intercept nearby missiles and jam enemy drones.<br /><br />How To Use:<br /> - Place the Tempest Device anywhere or drive it to the desired location.<br /> - Look at the Tempest Device and select the ""EW Network"" option to enable/disable the drone jammer and select the ""Dazzler"" option to enable/disable the intercepting of any nearby enemy rockets and missiles.";
        name = "Tempest (Device)";
        rearm = 120;
        requirements[] = {};
        spawn = "O_T_Truck_03_device_ghex_F";
        textures[] = {
            "#(argb,8,8,3)color(0.80,0.76,0.66,0.15)",
            "#(argb,8,8,3)color(0.2,0.25,0.25,0.15)",
            "#(argb,8,8,3)color(0.2,0.25,0.3,0.15)",
            "#(argb,8,8,3)color(0.6,0.6,0.4,0.15)"
        };
    }; // "Tempest Device"

    class B_LSV_01_AT_TV_F {
        ammoOverrides[] = {
            {"M_127mm_Firefist_AT", {"M_Spike", "Spike (TV-Guided)"}}
        };
        capValue = 1;
        cost = 6000;
        description = "Prowler (Spike AT) is a variant of the Prowler AT with TV Guided Missiles.<br /><br />Basic Controls:<br />Press zoomIn and zoomOut to zoom in or out.<br />Press gunElevAuto to measure distance.<br />Press ListLeftVehicleDisplay and ListRightVehicleDisplay to adjust system panels for the left or right side of your screen.<br />Press NextModeLeftVehicleDisplay or NextModeRightVehicleDisplay to adjust modes (if available) for system panels.";
        loadable[] = {0, -1.3, 0.95};
        name = "Prowler (Spike AT)";
        offset[] = {0, 5, 0};
        rearm = 200;
        requirements[] = {};
        spawn = "B_LSV_01_AT_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "2Rnd_127mm_Firefist_missiles",
                "2Rnd_127mm_Firefist_missiles"
            };
            addWeapons[] = {
                "missiles_Firefist"
            };
            removeMagazines[] = {
                "1Rnd_GAT_missiles"
            };
            removeWeapons[] = {
                "missiles_titan_static"
            };
            turret[] = { 0 };
        };
    };
};