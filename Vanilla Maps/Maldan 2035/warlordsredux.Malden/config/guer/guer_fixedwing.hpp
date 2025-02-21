class FixedWing {
    class I_Plane_Civil_01_F {
        cost = 800;
        description = "Caesar BTT is a light unarmed aircraft.";
        killReward = 200;
        name = "Caesar BTT";
        requirements[] = {"A"};
        spawn = "I_C_Plane_Civil_01_F";
    };

    class I_Plane_Caesar_hmggmg_01_F {
        cost = 1500;
        description = "Caesar BTT (HMG/GMG) is a variant of the Caesar BTT armed with a HMG and GMG.";
        killReward = 300;
        name = "Caesar BTT (HMG/GMG)";
        rearm = 300;
        requirements[] = {"A"};
        spawn = "I_C_Plane_Civil_01_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "500Rnd_127x99_mag_Tracer_Yellow",
                "500Rnd_127x99_mag_Tracer_Yellow",
                "96Rnd_40mm_G_belt",
                "96Rnd_40mm_G_belt",
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {
                "HMG_127",
                "GMG_40mm",
                "CMFlareLauncher"
            };
            removeMagazines[] = {};
            removeWeapons[] = {};
            turret[] = { -1 };
        };
    };

    class I_Plane_Caesar_rocket_01_F {
        cost = 1800;
        description = "Caesar BTT (Rocket) is a variant of the Caesar BTT armed with rockets.";
        killReward = 300;
        name = "Caesar BTT (Rocket)";
        rearm = 400;
        requirements[] = {"A"};
        spawn = "I_C_Plane_Civil_01_F";
        variant = 1;

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "14Rnd_80mm_rockets",
                "14Rnd_80mm_rockets",
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {
                "rockets_Skyfire",
                "CMFlareLauncher"
            };
            removeMagazines[] = {};
            removeWeapons[] = {};
            turret[] = { -1 };
        };
    };

    class I_Plane_Caesar_bomb_01_F {
        cost = 2000;
        description = "Caesar BTT (Bomb) is a variant of the Caesar BTT armed with a pair of Mk82 bombs.";
        killReward = 300;
        name = "Caesar BTT (Bomb)";
        rearm = 400;
        requirements[] = {"A"};
        spawn = "I_C_Plane_Civil_01_F";
        variant = 1;

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "2Rnd_Mk82",
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {
                "Mk82BombLauncher",
                "CMFlareLauncher"
            };
            removeMagazines[] = {};
            removeWeapons[] = {};
            turret[] = { -1 };
        };
    };

    class I_Plane_Fighter_03_CAS_F {
        killReward = 500;
    };

    class I_Plane_Fighter_03_dynamicLoadout_F {
        aircraftSpawn = 1;
        cost = 15000;
        killReward = 500;
        rearm = 900;
        requirements[] = {"A"};
    };  // "A-143 Buzzard (CAS)"

    class I_Plane_Fighter_04_F {
        aircraftSpawn = 1;
        cost = 23000;
        killReward = 500;
        rearm = 900;
        requirements[] = {"A"};
    };  // "A-149 Gryphon"
};