BIS_WL_initModule setVariable ["BIS_WL_combatantsPreset", 0];
BIS_WL_initModule setVariable ["BIS_WL_faction_WEST", "BLU_F"];
BIS_WL_initModule setVariable ["BIS_WL_faction_EAST", "OPF_F"];
BIS_WL_initModule setVariable ["BIS_WL_faction_GUER", "IND_F"];
BIS_WL_initModule setVariable ["BIS_WL_startCP", 1000]; // Correct place to change starting CP, defualt value 1000
BIS_WL_initModule setVariable ["BIS_WL_targetVotingDuration", 15];
BIS_WL_initModule setVariable ["BIS_WL_allowAIVoting", FALSE];
BIS_WL_initModule setVariable ["BIS_WL_announcerEnabled", TRUE];
BIS_WL_initModule setVariable ["BIS_WL_musicEnabled", TRUE];
BIS_WL_initModule setVariable ["BIS_WL_initialProgress", 0];
BIS_WL_initModule setVariable ["BIS_WL_fogOfWar", 1];
BIS_WL_initModule setVariable ["BIS_WL_playersAlpha", 50];
BIS_WL_initModule setVariable ["BIS_WL_markersAlpha", 50];
BIS_WL_initModule setVariable ["BIS_WL_requisitionPreset", "['A3ReduxAll']"];
BIS_WL_initModule setVariable ["BIS_WL_scanCost", 350];
BIS_WL_initModule setVariable ["BIS_WL_fastTravelCostOwned", 0];
BIS_WL_initModule setVariable ["BIS_WL_fastTravelCostContested", 50]; //Cost of fast travel to contested sector
BIS_WL_initModule setVariable ["BIS_WL_fundsTransferCost", 1000];  //Set to 1000 to prevent relog and transfer for a +500 CP profit
BIS_WL_initModule setVariable ["BIS_WL_targetResetCost", 2000]; //default value 2000
BIS_WL_initModule setVariable ["BIS_WL_scanEnabled", TRUE];
BIS_WL_initModule setVariable ["BIS_WL_fastTravelEnabled", 1];
BIS_WL_initModule setVariable ["BIS_WL_maxCP", 50000];
BIS_WL_initModule setVariable ["BIS_WL_dropCost", 25];
BIS_WL_initModule setVariable ["BIS_WL_dropCost_far", 1000];
BIS_WL_initModule setVariable ["BIS_WL_autonomous_limit", 2];
BIS_WL_initModule setVariable ["BIS_WL_arsenalEnabled", TRUE];
BIS_WL_initModule setVariable ["BIS_WL_arsenalCost", 1000];
BIS_WL_initModule setVariable ["BIS_WL_maxSubordinates", 8]; //default value 8
BIS_WL_initModule setVariable ["BIS_WL_assetLimit", 10];
BIS_WL_initModule setVariable ["BIS_WL_targetResetTimeout", 300];
BIS_WL_initModule setVariable ["BIS_WL_baseValue", 50]; //this changes money from main base ie starter CP/Min, default value 10
BIS_WL_initModule setVariable ["BIS_WL_baseDistanceMin", 8]; //default value 5
BIS_WL_initModule setVariable ["BIS_WL_baseDistanceMax", -1]; //default value -1 
BIS_WL_initModule setVariable ["BIS_WL_scanCooldown", 90];
BIS_WL_initModule setVariable ["BIS_WL_lastLoadoutCost", 100];
BIS_WL_initModule setVariable ["BIS_WL_wreckRemovalTimeout", 30];
BIS_WL_initModule setVariable ["BIS_WL_corpseRemovalTimeout", 600];
BIS_WL_initModule setVariable ["BIS_WL_savedLoadoutCost", 500];
BIS_WL_initModule setVariable ["BIS_WL_timeMultiplier", 6];
BIS_WL_initModule setVariable ["BIS_WL_zoneRestrictionSetting", 0];
BIS_WL_initModule setVariable ["BIS_WL_savingEnabled", FALSE];

{
	_x setVariable ["objectArea", triggerArea ((_x nearObjects ["EmptyDetector", 100]) # 0)];
	if (isNil {_x getVariable "BIS_WL_services"}) then {
		_x setVariable ["BIS_WL_services", []];
	};
	if (isNil {_x getVariable "BIS_WL_canBeBase"}) then {
		_x setVariable ["BIS_WL_canBeBase", TRUE];
	};
	_x setVariable ["BIS_WL_fastTravelEnabled", TRUE];
} forEach BIS_WL_allSectors;

{_x enableSimulation FALSE} forEach allMissionObjects "EmptyDetector";