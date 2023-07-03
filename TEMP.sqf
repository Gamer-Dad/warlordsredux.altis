BIS_WL_initModule setVariable ["BIS_WL_targetVotingDuration", 15];
BIS_WL_initModule setVariable ["BIS_WL_requisitionPreset", "['A3ReduxAll']"];
BIS_WL_initModule setVariable ["BIS_WL_scanCost", 750];
BIS_WL_initModule setVariable ["BIS_WL_fastTravelCostOwned", 0];
BIS_WL_initModule setVariable ["BIS_WL_fastTravelCostContested", 200]; //Cost of fast travel to contested sector
BIS_WL_initModule setVariable ["BIS_WL_fundsTransferCost", 2000];  //default 1000; Increased to 2000 to limits a CP exploit on official servers
BIS_WL_initModule setVariable ["BIS_WL_targetResetCost", 500]; //default value 2000; lowered to 500 for official servers
BIS_WL_initModule setVariable ["BIS_WL_maxCP", 50000];
BIS_WL_initModule setVariable ["BIS_WL_autonomous_limit", 2];
BIS_WL_initModule setVariable ["BIS_WL_arsenalCost", 1000];
BIS_WL_initModule setVariable ["BIS_WL_maxSubordinates", 1]; //default value 8
BIS_WL_initModule setVariable ["BIS_WL_assetLimit", 10];
BIS_WL_initModule setVariable ["BIS_WL_targetResetTimeout", 300];
BIS_WL_initModule setVariable ["BIS_WL_baseValue", 50]; //this changes money from main base ie starter CP/Min, default value 10
BIS_WL_initModule setVariable ["BIS_WL_baseDistanceMin", 18]; //default value 5; Use _tolerance value in combo with baseDistanceMin to add randomness to base distances
BIS_WL_initModule setVariable ["BIS_WL_baseDistanceMax", -1]; //default value -1 
BIS_WL_initModule setVariable ["BIS_WL_scanCooldown", 300];
BIS_WL_initModule setVariable ["BIS_WL_lastLoadoutCost", 100];
BIS_WL_initModule setVariable ["BIS_WL_savedLoadoutCost", 500];


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