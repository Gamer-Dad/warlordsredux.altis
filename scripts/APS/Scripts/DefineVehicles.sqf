// Vehicles that use each type of APS
apsLight = [
	"O_MRAP_02_hmg_F",	// Ifrit
	"O_MRAP_02_gmg_F",
	"B_MRAP_01_hmg_F",	// Hunter
	"B_MRAP_01_gmg_F",
	"I_LT_01_AA_F",		// Nyx
	"I_LT_01_AT_F",
	"I_LT_01_cannon_F",
	"I_MRAP_03_gmg_F",	// Strider
	"I_MRAP_03_hmg_F"
];

apsMedium = [
	"O_APC_Wheeled_02_rcws_v2_F",	// Marid
	"O_APC_Tracked_02_cannon_F",	// BTR
	"O_APC_Tracked_02_AA_F",		// Tigris
	"B_APC_Wheeled_03_cannon_F",	// Gorgon
	"B_APC_Wheeled_01_cannon_F",	// Marshall
	"B_APC_Tracked_01_rcws_F",		// Panther
	"B_APC_Tracked_01_AA_F",		// Cheetah
	"B_AFV_Wheeled_01_cannon_F",	// Rhino
	"B_AFV_Wheeled_01_up_cannon_F",
	"I_APC_Wheeled_03_cannon_F"		// Gorgon
];

apsHeavy = [
	"O_MBT_02_cannon_F",			// T-100
	"O_MBT_04_cannon_F",			// T-140
	"O_MBT_04_command_F",
	"O_MBT_02_railgun_F",			//T-100 Futura
	"B_MBT_01_cannon_F",			// Slammer
	"B_MBT_01_TUSK_F",
	"B_MBT_01_arty_F",				// Scorcher
	"B_MBT_01_mlrs_F",				// Sandstorm MLRS
	"O_MBT_02_arty_F",				// Sochor
	"I_Truck_02_MRL_F",				// Zamak MRL
	"I_APC_tracked_03_cannon_F",	// Mora
	"I_MBT_03_cannon_F"				// Kuma
];

apsDazzler = ["O_T_Truck_03_device_ghex_F", "O_Truck_03_device_F"];

// APS projectile block lists
_heavyBlockList = [
	"M_120mm_cannon_ATGM_LG", 	// Rhino ATGM LG
	"M_127mm_Firefist_AT", 		// Nyx AT
	"Missile_AGM_01_F", 		// Sharur
	"Missile_AGM_02_F", 		// Macer II
	"R_80mm_HE", 				// Skyfire
	"Rocket_03_AP_F",			// Tratnyr 
	"Rocket_03_HE_F",
	"Rocket_04_AP_F", 			// Shrieker
	"Rocket_04_HE_F",
	"M_AT", 					// DAR
	"M_PG_AT", 					// DAGR
	"M_Scalpel_AT", 			// Skalpel
	"M_Scalpel_AT_hidden",
	"M_SPG9_HE", 				// SPG-9
	"M_SPG9_HEAT", 
	"M_Titan_AP",				// Titan
	"M_Titan_AT", 
	"M_Titan_AT_long", 
	"M_Titan_AT_static", 
	"M_Vorona_HE", 				// Vorona
	"M_Vorona_HEAT", 
	"R_MRAAWS_HE_F", 			// MAAWS
	"R_MRAAWS_HEAT_F", 
	"R_MRAAWS_HEAT55_F",
	"R_TBG32V_F", 				// RPG-42
	"R_PG32V_F",
	"R_PG7_F",					// RPG-7
	"M_NLAW_AT_F" 				// PCML
];

_mediumBlockList = [
	"ammo_Missile_KH58",		// KH-58 
	"ammo_Missile_HARM",		// HARM
	"Missile_AGM_01_F", 		// Sharur
	"Missile_AGM_02_F", 		// Macer II
	"M_120mm_cannon_ATGM_LG", 	// Rhino ATGM LG
	"M_127mm_Firefist_AT", 		// Nyx AT
	"R_80mm_HE", 				// Skyfire
	"Rocket_03_AP_F",			// Tratnyr 
	"Rocket_03_HE_F",
	"Rocket_04_AP_F", 			// Shrieker
	"Rocket_04_HE_F",
	"M_AT", 					// DAR
	"M_PG_AT", 					// DAGR
	"M_Scalpel_AT", 			// Skalpel
	"M_Scalpel_AT_hidden",
	"M_SPG9_HE", 				// SPG-9
	"M_SPG9_HEAT", 
	"M_Titan_AP",				// Titan
	"M_Titan_AT", 
	"M_Titan_AT_long", 
	"M_Titan_AT_static", 
	"M_Vorona_HE", 				// Vorona
	"M_Vorona_HEAT", 
	"M_NLAW_AT_F", 				// PCML
	"R_MRAAWS_HE_F", 			// MAAWS
	"R_MRAAWS_HEAT_F", 
	"R_MRAAWS_HEAT55_F",
	"R_TBG32V_F", 				// RPG-42
	"R_PG32V_F",
	"R_PG7_F"					// RPG-7
];

_lightBlockList = [
	"M_NLAW_AT_F",				// PCML
	"R_MRAAWS_HE_F", 			// MAAWS
	"R_MRAAWS_HEAT_F", 
	"R_MRAAWS_HEAT55_F", 
	"R_TBG32V_F", 				// RPG-42
	"R_PG32V_F", 
	"R_PG7_F"					// RPG-7
];

// assumption: APS types are straight upgrades
apsEligibleProjectiles = createHashMap;
{
	apsEligibleProjectiles set [_x, 2];
} forEach _heavyBlockList;
{
	apsEligibleProjectiles set [_x, 1];
} forEach _mediumBlockList;
{
	apsEligibleProjectiles set [_x, 0];
} forEach _lightBlockList;

apsVehiclesMap = createHashMap;
{
	apsVehiclesMap set [_x, 2];
} forEach apsHeavy;
{
	apsVehiclesMap set [_x, 1];
} forEach apsMedium;
{
	apsVehiclesMap set [_x, 0];
} forEach apsLight;

{
	apsVehiclesMap set [_x, 3];
} forEach apsDazzler;
