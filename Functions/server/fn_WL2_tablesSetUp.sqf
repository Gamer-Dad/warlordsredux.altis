#include "..\warlords_constants.inc"

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
		["B_Plane_CAS_01_dynamicLoadout_F", 800], ["B_Plane_Fighter_01_F", 1000],
		["C_Scooter_Transport_01_F", 20], ["B_Boat_Transport_01_F", 20], ["B_Boat_Armed_01_minigun_F", 80], ["B_SDV_01_F", 20],
		//Boxes
		["Box_NATO_Ammo_F", 40], ["Box_NATO_Grenades_F", 40], ["Box_NATO_Wps_F", 40], ["Box_NATO_AmmoOrd_F", 40], ["Box_NATO_WpsLaunch_F", 40], ["Box_NATO_WpsSpecial_F", 40], ["B_supplyCrate_F", 40], ["Box_NATO_AmmoVeh_F", 70], // Boxes 
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
		["O_Plane_CAS_02_dynamicLoadout_F", 900], ["O_Plane_Fighter_02_F", 1100],
		["C_Scooter_Transport_01_F", 20], ["O_Boat_Transport_01_F", 20], ["O_Boat_Armed_01_hmg_F", 80], ["O_SDV_01_F", 20],
		//Boxes
		["Box_East_Ammo_F", 40], ["Box_East_Grenades_F", 40], ["Box_East_Wps_F", 40], ["Box_East_AmmoOrd_F", 40], ["Box_East_WpsLaunch_F", 40], ["Box_East_WpsSpecial_F", 40], ["O_supplyCrate_F", 40], ["Box_East_AmmoVeh_F", 70], // Boxes 
		["O_UGV_02_Demining_F", 100], ["O_UGV_01_F", 50], ["O_UGV_01_rcws_F", 100],
		["Land_BagFence_Round_F", 30], ["Land_Razorwire_F", 30], ["Land_DragonsTeeth_01_1x1_new_F", 30],
		["O_HMG_01_F", 100], ["O_HMG_01_high_F", 100], ["O_GMG_01_F", 100], ["O_GMG_01_high_F", 100],
		["O_static_AT_F", 100], ["O_static_AA_F", 100], ["O_Mortar_01_F", 125],
		["B_Slingload_01_Ammo_F", 150], ["B_Slingload_01_Repair_F", 150], ["B_Slingload_01_Fuel_F", 150],
		["Land_Pod_Heli_Transport_04_ammo_F", 150], ["Land_Pod_Heli_Transport_04_repair_F", 150], ["Land_Pod_Heli_Transport_04_fuel_F", 150],
		["B_Slingload_01_Medevac_F", 300], ["Land_Pod_Heli_Transport_04_medevac_F", 300],
		//Static
		["O_Radar_System_02_F", 350], ["O_UAV_01_F", 20],
		["B_AAA_System_01_F", 400], ["B_SAM_System_01_F", 500], ["O_SAM_System_04_F", 500],
		["B_SAM_System_02_F", 600], ["B_Ship_MRLS_01_F", 700],
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
		["B_Quadbike_01_F", 0], ["B_LSV_01_unarmed_F", 0], ["B_MRAP_01_F", 0],
		["B_Truck_01_transport_F", 0], ["B_Truck_01_fuel_F", 0],
		["B_LSV_01_armed_F", 0], ["B_G_Offroad_01_armed_F", 0], ["B_LSV_01_AT_F", 0], ["B_G_Offroad_01_AT_F", 0],
		["B_Truck_01_flatbed_F", 0], ["B_Truck_01_medical_F", 0],
		["B_MRAP_01_hmg_F", 0], ["B_MRAP_01_gmg_F", 0],
		["B_Truck_01_Repair_F", 0], ["O_T_Truck_03_device_ghex_F", 0], ["B_Truck_01_ammo_F", 80],
		["B_APC_Wheeled_03_cannon_F", 0], ["B_APC_Wheeled_01_cannon_F", 0], ["B_APC_Tracked_01_rcws_F", 0],
		["B_APC_Tracked_01_AA_F", 0],
		["B_MBT_01_cannon_F", 0], ["B_MBT_01_TUSK_F", 0],
		["B_AFV_Wheeled_01_cannon_F", 0], ["B_AFV_Wheeled_01_up_cannon_F", 0],
		["B_MBT_01_arty_F", 0], ["B_MBT_01_mlrs_F", 0],
		["B_Heli_Light_01_F", 0], ["B_Heli_Light_01_dynamicLoadout_F", 0],
		["B_Heli_Transport_01_F", 0], ["B_Heli_Transport_03_F", 0],
		["B_UAV_02_dynamicLoadout_F", 0], ["B_T_UAV_03_dynamicLoadout_F", 0], ["B_UAV_05_F", 0],
		["B_Heli_Attack_01_dynamicLoadout_F", 0],
		["B_T_VTOL_01_infantry_F", 0], ["B_T_VTOL_01_vehicle_F", 0], ["B_T_VTOL_01_armed_F", 0],
		["B_Plane_CAS_01_dynamicLoadout_F", 0], ["B_Plane_Fighter_01_F", 0],
		["C_Scooter_Transport_01_F", 0], ["B_Boat_Transport_01_F", 0], ["B_Boat_Armed_01_minigun_F", 0], ["B_SDV_01_F", 0],
		//Boxes
		["Box_NATO_Ammo_F", 0], ["Box_NATO_Grenades_F", 0], ["Box_NATO_Wps_F", 0], ["Box_NATO_AmmoOrd_F", 0], ["Box_NATO_WpsLaunch_F", 0], ["Box_NATO_WpsSpecial_F", 0], ["B_supplyCrate_F", 0], ["Box_NATO_AmmoVeh_F", 0], // Boxes 
		["B_UGV_02_Demining_F", 0], ["B_UGV_01_F", 0], ["B_UGV_01_rcws_F", 0],
		["Land_BagFence_Round_F", 0], ["Land_Razorwire_F", 0], ["Land_DragonsTeeth_01_1x1_new_F", 0],
		["B_HMG_01_F", 0], ["B_HMG_01_high_F", 0], ["B_GMG_01_F", 0], ["B_GMG_01_high_F", 0],
		["B_static_AT_F", 0], ["B_static_AA_F", 0], ["B_Mortar_01_F", 0],
		//Static
		["B_Radar_System_01_F", 0], ["B_UAV_01_F", 0],
		["B_AAA_System_01_F", 0], ["B_SAM_System_01_F", 0], ["B_SAM_System_03_F", 0],
		["B_SAM_System_02_F", 0], ["B_Ship_MRLS_01_F", 0],
		//CSAT
		["O_Quadbike_01_F", 0], ["O_LSV_02_unarmed_F", 0], ["O_MRAP_02_F", 0],
		["O_Truck_03_transport_F", 0], ["O_Truck_03_Fuel_F", 0],
		["O_LSV_02_armed_F", 0], ["O_G_Offroad_01_armed_F", 0], ["O_LSV_02_AT_F", 0], ["O_G_Offroad_01_AT_F", 0],
		["B_Truck_01_flatbed_F", 0], ["O_Truck_03_medical_F", 0],
		["O_MRAP_02_hmg_F", 0], ["O_MRAP_02_gmg_F", 0],
		["O_Truck_03_Repair_F", 0], ["O_Truck_03_device_F", 0], ["O_Truck_03_ammo_F", 0],
		["O_APC_Wheeled_02_rcws_v2_F", 0], ["O_APC_Tracked_02_cannon_F", 0],
		["O_APC_Tracked_02_AA_F", 0],
		["O_MBT_02_cannon_F", 0], ["O_MBT_04_cannon_F", 0], ["O_MBT_04_command_F", 0],
		["O_MBT_02_arty_F", 0], ["I_Truck_02_MRL_F", 0],
		["O_Heli_Light_02_unarmed_F", 0], ["O_Heli_Light_02_dynamicLoadout_F", 0],
		["O_Heli_Transport_04_F", 0], ["O_Heli_Transport_04_covered_F", 0], ["O_Heli_Transport_04_medevac_F", 0],
		["O_UAV_02_dynamicLoadout_F", 0], ["O_T_UAV_04_CAS_F", 0],
		["O_Heli_Attack_02_dynamicLoadout_F", 0],
		["O_T_VTOL_02_vehicle_dynamicLoadout_F", 0],
		["O_Plane_CAS_02_dynamicLoadout_F", 0], ["O_Plane_Fighter_02_F", 0],
		["C_Scooter_Transport_01_F", 0], ["O_Boat_Transport_01_F", 0], ["O_Boat_Armed_01_hmg_F", 0], ["O_SDV_01_F", 0],
		//Boxes
		["Box_East_Ammo_F", 0], ["Box_East_Grenades_F", 0], ["Box_East_Wps_F", 0], ["Box_East_AmmoOrd_F", 0], ["Box_East_WpsLaunch_F", 0], ["Box_East_WpsSpecial_F", 0], ["O_supplyCrate_F", 0], ["Box_East_AmmoVeh_F", 0], // Boxes 
		["O_UGV_02_Demining_F", 0], ["O_UGV_01_F", 0], ["O_UGV_01_rcws_F", 0],
		["Land_BagFence_Round_F", 0], ["Land_Razorwire_F", 0], ["Land_DragonsTeeth_01_1x1_new_F", 0],
		["O_HMG_01_F", 0], ["O_HMG_01_high_F", 0], ["O_GMG_01_F", 0], ["O_GMG_01_high_F", 0],
		["O_static_AT_F", 0], ["O_static_AA_F", 0], ["O_Mortar_01_F", 0],
		["B_Slingload_01_Ammo_F", 0], ["B_Slingload_01_Repair_F", 0], ["B_Slingload_01_Fuel_F", 0],
		["Land_Pod_Heli_Transport_04_ammo_F", 0], ["Land_Pod_Heli_Transport_04_repair_F", 0], ["Land_Pod_Heli_Transport_04_fuel_F", 0],
		["B_Slingload_01_Medevac_F", 0], ["Land_Pod_Heli_Transport_04_medevac_F", 0],
		//Static
		["O_Radar_System_02_F", 0], ["O_UAV_01_F", 0],
		["B_AAA_System_01_F", 0], ["B_SAM_System_01_F", 0], ["O_SAM_System_04_F", 0],
		["B_SAM_System_02_F", 0], ["B_Ship_MRLS_01_F", 0],
		//AAF
		["I_MRAP_03_hmg_F", 0], ["I_MRAP_03_gmg_F", 0],
		["I_LT_01_scout_F", 0], ["I_LT_01_AA_F", 0], ["I_LT_01_AT_F", 0], ["I_LT_01_cannon_F", 0],
		["I_MBT_03_cannon_F", 0], ["I_APC_Wheeled_03_cannon_F", 0], ["I_APC_tracked_03_cannon_F", 0<],
		["I_Heli_light_03_dynamicLoadout_F", 0], ["I_Heli_light_03_F", 0], ["I_Plane_Fighter_03_dynamicLoadout_F", 0], ["I_Plane_Fighter_03_CAS_F", 0], ["I_Plane_Fighter_04_F", 0]
	]
];