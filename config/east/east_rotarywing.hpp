class RotaryWing {
    class O_Heli_Transport_04_covered_F {
        cost = 400;
        killReward = 100;
        offset[] = {0, 10, 0};
        requirements[] = {"H"};
    }; // "Mi-290 Taru (Transport)"

    class O_Heli_Transport_04_F {
        cost = 500;
        killReward = 100;
        offset[] = {0, 10, 0};
        requirements[] = {"H"};
    }; // "Mi-290 Taru"

    class O_Heli_Transport_04_medevac_F {
        cost = 500;
        killReward = 100;
        offset[] = {0, 10, 0};
        requirements[] = {"H"};
    }; // "Mi-290 Taru (Medical)"

    class O_Heli_Light_02_unarmed_F {
        cost = 500;
        hasHMD = 1;
        killReward = 125;
        offset[] = {0, 10, 0};
        requirements[] = {"H"};
    }; // "PO-30 Orca (Unarmed)"

    // class O_Heli_Transport_04_recon_F {
    //     cost = 2500;
    //     description = "Mi-290 Taru (Recon) is a variant of the Mi-290 Taru with a powerful scanner.";
    //     hasHMD = 1;
    //     hasScanner = 1;
    //     killReward = 125;
    //     name = "Mi-290 Taru (Recon)";
    //     offset[] = {0, 10, 0};
    //     requirements[] = {"H"};
    //     spawn = "O_Heli_Transport_04_box_F";
    //
    //     class Pilot: WLTurretDefaults {
    //         addMagazines[] = {
    //             "240Rnd_CMFlare_Chaff_Magazine"
    //         };
    //         addWeapons[] = {
    //             "CMFlareLauncher_Singles"
    //         };
    //         removeMagazines[] = {
    //             "168Rnd_CMFlare_Chaff_Magazine"
    //         };
    //         removeWeapons[] = {
    //             "CMFlareLauncher"
    //         };
    //         turret[] = { -1 };
    //     };
    // };

    // class O_Heli_Transport_02_AWACS_F {
    //     cost = 3800;
    //     description = "CH-49 Mohawk (AWACS) is a variant of the CH-49 Mohawk with a powerful air radar.";
    //     hasAWACS = 1;
    //     hasHMD = 1;
    //     killReward = 300;
    //     name = "CH-49 Mohawk (AWACS)";
    //     offset[] = {0, 10, 0};
    //     requirements[] = {"H"};
    //     spawn = "I_Heli_Transport_02_F";
    //     textures[] = {
    //         "A3\Air_F_Beta\Heli_Transport_02\Data\Skins\Heli_Transport_02_1_DAHOMAN_CO.paa",
    //         "A3\Air_F_Beta\Heli_Transport_02\Data\Skins\Heli_Transport_02_2_DAHOMAN_CO.paa",
    //         "A3\Air_F_Beta\Heli_Transport_02\Data\Skins\Heli_Transport_02_3_DAHOMAN_CO.paa",
    //         "A3\Air_F_Beta\Heli_Transport_02\Data\Heli_Transport_02_int_02_CO.paa"
    //     };
    // };

    class O_Heli_Light_02_dynamicLoadout_F {
        cost = 4000;
        killReward = 300;
        offset[] = {0, 10, 0};
        rearm = 300;
        requirements[] = {"H"};
    }; // "PO-30 Orca"

    class O_Heli_Attack_02_dynamicLoadout_F {
        allowPylonMagazines[] = {
            "PylonRack_12Rnd_PG_missiles",
            "PylonMissile_Missile_KH58_INT_x1"
        };
        cost = 10000;
        hasHMD = 1;
        killReward = 550;
        offset[] = {0, 11, 0};
        rearm = 700;
        requirements[] = {"H"};

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {
                "CMFlareLauncher_Singles"
            };
            removeMagazines[] = { };
            removeWeapons[] = {
                "CMFlareLauncher"
            };
            turret[] = { -1 };
        };
    }; // "Mi-48 Kajman"

    class O_Heli_Attack_02_sead_F: O_Heli_Attack_02_dynamicLoadout_F {
        cost = 15000;
        description = "Mi-55 Kajman-M is a variant of the Mi-48 Kajman with a powerful device jammer. Gunner seat must be player-operated.";
        killReward = 650;
        name = "Mi-55 Kajman-M";
        spawn = "O_Heli_Attack_02_dynamicLoadout_F";
        variant = 1;

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {
                "CMFlareLauncher_Singles"
            };
            removeMagazines[] = { };
            removeWeapons[] = {
                "CMFlareLauncher"
            };
            turret[] = { -1 };
        };

        class Gunner: WLTurretDefaults {
            addMagazines[] = {};
            addWeapons[] = {};
            deviceJammer = 1;
            removeMagazines[] = {
                "250Rnd_30mm_APDS_shells_Tracer_Green",
                "250Rnd_30mm_HE_shells_Tracer_Green"
            };
            removeWeapons[] = {
                "gatling_30mm"
            };
            turret[] = { 0 };
        };
    };
};