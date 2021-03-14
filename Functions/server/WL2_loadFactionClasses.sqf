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
		"B_Soldier_F",			100,
		"B_Soldier_GL_F",		80,
		"B_soldier_AR_F",		70,
		"B_soldier_AAR_F",		70,
		"B_Soldier_TL_F",		30,
		"B_soldier_M_F",		20,
		"B_soldier_LAT_F",		20,
		"B_soldier_LAT2_F",		20,
		"B_Soldier_A_F",		20,
		"B_Soldier_SL_F",		15,
		"B_medic_F",			15,
		"B_soldier_repair_F",		15,
		"B_soldier_AT_F",		15,
		"B_soldier_AA_F",		15,
		"B_engineer_F",			15,
		"B_soldier_AAT_F",		15,
		"B_soldier_AAA_F",		15,
		"B_Sharpshooter_F",		15,
		"B_HeavyGunner_F",		15,
		"B_soldier_exp_F",		10,
		"B_officer_F",			10,
		"B_spotter_F",			10,
		"B_sniper_F",			10
	],
	[
		"O_Soldier_F",			100,
		"O_Soldier_GL_F",		80,
		"O_Soldier_AR_F",		70,
		"O_Soldier_AAR_F",		70,
		"O_Soldier_TL_F",		30,
		"O_officer_F",			10,
		"O_soldier_M_F",		20,
		"O_Soldier_LAT_F",		20,
		"O_Soldier_A_F",		20,
		"O_Soldier_SL_F",		15,
		"O_Soldier_AAT_F",		15,
		"O_Soldier_AAA_F",		15,
		"O_Sharpshooter_F",		15,
		"O_HeavyGunner_F",		15,
		"O_Soldier_AT_F",		15,
		"O_Soldier_AA_F",		15,
		"O_engineer_F",			15,
		"O_medic_F",			15,
		"O_soldier_repair_F",		15,
		"O_soldier_exp_F",		10,
		"O_spotter_F",			10,
		"O_sniper_F",			10
	],
	[
		"I_soldier_F",			100,
		"I_Soldier_GL_F",		80,
		"I_Soldier_AR_F",		70,
		"I_Soldier_AAR_F",		70,
		"I_Soldier_TL_F",		30,
		"I_Soldier_A_F",		20,
		"I_Soldier_M_F",		20,
		"I_Soldier_LAT_F",		20,
		"I_Soldier_LAT2_F",		20,
		"I_Soldier_SL_F",		15,
		"I_Soldier_AAT_F",		15,
		"I_Soldier_AAA_F",		15,
		"I_Soldier_AT_F",		15,
		"I_Soldier_AA_F",		15,
		"I_medic_F",			15,
		"I_Soldier_repair_F",		15,
		"I_engineer_F",			15,
		"I_Soldier_exp_F",		10,
		"I_officer_F",			10,
		"I_Spotter_F",			10,
		"I_Sniper_F",			10
	]
];

BIS_WL_factionVehicleClasses = [
	[
		"B_APC_Wheeled_01_cannon_F",		50,
		"B_AFV_Wheeled_01_up_cannon_F",		50,
		"B_AFV_Wheeled_01_cannon_F",		50,
		"B_APC_Tracked_01_CRV_F",		50,
		"B_APC_Tracked_01_rcws_F",		50,
		"B_LSV_01_armed_F",			75,
		"B_LSV_01_AT_F",			75,
		"B_MRAP_01_hmg_F",			100,
		"B_MRAP_01_gmg_F",			100,
		"B_APC_Tracked_01_AA_F",		50,
		"B_MBT_01_cannon_F",			25,
		"B_MBT_01_TUSK_F",			25
	],
	[
			
		"O_APC_Wheeled_02_rcws_v2_F",
		"O_MRAP_02_gmg_F",			100,
		"O_MRAP_02_hmg_F",			100,
		"O_LSV_02_AT_F",			75,
		
		"O_LSV_02_armed_F",			75,
		"O_MBT_02_cannon_F",			25,
		"O_APC_Tracked_02_cannon_F",		50,
		
		"O_MBT_04_cannon_F",			15,
		"O_MBT_04_command_F",			15,
		"O_APC_Tracked_02_AA_F",		50
	],
	[
		
		"I_LT_01_AA_F",				50,
		"I_APC_Wheeled_03_cannon_F",		50,
		"I_APC_tracked_03_cannon_F",		50,
		"I_LT_01_AT_F",				50,
		"I_LT_01_cannon_F",			50,
		"I_MRAP_03_gmg_F",			100,
		"I_MRAP_03_hmg_F",			100,
		"I_MBT_03_cannon_F",			25
	]
];

BIS_WL_factionAircraftClasses = [
	[
		"B_Heli_Light_01_dynamicLoadout_F",	100,
		"B_Heli_Attack_01_dynamicLoadout_F",	50
	],
	[
		"O_Heli_Attack_02_dynamicLoadout_F",	50,
		"O_Heli_Light_02_dynamicLoadout_F",	100
	],
	[
		"I_Heli_light_03_dynamicLoadout_F",	100
	]
];