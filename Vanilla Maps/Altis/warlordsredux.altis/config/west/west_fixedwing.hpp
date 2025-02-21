class FixedWing {
    class B_Plane_Civil_01_F {
        cost = 800;
        description = "Caesar BTT is a light unarmed aircraft.";
        killReward = 200;
        name = "Caesar BTT";
        requirements[] = {"A"};
        spawn = "C_Plane_Civil_01_F";
    };

    // class B_Plane_Caesar_hmggmg_01_F {
    //     cost = 1500;
    //     description = "Caesar BTT (HMG/GMG) is a variant of the Caesar BTT armed with a HMG and GMG.";
    //     killReward = 300;
    //     name = "Caesar BTT (HMG/GMG)";
    //     rearm = 300;
    //     requirements[] = {"A"};
    //     spawn = "C_Plane_Civil_01_F";
    //     variant = 1;
    //
    //     class Pilot: WLTurretDefaults {
    //         turret[] = { -1 };
    //         removeMagazines[] = {};
    //         removeWeapons[] = {};
    //         addMagazines[] = {
    //             "500Rnd_127x99_mag_Tracer_Yellow",
    //             "500Rnd_127x99_mag_Tracer_Yellow",
    //             "96Rnd_40mm_G_belt",
    //             "96Rnd_40mm_G_belt",
    //             "240Rnd_CMFlare_Chaff_Magazine"
    //         };
    //         addWeapons[] = {
    //             "HMG_127",
    //             "GMG_40mm",
    //             "CMFlareLauncher"
    //         };
    //     };
    // };

    class B_Plane_Caesar_rocket_01_F {
        cost = 1800;
        description = "Caesar BTT (Rocket) is a variant of the Caesar BTT armed with rockets.";
        killReward = 300;
        name = "Caesar BTT (Rocket)";
        rearm = 400;
        requirements[] = {"A"};
        spawn = "C_Plane_Civil_01_F";
        variant = 1;

        class Pilot: WLTurretDefaults {
            turret[] = { -1 };
            removeMagazines[] = {};
            removeWeapons[] = {};
            addMagazines[] = {
                "14Rnd_80mm_rockets",
                "14Rnd_80mm_rockets",
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {
                "rockets_Skyfire",
                "CMFlareLauncher"
            };
        };
    };

    // class B_Plane_Caesar_bomb_01_F {
    //     cost = 2000;
    //     description = "Caesar BTT (Bomb) is a variant of the Caesar BTT armed with a pair of Mk82 bombs.";
    //     killReward = 300;
    //     name = "Caesar BTT (Bomb)";
    //     rearm = 400;
    //     requirements[] = {"A"};
    //     spawn = "C_Plane_Civil_01_F";
    //     variant = 1;
    //
    //     class Pilot: WLTurretDefaults {
    //         turret[] = { -1 };
    //         removeMagazines[] = {};
    //         removeWeapons[] = {};
    //         addMagazines[] = {
    //             "2Rnd_Mk82",
    //             "240Rnd_CMFlare_Chaff_Magazine"
    //         };
    //         addWeapons[] = {
    //             "Mk82BombLauncher",
    //             "CMFlareLauncher"
    //         };
    //     };
    // };

    class B_T_VTOL_01_infantry_F {
        cost = 2000;
        killReward = 300;
        requirements[] = {"A"};
    }; // "V-44 X Blackfish (Inf)"

    class B_T_VTOL_01_vehicle_F {
        cost = 2000;
        killReward = 300;
        requirements[] = {"A"};
    }; // "V-44 X Blackfish (Vic)"

    class B_T_VTOL_01_recon_F {
        cost = 3800;
        description = "V-44 X Blackfish (AWACS) is a variant of the V-44 X Blackfish with a powerful air radar.";
        hasAWACS = 1;
        hasHMD = 1;
        killReward = 300;
        name = "V-44 X Blackfish (AWACS)";
        requirements[] = {"A"};
        spawn = "B_T_VTOL_01_infantry_F";

        class Pilot: WLTurretDefaults {
            turret[] = { -1 };
            removeMagazines[] = {};
            removeWeapons[] = {
                "CMFlareLauncher_Triples"
            };
            addMagazines[] = {
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {
                "CMFlareLauncher_Singles"
            };
        };
    };

    class B_T_VTOL_01_armed_F {
        cost = 8000;
        killReward = 350;
        rearm = 500;
        requirements[] = {"A"};
    }; // "V-44 X Blackfish (Armed)"

    class B_Plane_CAS_01_dynamicLoadout_F {
        cost = 15000;
        killReward = 800;
        rearm = 900;
        requirements[] = {"A"};

        class Pilot: WLTurretDefaults {
            turret[] = { -1 };
            removeMagazines[] = {
                "120Rnd_CMFlare_Chaff_Magazine"
            };
            removeWeapons[] = {};
            addMagazines[] = {
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {};
        };
    }; // "A-164 Wipeout (CAS)"

    class B_Plane_Fighter_04_F {
        allowPylonMagazines[] = {
            "PylonRack_3Rnd_LG_scalpel",
            "PylonRack_Missile_AMRAAM_C_x2"
        };
        cost = 23000;
        description = "A-149 Gryphon is a light multirole aircraft.";
        killReward = 600;
        name = "A-149 Gryphon";
        rearm = 900;
        requirements[] = {"A"};
        spawn = "I_Plane_Fighter_04_F";
        textures[] = {
            "a3\air_f_jets\plane_fighter_04\data\Fighter_04_fuselage_01_gray_co.paa",
            "a3\air_f_jets\plane_fighter_04\data\Fighter_04_fuselage_02_gray_co.paa",
            "a3\air_f_jets\plane_fighter_04\data\fighter_04_misc_01_co.paa",
            "a3\air_f_jets\plane_fighter_04\data\Numbers\Fighter_04_number_04_ca.paa",
            "a3\air_f_jets\plane_fighter_04\data\Numbers\Fighter_04_number_04_ca.paa",
            "a3\air_f_jets\plane_fighter_04\data\Numbers\Fighter_04_number_08_ca.paa"
        };
    }; // "A-149 Gryphon"

    class B_Plane_Fighter_01_F {
        allowPylonMagazines[] = {
            "PylonRack_Missile_HARM_x1"
        };
        cost = 30000;
        killReward = 1000;
        rearm = 900;
        requirements[] = {"A"};
    }; // "F/A-181 Black Wasp II"

    class B_Plane_Fighter_01_Stealth_F {
        allowPylonMagazines[] = {
            "PylonRack_Missile_HARM_x1"
        };
        cost = 35000;
        killReward = 1000;
        rearm = 900;
        requirements[] = {"A"};
    }; // "F/A-181 Black Wasp II (Stealth)"
};