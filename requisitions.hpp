// All vehicle properties
// class CfgVehicleClassName {
//     cost = number;           // Cost of the vehicle, not shown in buy menu if 0.
//     requirements[] = array;  // Requirements for deployment (A = Airport, H = Helipad, W = Harbor)
//     offset[] = array;        // Offset for placing the vehicle after buying, only valid for some vehicle types
//     rearm = number;          // Rearm timer in seconds
//     killReward = number;     // Reward for destroying the vehicle
//     capValue = number;       // Value of the vehicle for calculating team's sector capture strength
//     name = string;           // Name override for vehicle in buy menu.
// };

class CfgWLRequisitionPresets {
    class A3ReduxAll {
        class WEST {
            class Infantry {
                class B_Soldier_F {
                    cost = 20;
                    requirements[] = {};
                };	// "Rifleman"

                class B_soldier_PG_F {
                    cost = 25;
                    requirements[] = {};
                };	// "Para Trooper"

                class B_CTRG_Soldier_tna_F {
                    cost = 30;
                    requirements[] = {};
                };	// "CTRG Scout"

                class B_crew_F {
                    cost = 15;
                    requirements[] = {};
                };	// "Crewman"

                class B_Helipilot_F {
                    cost = 10;
                    requirements[] = {};
                };	// "Helicopter Pilot"

                class B_Pilot_F {
                    cost = 10;
                    requirements[] = {};
                };	// "Pilot"

                class B_Soldier_GL_F {
                    cost = 50;
                    requirements[] = {};
                };	// "Grenadier"

                class B_medic_F {
                    cost = 20;
                    requirements[] = {};
                };	// "Combat Life Saver"

                class B_soldier_AR_F {
                    cost = 50;
                    requirements[] = {};
                };	// "Autorifleman"

                class B_Soldier_A_F {
                    cost = 25;
                    requirements[] = {};
                };	// "Ammo Bearer"

                class B_soldier_M_F {
                    cost = 60;
                    requirements[] = {};
                };	// "Marksman"

                class B_diver_F {
                    cost = 50;
                    requirements[] = {};
                };	// "Assault Diver"

                class B_diver_exp_F {
                    cost = 80;
                    requirements[] = {};
                };	// "Diver Explosive Specialist"

                class B_soldier_repair_F {
                    cost = 100;
                    requirements[] = {};
                };	// "Repair Specialist"

                class B_HeavyGunner_F {
                    cost = 80;
                    requirements[] = {};
                };	// "Heavy Gunner"

                class B_soldier_LAT_F {
                    cost = 100;
                    requirements[] = {};
                };	// "Rifleman (AT)"

                class B_soldier_LAT2_F {
                    cost = 100;
                    requirements[] = {};
                };	// "Rifleman (Light AT)"

                class B_CTRG_Soldier_LAT_tna_F {
                    cost = 150;
                    requirements[] = {};
                };	// "Rifleman (Light AT)"

                class B_soldier_AT_F {
                    cost = 150;
                    requirements[] = {};
                };	// "Missile Specialist (AT)"

                class B_soldier_AA_F {
                    cost = 150;
                    requirements[] = {};
                };	// "Missile Specialist (AA)"

                class B_Sharpshooter_F {
                    cost = 80;
                    requirements[] = {};
                };	// "Sharpshooter"

                class B_sniper_F {
                    cost = 100;
                    requirements[] = {};
                };	// "Sniper"

                class B_Captain_Dwarden_F {
                    cost = 150;
                    requirements[] = {};
                };	// "Dwarden"
            };

            class Vehicles {
                class B_Quadbike_01_F {
                    cost = 20;
                    requirements[] = {};
                    killReward = 20;
                    capValue = 1;
                }; // "Quad Bike"

                class B_MRAP_01_F {
                    cost = 300;
                    requirements[] = {};
                    killReward = 70;
                    capValue = 1;
                }; // "Hunter"

                class B_LSV_01_armed_F {
                    cost = 200;
                    requirements[] = {};
                    rearm = 120;
                    killReward = 150;
                    capValue = 1;
                }; // "Prowler (HMG)"

                class B_G_Offroad_01_armed_F {
                    cost = 150;
                    requirements[] = {};
                    rearm = 120;
                    killReward = 150;
                    capValue = 1;
                }; // "Offroad (HMG)"

                class B_LSV_01_AT_F {
                    cost = 750;
                    requirements[] = {};
                    rearm = 200;
                    killReward = 200;
                    capValue = 1;
                }; // "Prowler (AT)"

                class B_G_Offroad_01_AT_F {
                    cost = 500;
                    requirements[] = {};
                    rearm = 180;
                    killReward = 180;
                    capValue = 1;
                }; // "Offroad (AT)"

                class B_MRAP_01_hmg_F {
                    cost = 1000;
                    requirements[] = {};
                    rearm = 300;
                    killReward = 250;
                    capValue = 2;
                }; // "Hunter HMG"

                class B_MRAP_01_gmg_F {
                    cost = 1250;
                    requirements[] = {};
                    rearm = 300;
                    killReward = 250;
                    capValue = 2;
                }; // "Hunter GMG"

                class B_Truck_01_ammo_F {
                    cost = 1000;
                    requirements[] = {};
                    killReward = 80;
                    capValue = 1;
                }; // "HEMTT Ammo"

                class B_Truck_01_Repair_F {
                    cost = 1000;
                    requirements[] = {};
                    killReward = 80;
                    capValue = 1;
                }; // "HEMTT Repair"

                class B_Truck_01_fuel_F {
                    cost = 1000;
                    requirements[] = {};
                    killReward = 80;
                    capValue = 1;
                }; // "HEMTT Fuel"

                class O_T_Truck_03_device_ghex_F {
                    cost = 1500;
                    requirements[] = {};
                    killReward = 200;
                    capValue = 1;
                }; // "Tempest Device"

                class B_Truck_01_transport_F {
                    cost = 200;
                    requirements[] = {};
                    killReward = 80;
                    capValue = 1;
                }; // "HEMTT Transport"

                class B_Truck_01_flatbed_F {
                    cost = 500;
                    requirements[] = {};
                    killReward = 80;
                    capValue = 1;
                }; // "HEMTT Flatbed"

                class B_APC_Tracked_01_CRV_F {
                    cost = 1700;
                    requirements[] = {};
                    killReward = 300;
                    capValue = 2;
                }; // "CRV-6e Bobcat"

                class B_APC_Wheeled_03_cannon_F {
                    cost = 2500;
                    requirements[] = {};
                    rearm = 500;
                    killReward = 300;
                    capValue = 3;
                }; // "BLUFOR Gorgon"

                class B_APC_Wheeled_01_cannon_F {
                    cost = 3200;
                    requirements[] = {};
                    rearm = 500;
                    killReward = 300;
                    capValue = 3;
                }; // "AMV-7 Marshall"

                class B_APC_Tracked_01_rcws_F {
                    cost = 1800;
                    requirements[] = {};
                    rearm = 400;
                    killReward = 300;
                    capValue = 3;
                }; // "IFV-6c Panther"

                class B_APC_Tracked_01_AA_F {
                    cost = 5000;
                    requirements[] = {};
                    rearm = 500;
                    killReward = 350;
                    capValue = 4;
                }; // "IFV-6a Cheetah"

                class B_AFV_Wheeled_01_cannon_F {
                    cost = 4500;
                    requirements[] = {};
                    rearm = 500;
                    killReward = 450;
                    capValue = 4;
                }; // "Rhino MGS"

                class B_AFV_Wheeled_01_up_cannon_F {
                    cost = 5000;
                    requirements[] = {};
                    rearm = 500;
                    killReward = 500;
                    capValue = 4;
                }; // "Rhino MGS UP"

                class B_MBT_01_cannon_F {
                    cost = 6000;
                    requirements[] = {};
                    rearm = 600;
                    killReward = 450;
                    capValue = 4;
                }; // "M2A1 Slammer"

                class B_MBT_01_TUSK_F {
                    cost = 7000;
                    requirements[] = {};
                    rearm = 600;
                    killReward = 500;
                    capValue = 4;
                }; // "M2A1 Slammer UP"

                class B_MBT_01_arty_F {
                    cost = 20000;
                    requirements[] = {};
                    rearm = 1800;
                    killReward = 600;
                    capValue = 4;
                }; // "M4 Scorcher"

                class B_MBT_01_mlrs_F {
                    cost = 20000;
                    requirements[] = {};
                    rearm = 1800;
                    killReward = 600;
                    capValue = 4;
                }; // "M5 Sandstorm MLRS"

                class B_Truck_01_medical_F {
                    killReward = 100;
                    capValue = 1;
                }; // HEMMT Spawn Truck
            };

            class Aircraft {
                class B_Heli_Light_01_F {
                    cost = 300;
                    requirements[] = {"H"};
                    killReward = 100;
                }; // "MH-9 Hummingbird"

                class B_Heli_Transport_01_F {
                    cost = 800;
                    requirements[] = {"H"};
                    killReward = 100;
                }; // "UH-80 Ghost Hawk"

                class B_Heli_Transport_03_F {
                    cost = 1000;
                    requirements[] = {"H"};
                    killReward = 100;
                }; // "CH-67 Huron"

                class B_Heli_Light_01_dynamicLoadout_F {
                    cost = 2500;
                    requirements[] = {"H"};
                    rearm = 300;
                    killReward = 200;
                }; // "AH-9 Pawnee"

                class I_Heli_light_03_dynamicLoadout_F {
                    cost = 7500;
                    requirements[] = {"H"};
                    rearm = 300;
                    killReward = 300;
                }; // "WY-55 Hellcat"

                class B_UAV_02_dynamicLoadout_F {
                    cost = 12000;
                    requirements[] = {"A"};
                    rearm = 500;
                    killReward = 600;
                }; // "Greyhawk"

                class B_Heli_Attack_01_dynamicLoadout_F {
                    cost = 13000;
                    requirements[] = {"H"};
                    rearm = 700;
                    killReward = 550;
                }; // "AH-99 Blackfoot"

                class B_T_UAV_03_dynamicLoadout_F {
                    cost = 12000;
                    requirements[] = {"H"};
                    rearm = 600;
                    killReward = 600;
                }; // "Falcon"

                class B_UAV_05_F {
                    cost = 20000;
                    requirements[] = {"A"};
                    rearm = 500;
                    killReward = 650;
                }; // "Sentinel"

                class B_T_VTOL_01_infantry_F {
                    cost = 2000;
                    requirements[] = {"A"};
                    killReward = 300;
                }; // "V-44 X Blackfish (Inf)"

                class B_T_VTOL_01_vehicle_F {
                    cost = 2000;
                    requirements[] = {"A"};
                    killReward = 300;
                }; // "V-44 X Blackfish (Vic)"

                class B_T_VTOL_01_armed_F {
                    cost = 8000;
                    requirements[] = {"A"};
                    rearm = 500;
                    killReward = 350;
                }; // "V-44 X Blackfish (Armed)"

                class B_Plane_CAS_01_dynamicLoadout_F {
                    cost = 15000;
                    requirements[] = {"A"};
                    rearm = 900;
                    killReward = 800;
                }; // "A-164 Wipeout (CAS)"

                class I_Plane_Fighter_04_F {
                    cost = 23000;
                    requirements[] = {"A"};
                    rearm = 900;
                    killReward = 600;
                }; // "A-149 Gryphon"

                class B_Plane_Fighter_01_F {
                    cost = 30000;
                    requirements[] = {"A"};
                    rearm = 900;
                    killReward = 1000;
                }; // "F/A-181 Black Wasp II"

                class B_Plane_Fighter_01_Stealth_F {
                    cost = 35000;
                    requirements[] = {"A"};
                    rearm = 900;
                    killReward = 1000;
                }; // "F/A-181 Black Wasp II (Stealth)"
            };

            class Naval {
                class C_Scooter_Transport_01_F {
                    cost = 50;
                    requirements[] = {"W"};
                    killReward = 20;
                };	// "Water scooter"

                class B_Boat_Transport_01_F {
                    cost = 100;
                    requirements[] = {"W"};
                    killReward = 20;
                };	// "Assault Boat"

                class B_Boat_Armed_01_minigun_F {
                    cost = 500;
                    requirements[] = {"W"};
                    rearm = 400;
                    killReward = 80;
                };	// "Speedboat Minigun"

                class B_SDV_01_F {
                    cost = 250;
                    requirements[] = {"W"};
                    killReward = 20;
                };	// "SDV"
            };

            class Gear {
                class Box_NATO_Ammo_F {
                    cost = 50;
                    requirements[] = {};
                    killReward = 40;
                }; // "Basic Ammo [NATO]"

                class Box_NATO_Grenades_F {
                    cost = 50;
                    requirements[] = {};
                    killReward = 40;
                }; // "Grenades [NATO]"

                class Box_NATO_Wps_F {
                    cost = 100;
                    requirements[] = {};
                    killReward = 40;
                }; // "Basic Weapons [NATO]"

                class Box_NATO_Uniforms_F {
                    cost = 100;
                    requirements[] = {};
                    killReward = 40;
                }; // "Uniforms [NATO]"

                class Box_NATO_Equip_F {
                    cost = 100;
                    requirements[] = {};
                    killReward = 40;
                }; // "Equipment [NATO]"

                class Box_NATO_AmmoOrd_F {
                    cost = 150;
                    requirements[] = {};
                    killReward = 40;
                }; // "Explosives [NATO]"

                class Box_NATO_WpsLaunch_F {
                    cost = 200;
                    requirements[] = {};
                    killReward = 40;
                }; // "Launchers [NATO]"

                class Box_NATO_WpsSpecial_F {
                    cost = 250;
                    requirements[] = {};
                    killReward = 40;
                }; // "Special Weapons [NATO]"

                class B_supplyCrate_F {
                    cost = 300;
                    requirements[] = {};
                    killReward = 40;
                }; // "Supply Box [NATO]"

                class Box_NATO_AmmoVeh_F {
                    cost = 250;
                    requirements[] = {};
                    killReward = 70;
                }; // "Vehicle Ammo [NATO]"

                class B_Slingload_01_Ammo_F {
                    cost = 500;
                    requirements[] = {};
                    killReward = 150;
                }; // "Huron Ammo Container"

                class B_Slingload_01_Repair_F {
                    cost = 500;
                    requirements[] = {};
                    killReward = 150;
                }; // "Huron Repair Container"

                class B_Slingload_01_Fuel_F {
                    cost = 300;
                    requirements[] = {};
                    killReward = 150;
                }; // "Huron Fuel Container"

                class B_Slingload_01_Medevac_F {
                    killReward = 300;
                }; // Huron Spawn
            };

            class Defences {
                class Land_BagFence_Round_F {
                    cost = 50;
                    requirements[] = {};
                    offset[] = {0, 2, 0};
                    killReward = 30;
                }; // "Semi Circle Sand bags"

                class Land_Razorwire_F {
                    cost = 50;
                    requirements[] = {};
                    offset[] = {0, 5, 0};
                    killReward = 30;
                }; // "Razor Wire Fence"

                class Land_DragonsTeeth_01_1x1_new_F {
                    cost = 50;
                    requirements[] = {};
                    offset[] = {0, 2, 0};
                    killReward = 30;
                }; // "Tank barrier"

                class CamoNet_BLUFOR_big_F {
                    cost = 100;
                    requirements[] = {};
                    offset[] = {0, 6, 0};
                    killReward = 30;
                }; // "Camouflage Vehicle Cover (Green)"

                class Land_IRMaskingCover_01_F {
                    cost = 200;
                    requirements[] = {};
                    offset[] = {0, 8, 0};
                    killReward = 30;
                }; // "IR Masking Tent (Large)"

                class Land_Communication_F {
                    cost = 1500;
                    requirements[] = {};
                    offset[] = {0, 6, 0};
                    name = "Jamming Tower";
                    killReward = 400;
                };

                class B_HMG_01_F {
                    cost = 150;
                    requirements[] = {};
                    rearm = 300;
                    killReward = 100;
                }; // "Mk30 HMG .50"

                class B_HMG_01_high_F {
                    cost = 200;
                    requirements[] = {};
                    rearm = 300;
                    killReward = 100;
                }; // "Mk30 HMG .50 (Raised)"

                class B_GMG_01_F {
                    cost = 200;
                    requirements[] = {};
                    rearm = 300;
                    killReward = 100;
                }; // "Mk32 GMG 20mm"

                class B_GMG_01_high_F {
                    cost = 250;
                    requirements[] = {};
                    rearm = 300;
                    killReward = 100;
                }; // "Mk32 GMG 20mm (Raised)"

                class B_HMG_01_A_F {
                    cost = 500;
                    requirements[] = {};
                    rearm = 300;
                    name = "Mk30 HMG Auto Turret";
                    killReward = 150;
                };

                class B_GMG_01_A_F {
                    cost = 650;
                    requirements[] = {};
                    rearm = 300;
                    name = "Mk32 GMG Auto Turret";
                    killReward = 150;
                };

                class B_static_AT_F {
                    cost = 300;
                    requirements[] = {};
                    rearm = 300;
                    killReward = 100;
                }; // "Static Titan Launcher (AT) [NATO]"

                class B_static_AA_F {
                    cost = 300;
                    requirements[] = {};
                    rearm = 300;
                    killReward = 100;
                }; // "Static Titan Launcher (AA) [NATO]"

                class B_Mortar_01_F {
                    cost = 4000;
                    requirements[] = {};
                    rearm = 900;
                    killReward = 125;
                }; // "Mortar"

                class B_UGV_02_Demining_F {
                    cost = 100;
                    requirements[] = {};
                    offset[] = {0, 3, 0};
                    rearm = 200;
                    killReward = 100;
                }; // "UGAS demining"

                class B_UGV_01_F {
                    cost = 150;
                    requirements[] = {};
                    offset[] = {0, 3, 0};
                    killReward = 50;
                }; // "UGV Stomper"

                class B_UGV_01_rcws_F {
                    cost = 400;
                    requirements[] = {};
                    offset[] = {0, 3, 0};
                    rearm = 300;
                    killReward = 100;
                }; // "UGAS"

                class B_UAV_01_F {
                    cost = 500;
                    requirements[] = {};
                    killReward = 100;
                }; // AR-2

                class B_UAV_06_F {
                    cost = 1000;
                    requirements[] = {};
                    killReward = 200;
                }; // "AR-6"

                class B_Ship_Gun_01_F {
                    cost = 10000;
                    requirements[] = {};
                    offset[] = {0, 9, 0};
                    rearm = 2700;
                    killReward = 600;
                }; // "MK45 Hammer"

                class B_Radar_System_01_F {
                    cost = 1000;
                    requirements[] = {};
                    offset[] = {0, 7, 0};
                    killReward = 350;
                }; // "AN/MPQ-105 Radar"

                class B_AAA_System_01_F {
                    cost = 3500;
                    requirements[] = {};
                    offset[] = {0, 5.3, 0};
                    rearm = 300;
                    killReward = 400;
                }; // "Praetorian 1C"

                class B_SAM_System_01_F {
                    cost = 10000;
                    requirements[] = {};
                    offset[] = {0, 5.3, 0};
                    rearm = 600;
                    killReward = 500;
                }; // "Mk49 Spartan"

                class B_SAM_System_03_F {
                    cost = 8000;
                    requirements[] = {};
                    offset[] = {0, 6, 0};
                    rearm = 450;
                    killReward = 500;
                }; // "MIM-145 Defender"

                class B_SAM_System_02_F {
                    cost = 15000;
                    requirements[] = {};
                    offset[] = {0, 5.3, 0};
                    rearm = 600;
                    killReward = 600;
                }; // "Mk21 Centurion"

                class B_Ship_MRLS_01_F {
                    cost = 30000;
                    requirements[] = {};
                    offset[] = {0, 7, 0};
                    rearm = 2700;
                    killReward = 700;
                }; // "Mk41 VLS"
            };

        };

        class EAST {
            class Infantry {
                class O_Soldier_F {
                    cost = 20;
                    requirements[] = {};
                };	// "Rifleman"

                class O_soldier_PG_F {
                    cost = 25;
                    requirements[] = {};
                };	// "Para Trooper"

                class O_V_Soldier_hex_F {
                    cost = 40;
                    requirements[] = {};
                };	// "Viper Rifleman"

                class O_crew_F {
                    cost = 15;
                    requirements[] = {};
                };	// "Crewman"

                class O_Helipilot_F {
                    cost = 10;
                    requirements[] = {};
                };	// "Helicopter Pilot"

                class O_Pilot_F {
                    cost = 10;
                    requirements[] = {};
                };	// "Pilot"

                class O_Soldier_GL_F {
                    cost = 50;
                    requirements[] = {};
                };	// "Grenadier"

                class O_medic_F {
                    cost = 20;
                    requirements[] = {};
                };	// "Combat Life Saver"

                class O_soldier_AR_F {
                    cost = 50;
                    requirements[] = {};
                };	// "Autorifleman"

                class O_Soldier_A_F {
                    cost = 25;
                    requirements[] = {};
                };	// "Ammo Bearer"

                class O_soldier_M_F {
                    cost = 60;
                    requirements[] = {};
                };	// "Marksman"

                class O_diver_F {
                    cost = 50;
                    requirements[] = {};
                };	// "Assault Diver"

                class O_diver_exp_F {
                    cost = 80;
                    requirements[] = {};
                };	// "Diver Explosive Specialist"

                class O_soldier_repair_F {
                    cost = 100;
                    requirements[] = {};
                };	// "Repair Specialist"

                class O_HeavyGunner_F {
                    cost = 80;
                    requirements[] = {};
                };	// "Heavy Gunner"

                class O_soldier_LAT_F {
                    cost = 100;
                    requirements[] = {};
                };	// "Rifleman (AT)"

                class O_V_Soldier_LAT_hex_F {
                    cost = 150;
                    requirements[] = {};
                };	// "Viper Rifleman (AT)"

                class O_soldier_AT_F {
                    cost = 150;
                    requirements[] = {};
                };	// "Missile Specialist (AT)"

                class O_Soldier_AA_F {
                    cost = 150;
                    requirements[] = {};
                };	// "Missile Specialist (AA)"

                class O_Sharpshooter_F {
                    cost = 80;
                    requirements[] = {};
                };	// "Sharpshooter"

                class O_sniper_F {
                    cost = 100;
                    requirements[] = {};
                };	// "Sniper"

                class O_soldier_HAT_F {
                    cost = 200;
                    requirements[] = {};
                };	// "Rifleman (Heavy AT)"
            };

            class Vehicles {
                class O_Quadbike_01_F {
                    cost = 20;
                    requirements[] = {};
                    killReward = 20;
                    capValue = 1;
                }; // "Quad Bike"

                class O_LSV_02_unarmed_F {
                    cost = 50;
                    requirements[] = {};
                    killReward = 50;
                    capValue = 1;
                }; // "Qilin (Unarmed)"

                class O_MRAP_02_F {
                    cost = 300;
                    requirements[] = {};
                    killReward = 70;
                    capValue = 1;
                }; // "Ifrit"

                class O_Truck_03_transport_F {
                    cost = 200;
                    requirements[] = {};
                    killReward = 80;
                    capValue = 1;
                }; // "Tempest Transport"

                class O_Truck_03_Fuel_F {
                    cost = 1000;
                    requirements[] = {};
                    killReward = 80;
                    capValue = 1;
                }; // "Tempest Fuel"

                class O_LSV_02_armed_F {
                    cost = 200;
                    requirements[] = {};
                    rearm = 120;
                    killReward = 150;
                    capValue = 1;
                }; // "Qilin (Minigun)"

                class O_G_Offroad_01_armed_F {
                    cost = 150;
                    requirements[] = {};
                    rearm = 120;
                    killReward = 150;
                    capValue = 1;
                }; // "Offroad (HMG)"

                class O_LSV_02_AT_F {
                    cost = 750;
                    requirements[] = {};
                    rearm = 200;
                    killReward = 200;
                    capValue = 1;
                }; // "Qilin (AT)"

                class O_G_Offroad_01_AT_F {
                    cost = 500;
                    requirements[] = {};
                    rearm = 180;
                    killReward = 180;
                    capValue = 1;
                }; // "Offroad (AT)"

                class B_Truck_01_flatbed_F {
                    cost = 500;
                    requirements[] = {};
                    killReward = 80;
                    capValue = 1;
                }; // "HEMTT Flatbed"

                class O_MRAP_02_hmg_F {
                    cost = 1000;
                    requirements[] = {};
                    rearm = 300;
                    killReward = 250;
                    capValue = 2;
                }; // "Ifrit HMG"

                class O_MRAP_02_gmg_F {
                    cost = 1250;
                    requirements[] = {};
                    rearm = 300;
                    killReward = 250;
                    capValue = 2;
                }; // "Ifrit GMG"

                class O_Truck_03_Repair_F {
                    cost = 1000;
                    requirements[] = {};
                    killReward = 80;
                    capValue = 1;
                }; // "Tempest Repair"

                class O_Truck_03_device_F {
                    cost = 1500;
                    requirements[] = {};
                    killReward = 200;
                    capValue = 1;
                }; // "Tempest Device"

                class O_Truck_03_ammo_F {
                    cost = 1000;
                    requirements[] = {};
                    killReward = 80;
                    capValue = 1;
                }; // "Tempest Ammo"

                class O_APC_Wheeled_02_rcws_v2_F {
                    cost = 1500;
                    requirements[] = {};
                    rearm = 400;
                    killReward = 300;
                    capValue = 2;
                }; // "MSE-3 Marid"

                class O_APC_Tracked_02_cannon_F {
                    cost = 2800;
                    requirements[] = {};
                    rearm = 500;
                    killReward = 350;
                    capValue = 3;
                }; // "BTR-K Kamysh"

                class O_APC_Tracked_02_AA_F {
                    cost = 5000;
                    requirements[] = {};
                    rearm = 500;
                    killReward = 350;
                    capValue = 4;
                }; // "ZSU-39 Tigris"

                class O_MBT_02_cannon_F {
                    cost = 8000;
                    requirements[] = {};
                    rearm = 600;
                    killReward = 500;
                    capValue = 4;
                }; // "T-100 Varsuk"

                class O_MBT_04_cannon_F {
                    cost = 13000;
                    requirements[] = {};
                    rearm = 600;
                    killReward = 550;
                    capValue = 4;
                }; // "T-140 Angara"

                class O_MBT_04_command_F {
                    cost = 15000;
                    requirements[] = {};
                    rearm = 600;
                    killReward = 600;
                    capValue = 4;
                }; // "T-140K Angara"

                class O_MBT_02_railgun_F {
                    cost = 16000;
                    requirements[] = {};
                    rearm = 600;
                    killReward = 500;
                    capValue = 4;
                }; // "T-100 Futura"

                class O_MBT_02_arty_F {
                    cost = 20000;
                    requirements[] = {};
                    rearm = 1800;
                    killReward = 600;
                    capValue = 4;
                }; // "2S9 Sochor"

                class I_Truck_02_MRL_F {
                    cost = 18000;
                    requirements[] = {};
                    rearm = 1800;
                    killReward = 600;
                    capValue = 4;
                }; // "Zamak MRL"

                class O_Truck_03_medical_F {
                    killReward = 100;
                    capValue = 1;
                }; // Tempest Spawn Truck
            };

            class Aircraft {
                class O_Heli_Light_02_unarmed_F {
                    cost = 500;
                    requirements[] = {"H"};
                    killReward = 125;
                }; // "PO-30 Orca (Unarmed)"

                class O_Heli_Transport_04_F {
                    cost = 500;
                    requirements[] = {"H"};
                    killReward = 100;
                }; // "Mi-290 Taru"

                class O_Heli_Transport_04_covered_F {
                    cost = 400;
                    requirements[] = {"H"};
                    killReward = 100;
                }; // "Mi-290 Taru (Transport)"

                class O_Heli_Transport_04_medevac_F {
                    cost = 500;
                    requirements[] = {"H"};
                    killReward = 100;
                }; // "Mi-290 Taru (Medical)"

                class O_Heli_Light_02_dynamicLoadout_F {
                    cost = 4000;
                    requirements[] = {"H"};
                    killReward = 300;
                }; // "PO-30 Orca"

                class O_T_UAV_04_CAS_F {
                    cost = 8000;
                    requirements[] = {"A"};
                    rearm = 500;
                    killReward = 600;
                }; // "KH-3A Fenghuang"

                class O_Heli_Attack_02_dynamicLoadout_F {
                    cost = 10000;
                    requirements[] = {"H"};
                    rearm = 700;
                    killReward = 550;
                }; // "Mi-48 Kajman"

                class O_UAV_02_dynamicLoadout_F {
                    cost = 10000;
                    requirements[] = {"A"};
                    rearm = 330;
                    killReward = 600;
                }; // "K40 Ababil-3"

                class O_T_VTOL_02_vehicle_dynamicLoadout_F {
                    cost = 14000;
                    requirements[] = {"A"};
                    rearm = 700;
                    killReward = 600;
                }; // "Y-32 Xi'an (Infantry Transport)"

                class I_Plane_Fighter_03_dynamicLoadout_F {
                    cost = 15000;
                    requirements[] = {"A"};
                    rearm = 900;
                    killReward = 600;
                }; // "A-143 Buzzard"

                class O_Plane_CAS_02_dynamicLoadout_F {
                    cost = 20000;
                    requirements[] = {"A"};
                    rearm = 900;
                    killReward = 900;
                }; // "To-199 Neophron (CAS)"

                class O_Plane_Fighter_02_F {
                    cost = 32000;
                    requirements[] = {"A"};
                    rearm = 900;
                    killReward = 1100;
                }; // "To-201 Shikra"

                class O_Plane_Fighter_02_Stealth_F {
                    cost = 28000;
                    requirements[] = {"A"};
                    rearm = 900;
                    killReward = 1100;
                }; // "To-201 Shikra (Stealth)"
            };

            class Naval {
                class C_Scooter_Transport_01_F {
                    cost = 50;
                    requirements[] = {"W"};
                    killReward = 20;
                };	// "Water scooter"

                class O_Boat_Transport_01_F {
                    cost = 100;
                    requirements[] = {"W"};
                    killReward = 20;
                };	// "Assault Boat"

                class O_Boat_Armed_01_hmg_F {
                    cost = 250;
                    requirements[] = {"W"};
                    rearm = 400;
                    killReward = 80;
                };	// "Speedboat HMG"

                class O_SDV_01_F {
                    cost = 650;
                    requirements[] = {"W"};
                    killReward = 20;
                };	// "SDV"
            };

            class Gear {
                class Box_East_Ammo_F {
                    cost = 50;
                    requirements[] = {};
                    killReward = 40;
                }; // "Basic Ammo [CSAT]"

                class Box_East_Grenades_F {
                    cost = 50;
                    requirements[] = {};
                    killReward = 40;
                }; // "Grenades [CSAT]"

                class Box_East_Wps_F {
                    cost = 100;
                    requirements[] = {};
                    killReward = 40;
                }; // "Basic Weapons [CSAT]"

                class Box_CSAT_Uniforms_F {
                    cost = 100;
                    requirements[] = {};
                    killReward = 40;
                }; // "Uniforms [NATO]"

                class Box_CSAT_Equip_F {
                    cost = 100;
                    requirements[] = {};
                    killReward = 40;
                }; // "Equipment [NATO]"

                class Box_East_AmmoOrd_F {
                    cost = 150;
                    requirements[] = {};
                    killReward = 40;
                }; // "Explosives [CSAT]"

                class Box_East_WpsLaunch_F {
                    cost = 200;
                    requirements[] = {};
                    killReward = 40;
                }; // "Launchers [CSAT]"

                class Box_East_WpsSpecial_F {
                    cost = 250;
                    requirements[] = {};
                    killReward = 40;
                }; // "Special Weapons [CSAT]"

                class O_supplyCrate_F {
                    cost = 300;
                    requirements[] = {};
                    killReward = 40;
                }; // "Supply Box [CSAT]"

                class Box_East_AmmoVeh_F {
                    cost = 250;
                    requirements[] = {};
                    killReward = 70;
                }; // "Vehicle Ammo [CSAT]"

                class Land_Pod_Heli_Transport_04_ammo_F {
                    cost = 500;
                    requirements[] = {};
                    killReward = 150;
                }; // "Taru Ammo Pod"

                class Land_Pod_Heli_Transport_04_repair_F {
                    cost = 500;
                    requirements[] = {};
                    killReward = 150;
                }; // "Taru Repair Pod"

                class Land_Pod_Heli_Transport_04_fuel_F {
                    cost = 300;
                    requirements[] = {};
                    killReward = 150;
                }; // "Taru Fuel Pod"

                class Land_Pod_Heli_Transport_04_medevac_F {
                    killReward = 300;
                }; // Taru Spawn Container
            };

            class Defences {
                class Land_BagFence_Round_F {
                    cost = 50;
                    requirements[] = {};
                    offset[] = {0, 2, 0};
                    killReward = 30;
                };  // "Semi Circle Sand bags"

                class Land_Razorwire_F {
                    cost = 50;
                    requirements[] = {};
                    offset[] = {0, 5, 0};
                    killReward = 30;
                };  // "Razor Wire Fence"

                class Land_DragonsTeeth_01_1x1_new_F {
                    cost = 50;
                    requirements[] = {};
                    offset[] = {0, 2, 0};
                    killReward = 30;
                };  // "Tank barrier"

                class CamoNet_OPFOR_big_F {
                    cost = 100;
                    requirements[] = {};
                    offset[] = {0, 6, 0};
                };  // "Camouflage Vehicle Cover (Hex)"

                class Land_IRMaskingCover_01_F {
                    cost = 200;
                    requirements[] = {};
                    offset[] = {0, 8, 0};
                };  // "IR Masking Tent (Large)"

                class Land_Communication_F {
                    cost = 1500;
                    requirements[] = {};
                    offset[] = {0, 6, 0};
                    name = "Jamming Tower";
                    killReward = 400;
                };

                class O_HMG_01_F {
                    cost = 150;
                    requirements[] = {};
                    rearm = 300;
                    killReward = 100;
                };  // "Mk30 HMG .50"

                class O_HMG_01_high_F {
                    cost = 200;
                    requirements[] = {};
                    rearm = 300;
                    killReward = 100;
                };  // "Mk30 HMG .50 (Raised)"

                class O_GMG_01_F {
                    cost = 200;
                    requirements[] = {};
                    rearm = 300;
                    killReward = 100;
                };  // "Mk32 GMG 20 mm"

                class O_GMG_01_high_F {
                    cost = 250;
                    requirements[] = {};
                    rearm = 300;
                    killReward = 100;
                };  // "Mk32 GMG 20 mm (Raised)"

                class O_HMG_01_A_F {
                    cost = 500;
                    requirements[] = {};
                    rearm = 300;
                    killReward = 150;
                    name = "Mk30 HMG Auto Turret";
                };

                class O_GMG_01_A_F {
                    cost = 650;
                    requirements[] = {};
                    rearm = 300;
                    killReward = 150;
                    name = "Mk32 GMG Auto Turret";
                };

                class O_static_AT_F {
                    cost = 300;
                    requirements[] = {};
                    rearm = 300;
                    killReward = 100;
                };  // "Static Titan Launcher (AT) [CSAT]"

                class O_static_AA_F {
                    cost = 300;
                    requirements[] = {};
                    rearm = 300;
                    killReward = 100;
                };  // "Static Titan Launcher (AA) [CSAT]"

                class O_Mortar_01_F {
                    cost = 4000;
                    requirements[] = {};
                    rearm = 900;
                    killReward = 125;
                };  // "Mortar"

                class O_UGV_02_Demining_F {
                    cost = 100;
                    requirements[] = {};
                    offset[] = {0, 3, 0};
                    rearm = 200;
                    killReward = 100;
                };  // "UGAS demining"

                class O_UGV_01_F {
                    cost = 150;
                    requirements[] = {};
                    offset[] = {0, 3, 0};
                    killReward = 50;
                };  // "UGV Stomper"

                class O_UGV_01_rcws_F {
                    cost = 400;
                    requirements[] = {};
                    offset[] = {0, 3, 0};
                    rearm = 300;
                    killReward = 100;
                };  // "UGAV rcws"

                class O_UAV_01_F {
                    cost = 500;
                    requirements[] = {};
                    killReward = 100;
                };  // "AR-2"

                class O_UAV_06_F {
                    cost = 1000;
                    requirements[] = {};
                    killReward = 200;
                };  // "AR-6"

                class O_Radar_System_02_F {
                    cost = 1000;
                    requirements[] = {};
                    offset[] = {0, 7, 0};
                    killReward = 350;
                };  // "R-750 Cronus Radar"

                class B_AAA_System_01_F {
                    cost = 3500;
                    requirements[] = {};
                    offset[] = {0, 5.3, 0};
                    rearm = 300;
                };  // "Praetorian 1C"

                class B_SAM_System_01_F {
                    cost = 10000;
                    requirements[] = {};
                    offset[] = {0, 5.3, 0};
                    rearm = 600;
                };  // "Mk49 Spartan"

                class O_SAM_System_04_F {
                    cost = 8000;
                    requirements[] = {};
                    offset[] = {0, 6, 0};
                    rearm = 450;
                    killReward = 500;
                };  // "S-750 Rhea"

                class B_SAM_System_02_F {
                    cost = 15000;
                    requirements[] = {};
                    offset[] = {0, 5.3, 0};
                    rearm = 600;
                };  // "Mk21 Centurion"

                class B_Ship_MRLS_01_F {
                    cost = 30000;
                    requirements[] = {};
                    offset[] = {0, 7, 0};
                    rearm = 2700;
                };  // "Mk41 VLS"
            };
        };

        class INDEPENDENT {
            class Vehicles {
                class I_MRAP_03_hmg_F {
                    killReward = 130;
                    capValue = 3;
                };

                class I_MRAP_03_gmg_F {
                    killReward = 130;
                    capValue = 3;
                };

                class I_LT_01_scout_F {
                    killReward = 240;
                    capValue = 4;
                };

                class I_LT_01_AA_F {
                    killReward = 240;
                    capValue = 4;
                };

                class I_LT_01_AT_F {
                    killReward = 240;
                    capValue = 4;
                };

                class I_LT_01_cannon_F {
                    killReward = 240;
                    capValue = 4;
                };

                class I_MBT_03_cannon_F {
                    killReward = 400;
                    capValue = 5;
                };

                class I_APC_Wheeled_03_cannon_F {
                    killReward = 400;
                    capValue = 5;
                };

                class I_APC_tracked_03_cannon_F {
                    killReward = 400;
                    capValue = 5;
                };

                class I_Heli_light_03_F {
                    killReward = 300;
                };

                class I_Plane_Fighter_03_CAS_F {
                    killReward = 500;
                };
            };
        };
    };
};