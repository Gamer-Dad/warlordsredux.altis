serverNamespace setVariable ["fundsDatabase", createHashMap];
serverNamespace setVariable ["playerList", createHashMap];

serverNamespace setVariable ["WL2_killRewards",
	createHashMapFromArray [
		//***blufor Vics kill value***/
		["B_Quadbike_01_F", 20], 
		["B_LSV_01_unarmed_F", 50], 
		["B_MRAP_01_F", 70],
		["B_Truck_01_transport_F", 80], 
		["B_Truck_01_fuel_F", 80],
		["B_LSV_01_armed_F", 150], 
		["B_G_Offroad_01_armed_F", 150], 
		["B_LSV_01_AT_F", 200], 
		["B_G_Offroad_01_AT_F", 180],
		["B_Truck_01_flatbed_F", 80], 
		["B_Truck_01_medical_F", 100],
		["B_APC_Tracked_01_CRV_F", 300],
		["B_MRAP_01_hmg_F", 250], 
		["B_MRAP_01_gmg_F", 250],
		["B_Truck_01_Repair_F", 80], 
		["O_T_Truck_03_device_ghex_F", 200], 
		["B_Truck_01_ammo_F", 80],
		["B_APC_Wheeled_03_cannon_F", 300], 
		["B_APC_Wheeled_01_cannon_F", 300], 
		["B_APC_Tracked_01_rcws_F", 300],
		["B_APC_Tracked_01_AA_F", 350],
		["B_MBT_01_cannon_F", 450], 
		["B_MBT_01_TUSK_F", 500],
		["B_AFV_Wheeled_01_cannon_F", 450], 
		["B_AFV_Wheeled_01_up_cannon_F", 500],
		["B_MBT_01_arty_F", 600], 
		["B_MBT_01_mlrs_F", 600],
		//***blufor Air kill value***/
		["B_Heli_Light_01_F", 100], 
		["B_Heli_Light_01_dynamicLoadout_F", 200],
		["B_Heli_Transport_01_F", 100], 
		["B_Heli_Transport_03_F", 100],
		["B_UAV_02_dynamicLoadout_F", 600], 
		["B_T_UAV_03_dynamicLoadout_F", 600], 
		["B_UAV_05_F", 650],
		["B_Heli_Attack_01_dynamicLoadout_F", 550],
		["B_T_VTOL_01_infantry_F", 300], 
		["B_T_VTOL_01_vehicle_F", 300], 
		["B_T_VTOL_01_armed_F", 350],
		["B_Plane_CAS_01_dynamicLoadout_F", 800], 
		["B_Plane_Fighter_01_F", 1000], 
		["B_Plane_Fighter_01_Stealth_F", 1000],
		//***Civ Water kill value***/
		["C_Scooter_Transport_01_F", 20], 
		//***Blufor Water kill value***/
		["B_Boat_Transport_01_F", 20], 
		["B_Boat_Armed_01_minigun_F", 80], 
		["B_SDV_01_F", 20],
		//***Blufor crates and defense kill value***/
		["Box_NATO_Ammo_F", 40], 
		["Box_NATO_Grenades_F", 40], 
		["Box_NATO_Wps_F", 40], 
		["Box_NATO_AmmoOrd_F", 40], 
		["Box_NATO_WpsLaunch_F", 40], 
		["Box_NATO_WpsSpecial_F", 40], 
		["B_supplyCrate_F", 40], 
		["Box_NATO_AmmoVeh_F", 70],
		["B_Slingload_01_Ammo_F", 150],
		["B_Slingload_01_Repair_F", 150],
		["B_Slingload_01_Fuel_F", 150],
		["B_Slingload_01_Medevac_F", 300],
		["B_UGV_02_Demining_F", 100], 
		["B_UGV_01_F", 50], 
		["B_UGV_01_rcws_F", 100],
		["Land_BagFence_Round_F", 30], 
		["Land_Razorwire_F", 30], 
		["Land_DragonsTeeth_01_1x1_new_F", 30],
		["Land_Communication_F", 100],
		["B_HMG_01_F", 100], 
		["B_HMG_01_high_F", 100], 
		["B_GMG_01_F", 100], 
		["B_GMG_01_high_F", 100], 
		["B_HMG_01_A_F", 150], 
		["B_GMG_01_A_F", 150],
		["B_static_AT_F", 100], 
		["B_static_AA_F", 100], 
		["B_Mortar_01_F", 125],
		["B_Radar_System_01_F", 350], 
		["B_UAV_01_F", 100],
		["B_UAV_06_F", 200],
		["B_AAA_System_01_F", 400], 
		["B_SAM_System_01_F", 500], 
		["B_SAM_System_03_F", 500],
		["B_SAM_System_02_F", 600], 
		["B_Ship_MRLS_01_F", 700],
		//***OPFOR Vics kill value***/
		["O_Quadbike_01_F", 20], 
		["O_LSV_02_unarmed_F", 50], 
		["O_MRAP_02_F", 70],
		["O_Truck_03_transport_F", 80], 
		["O_Truck_03_Fuel_F", 80],
		["O_LSV_02_armed_F", 150], 
		["O_G_Offroad_01_armed_F", 150], 
		["O_LSV_02_AT_F", 200], 
		["O_G_Offroad_01_AT_F", 180],
		["B_Truck_01_flatbed_F", 80], 
		["O_Truck_03_medical_F", 100],
		["O_MRAP_02_hmg_F", 250], 
		["O_MRAP_02_gmg_F", 250],
		["O_Truck_03_Repair_F", 80], 
		["O_Truck_03_device_F", 200], 
		["O_Truck_03_ammo_F", 80],
		["O_APC_Wheeled_02_rcws_v2_F", 300], 
		["O_APC_Tracked_02_cannon_F", 350],
		["O_APC_Tracked_02_AA_F", 350],
		["O_MBT_02_cannon_F", 500], 
		["O_MBT_04_cannon_F", 550], 
		["O_MBT_04_command_F", 600], 
		["O_MBT_02_railgun_F", 500],
		["O_MBT_02_arty_F", 600], 
		["I_Truck_02_MRL_F", 600],
		//***OPFOR Air kill value***/
		["O_Heli_Light_02_unarmed_F", 125], 
		["O_Heli_Light_02_dynamicLoadout_F", 300],
		["O_Heli_Transport_04_F", 100], 
		["O_Heli_Transport_04_covered_F", 100], 
		["O_Heli_Transport_04_medevac_F", 100],
		["O_UAV_02_dynamicLoadout_F", 600], 
		["O_T_UAV_04_CAS_F", 600],
		["O_Heli_Attack_02_dynamicLoadout_F", 550],
		["O_T_VTOL_02_vehicle_dynamicLoadout_F", 600],
		["O_Plane_CAS_02_dynamicLoadout_F", 900], 
		["O_Plane_Fighter_02_F", 1100], 
		["O_Plane_Fighter_02_Stealth_F", 1100],
		//***Civ Water kill value***/
		["C_Scooter_Transport_01_F", 20], //This is listed twice, see blufor water 
		//***OPFOR Water kill value***/ 
		["O_Boat_Transport_01_F", 20], 
		["O_Boat_Armed_01_hmg_F", 80], 
		["O_SDV_01_F", 20],
		//***OPFOR crates and defense kill value***/
		["Box_East_Ammo_F", 40], 
		["Box_East_Grenades_F", 40], 
		["Box_East_Wps_F", 40], 
		["Box_East_AmmoOrd_F", 40], 
		["Box_East_WpsLaunch_F", 40], 
		["Box_East_WpsSpecial_F", 40], 
		["O_supplyCrate_F", 40], 
		["Box_East_AmmoVeh_F", 70],
		["O_UGV_02_Demining_F", 100], 
		["O_UGV_01_F", 50], 
		["O_UGV_01_rcws_F", 100],
		["Land_BagFence_Round_F", 30], 
		["Land_Razorwire_F", 30], 
		["Land_DragonsTeeth_01_1x1_new_F", 30],
		["O_HMG_01_F", 100], 
		["O_HMG_01_high_F", 100], 
		["O_GMG_01_F", 100], 
		["O_GMG_01_high_F", 100],
		["O_HMG_01_A_F", 150],
		["O_GMG_01_A_F", 150],
		["O_static_AT_F", 100], 
		["O_static_AA_F", 100], 
		["O_Mortar_01_F", 125],
		["Land_Pod_Heli_Transport_04_ammo_F", 150], 
		["Land_Pod_Heli_Transport_04_repair_F", 150], 
		["Land_Pod_Heli_Transport_04_fuel_F", 150],
		["Land_Pod_Heli_Transport_04_medevac_F", 300],
		["O_Radar_System_02_F", 350], 
		["O_UAV_01_F", 100], 
		["O_UAV_06_F", 200], 
		["O_SAM_System_04_F", 500],
		//***Indy vic kill value***/
		["I_MRAP_03_hmg_F", 130], 
		["I_MRAP_03_gmg_F", 130],
		["I_LT_01_scout_F", 240], 
		["I_LT_01_AA_F", 240], 
		["I_LT_01_AT_F", 240], 
		["I_LT_01_cannon_F", 240],
		["I_MBT_03_cannon_F", 400], 
		["I_APC_Wheeled_03_cannon_F", 400], 
		["I_APC_tracked_03_cannon_F", 400],
		//***Indy air kill value***/
		["I_Heli_light_03_dynamicLoadout_F", 300], 
		["I_Heli_light_03_F", 300], 
		["I_Plane_Fighter_03_dynamicLoadout_F", 600], 
		["I_Plane_Fighter_03_CAS_F", 500], 
		["I_Plane_Fighter_04_F", 600],
		["C_IDAP_UAV_06_antimine_F", 400],
		//***random Civ stuff?***/
		["C_Offroad_02_unarmed_F", -150], //why do these have negative values?
		["C_Plane_Civil_01_F", -250], 
		["C_Plane_Civil_01_racing_F", -250], 
		["C_Heli_Light_01_civil_F", -200], 
		["C_Van_02_medevac_F", -250] //<--no comma on last item
	]
];

serverNamespace setVariable ["WL2_cappingValues",
	createHashMapFromArray [
		//***Blufor Capping values***/
		["B_Quadbike_01_F", 1],
		["B_LSV_01_unarmed_F", 1], 
		["B_MRAP_01_F", 1],
		["B_Truck_01_transport_F", 1], 
		["B_Truck_01_fuel_F", 1],
		["B_LSV_01_armed_F", 1], 
		["B_G_Offroad_01_armed_F", 1], 
		["B_LSV_01_AT_F", 1], 
		["B_G_Offroad_01_AT_F", 1],
		["B_Truck_01_flatbed_F", 1], 
		["B_Truck_01_medical_F", 1],
		["B_MRAP_01_hmg_F", 2], 
		["B_MRAP_01_gmg_F", 2],
		["B_Truck_01_Repair_F", 1], 
		["O_T_Truck_03_device_ghex_F", 1], //<---this thing is blufor?
		["B_Truck_01_ammo_F", 1],
		["B_APC_Tracked_01_CRV_F", 1],
		["B_APC_Wheeled_03_cannon_F", 3], 
		["B_APC_Wheeled_01_cannon_F", 3], 
		["B_APC_Tracked_01_rcws_F", 3],
		["B_APC_Tracked_01_AA_F", 4],
		["B_MBT_01_cannon_F", 4], 
		["B_MBT_01_TUSK_F", 4],
		["B_AFV_Wheeled_01_cannon_F", 4], 
		["B_AFV_Wheeled_01_up_cannon_F", 4],
		["B_MBT_01_arty_F", 4], 
		["B_MBT_01_mlrs_F", 4],
		//***OPFOR Capping values***/
		["O_Quadbike_01_F", 1], 
		["O_LSV_02_unarmed_F", 1], 
		["O_MRAP_02_F", 1],
		["O_Truck_03_transport_F", 1], 
		["O_Truck_03_Fuel_F", 1],
		["O_LSV_02_armed_F", 1], 
		["O_G_Offroad_01_armed_F", 1], 
		["O_LSV_02_AT_F", 1], 
		["O_G_Offroad_01_AT_F", 1],
		["B_Truck_01_flatbed_F", 1], //<---OPFOR? 
		["O_Truck_03_medical_F", 1],
		["O_MRAP_02_hmg_F", 2], 
		["O_MRAP_02_gmg_F", 2],
		["O_Truck_03_Repair_F", 1], 
		["O_Truck_03_device_F", 1], 
		["O_Truck_03_ammo_F", 1],
		["O_APC_Wheeled_02_rcws_v2_F", 3], 
		["O_APC_Tracked_02_cannon_F", 3],
		["O_APC_Tracked_02_AA_F", 4],
		["O_MBT_02_cannon_F", 4], 
		["O_MBT_04_cannon_F", 4], 
		["O_MBT_04_command_F", 4],
		["O_MBT_02_arty_F", 4], 
		//***Indy Capping Values***/
		["I_Truck_02_MRL_F", 4], 
		["O_MBT_02_railgun_F", 4],
		["I_MRAP_03_hmg_F", 3],
		["I_MRAP_03_gmg_F", 3],
		["I_LT_01_scout_F", 4], 
		["I_LT_01_AA_F", 4], 
		["I_LT_01_AT_F", 4], 
		["I_LT_01_cannon_F", 4],
		["I_MBT_03_cannon_F", 5], 
		["I_APC_Wheeled_03_cannon_F", 5], 
		["I_APC_tracked_03_cannon_F", 5]  //<---no comma on final item
	]
];

// Read mission config file for requisition costs
// Hierarchy: CfgWLRequisitionPresets >> preset >> side >> category >> class
private _costHashMap = createHashMap;
private _requisitionPresets = BIS_WL_purchaseListTeplateArr;
{
	private _requisitionPreset = missionConfigFile >> "CfgWLRequisitionPresets" >>_x;
	private _requisitionSides = configProperties [_requisitionPreset];
	{
		private _requisitionCategories = configProperties [_x];
		{
			private _requisitionClasses = configProperties [_x];
			{
				private _requistitonName = configName _x;
				private _requisitionCost = getNumber (_x >> "cost");

				_costHashMap set [_requistitonName, _requisitionCost];
			} forEach _requisitionClasses;
		} forEach _requisitionCategories;
	} forEach _requisitionSides;
} forEach _requisitionPresets;
serverNamespace setVariable ["WL2_costs", _costHashMap];

serverNamespace setVariable ["WL2_factionUnitClasses", [
	[
		"B_Soldier_F",
		"B_Soldier_GL_F",
		"B_soldier_AR_F",
		"B_soldier_AAR_F",
		"B_Soldier_TL_F",
		"B_soldier_M_F",
		"B_soldier_LAT_F",
		"B_soldier_LAT2_F",
		"B_Soldier_A_F",
		"B_Soldier_SL_F",
		"B_medic_F",
		"B_soldier_repair_F",
		"B_soldier_AT_F",
		"B_soldier_AA_F",
		"B_engineer_F",
		"B_soldier_AAT_F",
		"B_soldier_AAA_F",
		"B_Sharpshooter_F",
		"B_HeavyGunner_F",
		"B_soldier_exp_F",
		"B_officer_F",
		"B_spotter_F",
		"B_sniper_F"
	],
	[
		"O_Soldier_F",
		"O_Soldier_GL_F",
		"O_Soldier_AR_F",
		"O_Soldier_AAR_F",
		"O_Soldier_TL_F",
		"O_officer_F",
		"O_soldier_M_F",
		"O_Soldier_LAT_F",
		"O_Soldier_A_F",
		"O_Soldier_SL_F",
		"O_Soldier_AAT_F",
		"O_Soldier_AAA_F",
		"O_Sharpshooter_F",
		"O_HeavyGunner_F",
		"O_Soldier_AT_F",
		"O_Soldier_AA_F",
		"O_engineer_F",
		"O_medic_F",
		"O_soldier_repair_F",
		"O_soldier_exp_F",
		"O_spotter_F",
		"O_sniper_F"
	],
	[
		"I_soldier_F",
		"I_Soldier_GL_F",
		"I_Soldier_AR_F",
		"I_Soldier_AAR_F",
		"I_Soldier_TL_F",
		"I_Soldier_A_F",
		"I_Soldier_M_F",
		"I_Soldier_LAT_F",
		"I_Soldier_LAT2_F",
		"I_Soldier_SL_F",
		"I_Soldier_AAT_F",
		"I_Soldier_AAA_F",
		"I_Soldier_AT_F",
		"I_Soldier_AA_F",
		"I_medic_F",
		"I_Soldier_repair_F",
		"I_engineer_F",
		"I_Soldier_exp_F",
		"I_officer_F",
		"I_Spotter_F",
		"I_Sniper_F"
	]
]];

serverNamespace setVariable ["WL2_factionVehicleClasses", [
	"I_LT_01_AA_F",
	"I_APC_Wheeled_03_cannon_F",
	"I_APC_tracked_03_cannon_F",
	"I_LT_01_AT_F",
	"I_LT_01_cannon_F",
	"I_MRAP_03_gmg_F",
	"I_MRAP_03_hmg_F",
	"I_MBT_03_cannon_F"
]];

serverNamespace setVariable ["WL2_factionAircraftClasses", [
	"I_Plane_Fighter_03_dynamicLoadout_F",
	"I_Heli_light_03_dynamicLoadout_F",
	"I_Plane_Fighter_04_F"
]];

serverNamespace setVariable ["garbageCollector", 
	createHashMapFromArray [
		["B_Ejection_Seat_Plane_Fighter_01_F", true],
		["O_Ejection_Seat_Plane_Fighter_02_F", true],
		["I_Ejection_Seat_Plane_Fighter_03_F", true],
		["B_Ejection_Seat_Plane_CAS_01_F", true],
		["O_Ejection_Seat_Plane_CAS_02_F", true],
		["Plane_Fighter_03_Canopy_F", true],
		["Plane_CAS_02_Canopy_F", true],
		["Plane_CAS_01_Canopy_F", true],
		["Plane_Fighter_01_Canopy_F", true],
		["Plane_Fighter_02_Canopy_F", true],
		["Plane_Fighter_04_Canopy_F", true] //<--no comma on last item
	]
];

serverNamespace setVariable ["staticsGarbageCollector", 
	createHashMapFromArray [
		["CamoNet_BLUFOR_big_F", true],
		["CamoNet_OPFOR_big_F", true],
		["Land_IRMaskingCover_01_F", true],
		["Land_Communication_F", true]
	]
];