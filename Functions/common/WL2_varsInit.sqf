#include "..\warlords_constants.inc"

params ["_locality"];

switch (_locality) do {
	case "common": {
		BIS_WL_sidesArray = [WEST, EAST, RESISTANCE];
		BIS_WL_competingSides = [[WEST, EAST], [WEST, RESISTANCE], [EAST, RESISTANCE]] # (BIS_WL_initModule getVariable ["BIS_WL_combatantsPreset", 0]);
		BIS_WL_targetVotingDuration = BIS_WL_initModule getVariable ["BIS_WL_targetVotingDuration", 15];
		BIS_WL_startCP = BIS_WL_initModule getVariable ["BIS_WL_startCP", 500]; //This doesn't work, look in TEMP.sqf
		BIS_WL_fogOfWar = BIS_WL_initModule getVariable ["BIS_WL_fogOfWar", 1];
		BIS_WL_localSide = (BIS_WL_sidesArray - BIS_WL_competingSides) # 0;
		BIS_WL_missionEnd = FALSE;
		BIS_WL_sectorUpdateInProgress = FALSE;
		BIS_WL_mapSize = getNumber (configFile >> "cfgWorlds" >> worldName >> "mapSize");
		if (BIS_WL_mapSize == 0) then {BIS_WL_mapSize = getNumber (configFile >> "cfgWorlds" >> worldName >> "Grid" >> "OffsetY")};
		BIS_WL_mapAreaArray = [[BIS_WL_mapSize / 2, BIS_WL_mapSize / 2], BIS_WL_mapSize / 2, BIS_WL_mapSize / 2, 0, TRUE];
		BIS_WL_purchaseListTeplateArr = call compile (BIS_WL_initModule getVariable ["BIS_WL_requisitionPreset", "['A3DefaultAll']"]);
		BIS_WL_scanCost = BIS_WL_initModule getVariable ["BIS_WL_scanCost", 350];
		BIS_WL_fastTravelCostOwned = BIS_WL_initModule getVariable ["BIS_WL_fastTravelCostOwned", 0];
		BIS_WL_fastTravelCostContested = BIS_WL_initModule getVariable ["BIS_WL_fastTravelCostContested", 50];
		BIS_WL_fundsTransferCost = BIS_WL_initModule getVariable ["BIS_WL_fundsTransferCost", 500];
		BIS_WL_targetResetCost = BIS_WL_initModule getVariable ["BIS_WL_targetResetCost", 2000];
		BIS_WL_scanEnabled = BIS_WL_initModule getVariable ["BIS_WL_scanEnabled", TRUE];
		BIS_WL_fastTravelEnabled = BIS_WL_initModule getVariable ["BIS_WL_fastTravelEnabled", 1];
		BIS_WL_maxCP = BIS_WL_initModule getVariable ["BIS_WL_maxCP", 50000];
		BIS_WL_dropCost = BIS_WL_initModule getVariable ["BIS_WL_dropCost", 25];
		BIS_WL_dropCost_far = BIS_WL_initModule getVariable ["BIS_WL_dropCost_far", 1000];
		BIS_WL_arsenalEnabled = BIS_WL_initModule getVariable ["BIS_WL_arsenalEnabled", TRUE];
		BIS_WL_arsenalCost = BIS_WL_initModule getVariable ["BIS_WL_arsenalCost", 1000];
		BIS_WL_assetLimit = BIS_WL_initModule getVariable ["BIS_WL_assetLimit", 10];
		BIS_WL_maxSubordinates = BIS_WL_initModule getVariable ["BIS_WL_maxSubordinates", 3];
		BIS_WL_targetResetTimeout = BIS_WL_initModule getVariable ["BIS_WL_targetResetTimeout", 300];
		BIS_WL_baseValue = BIS_WL_initModule getVariable ["BIS_WL_baseValue", 10];
		BIS_WL_scanCooldown = (BIS_WL_initModule getVariable ["BIS_WL_scanCooldown", 90]) max WL_SCAN_DURATION;
		BIS_WL_lastLoadoutCost = BIS_WL_initModule getVariable ["BIS_WL_lastLoadoutCost", 100];
		BIS_WL_savedLoadoutCost = BIS_WL_initModule getVariable ["BIS_WL_savedLoadoutCost", 500];
		BIS_WL_zoneRestrictionSetting = BIS_WL_initModule getVariable ["BIS_WL_zoneRestrictionSetting", 0];
		BIS_WL_savingEnabled = BIS_WL_initModule getVariable ["BIS_WL_savingEnabled", FALSE];
		BIS_WL_blacklistedBackpacks = [];
		{
			private _class = _x;
			private _bases = getArray (_class >> "assembleInfo" >> "base");
			if (count _bases > 0 || (toLower configName _class) find "respawn" != -1) then {
				BIS_WL_blacklistedBackpacks pushBackUnique configName _class;
				{
					BIS_WL_blacklistedBackpacks pushBackUnique _x;
				} forEach _bases;
			};
		} forEach ("getNumber (_x >> 'scope') == 2 && (configName _x) isKindOf 'Bag_Base'" configClasses (configFile >> "CfgVehicles"));

		BIS_WL_blacklistedBackpacks = BIS_WL_blacklistedBackpacks - [""];

		BIS_WL_blacklistedBackpacks append [
			"C_IDAP_UGV_02_Demining_backpack_F",
			"I_UGV_02_Demining_backpack_F",
			"O_UGV_02_Demining_backpack_F",
			"I_E_UGV_02_Demining_backpack_F",
			"B_UGV_02_Demining_backpack_F",
			"I_UGV_02_Science_backpack_F",
			"O_UGV_02_Science_backpack_F",
			"I_E_UGV_02_Science_backpack_F",
			"B_UGV_02_Science_backpack_F"
		];
	};
	case "server": {
		BIS_WL_allowAIVoting = BIS_WL_initModule getVariable ["BIS_WL_allowAIVoting", FALSE];
		BIS_WL_initialProgress = BIS_WL_initModule getVariable ["BIS_WL_initialProgress", FALSE];
		BIS_WL_baseDistanceMin = BIS_WL_initModule getVariable ["BIS_WL_baseDistanceMin", 1];
		BIS_WL_baseDistanceMax = BIS_WL_initModule getVariable ["BIS_WL_baseDistanceMax", -1];
		BIS_WL_wreckRemovalTimeout = BIS_WL_initModule getVariable ["BIS_WL_wreckRemovalTimeout", 30];
		BIS_WL_corpseRemovalTimeout = BIS_WL_initModule getVariable ["BIS_WL_corpseRemovalTimeout", 600];
		if (BIS_WL_baseDistanceMax < 0) then {BIS_WL_baseDistanceMax = 999};
		BIS_WL_initialProgress = switch (BIS_WL_initialProgress) do {
			case 0: 	{[0, 0]};
			case 2525: 	{[0.25, 0.25]};
			case 5050: 	{[0.5, 0.5]};
			case 250: 	{[0.25, 0]};
			case 500: 	{[0.5, 0]};
			case 750: 	{[0.75, 0]};
			case 25: 	{[0, 0.25]};
			case 50: 	{[0, 0.5]};
			case 75: 	{[0, 0.75]};
			case 5025: 	{[0.5, 0.25]};
			case 7525: 	{[0.75, 0.25]};
			case 2550: 	{[0.25, 0.5]};
			case 2575: 	{[0.25, 0.75]};
		};
		BIS_WL_playerIDArr = [[], []];
		BIS_WL_faction_WEST = BIS_WL_initModule getVariable ["BIS_WL_faction_WEST", "BLU_F"];
		BIS_WL_faction_EAST = BIS_WL_initModule getVariable ["BIS_WL_faction_EAST", "OPF_F"];
		BIS_WL_faction_GUER = BIS_WL_initModule getVariable ["BIS_WL_faction_GUER", "IND_F"];
		{
			missionNamespace setVariable [format ["BIS_WL_boundTo%1", _x], []];
		} forEach BIS_WL_competingSides;
		BIS_WL_timeMultiplier = BIS_WL_initModule getVariable ["BIS_WL_timeMultiplier", 12];
	};
	case "client": {
		BIS_WL_playerSide = side group player;
		BIS_WL_enemySide = (BIS_WL_competingSides - [BIS_WL_playerSide]) # 0;
		BIS_WL_playersAlpha = (BIS_WL_initModule getVariable ["BIS_WL_playersAlpha", 50]) / 100;
		BIS_WL_markersAlpha = (BIS_WL_initModule getVariable ["BIS_WL_markersAlpha", 50]) / 100;
		BIS_WL_autonomous_limit = BIS_WL_initModule getVariable ["BIS_WL_autonomous_limit", 2];
		BIS_WL_playerBase = BIS_WL_playerSide call BIS_fnc_WL2_getSideBase;
		BIS_WL_enemyBase = BIS_WL_enemySide call BIS_fnc_WL2_getSideBase;
		BIS_WL_mapSizeIndex = BIS_WL_mapSize / 8192;
		BIS_WL_colorMarkerFriendly = ["colorBLUFOR", "colorOPFOR", "colorIndependent"] # (BIS_WL_sidesArray find BIS_WL_playerSide);
		BIS_WL_colorMarkerEnemy = ["colorBLUFOR", "colorOPFOR", "colorIndependent"] # (BIS_WL_sidesArray find BIS_WL_enemySide);
		BIS_WL_targetVote = objNull;
		BIS_WL_announcerEnabled = BIS_WL_initModule getVariable ["BIS_WL_announcerEnabled", TRUE];
		BIS_WL_musicEnabled = BIS_WL_initModule getVariable ["BIS_WL_musicEnabled", TRUE];
		BIS_WL_terminateOSDEvent_voting = FALSE;
		BIS_WL_terminateOSDEvent_seizing = FALSE;
		BIS_WL_terminateOSDEvent_trespassing = FALSE;
		BIS_WL_terminateOSDEvent_seizingDisabled = FALSE;
		BIS_WL_resetTargetSelection_client = FALSE;
		BIS_WL_localized_m = localize "STR_A3_rscdisplayarcademap_meters";
		BIS_WL_localized_km = localize "STR_A3_WL_unit_km";
		BIS_WL_purchaseMenuVisible = FALSE;
		BIS_WL_purchaseMenuDiscovered = FALSE;
		BIS_WL_gearKeyPressed = FALSE;
		BIS_WL_currentSelection = WL_ID_SELECTION_NONE;
		BIS_WL_matesAvailable = floor (BIS_WL_maxSubordinates / 2);
		BIS_WL_matesInBasket = 0;
		BIS_WL_vehsInBasket = 0;
		BIS_WL_dropPool = [];
		BIS_WL_lastLoadout = [];
		BIS_WL_savedLoadout = [];
		BIS_WL_loadoutApplied = FALSE;
		BIS_WL_selectionMapManager = -1;
		BIS_WL_currentlyScannedSectors = [];
		BIS_WL_currentTargetData = [
			"\A3\ui_f\data\map\markers\nato\b_hq.paa",
			[0, 0, 0, 0],
			[0, 0, 0]
		];
		BIS_WL_colorsArray = [
			[profileNamespace getVariable ["Map_BLUFOR_R", 0], profileNamespace getVariable ["Map_BLUFOR_G", 1], profileNamespace getVariable ["Map_BLUFOR_B", 1], profileNamespace getVariable ["Map_BLUFOR_A", 0.8]],
			[profileNamespace getVariable ["Map_OPFOR_R", 0], profileNamespace getVariable ["Map_OPFOR_G", 1], profileNamespace getVariable ["Map_OPFOR_B", 1], profileNamespace getVariable ["Map_OPFOR_A", 0.8]],
			[profileNamespace getVariable ["Map_Independent_R", 0], profileNamespace getVariable ["Map_Independent_G", 1], profileNamespace getVariable ["Map_Independent_B", 1], profileNamespace getVariable ["Map_Independent_A", 0.8]],
			[profileNamespace getVariable ["Map_Unknown_R", 0], profileNamespace getVariable ["Map_Unknown_G", 1], profileNamespace getVariable ["Map_Unknown_B", 1], profileNamespace getVariable ["Map_Unknown_A", 0.8]]
		];
		BIS_WL_sectorIconsArray = [
			"\A3\ui_f\data\map\markers\nato\b_installation.paa",
			"\A3\ui_f\data\map\markers\nato\o_installation.paa",
			"\A3\ui_f\data\map\markers\nato\n_installation.paa"
		];
		BIS_WL_colorFriendly = BIS_WL_colorsArray # (BIS_WL_sidesArray find BIS_WL_playerSide);
		BIS_WL_recentlyPurchasedAssets = [];
		BIS_WL_penalized = FALSE;
		BIS_WL_mapAssetTarget = objNull;
	};
};