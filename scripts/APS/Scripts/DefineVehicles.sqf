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
	"B_APC_Tracked_01_CRV_F",		// Bobcat
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
	"O_MBT_04_cannon_F",			// T-140 Angara
	"O_MBT_04_command_F",			// T-140K Angara
	"O_MBT_02_railgun_F",			// T-100 Futura
	"B_MBT_01_cannon_F",			// Slammer
	"B_MBT_01_TUSK_F",				// Slammer UP
	"I_APC_tracked_03_cannon_F",	// Mora
	"I_MBT_03_cannon_F"				// Kuma
];

_apsDazzler = ["O_T_Truck_03_device_ghex_F", "O_Truck_03_device_F"];

// APS projectile block lists (heavy contains everything medium, medium contains everything light)
_heavyBlockList = [];				// For now, heavy doesn't block anything extra

_mediumBlockList = [
	// Tank ATGM
    "M_120mm_cannon_ATGM",			// 120mm Cannon ATGM
    "M_120mm_cannon_ATGM_LG",		// 120mm Cannon ATGM (Laser Guided)
    "M_125mm_cannon_ATGM",			// 125mm Cannon ATGM

	// Ground Vehicle AT
    "M_127mm_Firefist_AT",			// Nyx Firefist AT
	"M_Titan_AT_long",				// Titan AT (Vehicle)
	"M_SPG9_HE",					// SPG-9 HE
    "M_SPG9_HEAT",					// SPG-9 HEAT

	// Air Vehicle SEAD
    "ammo_Missile_HARM",			// AGM-88 HARM
    "ammo_Missile_KH58",			// KH-58 ARM

	// Air Vehicle Guided
	"M_AT",							// DAR
    "M_Jian_AT",					// Jian
    "M_PG_AT",						// DAGR
    "M_Scalpel_AT",					// Scalpel
    "M_Scalpel_AT_hidden",			// Scalpel (x2)
    "Missile_AGM_01_F",				// Sharur
    "Missile_AGM_02_F",				// Macer II

	// Air Vehicle Unguided
	"R_80mm_HE",					// Skyfire
    "Rocket_03_AP_F",				// Tratnyr AP 
    "Rocket_03_HE_F",				// Tratnyr HE
    "Rocket_04_AP_F",				// Shrieker AP
    "Rocket_04_HE_F",				// Shrieker HE

	// Infantry
    "M_NLAW_AT_F",					// PCML
    "M_Titan_AP",					// Titan AP
    "M_Titan_AT",					// Titan AT
    "M_Titan_AT_static",			// Titan AT (Static)
    "M_Vorona_HE",					// Vorona HE
    "M_Vorona_HEAT"					// Vorona HEAT
];

_lightBlockList = [
    "R_MRAAWS_HE_F",				// MAAWS HE
    "R_MRAAWS_HEAT_F",				// MAAWS HEAT
    "R_MRAAWS_HEAT55_F",			// MAAWS HEAT55
    "R_PG32V_F",					// RPG-42 AT
    "R_PG7_F",						// RPG-7 HEAT
    "R_TBG32V_F"					// RPG-42 HE
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