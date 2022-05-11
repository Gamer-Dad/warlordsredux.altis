class CfgWLRequisitionPresets
{
	class A3ReduxAll
	{
		class WEST
		{
			class Infantry
			{
				class CUP_B_USMC_Soldier					{cost = 20;		requirements[]={};	};	// "Rifleman"
				class CUP_B_BAF_Soldier_Paratrooper_DPM		{cost = 25;		requirements[]={};	};	// "Para Trooper"
				class B_CTRG_Soldier_tna_F					{cost = 30;		requirements[]={};	};	// "CTRG Scout"
				class CUP_B_USMC_Crew						{cost = 15;		requirements[]={};	};	// "Crewman"
				class CUP_B_USMC_Pilot 						{cost = 10;		requirements[]={};	};	// "Pilot"
				class CUP_B_USMC_Soldier_GL					{cost = 50;		requirements[]={};	};	// "Grenadier"
				class CUP_B_USMC_Medic						{cost = 20;		requirements[]={};	};	// "Combat Life Saver"
				class CUP_B_USMC_Soldier_AR					{cost = 50;		requirements[]={};	};	// "Autorifleman"
				class CUP_B_USMC_SpecOps_SD					{cost = 25;		requirements[]={};	};	// "Shotgun"
				class CUP_B_USMC_Soldier_Marksman			{cost = 60;		requirements[]={};	};	// "Marksman"
				class CUP_B_USMC_Engineer					{cost = 100;	requirements[]={};	};	// "Repair Specialist"
				class CUP_B_USMC_Soldier_MG					{cost = 80;		requirements[]={};	};	// "Heavy Gunner"
				class CUP_B_USMC_Soldier_AT					{cost = 100;	requirements[]={};	};	// "Rifleman (AT)"
				class CUP_B_USMC_Soldier_HAT				{cost = 150;	requirements[]={};	};	// "Missile Specialist (AT)"
				class CUP_B_USMC_Soldier_AA					{cost = 150;	requirements[]={};	};	// "Missile Specialist (AA)"
				class CUP_B_USMC_Sniper_M40A3				{cost = 80;		requirements[]={};	};	// "Sharpshooter"
				class CUP_B_USMC_Sniper_M107				{cost = 100;	requirements[]={};	};	// "Sniper"
				
			};
			class Vehicles
			{
				class CUP_B_M1030_USMC						{cost =  10;	requirements[]={};	};	// "Bike"
				class B_Quadbike_01_F						{cost =  20;	requirements[]={};	};	// "Quad Bike"
				class CUP_B_M1152_USMC			 			{cost = 100;	requirements[]={};	};	// "Unarmed Humvee Pickup"
				class CUP_B_nM1025_Unarmed_USMC_WDL			{cost = 150;	requirements[]={};	};	// "Unarmed HUMVEE"								
				class CUP_B_MTVR_USMC		 				{cost = 200;	requirements[]={};	};	// "MTVR Transport"
				class CUP_B_MTVR_Fuel_USMC					{cost = 500;	requirements[]={};	};	// "MTVR Fuel"
				class CUP_B_nM997_USMC_WDL					{cost = 350;	requirements[]={};	};	// "Humvee Medical"
				class CUP_B_nM1025_SOV_M2_USMC_WDL			{cost = 200;	requirements[]={};	};	// "Opentop HUMVEE w/.50"
				class CUP_B_nM1025_SOV_MK19_USMC_WDL		{cost = 250;	requirements[]={};	};	// "Opentop HUMVEE GMG"
				class CUP_B_M1151_M2_USMC					{cost = 500;	requirements[]={};	};	// "Humvee HMG"
				class CUP_B_M1165_GMV_USMC					{cost = 600;	requirements[]={};	};	// "Humvee Minigun"
				class CUP_B_M1151_Mk19_USMC					{cost = 700;	requirements[]={};	};	// "Humvee GMG"
				class CUP_B_nM1036_TOW_DF_USMC_WDL			{cost = 1200;	requirements[]={};	};	// "Humvee TOW"
				class CUP_B_nM1097_AVENGER_USA_WDL			{cost = 3000;	requirements[]={};	};	// "Humvee Avenger AA"
				class CUP_B_MTVR_Repair_USMC				{cost = 2000;	requirements[]={};	};	// "MTVR Repair"
				class CUP_B_MTVR_Ammo_USMC					{cost = 3000;	requirements[]={};	};	// "HEMTT Ammo"
				
				
				class CUP_B_M1126_ICV_M2_Woodland			{cost = 2000;	requirements[]={};	};	// "Striker M2"
				class CUP_B_M1126_ICV_MK19_Woodland			{cost = 2200;	requirements[]={};	};	// "Striker MK19"
				class CUP_B_M1128_MGS_Woodland				{cost = 2500;	requirements[]={};	};	// "Striker MGS"
				class CUP_B_M2Bradley_USA_W					{cost = 5000;	requirements[]={};	};	// "Bradley IFV"
				class CUP_B_M6LineBacker_USA_W				{cost = 6000;	requirements[]={};	};	// "Bradley IFV AA"
				class CUP_M60A3_TTS_USMC					{cost = 7000;	requirements[]={};	};	// "M60 Patton"
				class CUP_B_M1A1FEP_Woodland_USMC			{cost = 12000;	requirements[]={};	};	// "Abrams"
				class CUP_B_M270_HE_USMC					{cost = 20000;	requirements[]={};	};	// "M270 Artillery" 
				 
				 
			};
			class Aircraft
			{
				class CUP_B_MH6J_USA						{cost = 500;	requirements[]={"H"};	};	// "Littlebird"
				class CUP_B_USMC_Pilot						{cost = 1500;	requirements[]={"H"};	};	// "Littlebird Armed"
				class CUP_B_UH60M_US						{cost = 1000;	requirements[]={"H"};	};	// "Blackhawk Armed"
				class CUP_B_CH47F_USA						{cost = 1500;	requirements[]={"H"};	};	// "CH-47F Chinook"
				class CUP_B_C130J_GB						{cost = 2000;	requirements[]={"A"};	};	// "C130 Transport";
				class CUP_B_MH60L_DAP_4x_US					{cost = 8000;	requirements[]={"H"};	};	// "Blackhawk Rockets"
				class CUP_B_AH1Z_Dynamic_USMC				{cost = 12000;	requirements[]={"H"};	};	// "AH1Z Cobra"
				class CUP_B_AH64D_DL_USA					{cost = 15000;	requirements[]={"H"};	};	// "AH64D Apache"				
				class CUP_B_A10_DYN_USA						{cost = 18000;	requirements[]={"A"};	};	// "A-10 Warthog"
				class CUP_B_AV8B_DYN_USMC					{cost = 25000;	requirements[]={"A"};	};	// "Sea Harrier";
				
				
			};
			class Naval
			{
				class CUP_B_RHIB_USMC						{cost = 100;	requirements[]={"W"};	};	// "RHIB"
				class CUP_B_LCU1600_USMC					{cost = 2000;	requirements[]={"W"};	};	// "Large Boat"
				
			};
			class Gear
			{
				class CUP_BOX_USMC_Uniforms_F				{cost = 100;	requirements[]={};	};	// "Uniforms Box "
				class CUP_BOX_USMC_Ammo_F					{cost = 200;	requirements[]={};	};	// "Basic Ammo "
				class CUP_BOX_USMC_Grenades_F				{cost = 200;	requirements[]={};	};	// "Grenades"
				class CUP_BOX_USMC_Wps_F					{cost = 250;	requirements[]={};	};	// "Basic Weapons "
				class CUP_BOX_USMC_AmmoOrd_F				{cost = 750;	requirements[]={};	};	// "Explosives "
				class CUP_BOX_USMC_WpsLaunch_F				{cost = 300;	requirements[]={};	};	// "Launchers "
				class CUP_BOX_USMC_Support_F				{cost = 400;	requirements[]={};	};	// "Special Support "
				class CUP_BOX_USMC_AmmoVeh_F				{cost = 500;	requirements[]={};	};	// "Vehicle Ammo"					
			};
			class Defences
			{
				class CUP_B_M2StaticMG_MiniTripod_USMC		{cost = 300;	requirements[]={};	};	// "M2 .50 Low"
				class CUP_B_M2StaticMG_USMC					{cost = 300;	requirements[]={};	};	// "M2 .50 Raised"
				class CUP_B_MK19_TriPod_USMC				{cost = 450;	requirements[]={};	};	// "MK19 Low"
				class CUP_B_Stinger_AA_pod_Base_USMC		{cost = 600;	requirements[]={};	};	// "Static Stinger (AA) "
				class CUP_B_TOW_TriPod_USMC					{cost = 600;	requirements[]={};	};	// "Static TOW (AT) "
				//class B_SAM_System_03_F						{cost = 8000;	requirements[]={};	offset[]={0, 5.3, 0};};	// "MIM-145 Defender"
				class B_Radar_System_01_F					{cost = 5000;	requirements[]={};	offset[]={0, 5.3, 0};};	// "AN/MPQ-105 Radar"
				class CUP_B_M252_USMC						{cost = 10000;	requirements[]={};	};	// "Mortar"
				class CUP_B_M119_USMC						{cost = 20000;	requirements[]={};	};	// "Cannon" 
				//class B_UGV_02_Demining_F					{cost = 1500;	requirements[]={};	};	// "UGAS demining"
				//class B_UAV_05_F 							{cost = 25000;	requirements[]={"A"};	};	// "UCAV";
				//class B_UAV_02_F 							{cost = 25000;	requirements[]={"A"};	};	// "greyhawk AT";
				//class B_UAV_02_CAS_F						{cost = 25000;	requirements[]={"A"};	};	// "greyhawk LGB";
				//class B_T_UAV_03_F 						{cost = 25000;	requirements[]={"A"};	};	// "Firescout";
				//class B_UAV_01_F 							{cost = 500;	requirements[]={};	};	// "AR-2 Darter";
				//class B_UAV_06_F							{cost = 500;	requirements[]={};	};	// "AL-6 Pelican";
				//class B_UAV_06_medical_F					{cost = 500;	requirements[]={};	};	// "AL-6 Pelican medical";
				//class B_AAA_System_01_F 					{cost = 8000;	requirements[]={};	};	// "Phalax";

			};
		};
		class EAST
		{
			class Infantry
			{
				class O_Soldier_F							{cost = 20;	requirements[]={};	};	// "Rifleman"
				class O_soldier_PG_F						{cost = 25;	requirements[]={};	};	// "Para Trooper"
				class O_V_Soldier_hex_F						{cost = 40;	requirements[]={};	};	// "Viper Rifleman"
				class O_crew_F 								{cost = 15;	requirements[]={};	};	// "Crewman"
				class O_Helipilot_F 						{cost = 10;	requirements[]={};	};	// "Helicopter Pilot"
				class O_Pilot_F 							{cost = 10;	requirements[]={};	};	// "Pilot"
				class O_Soldier_GL_F						{cost = 50;	requirements[]={};	};	// "Grenadier"
				class O_medic_F								{cost = 20;	requirements[]={};	};	// "Combat Life Saver"
				class O_soldier_AR_F						{cost = 50;	requirements[]={};	};	// "Autorifleman"
				class O_Soldier_A_F							{cost = 25;	requirements[]={};	};	// "Ammo Bearer"
				class O_soldier_M_F							{cost = 60;	requirements[]={};	};	// "Marksman"
				class O_soldier_repair_F					{cost = 100;	requirements[]={};	};	// "Repair Specialist"
				class O_HeavyGunner_F						{cost = 80;	requirements[]={};	};	// "Heavy Gunner"
				class O_soldier_LAT_F						{cost = 100;	requirements[]={};	};	// "Rifleman (AT)"
				class O_V_Soldier_LAT_hex_F					{cost = 150;	requirements[]={};	};	// "Viper Rifleman (AT)"
				class O_soldier_AT_F						{cost = 150;	requirements[]={};	};	// "Missile Specialist (AT)"
				class O_Soldier_AA_F						{cost = 150;	requirements[]={};	};	// "Missile Specialist (AA)"
				class O_Sharpshooter_F						{cost = 80;	requirements[]={};	};	// "Sharpshooter"
				class O_sniper_F							{cost = 100;	requirements[]={};	};	// "Sniper"
				class O_soldier_HAT_F						{cost = 200;	requirements[]={};	};	// "Rifleman (Heavy AT)"
			};
			class Vehicles
			{
				class O_Quadbike_01_F						{cost = 20;	requirements[]={};	};	// "Quad Bike"
				class O_LSV_02_unarmed_F					{cost = 100;	requirements[]={};	};	// "Qilin (Unarmed)"
				class O_MRAP_02_F							{cost = 300;	requirements[]={};	};	// "Ifrit"
				class O_Truck_03_transport_F				{cost = 200;	requirements[]={};	};	// "Tempest Transport"
				class O_Truck_03_Fuel_F						{cost = 500;	requirements[]={};	};	// "Tempest Fuel"
				class O_Truck_03_medical_F					{cost = 350;	requirements[]={};	};	// "Tempest Medical"
				class O_LSV_02_armed_F						{cost = 350;	requirements[]={};	};	// "Qilin (Minigun)"
				class O_G_Offroad_01_armed_F				{cost = 200;	requirements[]={};	};	// "Offroad (HMG)"
				class O_LSV_02_AT_F							{cost = 700;	requirements[]={};	};	// "Qilin (AT)"
				class O_G_Offroad_01_AT_F					{cost = 350;	requirements[]={};	};	// "Offroad (AT)"
				class O_Truck_03_Repair_F					{cost = 2000;	requirements[]={};	};	// "Tempest Repair"
				class O_Truck_03_ammo_F						{cost = 3000;	requirements[]={};	};	// "Tempest Ammo"
				class O_MRAP_02_hmg_F						{cost = 1000;	requirements[]={};	};	// "Ifrit HMG"
				class O_MRAP_02_gmg_F						{cost = 1200;	requirements[]={};	};	// "Ifrit GMG"
				class O_APC_Wheeled_02_rcws_v2_F			{cost = 2000;	requirements[]={};	};	// "MSE-3 Marid"
				class O_APC_Tracked_02_cannon_F				{cost = 6000;	requirements[]={};	};	// "BTR-K Kamysh"
				class O_APC_Tracked_02_AA_F					{cost = 5000;	requirements[]={};	};	// "ZSU-39 Tigris"
				class O_MBT_02_cannon_F						{cost = 10000;	requirements[]={};	};	// "T-100 Varsuk"
				class O_MBT_04_cannon_F						{cost = 12000;	requirements[]={};	};	// "T-140 Angara"
				class O_MBT_04_command_F					{cost = 13000;	requirements[]={};	};	// "T-140K Angara"
				class O_MBT_02_arty_F						{cost = 20000;	requirements[]={};	};	// "2S9 Sochor"
				

			};
			class Aircraft
			{
				class O_Heli_Light_02_unarmed_F				{cost = 700;	requirements[]={"H"};	};	// "PO-30 Orca (Unarmed)"
				class O_Heli_Light_02_dynamicLoadout_F		{cost = 5000;	requirements[]={"H"};	};	// "PO-30 Orca"
				class O_Heli_Transport_04_F					{cost = 500;	requirements[]={"H"};	};	// "Mi-290 Taru"
				class O_Heli_Transport_04_covered_F			{cost = 1000;	requirements[]={"H"};	};	// "Mi-290 Taru (Transport)"
				class O_Heli_Transport_04_medevac_F 		{cost = 1000;	requirements[]={"H"};	};	// "Mi-290 Taru (Medical)"
				class O_Heli_Attack_02_dynamicLoadout_F		{cost = 12000;	requirements[]={"H"};	};	// "Mi-48 Kajman"
				class O_T_VTOL_02_infantry_dynamicLoadout_F	{cost = 16000;	requirements[]={"A"};	};	// "Y-32 Xi'an (Infantry Transport)"
				//class O_T_VTOL_02_vehicle_F             	{cost = 20000;	requirements[]={"A"};	};	// "Y-32 Xi'an (vehicle Transport)"
				class O_Plane_CAS_02_dynamicLoadout_F		{cost = 18000;	requirements[]={"A"};	};	// "To-199 Neophron (CAS)"
				class O_Plane_Fighter_02_F					{cost = 33000;	requirements[]={"A"};	};	// "To-201 Shikra"
				//class O_Plane_Fighter_02_Stealth_F		{cost = 42000;	requirements[]={"A"};	};	// "To-201 Shikra Stealth"
				
			};
			class Naval
			{
				class O_Boat_Transport_01_F					{cost = 100;	requirements[]={"W"};	};	// "Assault Boat"
				class O_Boat_Armed_01_hmg_F					{cost = 750;	requirements[]={"W"};	};	// "Speedboat HMG"
				class O_SDV_01_F							{cost = 900;	requirements[]={"W"};	};	// "SDV"
			};
			class Gear
			{
				class Box_East_Ammo_F						{cost = 200;	requirements[]={};	};	// "Basic Ammo [CSAT]"
				class Box_East_Grenades_F					{cost = 200;	requirements[]={};	};	// "Grenades [CSAT]"
				class Box_East_Wps_F						{cost = 250;	requirements[]={};	};	// "Basic Weapons [CSAT]"
				class Box_East_AmmoOrd_F					{cost = 750;	requirements[]={};	};	// "Explosives [CSAT]"
				class Box_East_WpsLaunch_F					{cost = 300;	requirements[]={};	};	// "Launchers [CSAT]"
				class Box_East_WpsSpecial_F					{cost = 500;	requirements[]={};	};	// "Special Weapons [CSAT]"
				class O_supplyCrate_F						{cost = 500;	requirements[]={};	};	// "Supply Box [CSAT]"
				class Box_East_AmmoVeh_F					{cost = 500;	requirements[]={};	};	// "Vehicle Ammo [CSAT]"
			};
			class Defences
			{
				class O_HMG_01_F							{cost = 300;	requirements[]={};	};	// "Mk30 HMG .50"
				class O_HMG_01_high_F						{cost = 300;	requirements[]={};	};	// "Mk30 HMG .50 (Raised)"
				class O_GMG_01_F							{cost = 450;	requirements[]={};	};	// "Mk32 GMG 20 mm"
				class O_GMG_01_high_F						{cost = 450;	requirements[]={};	};	// "Mk32 GMG 20 mm (Raised)"
				class O_static_AA_F							{cost = 600;	requirements[]={};	};	// "Static Titan Launcher (AA) [CSAT]"
				class O_static_AT_F							{cost = 600;	requirements[]={};	};	// "Static Titan Launcher (AT) [CSAT]"
				class O_SAM_System_04_F						{cost = 8000;	requirements[]={};	offset[]={0, 5.3, 0};};	// "S-750 Rhea"
				class O_Radar_System_02_F					{cost = 5000;	requirements[]={};	offset[]={0, 5.3, 0};};	// "R-750 Cronus Radar"
				class O_Mortar_01_F							{cost = 10000;	requirements[]={};	};	// "Mortar"
				class O_UGV_01_rcws_F						{cost = 2500;	requirements[]={};	};	// "UGAV rcws"
				class O_UGV_02_Demining_F					{cost = 1500;	requirements[]={};	};	// "UGAV demining"
				//class O_UAV_02_F							{cost = 25000;	requirements[]={"A"};	};	// "K40 AT"
				//class O_UAV_02_CAS_F						{cost = 25000;	requirements[]={"A"};	};	// "K40 LGB"
				//class O_T_UAV_04_CAS_F					{cost = 25000;	requirements[]={"A"};	};	// "KH-3A CAS"
				//class O_UAV_01_F							{cost = 500;	requirements[]={};	};	// "AR-2 Darter"
				//class O_UAV_06_F							{cost = 500;	requirements[]={};	};	// "AL_6 Pelican"
				//class O_UAV_06_medical_F					{cost = 500;	requirements[]={};	};	// "AL_6 Pelican Medical"
				//class B_AAA_System_01_F 					{cost = 8000;	requirements[]={};	};	// "Phalax";

			};
		};
	};
};