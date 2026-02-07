class ALL {
    class Nonbuyable {
        class Land_BagFence_Long_F {
            cost = 200;
            demolishable = 1;
            demolishStepTime = 1;
            lifetime = 180;
            name = "Temporary Sandbag Wall";
            offset[] = {0, 3, 0};
        };

        class Land_BagBunker_Small_F {
            cost = 1500;
            demolishable = 1;
            demolishStepTime = 1;
            hasFastTravel = 1;
            loaded = "I_HMG_02_high_F";
            name = "Fighting Position";
            offset[] = {0, 5, 0};
        };

        class Land_HBarrierWall_corridor_F {
            cost = 2000;
            demolishable = 1;
            demolishStepTime = 5;
            loaded = "Mortar_01_F";
            name = "Mortar Pit";
            offset[] = {0, 7, 0};
        };

        class ForwardBaseDome {
            hideMap = 2;
            name = "Base Dome";
        };

        class Land_Dome_Small_WIP_F: ForwardBaseDome {};
        class Land_Dome_Small_WIP2_F: ForwardBaseDome {};
        class Land_Dome_Small_F: ForwardBaseDome {};
        class Land_TentHangar_V1_F: ForwardBaseDome {};


        class CraterDebris {
            cost = 200;
            obstacle = 2;
            demolishable = 1;
            demolishStepTime = 40;
            lifetime = 1200;
            name = "Debris";
        };

        class Land_ShellCrater_02_large_F: CraterDebris {};
        class Land_ShellCrater_02_small_F: CraterDebris {};
        class SpaceshipCapsule_01_debris_F: CraterDebris {};
        class CraterLong: CraterDebris {};
        class CraterLong_02_F: CraterDebris {};

        class I_HMG_02_high_F {
            cost = 500;
            offset[] = {0, 3, 0};
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

        class Mortar_01_F {
            cost = 500;
            name = "Mk6 Mortar";
            offset[] = {0, 3, 0};
            rearm = 900;
            spawn = "I_Mortar_01_F";
            lifetime = 300;

            class Gunner: WLTurretDefaults {
                addMagazines[] = {
                    "8Rnd_82mm_Mo_shells"
                };
                removeMagazines[] = {
                    "8Rnd_82mm_Mo_shells",
                    "8Rnd_82mm_Mo_Flare_white",
                    "8Rnd_82mm_Mo_Flare_white_illumination",
                    "8Rnd_82mm_Mo_Smoke_white"
                };
                turret[] = { 0 };
            };
        };

        class I_static_FGS_F {
            aps = 2;
            capValue = 2;
            cost = 3000;
            conversion = 1;
            drone = 1;
            hasRearm = 1;
            immobile = 1;
            loaded = "Land_IRMaskingCover_01_F";
            loadable[] = {0, -3.4, 0.8};
            loadableAngle = 180;
            name = "Fighting Position (Cannon)";
            offset[] = {0, 8, 0};
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

        class Land_Destroyer_01_base_F {
            cost = 40000;
            name = "Destroyer";
        };

        class B_Ship_MRLS_01_F {
            cost = 20000;
            hasHMD = 1;
        };

        class SpawnTent {
            cost = 300;
            demolishStepTime = 2;
            name = "Tent";
        };

        class Land_TentA_F: SpawnTent {};
        class Land_TentDome_F: SpawnTent {};
        class Land_TentSolar_01_bluewhite_F: SpawnTent {};
        class Land_TentSolar_01_redwhite_F: SpawnTent {};

        class RuggedTerminal_01_communications_hub_F {
            name = "Forward Base";
        };
    };
};