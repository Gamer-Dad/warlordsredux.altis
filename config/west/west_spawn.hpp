class Spawn {
    class Land_BagFence_Long_F {
        cost = 200;
        demolishable = 1;
        demolishStepTime = 1;
        name = "Temporary Sandbag Wall";
        lifetime = 180;
    };

    class Land_BagBunker_Small_F {
        cost = 1500;
        demolishable = 1;
        demolishStepTime = 1;
        hasFastTravel = 1;
        loaded = "I_HMG_02_high_F";
        name = "Fighting Position";
    };

    class I_HMG_02_high_F {
        cost = 500;
        rearm = 180;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "500Rnd_127x99_mag_Tracer_Yellow",
                "500Rnd_127x99_mag_Tracer_Yellow"
            };
            addWeapons[] = {
                "HMG_static"
            };
            removeMagazines[] = {
                "100Rnd_127x99_mag_Tracer_Yellow"
            };
            removeWeapons[] = {
                "HMG_M2_Mounted"
            };
            turret[] = { 0 };
        };
    };

    class I_static_FGS_F {
        capValue = 2;
        cost = 3000;
        conversion = 1;
        drone = 1;
        hasRearm = 1;
        immobile = 1;
        loadable[] = {0, -3.4, 0.8};
        loadableAngle = 180;
        name = "Fighting Position (Cannon)";
        rearm = 300;
        spawn = "B_AFV_Wheeled_01_cannon_F";

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "12Rnd_120mm_APFSDS_shells_Tracer_Yellow",
                "8Rnd_120mm_HE_shells_Tracer_Yellow"
            };
            addWeapons[] = {
                "cannon_120mm"
            };
            removeMagazines[] = {
                "12Rnd_120mm_APFSDS_shells_Tracer_Red",
                "8Rnd_120mm_HE_shells_Tracer_Red",
                "8Rnd_120mm_HEAT_MP_T_Red",
                "4Rnd_120mm_LG_cannon_missiles",
                "200Rnd_338_Mag"
            };
            removeWeapons[] = {
                "cannon_120mm",
                "MMG_02_coax"
            };
            turret[] = { 0 };
        };
    };

    class B_Slingload_01_Cargo_F {
        conversion = 1;
        cost = 500;
        empty = 1;
        loadable[] = {0, -1.5, 0.5};
        name = "Forward Base Supplies (NATO)";
    };

    class Land_Destroyer_01_base_F {
        cost = 40000;
        name = "Destroyer";
    };

    class Land_MedicalTent_01_NATO_generic_open_F {
        cost = 5000;
        demolishStepTime = 3;
        hasFastTravel = 1;
        name = "Team Rally Pont (NATO)";
    };

    class Land_TentA_F {
        cost = 300;
        demolishStepTime = 2;
        name = "Tent";
    };

    class Land_TentDome_F {
        cost = 300;
        demolishStepTime = 2;
        name = "Tent";
    };

    class Land_TentSolar_01_bluewhite_F {
        cost = 300;
        demolishStepTime = 2;
        name = "Tent";
    };

    class Land_TentSolar_01_redwhite_F {
        cost = 300;
        demolishStepTime = 2;
        name = "Tent";
    };

    class RuggedTerminal_01_communications_hub_F {
        name = "Forward Base";
    };

    class B_Mortar_01_Integral_F {
        cost = -1;
        name = "Integral Mortar System";
    };

    class B_Ship_MRLS_01_F {
        cost = 20000;
        hasHMD = 1;
    };

    class B_UAV_02_F {
        cost = 1000;
    };
};