class RotaryWing {
    class B_Heli_Light_01_F {
        cost = 300;
        killReward = 100;
        requirements[] = {"H"};
    }; // "MH-9 Hummingbird"

    class B_Heli_Transport_01_F {
        cost = 800;
        killReward = 100;
        offset[] = {0, 11, 0};
        rearm = 300;
        requirements[] = {"H"};
    }; // "UH-80 Ghost Hawk"

    class B_Heli_Transport_03_F {
        cost = 1000;
        killReward = 100;
        offset[] = {0, 10, 0};
        rearm = 300;
        requirements[] = {"H"};
    }; // "CH-67 Huron"

    class B_Heli_Transport_01_UP_F {
        cost = 2000;
        description = "UH-80 Ghost Hawk UP is a variant of the UH-80 Ghost Hawk armed with 20mm autocannons.";
        hasHMD = 1;
        killReward = 200;
        name = "UH-80 Ghost Hawk UP";
        offset[] = {0, 11, 0};
        rearm = 300;
        requirements[] = {"H"};
        spawn = "B_Heli_Transport_01_F";
        variant = 1;

        class LeftGunner: WLTurretDefaults {
            addMagazines[] = {
                "250Rnd_30mm_HE_shells_Tracer_Green",
                "250Rnd_30mm_HE_shells_Tracer_Green",
                "250Rnd_30mm_APDS_shells_Tracer_Green",
                "250Rnd_30mm_APDS_shells_Tracer_Green"
            };
            addWeapons[] = {
                "gatling_30mm"
            };
            removeMagazines[] = {
                "2000Rnd_65x39_Belt_Tracer_Red"
            };
            removeWeapons[] = {
                "LMG_Minigun_Transport"
            };
            turret[] = { 1 };
        };

        class RightGunner: WLTurretDefaults {
            addMagazines[] = {
                "250Rnd_30mm_HE_shells_Tracer_Green",
                "250Rnd_30mm_HE_shells_Tracer_Green",
                "250Rnd_30mm_APDS_shells_Tracer_Green",
                "250Rnd_30mm_APDS_shells_Tracer_Green"
            };
            addWeapons[] = {
                "gatling_30mm"
            };
            removeMagazines[] = {
                "2000Rnd_65x39_Belt_Tracer_Red"
            };
            removeWeapons[] = {
                "LMG_Minigun_Transport2"
            };
            turret[] = { 2 };
        };
    };

    class B_Heli_Light_01_dynamicLoadout_F {
        cost = 2500;
        killReward = 200;
        rearm = 300;
        requirements[] = {"H"};
    }; // "AH-9 Pawnee"

    class B_Heli_Light_01_hmd_F {
        allowPylonMagazines[] = {
            "PylonRack_3Rnd_LG_scalpel"
        };
        cost = 4000;
        description = "AH-9 Pawnee Block II is a variant of the AH-9 Pawnee with advanced avionics.";
        hasHMD = 1;
        killReward = 300;
        name = "AH-9 Pawnee Block II";
        rearm = 300;
        requirements[] = {"H"};
        spawn = "B_Heli_Light_01_dynamicLoadout_F";
        textures[] = {
            "A3\air_f\Heli_Light_01\Data\Skins\Heli_Light_01_ext_digital_co.paa"
        };
        variant = 1;

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "168Rnd_CMFlare_Chaff_Magazine",
                "PylonWeapon_300Rnd_20mm_shells",
                "PylonWeapon_300Rnd_20mm_shells"
            };
            addWeapons[] = {
                "CMFlareLauncher",
                "Twin_Cannon_20mm_gunpod"
            };
            removeMagazines[] = {
                "5000Rnd_762x51_Belt"
            };
            removeWeapons[] = {
                "M134_minigun"
            };
            turret[] = { -1 };
        };
    };

    class B_Heli_light_03_dynamicLoadout_F {
        allowPylonMagazines[] = {
            "PylonRack_Missile_HARM_x1",
            "PylonRack_19Rnd_Rocket_Skyfire"
        };
        cost = 5000;
        description = "WY-55 Hellcat is a light attack helicopter.";
        hasHMD = 1;
        killReward = 300;
        name = "WY-55 Hellcat";
        offset[] = {0, 9, 0};
        rearm = 300;
        requirements[] = {"H"};
        spawn = "I_Heli_light_03_dynamicLoadout_F";
        textures[] = {
            "\A3\Air_F_Enoch\Heli_Light_03\data\Heli_Light_03_base_EAF_CO.paa",
            "\a3\Supplies_F_Enoch\Ammoboxes\Data\AmmoBox_EAF_CO.paa",
            "\a3\Supplies_F_Enoch\Ammoboxes\Data\AmmoBox_signs_EAF_CA.paa"
        };
    };

    class B_Heli_Attack_01_dynamicLoadout_F {
        allowPylonMagazines[] = {
            "PylonRack_Missile_HARM_x1"
        };
        cost = 13000;
        hasHMD = 1;
        killReward = 550;
        offset[] = {0, 10, 0};
        rearm = 700;
        requirements[] = {"H"};

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "192Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {
                "CMFlareLauncher_Singles"
            };
            removeMagazines[] = {};
            removeWeapons[] = {
                "CMFlareLauncher"
            };
            turret[] = { -1 };
        };
    }; // "AH-99 Blackfoot"

    // class B_Heli_Attack_01_sead_F {
    //     allowPylonMagazines[] = {
    //         "PylonMissile_1Rnd_AAA_missiles",
    //         "PylonMissile_1Rnd_LG_scalpel",
    //         "PylonRack_12Rnd_PG_missiles",
    //         "PylonRack_12Rnd_missiles"
    //     };
    //     cost = 14000;
    //     description = "AH-99 Blackfoot (SEAD)";
    //     hasHMD = 1;
    //     killReward = 550;
    //     offset[] = {0, 10, 0};
    //     rearm = 700;
    //     requirements[] = {"H"};
    //     spawn = "B_Heli_Attack_01_dynamicLoadout_F";
    //     variant = 1;
    //
    //     class Pilot: WLTurretDefaults {
    //         addMagazines[] = {
    //             "192Rnd_CMFlare_Chaff_Magazine",
    //             "magazine_Missile_HARM_x1",
    //             "magazine_Missile_HARM_x1",
    //             "magazine_Missile_HARM_x1",
    //             "magazine_Missile_HARM_x1",
    //             "magazine_Missile_HARM_x1",
    //             "magazine_Missile_HARM_x1",
    //             "magazine_Missile_HARM_x1",
    //             "magazine_Missile_HARM_x1",
    //             "magazine_Missile_HARM_x1",
    //             "magazine_Missile_HARM_x1",
    //             "magazine_Missile_HARM_x1",
    //             "magazine_Missile_HARM_x1"
    //         };
    //         addWeapons[] = {
    //             "CMFlareLauncher_Singles",
    //             "weapon_HARMLauncher"
    //         };
    //         removeMagazines[] = {};
    //         removeWeapons[] = {
    //             "CMFlareLauncher"
    //         };
    //         turret[] = { -1 };
    //     };
    // };
};