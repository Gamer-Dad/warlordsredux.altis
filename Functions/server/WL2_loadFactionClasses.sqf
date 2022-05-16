#include "..\warlords_constants.inc"
/*
BIS_WL_factionUnitClasses = [];

_cfgVehicles = "getNumber (_x >> 'scope') == 2 && getNumber (_x >> 'isMan') == 1 && vectorMagnitude getArray (_x >> 'threat') > 0.5 && (BIS_WL_blacklistedBackpacks find (getText (_x >> 'backpack')) == -1) && count getArray (_x >> 'weapons') > 2 && !((tolower getText (_x >> 'vehicleClass')) in ['menstory', 'mendiver'])" configClasses (configFile >> "CfgVehicles");

{
	private _side = _x;
	private _sideID = if (_forEachIndex < 2) then {abs (_forEachIndex - 1)} else {_forEachIndex};
	private _faction = missionNamespace getVariable format ["BIS_WL_faction_%1", _side];
	private _factionConfigs = _cfgVehicles select {
		getNumber (_x >> "side") == _sideID &&
		toLower getText (_x >> "faction") == toLower _faction
	};
	private _factionClassWeights = _factionConfigs apply {(1000000 - getNumber (_x >> "cost")) / 100000};
	_factionClassesWeighted = [];
	{
		_factionClassesWeighted pushBack configName _x;
		_factionClassesWeighted pushBack (_factionClassWeights # _forEachIndex);
	} forEach _factionConfigs;
	BIS_WL_factionUnitClasses pushBack _factionClassesWeighted;
} forEach BIS_WL_sidesArray;
*/

BIS_WL_factionUnitClasses = [
	[
		"CUP_B_USMC_Soldier",				5, //rifleman, default 100
		"CUP_B_USMC_Soldier_GL",			70, //Grenadir, default 80
		"CUP_B_USMC_Soldier_AR",			40, //Autorifleman, default 70
		"CUP_B_USMC_SpecOps_SD",			15, //Asst Autorifleman, default 70
		"CUP_B_USMC_Soldier",				5, //Team leader. default 30
		"CUP_B_USMC_Sniper_M40A3",			30, //Marksman, default 20
		"CUP_B_USMC_Soldier_AT",			10, //PCML, default 20
		"CUP_B_BAF_Soldier_Paratrooper_DPM",50, // MAAWS , default 20
		"CUP_B_USMC_Crew",					5, //Ammo, default 20
		"CUP_B_USMC_Pilot",					15, //Squad leader, default 15
		"CUP_B_USMC_Medic",					15, //Medic, default 15
		"CUP_B_USMC_Engineer",				5, //Repair, default 15
		"CUP_B_USMC_Soldier_HAT",			25, //Titan AT, default 15
		"CUP_B_USMC_Soldier_AA",			25, //Titan AA, default 15
		"CUP_B_USMC_Soldier_MG",			10, //Asst AT, default 15
		"CUP_B_USMC_Soldier_AT",			5, //Asst AA, default 15
		"CUP_B_USMC_Soldier_Marksman",		15, //762x51, default 15
		"CUP_B_USMC_Soldier_AR",			15, //338, default 15
		"CUP_B_USMC_Sniper_M40A3",			5 //sniper, default 10
	],
	[
		"CUP_O_RU_Soldier_EMR",				5, //rifleman, default 100
		"CUP_O_RU_Soldier_GL",				70, //Grenadir, default 80
		"CUP_O_RU_Soldier_AR",				40, //Autorifleman, default 70
		"CUP_O_RUS_SpecOps_SD_Autumn",		15, //Asst Autorifleman, default 70
		"CUP_O_RU_Crew",					5, //officer, default 10
		"CUP_O_RU_Soldier_LAT",				50, //RPG32, default 20
		"CUP_O_RU_Soldier_AT",				5, //Asst AT, default 15
		"CUP_O_RU_Soldier_MG",				15, //93x64, default 15
		"CUP_O_RU_Soldier_HAT",				25, //Titan AT, default 15
		"CUP_O_RU_Soldier_AA",				25, //Titan AA, default 15
		"CUP_O_RU_Engineer",				5, //engineer, default 15
		"CUP_O_RU_Medic",					15, //Medic, default 15
		"CUP_O_RU_Sniper_KSVK",				50, //Repair, default 15
		"CUP_O_RU_Pilot",					5, //APERS, default 10
		"CUP_O_RU_Spotter",					5, //spotter, default 10
		"CUP_O_RU_Sniper",					50 //sniper, default 10
	],
	[
		"CUP_I_GUE_Soldier_AKM",			5, //rifleman, default 100
		"CUP_I_GUE_Soldier_GL",				15, //Grenadir, default 80
		"CUP_I_GUE_Soldier_MG",				50, //Autorifleman, default 70
		"CUP_I_GUE_Soldier_AR",				25, //Asst Autorifleman, default 70
		"CUP_I_GUE_Officer",				60, //Team leader. default 30
		"CUP_I_GUE_Ammobearer",				5, //Ammo, default 20
		"CUP_I_GUE_Soldier_Scout",			30, //Marksman, default 20
		"CUP_I_GUE_Soldier_LAT",			40, //PCML, default 20
		"CUP_I_GUE_Soldier_AT",				60, //MAAWS? , deault 20
		"CUP_I_GUE_Soldier_AA2",			50, //Squad leader, default 15
		"CUP_I_GUE_Soldier_AA",				50, //Asst AT, default 15
		"CUP_I_GUE_Soldier_mEDIC",			20, //Medic, default 15
		"CUP_I_GUE_Engineer",				15, //engineer, default 15
		"CUP_I_GUE_Saboteur",				15, //APERS, default 10
		"CUP_I_GUE_Commander",				80, //officer, default 10
		"CUP_I_GUE_Soldier_Scout",			20, //spotter, default 10
		"CUP_I_GUE_Sniper",					30 //sniper, default 10
	]
];

BIS_WL_factionVehicleClasses = [
	[
		"CUP_B_M1030_USMC",					10, //Bike
		"B_Quadbike_01_F",					20, //Quadbike
		"CUP_B_M1152_USMC",					70, //Humvee Open
		"CUP_B_nM1025_Unarmed_USMC_WDL",	100, //Humvee Enclosed
		"CUP_B_MTVR_USMC",					150, //MTVR
		"CUP_B_MTVR_ReFuel_USMC",			250, //Refuel MTVR
		"CUP_B_nM997_USMC_WDL",				180, //Medical
		"CUP_B_nM1025_SOV_M2_USMC_WDL",		100, //Open Top Humvee
		"CUP_B_nM1025_SOV_MK19_USMC_WDL",	150, //Open Humvee
		"CUP_B_M1151_M2_USMC",				250, //Humvee HMG
		"CUP_B_M1165_GMV_USMC",				300, //Humvee Minigun
		"CUP_B_M1151_Mk19_USMC",			350, //Humvee GMG
		"CUP_B_nM1036_TOW_DF_USMC_WDL",		600, //Humvee Tow
		"CUP_B_nM1097_AVENGER_USA_WDL",		1500, //Humvee AA
		"CUP_B_MTVR_Repair_USMC",			1000, //MTVR Repair
		"CUP_B_MTVR_Ammo_USMC",				1500, //MTVR Ammo
		"CUP_B_M1126_ICV_M2_Woodland",		1000, //Striker M2
		"CUP_B_M1126_ICV_MK19_Woodland",	1100, //Striker GMG
		"CUP_B_M1128_MGS_Woodland",			1200, //Striker MGS
		"CUP_B_M2Bradley_USA_W",			2500, //Bradley IFV
		"CUP_B_M6LineBacker_USA_W",			3000, //Bradley AA
		"CUP_B_M60A3_TTS_USMC",				3500, //Patton tank
		"CUP_B_M1A1FEP_Woodland_USMC",		6000, //Abrams
		"CUP_B_M60A3_TTS_USMC",				10000 //Artillery

	


	],
	[
			
		"CUP_O_UAZ_Open_RU",				10, //
		"CUP_O_GAZ_Vodnik_Unarmed_RU",		100, //
		"CUP_O_UAZ_MG_RU",					150, //
		"CUP_O_Ural_RU",					100, //
		"CUP_O_Ural_Refuel_RU",				250, //
		"CUP_O_GAZ_Vodnik_MedEvac_RU",		175, //
		"CUP_O_GAZ_Vodnik_AGS_RU",			175, //
		"CUP_O_UAZ_SPG9_RU",				200, //
		"CUP_O_UAZ_METIS_RU",				500, //
		"CUP_O_Ural_Repair_RU",				1000, //
		"CUP_O_Ural_Reammo_RU",				1500, //
		"CUP_O_GAZ_Vodnik_KPVT_RU",			750, //
		"CUP_O_GAZ_Vodnik_BPPU_RU",			750, //
		"CUP_O_BTR60_RU",					1000, //
		"CUP_O_BRDM2_ATGM_RUS",				1250, //
		"CUP_O_BTR80_CAMO_RU",				1250, //
		"CUP_O_BTR80A_CAMO_RU",				1750, //
		"CUP_O_BMP2_RU",					3000, //
		"CUP_O_Ural_ZU23_RU",				1000, //
		"CUP_O_2S6_RU",						3000, //
		"CUP_O_T72_RU",						4700, //
		"CUP_O_BM21_RU",					10000 //


	],
	[
		
		"CUP_I_Datsun_AA",					250, //Pickup AA
		"CUP_I_BRDM2_NAPA",					800, //BRDM APC
		"CUP_I_MTLB_pk_NAPA",				1000,//HEAVY APC
		"CUP_I_BRDM2_ATGM_NAPA",			1200, //Light apc w/atgm
		"CUP_I_Hilux_armored_zu23_NAPA",	750,  //Hilux pickup armored zu23
		"CUP_I_Hilux_btr60_NAPA",			250, //Hilux with btr gun
		"CUP_I_Hilux_SPG9_NAPA",			125, //Hilux with SPG
		"CUP_I_T34_NAPA",					2000 //Kuma, default 25
	]
];

BIS_WL_factionAircraftClasses = [
	[
		"CUP_B_MH6J_USA",					250, //
		"CUP_B_AH6J_USA",					750, //
		"CUP_B_UH60M_US",					500, //
		"CUP_B_CH47F_USA",					750, //
		"CUP_B_C130J_GB",					1000, //
		"CUP_B_MH60L_DAP_4x_US",			4000, //
		"CUP_B_AH1Z_Dynamic_USMC",			6000, //
		"CUP_B_AH64D_DL_USA",				7500, //
		"CUP_B_A10_DYN_USA",				9000, //
		"CUP_B_AV8B_DYN_USMC",				25000 //
		

	
		
	],
	[
		"CUP_O_Mi8AMT_RU",					350, //
		"CUP_O_Mi8_medevac_RU",				500, //
		"CUP_O_MI6A_RU",					900, //
		"CUP_O_Mi8_RU",						4500, //
		"CUP_O_Mi24_V_Dynamic_RU",			6000, //
		"CUP_O_Ka52_RU",					7500, //
		"CUP_O_Su25_Dyn_RU",				9000, //
		"CUP_O_SU34_RU",					15000 //
		
	],
	[
		"CUP_I_CESSNA_T41_ARMED_RACS",		4000, //Indy Cessna w/rockets
		"CUP_I_UH1H_gunship_RACS", 			2500, //Huey w/rockets
		"CUP_I_AH6J_RACS", 					2000 //Little bird w/rockets and guns
		
		
	]
];