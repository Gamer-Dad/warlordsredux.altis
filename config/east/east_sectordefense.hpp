class SectorDefense {
    class O_HMG_01_F {
        cost = 150;
        loadable[] = {0, -2.5, 0.4};
        offset[] = {0, 3, 0};
        rearm = 120;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "100Rnd_127x99_mag_Tracer_Green",
                "100Rnd_127x99_mag_Tracer_Green",
                "100Rnd_127x99_mag_Tracer_Green",
                "100Rnd_127x99_mag_Tracer_Green"
            };
            addWeapons[] = {
                "HMG_static"
            };
            removeMagazines[] = {};
            removeWeapons[] = {
                "HMG_static"
            };
            turret[] = { 0 };
        };
    };  // "Mk30 HMG .50"

    class O_HMG_01_high_F {
        cost = 200;
        loadable[] = {0, -2.5, 0.8};
        offset[] = {0, 3, 0};
        rearm = 120;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "100Rnd_127x99_mag_Tracer_Green",
                "100Rnd_127x99_mag_Tracer_Green",
                "100Rnd_127x99_mag_Tracer_Green",
                "100Rnd_127x99_mag_Tracer_Green"
            };
            addWeapons[] = {
                "HMG_static"
            };
            removeMagazines[] = {};
            removeWeapons[] = {
                "HMG_static"
            };
            turret[] = { 0 };
        };
    };  // "Mk30 HMG .50 (Raised)"

    class O_GMG_01_F {
        cost = 200;
        loadable[] = {0, -2.5, 0.4};
        offset[] = {0, 3, 0};
        rearm = 120;
    };  // "Mk32 GMG 20 mm"

    class O_GMG_01_high_F {
        cost = 250;
        loadable[] = {0, -2.5, 0.8};
        offset[] = {0, 3, 0};
        rearm = 120;
    };  // "Mk32 GMG 20 mm (Raised)"

    class O_static_AT_F {
        cost = 300;
        hasTurretVisualizer = 1;
        loadable[] = {0, -2.5, 0.2};
        offset[] = {0, 3, 0};
        rearm = 180;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "1Rnd_GAT_missiles",
                "1Rnd_GAT_missiles",
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
    };  // "Static Titan Launcher (AT) [CSAT]"

    class O_HMG_01_A_F {
        cost = 500;
        loadable[] = {0, -2.5, 0.4};
        name = "Mk30 HMG Auto Turret";
        offset[] = {0, 3, 0};
        rearm = 120;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "100Rnd_127x99_mag_Tracer_Green",
                "100Rnd_127x99_mag_Tracer_Green",
                "100Rnd_127x99_mag_Tracer_Green",
                "100Rnd_127x99_mag_Tracer_Green"
            };
            addWeapons[] = {
                "HMG_static"
            };
            removeMagazines[] = {};
            removeWeapons[] = {
                "HMG_static"
            };
            turret[] = { 0 };
        };
    };

    class O_GMG_01_A_F {
        cost = 650;
        loadable[] = {0, -2.5, 0.4};
        name = "Mk32 GMG Auto Turret";
        offset[] = {0, 3, 0};
        rearm = 120;
    };

    // class O_static_AT_UP_F {
    //     cost = 800;
    //     description = "Static AT Launcher (UP) is an upgraded variant of the Static AT launcher.";
    //     loadable[] = {0, -2.5, 0.2};
    //     name = "Static AT Launcher (UP)";
    //     offset[] = {0, 3, 0};
    //     rearm = 180;
    //     spawn = "O_static_AT_F";
    //     variant = 1;

    //     class Gunner: WLTurretDefaults {
    //         addMagazines[] = {
    //             "Vorona_HEAT",
    //             "Vorona_HEAT",
    //             "Vorona_HEAT",
    //             "Vorona_HEAT",
    //             "Vorona_HEAT",
    //             "Vorona_HEAT",
    //             "Vorona_HEAT",
    //             "Vorona_HEAT",
    //             "Vorona_HEAT",
    //             "Vorona_HEAT",
    //             "Vorona_HEAT",
    //             "Vorona_HEAT",
    //             "Vorona_HEAT",
    //             "Vorona_HEAT",
    //             "Vorona_HEAT"
    //         };
    //         addWeapons[] = {
    //             "missiles_Vorona"
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

    // class O_AAA_System_01_F {
    //     cost = 3500;
    //     description = "Short range anti-mortar defense, capable of automatically engaging incoming ballistic shells. Effective range: 3km.";
    //     loadable[] = {0, -1, 1.7};
    //     name = "Praetorian 1C";
    //     offset[] = {0, 5.3, 0};
    //     rearm = 180;
    //     requirements[] = {};
    //     spawn = "B_AAA_System_01_F";
    //     textures[] = {
    //         "a3\static_f_jets\aaa_system_01\data\aaa_system_01_olive_co.paa",
    //         "a3\static_f_jets\aaa_system_01\data\aaa_system_02_olive_co.paa"
    //     };
    //     variant = 1;

    //     class Gunner: WLTurretDefaults {
    //         addMagazines[] = {
    //             "5000Rnd_762x51_Yellow_Belt"
    //         };
    //         addWeapons[] = {
    //             "M134_minigun"
    //         };
    //         removeMagazines[] = {
    //             "magazine_Cannon_Phalanx_x1550"
    //         };
    //         removeWeapons[] = {
    //             "weapon_Cannon_Phalanx"
    //         };
    //         turret[] = { 0 };
    //     };
    // };

    class O_Mortar_01_F {
        cost = 5000;
        loadable[] = {0, -2.5, 0};
        offset[] = {0, 3, 0};
        rearm = 900;
    };  // "Mortar"

    class O_Mortar_01_TV_F {
        ammoOverrides[] = {
            {"M_127mm_Firefist_AT", {"M_Lancet", "Lancet (Loitering Munition)"}}
        };
        cost = 8000;
        description = "Lancet Launcher is a remote controlled loitering munition launcher. It can be used to effectively engage enemy ground vehicles.";
        loadable[] = {0, -2.5, 0};
        name = "Lancet Launcher";
        offset[] = {0, 3, 0};
        rearm = 900;
        spawn = "O_Mortar_01_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "2Rnd_127mm_Firefist_missiles"
            };
            addWeapons[] = {
                "missiles_Firefist"
            };
            removeMagazines[] = {
                "8Rnd_82mm_Mo_shells",
                "8Rnd_82mm_Mo_Flare_white",
                "8Rnd_82mm_Mo_Smoke_white",
                "8Rnd_82mm_Mo_guided",
                "8Rnd_82mm_Mo_LG"
            };
            removeWeapons[] = {
                "mortar_82mm"
            };
            turret[] = { 0 };
        };
    };
};