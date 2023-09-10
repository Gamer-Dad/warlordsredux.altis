#include "..\warlords_constants.inc"

//CP databse
serverNamespace setVariable ["fundsDatabase", createHashMap];

// Rewards
serverNamespace setVariable ["BIS_WL2_killRewards", 
	createHashMapFromArray [
		//NATO
		["B_Quadbike_01_F", 20], ["B_LSV_01_unarmed_F", 50], ["B_MRAP_01_F", 70],
		["B_Truck_01_transport_F", 80], ["B_Truck_01_fuel_F", 80],
		["B_LSV_01_armed_F", 150], ["B_G_Offroad_01_armed_F", 150], ["B_LSV_01_AT_F", 200], ["B_G_Offroad_01_AT_F", 180],
		["B_Truck_01_flatbed_F", 80], ["B_Truck_01_medical_F", 100],
		["B_MRAP_01_hmg_F", 250], ["B_MRAP_01_gmg_F", 250],
		["B_Truck_01_Repair_F", 80], ["O_T_Truck_03_device_ghex_F", 200], ["B_Truck_01_ammo_F", 80],
		["B_APC_Wheeled_03_cannon_F", 300], ["B_APC_Wheeled_01_cannon_F", 300], ["B_APC_Tracked_01_rcws_F", 300],
		["B_APC_Tracked_01_AA_F", 350],
		["B_MBT_01_cannon_F", 450], ["B_MBT_01_TUSK_F", 500],
		["B_AFV_Wheeled_01_cannon_F", 450], ["B_AFV_Wheeled_01_up_cannon_F", 500],
		["B_MBT_01_arty_F", 600], ["B_MBT_01_mlrs_F", 600],
		["B_Heli_Light_01_F", 100], ["B_Heli_Light_01_dynamicLoadout_F", 200],
		["B_Heli_Transport_01_F", 100], ["B_Heli_Transport_03_F", 100],
		["B_UAV_02_dynamicLoadout_F", 600], ["B_T_UAV_03_dynamicLoadout_F", 600], ["B_UAV_05_F", 650],
		["B_Heli_Attack_01_dynamicLoadout_F", 550],
		["B_T_VTOL_01_infantry_F", 300], ["B_T_VTOL_01_vehicle_F", 300], ["B_T_VTOL_01_armed_F", 350],
		["B_Plane_CAS_01_dynamicLoadout_F", 800], ["B_Plane_Fighter_01_F", 1000], ["B_Plane_Fighter_01_Stealth_F", 1000],
		["C_Scooter_Transport_01_F", 20], ["B_Boat_Transport_01_F", 20], ["B_Boat_Armed_01_minigun_F", 80], ["B_SDV_01_F", 20],
		//Boxes
		["Box_NATO_Ammo_F", 40], ["Box_NATO_Grenades_F", 40], ["Box_NATO_Wps_F", 40], ["Box_NATO_AmmoOrd_F", 40], ["Box_NATO_WpsLaunch_F", 40], ["Box_NATO_WpsSpecial_F", 40], ["B_supplyCrate_F", 40], ["Box_NATO_AmmoVeh_F", 70],
		["B_UGV_02_Demining_F", 100], ["B_UGV_01_F", 50], ["B_UGV_01_rcws_F", 100],
		["Land_BagFence_Round_F", 30], ["Land_Razorwire_F", 30], ["Land_DragonsTeeth_01_1x1_new_F", 30],
		["B_HMG_01_F", 100], ["B_HMG_01_high_F", 100], ["B_GMG_01_F", 100], ["B_GMG_01_high_F", 100],
		["B_static_AT_F", 100], ["B_static_AA_F", 100], ["B_Mortar_01_F", 125],
		//Static
		["B_Radar_System_01_F", 350], ["B_UAV_01_F", 20],
		["B_AAA_System_01_F", 400], ["B_SAM_System_01_F", 500], ["B_SAM_System_03_F", 500],
		["B_SAM_System_02_F", 600], ["B_Ship_MRLS_01_F", 700],
		//CSAT
		["O_Quadbike_01_F", 20], ["O_LSV_02_unarmed_F", 50], ["O_MRAP_02_F", 70],
		["O_Truck_03_transport_F", 80], ["O_Truck_03_Fuel_F", 80],
		["O_LSV_02_armed_F", 150], ["O_G_Offroad_01_armed_F", 150], ["O_LSV_02_AT_F", 200], ["O_G_Offroad_01_AT_F", 180],
		["B_Truck_01_flatbed_F", 80], ["O_Truck_03_medical_F", 100],
		["O_MRAP_02_hmg_F", 250], ["O_MRAP_02_gmg_F", 250],
		["O_Truck_03_Repair_F", 80], ["O_Truck_03_device_F", 200], ["O_Truck_03_ammo_F", 80],
		["O_APC_Wheeled_02_rcws_v2_F", 300], ["O_APC_Tracked_02_cannon_F", 350],
		["O_APC_Tracked_02_AA_F", 350],
		["O_MBT_02_cannon_F", 500], ["O_MBT_04_cannon_F", 550], ["O_MBT_04_command_F", 600],
		["O_MBT_02_arty_F", 600], ["I_Truck_02_MRL_F", 600],
		["O_Heli_Light_02_unarmed_F", 125], ["O_Heli_Light_02_dynamicLoadout_F", 300],
		["O_Heli_Transport_04_F", 100], ["O_Heli_Transport_04_covered_F", 100], ["O_Heli_Transport_04_medevac_F", 100],
		["O_UAV_02_dynamicLoadout_F", 600], ["O_T_UAV_04_CAS_F", 600],
		["O_Heli_Attack_02_dynamicLoadout_F", 550],
		["O_T_VTOL_02_vehicle_dynamicLoadout_F", 600],
		["O_Plane_CAS_02_dynamicLoadout_F", 900], ["O_Plane_Fighter_02_F", 1100], ["O_Plane_Fighter_02_Stealth_F", 1100],
		["C_Scooter_Transport_01_F", 20], ["O_Boat_Transport_01_F", 20], ["O_Boat_Armed_01_hmg_F", 80], ["O_SDV_01_F", 20],
		//Boxes
		["Box_East_Ammo_F", 40], ["Box_East_Grenades_F", 40], ["Box_East_Wps_F", 40], ["Box_East_AmmoOrd_F", 40], ["Box_East_WpsLaunch_F", 40], ["Box_East_WpsSpecial_F", 40], ["O_supplyCrate_F", 40], ["Box_East_AmmoVeh_F", 70],
		["O_UGV_02_Demining_F", 100], ["O_UGV_01_F", 50], ["O_UGV_01_rcws_F", 100],
		["Land_BagFence_Round_F", 30], ["Land_Razorwire_F", 30], ["Land_DragonsTeeth_01_1x1_new_F", 30],
		["O_HMG_01_F", 100], ["O_HMG_01_high_F", 100], ["O_GMG_01_F", 100], ["O_GMG_01_high_F", 100],
		["O_static_AT_F", 100], ["O_static_AA_F", 100], ["O_Mortar_01_F", 125],
		["B_Slingload_01_Ammo_F", 150], ["B_Slingload_01_Repair_F", 150], ["B_Slingload_01_Fuel_F", 150],
		["Land_Pod_Heli_Transport_04_ammo_F", 150], ["Land_Pod_Heli_Transport_04_repair_F", 150], ["Land_Pod_Heli_Transport_04_fuel_F", 150],
		["B_Slingload_01_Medevac_F", 300], ["Land_Pod_Heli_Transport_04_medevac_F", 300],
		//Static
		["O_Radar_System_02_F", 350], ["O_UAV_01_F", 20], ["O_SAM_System_04_F", 500],
		//AAF
		["I_MRAP_03_hmg_F", 130], ["I_MRAP_03_gmg_F", 130],
		["I_LT_01_scout_F", 240], ["I_LT_01_AA_F", 240], ["I_LT_01_AT_F", 240], ["I_LT_01_cannon_F", 240],
		["I_MBT_03_cannon_F", 400], ["I_APC_Wheeled_03_cannon_F", 400], ["I_APC_tracked_03_cannon_F", 400],
		["I_Heli_light_03_dynamicLoadout_F", 300], ["I_Heli_light_03_F", 300], ["I_Plane_Fighter_03_dynamicLoadout_F", 600], ["I_Plane_Fighter_03_CAS_F", 500], ["I_Plane_Fighter_04_F", 600]
	]
];

//Capture Points
serverNamespace setVariable ["BIS_WL2_cappingValues",
	createHashMapFromArray [
		//NATO
		["B_Quadbike_01_F", 1], ["B_LSV_01_unarmed_F", 1], ["B_MRAP_01_F", 1], //Unarmed
		["B_Truck_01_transport_F", 1], ["B_Truck_01_fuel_F", 1], //Unarmed
		["B_LSV_01_armed_F", 1], ["B_G_Offroad_01_armed_F", 1], ["B_LSV_01_AT_F", 1], ["B_G_Offroad_01_AT_F", 1],
		["B_Truck_01_flatbed_F", 1], ["B_Truck_01_medical_F", 1], //Unarmed
		["B_MRAP_01_hmg_F", 2], ["B_MRAP_01_gmg_F", 2],
		["B_Truck_01_Repair_F", 1], ["O_T_Truck_03_device_ghex_F", 1], ["B_Truck_01_ammo_F", 1], //Unarmed
		["B_APC_Wheeled_03_cannon_F", 3], ["B_APC_Wheeled_01_cannon_F", 3], ["B_APC_Tracked_01_rcws_F", 3],
		["B_APC_Tracked_01_AA_F", 4],
		["B_MBT_01_cannon_F", 4], ["B_MBT_01_TUSK_F", 4],
		["B_AFV_Wheeled_01_cannon_F", 4], ["B_AFV_Wheeled_01_up_cannon_F", 4],
		["B_MBT_01_arty_F", 4], ["B_MBT_01_mlrs_F", 4],
		//CSAT
		["O_Quadbike_01_F", 1], ["O_LSV_02_unarmed_F", 1], ["O_MRAP_02_F", 1], //Unarmed
		["O_Truck_03_transport_F", 1], ["O_Truck_03_Fuel_F", 1], //Unarmed
		["O_LSV_02_armed_F", 1], ["O_G_Offroad_01_armed_F", 1], ["O_LSV_02_AT_F", 1], ["O_G_Offroad_01_AT_F", 1],
		["B_Truck_01_flatbed_F", 1], ["O_Truck_03_medical_F", 1], //Unarmed
		["O_MRAP_02_hmg_F", 2], ["O_MRAP_02_gmg_F", 2],
		["O_Truck_03_Repair_F", 1], ["O_Truck_03_device_F", 1], ["O_Truck_03_ammo_F", 1], //Unarmed
		["O_APC_Wheeled_02_rcws_v2_F", 3], ["O_APC_Tracked_02_cannon_F", 3],
		["O_APC_Tracked_02_AA_F", 4],
		["O_MBT_02_cannon_F", 4], ["O_MBT_04_cannon_F", 4], ["O_MBT_04_command_F", 4],
		["O_MBT_02_arty_F", 4], ["I_Truck_02_MRL_F", 4],
		//AAF
		["I_MRAP_03_hmg_F", 3], ["I_MRAP_03_gmg_F", 3],
		["I_LT_01_scout_F", 4], ["I_LT_01_AA_F", 4], ["I_LT_01_AT_F", 4], ["I_LT_01_cannon_F", 4],
		["I_MBT_03_cannon_F", 5], ["I_APC_Wheeled_03_cannon_F", 5], ["I_APC_tracked_03_cannon_F", 5]
	]
];

// Prices
serverNamespace setVariable ["BIS_WL2_costs",
	createHashMapFromArray [
		//Infantry
		["B_Soldier_F", 20], ["B_soldier_PG_F", 25], ["B_CTRG_Soldier_tna_F", 30], ["B_crew_F", 15], ["B_Helipilot_F", 10], ["B_Pilot_F", 10], ["B_Soldier_GL_F", 50], ["B_medic_F", 20], 
		["B_soldier_AR_F", 50], ["B_Soldier_A_F", 25], ["B_soldier_M_F", 60], ["B_diver_F", 50], ["B_diver_exp_F", 80], ["B_soldier_repair_F", 100], ["B_HeavyGunner_F", 80],
		["B_soldier_LAT_F", 100], ["B_soldier_LAT2_F", 100], ["B_CTRG_Soldier_LAT_tna_F", 150], ["B_soldier_AT_F", 150], ["B_soldier_AA_F", 150], ["B_Sharpshooter_F", 80],
		["B_sniper_F", 100], ["B_Captain_Dwarden_F", 150], 
		
		["O_Soldier_F", 20], ["O_soldier_PG_F", 25], ["O_V_Soldier_hex_F", 40], ["O_crew_F", 15], ["O_Helipilot_F", 10], ["O_Pilot_F", 10], ["O_Soldier_GL_F", 50], ["O_medic_F", 20], ["O_soldier_AR_F", 50],
		["O_Soldier_A_F", 25], ["O_soldier_M_F", 60], ["O_diver_F", 50], ["O_diver_exp_F", 80], ["O_soldier_repair_F", 100], ["O_HeavyGunner_F", 80], ["O_soldier_LAT_F", 100], ["O_V_Soldier_LAT_hex_F", 150],
		["O_soldier_AT_F", 150], ["O_Soldier_AA_F", 150], ["O_Sharpshooter_F", 80], ["O_sniper_F", 100], ["O_soldier_HAT_F", 200], 
		
		//Vehicles
		["B_Quadbike_01_F", 20], ["B_LSV_01_unarmed_F", 100], ["B_MRAP_01_F", 300], ["B_LSV_01_armed_F", 300], ["B_G_Offroad_01_armed_F", 150], ["B_LSV_01_AT_F", 750], ["B_G_Offroad_01_AT_F", 500],
		["B_MRAP_01_hmg_F", 1000], ["B_MRAP_01_gmg_F", 1250], ["B_Truck_01_ammo_F", 1000], ["B_Truck_01_Repair_F", 1000], ["B_Truck_01_fuel_F", 1000], ["O_T_Truck_03_device_ghex_F", 1500],
		["B_Truck_01_transport_F", 200], ["B_Truck_01_flatbed_F", 500], ["B_APC_Wheeled_03_cannon_F", 2500], ["B_APC_Wheeled_01_cannon_F", 3200], ["B_APC_Tracked_01_rcws_F", 1800], ["B_APC_Tracked_01_AA_F", 5000],
		["B_AFV_Wheeled_01_cannon_F", 4000], ["B_AFV_Wheeled_01_up_cannon_F", 4500], ["B_MBT_01_cannon_F", 6000], ["B_MBT_01_TUSK_F", 7000], ["B_MBT_01_arty_F", 20000], ["B_MBT_01_mlrs_F", 20000], 
		
		["O_Quadbike_01_F", 20], ["O_LSV_02_unarmed_F", 100], ["O_MRAP_02_F", 300], ["O_LSV_02_armed_F", 300], ["O_G_Offroad_01_armed_F", 150], ["O_LSV_02_AT_F", 750], ["O_G_Offroad_01_AT_F", 500],
		["O_MRAP_02_hmg_F", 1000], ["O_MRAP_02_gmg_F", 1250], ["O_Truck_03_ammo_F", 1000], ["O_Truck_03_Repair_F", 1000], ["O_Truck_03_Fuel_F", 1000],  ["O_Truck_03_device_F", 1500],
		["O_Truck_03_transport_F", 200], ["B_Truck_01_flatbed_F", 500], ["O_APC_Wheeled_02_rcws_v2_F", 1500], ["O_APC_Tracked_02_cannon_F", 2800], ["O_APC_Tracked_02_AA_F", 5000], ["O_MBT_02_cannon_F", 8000],
		["O_MBT_04_cannon_F", 13000], ["O_MBT_04_command_F", 15000], ["O_MBT_02_railgun_F", 16000],["O_MBT_02_arty_F", 20000], ["I_Truck_02_MRL_F", 18000], 
		
		//Aircraft
		["B_Heli_Light_01_F", 300], ["B_Heli_Transport_01_F", 800], ["B_Heli_Transport_03_F", 1000], ["B_Heli_Light_01_dynamicLoadout_F", 4000],
		["B_UAV_02_dynamicLoadout_F", 12000], ["B_Heli_Attack_01_dynamicLoadout_F", 13000], ["B_T_UAV_03_dynamicLoadout_F", 16000], ["B_UAV_05_F", 18000],
		["B_T_VTOL_01_infantry_F", 2000], ["B_T_VTOL_01_vehicle_F", 2000], ["B_T_VTOL_01_armed_F", 8000], ["B_Plane_CAS_01_dynamicLoadout_F", 15000], ["B_Plane_Fighter_01_F", 30000], ["B_Plane_Fighter_01_Stealth_F", 30000],
		
		["O_Heli_Light_02_unarmed_F", 500], ["O_Heli_Transport_04_F", 500], ["O_Heli_Transport_04_covered_F", 400], ["O_Heli_Transport_04_medevac_F", 500], ["O_Heli_Light_02_dynamicLoadout_F", 6500], 
		["O_T_UAV_04_CAS_F", 8000], ["O_Heli_Attack_02_dynamicLoadout_F", 10000], ["O_UAV_02_dynamicLoadout_F", 12000], ["O_T_VTOL_02_vehicle_dynamicLoadout_F", 15000],
		["O_Plane_CAS_02_dynamicLoadout_F", 20000], ["O_Plane_Fighter_02_F", 32000], ["O_Plane_Fighter_02_Stealth_F", 32000],
		
		//Naval
		["C_Scooter_Transport_01_F", 50], ["B_Boat_Transport_01_F", 100], ["B_Boat_Armed_01_minigun_F", 500], ["B_SDV_01_F", 250],
		
		["O_Boat_Transport_01_F", 100], ["O_Boat_Armed_01_hmg_F", 500], ["O_SDV_01_F", 250],
		
		//Gear
		["Box_NATO_Ammo_F", 50], ["Box_NATO_Grenades_F", 50], ["Box_NATO_Wps_F", 100], ["Box_NATO_Uniforms_F", 100], ["Box_NATO_Equip_F", 100], ["Box_NATO_AmmoOrd_F", 150], ["Box_NATO_WpsLaunch_F", 200], ["Box_NATO_WpsSpecial_F", 250], 
		["B_supplyCrate_F", 300], ["Box_NATO_AmmoVeh_F", 250], ["B_Slingload_01_Ammo_F", 500], ["B_Slingload_01_Repair_F", 500], ["B_Slingload_01_Fuel_F", 300],
		
		["Box_East_Ammo_F", 50], ["Box_East_Grenades_F", 50], ["Box_East_Wps_F", 100], ["Box_CSAT_Uniforms_F", 100], ["Box_CSAT_Equip_F", 100], ["Box_East_AmmoOrd_F", 150], ["Box_East_WpsLaunch_F", 200], ["Box_East_WpsSpecial_F", 250],
		["O_supplyCrate_F", 300], ["Box_East_AmmoVeh_F", 250], ["Land_Pod_Heli_Transport_04_ammo_F", 500], ["Land_Pod_Heli_Transport_04_repair_F", 500], ["Land_Pod_Heli_Transport_04_fuel_F", 300],
		
		//Defences
		["Land_BagFence_Round_F", 50], ["Land_Razorwire_F", 50], ["Land_DragonsTeeth_01_1x1_new_F", 50], ["CamoNet_BLUFOR_big_F", 100], ["Land_IRMaskingCover_01_F", 200],
		["B_HMG_01_F", 150], ["B_HMG_01_high_F", 4200], ["B_GMG_01_F", 200], ["B_GMG_01_high_F", 250], ["B_HMG_01_A_F", 500], ["B_GMG_01_A_F", 650], ["B_static_AT_F", 300], ["B_static_AA_F", 300], ["B_Mortar_01_F", 3000],
		["B_UGV_02_Demining_F", 100], ["B_UGV_01_F", 150], ["B_UGV_01_rcws_F", 400], ["B_UAV_01_F", 500], ["B_Ship_Gun_01_F", 10000], ["B_Radar_System_01_F", 1000],
		["B_AAA_System_01_F", 3500], ["B_SAM_System_01_F", 10000], ["B_SAM_System_03_F", 8000], ["B_SAM_System_02_F", 15000], ["B_Ship_MRLS_01_F", 30000],


		["O_HMG_01_F", 150], ["O_HMG_01_high_F", 200], ["O_GMG_01_F", 200], ["O_GMG_01_high_F", 250], ["O_HMG_01_A_F", 500], ["O_GMG_01_A_F", 650], ["O_static_AT_F", 300], ["O_static_AA_F", 300], ["O_Mortar_01_F", 3000],
		["O_UGV_02_Demining_F", 100], ["O_UGV_01_F", 150], ["O_UGV_01_rcws_F", 400], ["O_UAV_01_F", 500], ["O_Radar_System_02_F", 1000], ["O_SAM_System_04_F", 8000]
	]
];