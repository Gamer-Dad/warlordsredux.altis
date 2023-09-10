class CfgWLRequisitionPresets
{
	class A3ReduxAll
	{
		class WEST
		{
			class Infantry
			{
				class B_Soldier_F 							{cost = 20;		requirements[]={};	};	// "Rifleman"
				class B_soldier_PG_F						{cost = 25;		requirements[]={};	};	// "Para Trooper"
				class B_CTRG_Soldier_tna_F					{cost = 30;		requirements[]={};	};	// "CTRG Scout"
				class B_crew_F 								{cost = 15;		requirements[]={};	};	// "Crewman"
				class B_Helipilot_F 						{cost = 10;		requirements[]={};	};	// "Helicopter Pilot"
				class B_Pilot_F 							{cost = 10;		requirements[]={};	};	// "Pilot"
				class B_Soldier_GL_F 						{cost = 50;		requirements[]={};	};	// "Grenadier"				
				class B_medic_F								{cost = 20;		requirements[]={};	};	// "Combat Life Saver"
				class B_soldier_AR_F						{cost = 50;		requirements[]={};	};	// "Autorifleman"
				class B_Soldier_A_F							{cost = 25;		requirements[]={};	};	// "Ammo Bearer"
				class B_soldier_M_F							{cost = 60;		requirements[]={};	};	// "Marksman"
				class B_diver_F								{cost = 50;		requirements[]={};	};  // "Assault Diver"
				class B_diver_exp_F							{cost = 80; 	requirements[]={};	};  // "Diver Explosive Specialist"
				class B_soldier_repair_F					{cost = 100;	requirements[]={};	};	// "Repair Specialist"
				class B_HeavyGunner_F						{cost = 80;		requirements[]={};	};	// "Heavy Gunner"
				class B_soldier_LAT_F						{cost = 100;	requirements[]={};	};	// "Rifleman (AT)"
				class B_soldier_LAT2_F						{cost = 100;	requirements[]={};	};	// "Rifleman (Light AT)"
				class B_CTRG_Soldier_LAT_tna_F 				{cost = 150;	requirements[]={};	};	// "Rifleman (Light AT)"
				class B_soldier_AT_F						{cost = 150;	requirements[]={};	};	// "Missile Specialist (AT)"
				class B_soldier_AA_F						{cost = 150;	requirements[]={};	};	// "Missile Specialist (AA)"
				class B_Sharpshooter_F						{cost = 80;		requirements[]={};	};	// "Sharpshooter"
				class B_sniper_F							{cost = 100;	requirements[]={};	};	// "Sniper"
				class B_Captain_Dwarden_F					{cost = 150;	requirements[]={};	};	// "Dwarden"
			};
			class Vehicles
			{
				class B_Quadbike_01_F						{cost =  20;	requirements[]={};	};	// "Quad Bike"
				class B_LSV_01_unarmed_F					{cost = 100;	requirements[]={};	};	// "Prowler (Unarmed)"
				class B_MRAP_01_F							{cost = 300;	requirements[]={};	};	// "Hunter"
				class B_LSV_01_armed_F						{cost = 300;	requirements[]={};	};	// "Prowler (HMG)"
				class B_G_Offroad_01_armed_F				{cost = 150;	requirements[]={};	};	// "Offroad (HMG)"
				class B_LSV_01_AT_F							{cost = 750;	requirements[]={};	};	// "Prowler (AT)"
				class B_G_Offroad_01_AT_F					{cost = 500;	requirements[]={};	};	// "Offroad (AT)"
				class B_MRAP_01_hmg_F						{cost = 1000;	requirements[]={};	};	// "Hunter HMG"
				class B_MRAP_01_gmg_F						{cost = 1250;	requirements[]={};	};	// "Hunter GMG"
				class B_Truck_01_ammo_F						{cost = 1000;	requirements[]={};	};	// "HEMTT Ammo"
				class B_Truck_01_Repair_F					{cost = 1000;	requirements[]={};	};	// "HEMTT Repair"
				class B_Truck_01_fuel_F						{cost = 1000;	requirements[]={};	};	// "HEMTT Fuel"
				class O_T_Truck_03_device_ghex_F            {cost = 1500;	requirements[]={};	};	// "Tempest Device"
				class B_Truck_01_transport_F				{cost = 200;	requirements[]={};	};	// "HEMTT Transport"
				class B_Truck_01_flatbed_F					{cost = 500;	requirements[]={};	};	// "HEMTT Flatbed"	
				class B_APC_Wheeled_03_cannon_F				{cost = 2500;	requirements[]={};	};	// "BLUFOR Gorgon"
				class B_APC_Wheeled_01_cannon_F				{cost = 3200;	requirements[]={};	};	// "AMV-7 Marshall"
				class B_APC_Tracked_01_rcws_F				{cost = 1800;	requirements[]={};	};	// "IFV-6c Panther"
				class B_APC_Tracked_01_AA_F					{cost = 5000;	requirements[]={};	};	// "IFV-6a Cheetah"
				class B_AFV_Wheeled_01_cannon_F				{cost = 4000;	requirements[]={};	};	// "Rhino MGS"
				class B_AFV_Wheeled_01_up_cannon_F			{cost = 4500;	requirements[]={};	};	// "Rhino MGS UP" 
				class B_MBT_01_cannon_F						{cost = 6000;	requirements[]={};	};	// "M2A1 Slammer"
				class B_MBT_01_TUSK_F						{cost = 7000;	requirements[]={};	};	// "M2A1 Slammer UP"				
				class B_MBT_01_arty_F						{cost = 20000;	requirements[]={};	};	// "M4 Scorcher"
				class B_MBT_01_mlrs_F						{cost = 20000;	requirements[]={};	};	// "M5 Sandstorm MLRS" 
			};
			class Aircraft
			{
				class B_Heli_Light_01_F						{cost = 300;	requirements[]={"H"};	};	// "MH-9 Hummingbird"
				class B_Heli_Transport_01_F					{cost = 800;	requirements[]={"H"};	};	// "UH-80 Ghost Hawk"
				class B_Heli_Transport_03_F					{cost = 1000;	requirements[]={"H"};	};	// "CH-67 Huron"
				class B_Heli_Light_01_dynamicLoadout_F		{cost = 4000;	requirements[]={"H"};	};	// "AH-9 Pawnee"
				class B_UAV_02_dynamicLoadout_F         	{cost = 12000;  requirements[]={"A"};   };  // "Greyhawk"
				class B_Heli_Attack_01_dynamicLoadout_F		{cost = 13000;	requirements[]={"H"};	};	// "AH-99 Blackfoot"
				class B_T_UAV_03_dynamicLoadout_F			{cost = 16000;  requirements[]={"H"};   };  // "Falcon"
				class B_UAV_05_F							{cost = 18000;  requirements[]={"A"};   };  // "Sentinel"
				class B_T_VTOL_01_infantry_F				{cost = 2000;	requirements[]={"A"};	};	// "V-44 X Blackfish(Inf)"
				class B_T_VTOL_01_vehicle_F					{cost = 2000;	requirements[]={"A"};	};	// "V-44 X Blackfish(Vic)"
				class B_T_VTOL_01_armed_F					{cost = 8000;	requirements[]={"A"};	};	// "V-44 X Blackfish (Armed)"
				class B_Plane_CAS_01_dynamicLoadout_F		{cost = 14000;	requirements[]={"A"};	};	// "A-164 Wipeout (CAS)"
				class B_Plane_Fighter_01_F					{cost = 30000;	requirements[]={"A"};	};	// "F/A-181 Black Wasp II"
				class B_Plane_Fighter_01_Stealth_F			{cost = 30000;	requirements[]={"A"};	};  //"F/A-181 Black Wasp II (Stealth)"
			};
			class Naval
			{
				class C_Scooter_Transport_01_F				{cost = 50;		requirements[]={"W"};	};	// "Water scooter"
				class B_Boat_Transport_01_F					{cost = 100;	requirements[]={"W"};	};	// "Assault Boat"
				class B_Boat_Armed_01_minigun_F				{cost = 500;	requirements[]={"W"};	};	// "Speedboat Minigun"
				class B_SDV_01_F							{cost = 250;	requirements[]={"W"};	};	// "SDV"
			};
			class Gear
			{
				class Box_NATO_Ammo_F						{cost = 50;		requirements[]={};	};	// "Basic Ammo [NATO]"
				class Box_NATO_Grenades_F					{cost = 50;		requirements[]={};	};	// "Grenades [NATO]"
				class Box_NATO_Wps_F						{cost = 100;	requirements[]={};	};	// "Basic Weapons [NATO]"
				class Box_NATO_Uniforms_F					{cost = 100;	requirements[]={};	};	// "Uniforms [NATO]"
				class Box_NATO_Equip_F						{cost = 100;	requirements[]={};	};	// "Equipment [NATO]"
				class Box_NATO_AmmoOrd_F					{cost = 150;	requirements[]={};	};	// "Explosives [NATO]"
				class Box_NATO_WpsLaunch_F					{cost = 200;	requirements[]={};	};	// "Launchers [NATO]"
				class Box_NATO_WpsSpecial_F					{cost = 250;	requirements[]={};	};	// "Special Weapons [NATO]"
				class B_supplyCrate_F						{cost = 300;	requirements[]={};	};	// "Supply Box [NATO]"
				class Box_NATO_AmmoVeh_F					{cost = 250;	requirements[]={};	};	// "Vehicle Ammo [NATO]"
				class B_Slingload_01_Ammo_F                 {cost = 500;   requirements[]={};	};  // "Huron Ammo Container"
				class B_Slingload_01_Repair_F				{cost = 500;   requirements[]={};	};  // "Huron Repair Container"
				class B_Slingload_01_Fuel_F					{cost = 300;    requirements[]={};	};  // "Huron Fuel Container"
			};
			class Defences
			{
				
				class Land_BagFence_Round_F					{cost = 50;		requirements[]={};	offset[]={0, 2, 0};};	// "Semi Circle Sand bags"  
				class Land_Razorwire_F						{cost = 50;		requirements[]={};	offset[]={0, 5, 0};};	// "Razor Wire Fence"  
				class Land_DragonsTeeth_01_1x1_new_F		{cost = 50;		requirements[]={};	offset[]={0, 2, 0};};	// "Tank barrier"    	  	
				class CamoNet_BLUFOR_big_F					{cost = 100;	requirements[]={};	offset[]={0, 6, 0};};	// "Camouflage Vehicle Cover (Green)"    	
				class Land_IRMaskingCover_01_F				{cost = 200;	requirements[]={};	offset[]={0, 8, 0};};	// "IR Masking Tent (Large)"
				class B_HMG_01_F							{cost = 150;	requirements[]={};	};	// "Mk30 HMG .50"  
				class B_HMG_01_high_F						{cost = 200;	requirements[]={};	};	// "Mk30 HMG .50 (Raised)" 
				class B_GMG_01_F							{cost = 200;	requirements[]={};	};	// "Mk32 GMG 20mm"  
				class B_GMG_01_high_F						{cost = 250;	requirements[]={};	};	// "Mk32 GMG 20mm (Raised)"				
				class B_HMG_01_A_F							{cost = 500;	requirements[]={};	};	// "Mk30 HMG Auto Turret"
				class B_GMG_01_A_F							{cost = 650;	requirements[]={};	};	// "Mk30 GMG Auto Turret"
				class B_static_AT_F							{cost = 300;	requirements[]={};	};	// "Static Titan Launcher (AT) [NATO]"  
				class B_static_AA_F							{cost = 300;	requirements[]={};	};	// "Static Titan Launcher (AA) [NATO]"  
				class B_Mortar_01_F							{cost = 3000;	requirements[]={};	};	// "Mortar"
				class B_UGV_02_Demining_F					{cost = 100;	requirements[]={};	};	// "UGAS demining"  
				class B_UGV_01_F							{cost = 150;	requirements[]={};	offset[]={0, 3, 0};};	// "UGV Stomper"   
				class B_UGV_01_rcws_F 						{cost = 400;	requirements[]={};	offset[]={0, 3, 0};};	// "UGAS" 				
				class B_UAV_01_F							{cost = 500;    requirements[]={};	};  // AR-2  
				class B_Ship_Gun_01_F						{cost = 10000;	requirements[]={};	offset[]={0, 9, 0};};	// "MK45 Hammer"  
				class B_Radar_System_01_F					{cost = 1000;	requirements[]={};	offset[]={0, 7, 0};};	// "AN/MPQ-105 Radar"  
				class B_AAA_System_01_F 					{cost = 3500;	requirements[]={};	offset[]={0, 5.3, 0};};	// "Praetorian 1C"  
				class B_SAM_System_01_F						{cost = 10000;	requirements[]={};	offset[]={0, 5.3, 0};};	// "Mk49 Spartan"  
				class B_SAM_System_03_F						{cost = 8000;	requirements[]={};	offset[]={0, 6, 0};};	// "MIM-145 Defender"  
				class B_SAM_System_02_F						{cost = 15000;	requirements[]={};	offset[]={0, 5.3, 0};};	// "Mk21 Centurion"  
				class B_Ship_MRLS_01_F						{cost = 30000;	requirements[]={};	offset[]={0, 7, 0};};	// "Mk41 VLS"
			};
		};
		class EAST
		{
			class Infantry
			{
				class O_Soldier_F							{cost = 20;		requirements[]={};	};	// "Rifleman"
				class O_soldier_PG_F						{cost = 25;		requirements[]={};	};	// "Para Trooper"
				class O_V_Soldier_hex_F						{cost = 40;		requirements[]={};	};	// "Viper Rifleman"
				class O_crew_F 								{cost = 15;		requirements[]={};	};	// "Crewman"
				class O_Helipilot_F 						{cost = 10;		requirements[]={};	};	// "Helicopter Pilot"
				class O_Pilot_F 							{cost = 10;		requirements[]={};	};	// "Pilot"
				class O_Soldier_GL_F						{cost = 50;		requirements[]={};	};	// "Grenadier"
				class O_medic_F								{cost = 20;		requirements[]={};	};	// "Combat Life Saver"
				class O_soldier_AR_F						{cost = 50;		requirements[]={};	};	// "Autorifleman"
				class O_Soldier_A_F							{cost = 25;		requirements[]={};	};	// "Ammo Bearer"
				class O_soldier_M_F							{cost = 60;		requirements[]={};	};	// "Marksman"
				class O_diver_F								{cost = 50;		requirements[]={};	};  // "Assault Diver"
				class O_diver_exp_F							{cost = 80; 	requirements[]={};	};  // "Diver Explosive Specialist"
				class O_soldier_repair_F					{cost = 100;	requirements[]={};	};	// "Repair Specialist"
				class O_HeavyGunner_F						{cost = 80;		requirements[]={};	};	// "Heavy Gunner"
				class O_soldier_LAT_F						{cost = 100;	requirements[]={};	};	// "Rifleman (AT)"
				class O_V_Soldier_LAT_hex_F					{cost = 150;	requirements[]={};	};	// "Viper Rifleman (AT)"
				class O_soldier_AT_F						{cost = 150;	requirements[]={};	};	// "Missile Specialist (AT)"
				class O_Soldier_AA_F						{cost = 150;	requirements[]={};	};	// "Missile Specialist (AA)"
				class O_Sharpshooter_F						{cost = 80;		requirements[]={};	};	// "Sharpshooter"
				class O_sniper_F							{cost = 100;	requirements[]={};	};	// "Sniper"
				class O_soldier_HAT_F						{cost = 200;	requirements[]={};	};	// "Rifleman (Heavy AT)"
			};
			class Vehicles
			{
				class O_Quadbike_01_F						{cost = 20;		requirements[]={};	};	// "Quad Bike"
				class O_LSV_02_unarmed_F					{cost = 100;	requirements[]={};	};	// "Qilin (Unarmed)"
				class O_MRAP_02_F							{cost = 300;	requirements[]={};	};	// "Ifrit"
				class O_LSV_02_armed_F						{cost = 300;	requirements[]={};	};	// "Qilin (Minigun)"
				class O_G_Offroad_01_armed_F				{cost = 150;	requirements[]={};	};	// "Offroad (HMG)"
				class O_LSV_02_AT_F							{cost = 750;	requirements[]={};	};	// "Qilin (AT)"
				class O_G_Offroad_01_AT_F					{cost = 500;	requirements[]={};	};	// "Offroad (AT)"
				class O_MRAP_02_hmg_F						{cost = 1000;	requirements[]={};	};	// "Ifrit HMG"
				class O_MRAP_02_gmg_F						{cost = 1250;	requirements[]={};	};	// "Ifrit GMG"
				class O_Truck_03_ammo_F						{cost = 1000;	requirements[]={};	};	// "Tempest Ammo"
				class O_Truck_03_Repair_F					{cost = 1000;	requirements[]={};	};	// "Tempest Repair"
				class O_Truck_03_Fuel_F						{cost = 1000;	requirements[]={};	};	// "Tempest Fuel"
				class O_Truck_03_device_F            		{cost = 1500;	requirements[]={};	};	// "Tempest Device"
				class O_Truck_03_transport_F				{cost = 200;	requirements[]={};	};	// "Tempest Transport"
				class B_Truck_01_flatbed_F					{cost = 500;	requirements[]={};	};	// "HEMTT Flatbed"
				class O_APC_Wheeled_02_rcws_v2_F			{cost = 1500;	requirements[]={};	};	// "MSE-3 Marid"
				class O_APC_Tracked_02_cannon_F				{cost = 2800;	requirements[]={};	};	// "BTR-K Kamysh"
				class O_APC_Tracked_02_AA_F					{cost = 5000;	requirements[]={};	};	// "ZSU-39 Tigris"
				class O_MBT_02_cannon_F						{cost = 8000;	requirements[]={};	};	// "T-100 Varsuk"
				class O_MBT_04_cannon_F						{cost = 13000;	requirements[]={};	};	// "T-140 Angara"
				class O_MBT_04_command_F					{cost = 15000;	requirements[]={};	};	// "T-140K Angara"
				class O_MBT_02_railgun_F					{cost = 16000;	requirements[]={};	};	// "T-100 Futura"
				class O_MBT_02_arty_F						{cost = 20000;	requirements[]={};	};	// "2S9 Sochor"
				class I_Truck_02_MRL_F						{cost = 18000;	requirements[]={};	};	// "Zamak MRL"  
			};
			class Aircraft
			{	  
				class O_Heli_Light_02_unarmed_F				{cost = 500;	requirements[]={"H"};	};	// "PO-30 Orca (Unarmed)"  
				class O_Heli_Transport_04_F					{cost = 500;	requirements[]={"H"};	};	// "Mi-290 Taru"  
				class O_Heli_Transport_04_covered_F			{cost = 400;	requirements[]={"H"};	};	// "Mi-290 Taru (Transport)"  
				class O_Heli_Transport_04_medevac_F 		{cost = 500;	requirements[]={"H"};	};	// "Mi-290 Taru (Medical)"
				class O_Heli_Light_02_dynamicLoadout_F		{cost = 6500;	requirements[]={"H"};	};	// "PO-30 Orca" 
				class O_T_UAV_04_CAS_F						{cost = 8000;	requirements[]={"A"};	};	// "KH-3A Fenghuang"
				class O_Heli_Attack_02_dynamicLoadout_F		{cost = 10000;	requirements[]={"H"};	};	// "Mi-48 Kajman"   
				class O_UAV_02_dynamicLoadout_F	  			{cost = 12000;	requirements[]={"A"};	};	// "K40 Ababil-3"				    
				class O_T_VTOL_02_vehicle_dynamicLoadout_F	{cost = 15000;	requirements[]={"A"};	};	// "Y-32 Xi'an (Infantry Transport)"
				class O_Plane_CAS_02_dynamicLoadout_F		{cost = 20000;	requirements[]={"A"};	};	// "To-199 Neophron (CAS)"  
				class O_Plane_Fighter_02_F					{cost = 32000;	requirements[]={"A"};	};	// "To-201 Shikra"
				class O_Plane_Fighter_02_Stealth_F			{cost = 32000;	requirements[]={"A"};	};	// "To-201 Shikra (Stealth)"
			};
			class Naval
			{
				class C_Scooter_Transport_01_F				{cost = 50;		requirements[]={"W"};	};	// "Water scooter"
				class O_Boat_Transport_01_F					{cost = 100;	requirements[]={"W"};	};	// "Assault Boat"
				class O_Boat_Armed_01_hmg_F					{cost = 250;	requirements[]={"W"};	};	// "Speedboat HMG"
				class O_SDV_01_F							{cost = 650;	requirements[]={"W"};	};	// "SDV"
			};
			class Gear
			{
				class Box_East_Ammo_F						{cost = 50;		requirements[]={};	};	// "Basic Ammo [CSAT]"
				class Box_East_Grenades_F					{cost = 50;		requirements[]={};	};	// "Grenades [CSAT]"
				class Box_East_Wps_F						{cost = 100;	requirements[]={};	};	// "Basic Weapons [CSAT]"
				class Box_CSAT_Uniforms_F					{cost = 100;	requirements[]={};	};	// "Uniforms [NATO]"
				class Box_CSAT_Equip_F						{cost = 100;	requirements[]={};	};	// "Equipment [NATO]"
				class Box_East_AmmoOrd_F					{cost = 150;	requirements[]={};	};	// "Explosives [CSAT]"
				class Box_East_WpsLaunch_F					{cost = 200;	requirements[]={};	};	// "Launchers [CSAT]"
				class Box_East_WpsSpecial_F					{cost = 250;	requirements[]={};	};	// "Special Weapons [CSAT]"
				class O_supplyCrate_F						{cost = 300;	requirements[]={};	};	// "Supply Box [CSAT]"
				class Box_East_AmmoVeh_F					{cost = 250;	requirements[]={};	};	// "Vehicle Ammo [CSAT]"
				class Land_Pod_Heli_Transport_04_ammo_F     {cost = 500;    requirements[]={};	};  // "Taru Ammo Pod"
				class Land_Pod_Heli_Transport_04_repair_F	{cost = 500;    requirements[]={};	};  // "Taru Repair Pod"
				class Land_Pod_Heli_Transport_04_fuel_F		{cost = 300;    requirements[]={};	};  // "Taru Fuel Pod"
			};
			class Defences
			{
				
				class Land_BagFence_Round_F					{cost = 50;	requirements[]={};		offset[]={0, 2, 0};};	// "Semi Circle Sand bags"  
				class Land_Razorwire_F						{cost = 50;	requirements[]={};		offset[]={0, 5, 0};};	// "Razor Wire Fence"  
				class Land_DragonsTeeth_01_1x1_new_F		{cost = 50;	requirements[]={};		offset[]={0, 2, 0};};	// "Tank barrier"    	 	
				class CamoNet_OPFOR_big_F					{cost = 100;	requirements[]={};	offset[]={0, 6, 0};};	// "Camouflage Vehicle Cover (Hex)"    	
				class Land_IRMaskingCover_01_F				{cost = 200;	requirements[]={};	offset[]={0, 8, 0};};	// "IR Masking Tent (Large)" 
				class O_HMG_01_F							{cost = 150;	requirements[]={};	};	// "Mk30 HMG .50"  
				class O_HMG_01_high_F						{cost = 200;	requirements[]={};	};	// "Mk30 HMG .50 (Raised)"
				class O_GMG_01_F							{cost = 200;	requirements[]={};	};	// "Mk32 GMG 20 mm"
				class O_GMG_01_high_F						{cost = 250;	requirements[]={};	};	// "Mk32 GMG 20 mm (Raised)"
				class O_static_AT_F							{cost = 300;	requirements[]={};	};	// "Static Titan Launcher (AT) [CSAT]"  
				class O_static_AA_F							{cost = 300;	requirements[]={};	};	// "Static Titan Launcher (AA) [CSAT]"  
				class O_HMG_01_A_F							{cost = 500;	requirements[]={};	};	// "Mk30 HMG Auto Turret"
				class O_GMG_01_A_F							{cost = 650;	requirements[]={};	};	// "Mk30 GMG Auto Turret"
				class O_Mortar_01_F							{cost = 3000;	requirements[]={};	};	// "Mortar"  
				class O_UGV_02_Demining_F					{cost = 100;	requirements[]={};	offset[]={0, 3, 0};};	// "UGAV demining"  
				class O_UGV_01_F							{cost = 150;	requirements[]={};	offset[]={0, 3, 0};};	// "UGV Stomper"   
				class O_UGV_01_rcws_F						{cost = 400;	requirements[]={};	};	// "UGAV rcws"  
				class O_UAV_01_F       						{cost = 500;    requirements[]={};  };  // AR-2
				class O_Radar_System_02_F					{cost = 1000;	requirements[]={};	offset[]={0, 7, 0};};	// "R-750 Cronus Radar"  
				class B_AAA_System_01_F 					{cost = 3500;	requirements[]={};	offset[]={0, 5.3, 0};};	// "Praetorian 1C";  
				class B_SAM_System_01_F						{cost = 10000;	requirements[]={};	offset[]={0, 5.3, 0};};	// "Mk49 Spartan";  
				class O_SAM_System_04_F						{cost = 8000;	requirements[]={};	offset[]={0, 6, 0};};	// "S-750 Rhea"  
				class B_SAM_System_02_F						{cost = 15000;	requirements[]={};	offset[]={0, 5.3, 0};};	// "Mk21 Centurion";  
				class B_Ship_MRLS_01_F						{cost = 30000;	requirements[]={};	offset[]={0, 7, 0};};	// "Mk41 VLS";  
			};
		};
	};
};