// Vehicles that use each type of APS
_apsLight = [
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

_apsMedium = [
	"O_APC_Wheeled_02_rcws_v2_F",	// Marid
	"O_APC_Tracked_02_cannon_F",	// BTR
	"O_APC_Tracked_02_AA_F",		// Tigris
	"B_APC_Wheeled_03_cannon_F",	// Gorgon
	"B_APC_Wheeled_01_cannon_F",	// Marshall
	"B_APC_Tracked_01_rcws_F",		// Panther
	"B_APC_Tracked_01_AA_F",		// Cheetah
	"B_AFV_Wheeled_01_cannon_F",	// Rhino
	"B_AFV_Wheeled_01_up_cannon_F", // Rhino UP
	"B_MBT_01_arty_F",				// Scorcher
	"B_MBT_01_mlrs_F",				// Sandstorm MLRS
	"O_MBT_02_arty_F",				// Sochor
	"I_Truck_02_MRL_F",				// Zamak MRL
	"I_APC_Wheeled_03_cannon_F"		// Gorgon
];

_apsHeavy = [
	"O_MBT_02_cannon_F",			// T-100
	"O_MBT_04_cannon_F",			// T-140
	"O_MBT_04_command_F",
	"O_MBT_02_railgun_F",			//T-100 Futura
	"B_MBT_01_cannon_F",			// Slammer
	"B_MBT_01_TUSK_F",
	"I_APC_tracked_03_cannon_F",	// Mora
	"I_MBT_03_cannon_F"				// Kuma
];

_apsDazzler = ["O_T_Truck_03_device_ghex_F", "O_Truck_03_device_F"];

// APS projectile block lists
_heavyBlockList = [
	"M_120mm_cannon_ATGM_LG",
	"M_127mm_Firefist_AT",
	"Missile_AGM_01_F",
	"Missile_AGM_02_F",
	"R_80mm_HE",
	"Rocket_03_AP_F",
	"Rocket_03_HE_F",
	"Rocket_04_AP_F",
	"Rocket_04_HE_F",
	"M_AT",
	"M_PG_AT",
	"M_Scalpel_AT",
	"M_Scalpel_AT_hidden",
	"M_SPG9_HE",
	"M_SPG9_HEAT",
	"M_Titan_AP",
	"M_Titan_AT",
	"M_Titan_AT_long",
	"M_Titan_AT_static",
	"M_Vorona_HE",
	"M_Vorona_HEAT",
	"R_MRAAWS_HE_F",
	"R_MRAAWS_HEAT_F", 
	"R_MRAAWS_HEAT55_F",
	"R_TBG32V_F",
	"R_PG32V_F",
	"R_PG7_F",
	"M_NLAW_AT_F",
	"M_Jian_AT"
];

_mediumBlockList = [
	"ammo_Missile_KH58",
	"ammo_Missile_HARM",
	"Missile_AGM_01_F",
	"Missile_AGM_02_F",
	"M_120mm_cannon_ATGM_LG",
	"M_127mm_Firefist_AT",
	"R_80mm_HE",
	"Rocket_03_AP_F",
	"Rocket_03_HE_F",
	"Rocket_04_AP_F",
	"Rocket_04_HE_F",
	"M_AT",
	"M_PG_AT",
	"M_Scalpel_AT",
	"M_Scalpel_AT_hidden",
	"M_SPG9_HE",
	"M_SPG9_HEAT",
	"M_Titan_AP",
	"M_Titan_AT",
	"M_Titan_AT_long",
	"M_Titan_AT_static",
	"M_Vorona_HE",
	"M_Vorona_HEAT",
	"M_NLAW_AT_F",
	"R_MRAAWS_HE_F",
	"R_MRAAWS_HEAT_F",
	"R_MRAAWS_HEAT55_F",
	"R_TBG32V_F",
	"R_PG32V_F",
	"R_PG7_F",
	"M_Jian_AT"
];

_lightBlockList = [
	"M_NLAW_AT_F",
	"R_MRAAWS_HE_F",
	"R_MRAAWS_HEAT_F",
	"R_MRAAWS_HEAT55_F",
	"R_TBG32V_F",
	"R_PG32V_F",
	"R_PG7_F"
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
} forEach _apsHeavy;
{
	apsVehiclesMap set [_x, 1];
} forEach _apsMedium;
{
	apsVehiclesMap set [_x, 0];
} forEach _apsLight;

{
	apsVehiclesMap set [_x, 3];
} forEach _apsDazzler;

apsAPStypes = _apsLight + _apsMedium + _apsHeavy;
apsAPSAll = apsAPStypes + _apsDazzler;