serverNamespace setVariable ["fundsDatabase", createHashMap];
serverNamespace setVariable ["playerList", createHashMap];

// Read mission config file for requisition costs
// Hierarchy: CfgWLRequisitionPresets >> preset >> side >> category >> class
private _costHashMap = createHashMap;
private _rearmTimerHashMap = createHashMap;
private _killRewardHashMap = createHashMap;
private _capValueHashMap = createHashMap;
private _turretOverridesHashMap = createHashMap;

private _requisitionPresets = BIS_WL_purchaseListTemplate;
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
				private _requisitionRearmTime = getNumber (_x >> "rearm");
				private _requisitionKillReward = getNumber (_x >> "killReward");
				private _requisitionCapValue = getNumber (_x >> "capValue");
				private _requisitionTurretOverrides = "inheritsFrom _x == (missionConfigFile >> 'TurretDefaults')" configClasses _x;

				if (_requisitionCost != 0) then {
					_costHashMap set [_requistitonName, _requisitionCost];
				};

				if (_requisitionRearmTime != 0) then {
					_rearmTimerHashMap set [_requistitonName, _requisitionRearmTime];
				};

				if (_requisitionKillReward != 0) then {
					_killRewardHashMap set [_requistitonName, _requisitionKillReward];
				};

				if (_requisitionCapValue != 0) then {
					_capValueHashMap set [_requistitonName, _requisitionCapValue];
				};

				if (count _requisitionTurretOverrides > 0) then {
					_turretOverridesHashMap set [_requistitonName, _requisitionTurretOverrides];
				};
			} forEach _requisitionClasses;
		} forEach _requisitionCategories;
	} forEach _requisitionSides;
} forEach _requisitionPresets;

serverNamespace setVariable ["WL2_costs", _costHashMap];
serverNamespace setVariable ["WL2_killRewards", _killRewardHashMap];
serverNamespace setVariable ["WL2_cappingValues", _capValueHashMap];
missionNamespace setVariable ["WL2_rearmTimers", _rearmTimerHashMap, true];
missionNamespace setVariable ["WL2_turretOverrides", _turretOverridesHashMap, true];

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