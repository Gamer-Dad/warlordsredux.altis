startLoadingScreen [""];

BIS_fnc_WL2_announcer = compile preprocessFileLineNumbers "Functions\client\WL2_announcer.sqf";
BIS_fnc_WL2_assetMapControl = compile preprocessFileLineNumbers "Functions\client\WL2_assetMapControl.sqf";
BIS_fnc_WL2_assetRelevanceCheck = compile preprocessFileLineNumbers "Functions\server\WL2_assetRelevanceCheck.sqf";
BIS_fnc_WL2_detectNewPlayers = compile preprocessFileLineNumbers "Functions\server\WL2_detectNewPlayers.sqf";
BIS_fnc_WL2_findSpawnPositions = compile preprocessFileLineNumbers "Functions\common\WL2_findSpawnPositions.sqf";
BIS_fnc_WL2_forceGroupIconsFunctionality = compile preprocessFileLineNumbers "Functions\client\WL2_forceGroupIconsFunctionality.sqf";
BIS_fnc_WL2_friendlyFireHandleClient = compile preprocessFileLineNumbers "Functions\client\WL2_friendlyFireHandleClient.sqf";
BIS_fnc_WL2_friendlyFireHandleServer = compile preprocessFileLineNumbers "Functions\server\WL2_friendlyFireHandleServer.sqf";
BIS_fnc_WL2_fundsControl = compile preprocessFileLineNumbers "Functions\common\WL2_fundsControl.sqf";
BIS_fnc_WL2_garbageCollector = compile preprocessFileLineNumbers "Functions\server\WL2_garbageCollector.sqf";
BIS_fnc_WL2_generateVariableName = compile preprocessFileLineNumbers "Functions\common\WL2_generateVariableName.sqf";
BIS_fnc_WL2_getRespawnMarkers = compile preprocessFileLineNumbers "Functions\common\WL2_getRespawnMarkers.sqf";
BIS_fnc_WL2_getSideBase = compile preprocessFileLineNumbers "Functions\common\WL2_getSideBase.sqf";
BIS_fnc_WL2_groupIconClickHandle = compile preprocessFileLineNumbers "Functions\client\WL2_groupIconClickHandle.sqf";
BIS_fnc_WL2_groupIconEnterHandle = compile preprocessFileLineNumbers "Functions\client\WL2_groupIconEnterHandle.sqf";
BIS_fnc_WL2_groupIconLeaveHandle = compile preprocessFileLineNumbers "Functions\client\WL2_groupIconLeaveHandle.sqf";
BIS_fnc_WL2_handleEnemyCapture = compile preprocessFileLineNumbers "Functions\client\WL2_handleEnemyCapture.sqf";
BIS_fnc_WL2_handleRespawnMarkers = compile preprocessFileLineNumbers "Functions\common\WL2_handleRespawnMarkers.sqf";
BIS_fnc_WL2_hintHandle = compile preprocessFileLineNumbers "Functions\client\WL2_hintHandle.sqf";
BIS_fnc_WL2_changeSectorOwnership = compile preprocessFileLineNumbers "Functions\server\WL2_changeSectorOwnership.sqf";
BIS_fnc_WL2_income = compile preprocessFileLineNumbers "Functions\common\WL2_income.sqf";
BIS_fnc_WL2_incomePayoff = compile preprocessFileLineNumbers "Functions\server\WL2_incomePayoff.sqf";
BIS_fnc_WL2_initCommon = compile preprocessFileLineNumbers "Functions\common\WL2_initCommon.sqf";
BIS_fnc_WL2_initServer = compile preprocessFileLineNumbers "Functions\server\WL2_initServer.sqf";
BIS_fnc_WL2_initClient = compile preprocessFileLineNumbers "Functions\client\WL2_initClient.sqf";
BIS_fnc_WL2_killRewardHandle = compile preprocessFileLineNumbers "Functions\common\WL2_killRewardHandle.sqf";
BIS_fnc_WL2_loadFactionClasses = compile preprocessFileLineNumbers "Functions\server\WL2_loadFactionClasses.sqf";
BIS_fnc_WL2_mainAIHandle = compile preprocessFileLineNumbers "Functions\server\WL2_mainAIHandle.sqf";
BIS_fnc_WL2_mapControlHandle = compile preprocessFileLineNumbers "Functions\client\WL2_mapControlHandle.sqf";
BIS_fnc_WL2_mapDrawHandle = compile preprocessFileLineNumbers "Functions\client\WL2_mapDrawHandle.sqf";
BIS_fnc_WL2_missionEndHandle = compile preprocessFileLineNumbers "Functions\common\WL2_missionEndHandle.sqf";
BIS_fnc_WL2_music = compile preprocessFileLineNumbers "Functions\client\WL2_music.sqf";
BIS_fnc_WL2_newAssetHandle = compile preprocessFileLineNumbers "Functions\common\WL2_newAssetHandle.sqf";
BIS_fnc_WL2_onPause = compile preprocessFileLineNumbers "Functions\client\WL2_onPause.sqf";
BIS_fnc_WL2_orderAircraft = compile preprocessFileLineNumbers "Functions\client\WL2_orderAircraft.sqf";
BIS_fnc_WL2_orderAirdrop = compile preprocessFileLineNumbers "Functions\client\WL2_orderAirdrop.sqf";
BIS_fnc_WL2_orderArsenal = compile preprocessFileLineNumbers "Functions\client\WL2_orderArsenal.sqf";
BIS_fnc_WL2_orderDefence = compile preprocessFileLineNumbers "Functions\client\WL2_orderDefence.sqf";
BIS_fnc_WL2_orderFastTravel = compile preprocessFileLineNumbers "Functions\client\WL2_orderFastTravel.sqf";
BIS_fnc_WL2_orderFundsTransfer = compile preprocessFileLineNumbers "Functions\client\WL2_orderFundsTransfer.sqf";
BIS_fnc_WL2_orderLastLoadout = compile preprocessFileLineNumbers "Functions\client\WL2_orderLastLoadout.sqf";
BIS_fnc_WL2_orderNaval = compile preprocessFileLineNumbers "Functions\client\WL2_orderNaval.sqf";
BIS_fnc_WL2_orderSavedLoadout = compile preprocessFileLineNumbers "Functions\client\WL2_orderSavedLoadout.sqf";
BIS_fnc_WL2_orderSectorScan = compile preprocessFileLineNumbers "Functions\client\WL2_orderSectorScan.sqf";
BIS_fnc_WL2_orderTargetReset = compile preprocessFileLineNumbers "Functions\client\WL2_orderTargetReset.sqf";
BIS_fnc_WL2_parsePurchaseList = compile preprocessFileLineNumbers "Functions\common\WL2_parsePurchaseList.sqf";
BIS_fnc_WL2_playersListHandle = compile preprocessFileLineNumbers "Functions\common\WL2_playersListHandle.sqf";
BIS_fnc_WL2_populateSector = compile preprocessFileLineNumbers "Functions\server\WL2_populateSector.sqf";
BIS_fnc_WL2_processClientRequest = compile preprocessFileLineNumbers "Functions\server\WL2_processClientRequest.sqf";
BIS_fnc_WL2_processRunways = compile preprocessFileLineNumbers "Functions\server\WL2_processRunways.sqf";
BIS_fnc_WL2_purchaseMenuOpeningHandle = compile preprocessFileLineNumbers "Functions\client\WL2_purchaseMenuOpeningHandle.sqf";
BIS_fnc_WL2_refreshCurrentTargetData = compile preprocessFileLineNumbers "Functions\client\WL2_refreshCurrentTargetData.sqf";
BIS_fnc_WL2_refreshIconsToDraw = compile preprocessFileLineNumbers "Functions\client\WL2_refreshIconsToDraw.sqf";
BIS_fnc_WL2_refreshOSD = compile preprocessFileLineNumbers "Functions\client\WL2_refreshOSD.sqf";
BIS_fnc_WL2_requestPurchase = compile preprocessFileLineNumbers "Functions\client\WL2_requestPurchase.sqf";
BIS_fnc_WL2_sceneDrawHandle = compile preprocessFileLineNumbers "Functions\client\WL2_sceneDrawHandle.sqf";
BIS_fnc_WL2_respawnHandle = compile preprocessFileLineNumbers "Functions\common\WL2_respawnHandle.sqf";
BIS_fnc_WL2_sectorCaptureStatus = compile preprocessFileLineNumbers "Functions\client\WL2_sectorCaptureStatus.sqf";
BIS_fnc_WL2_sectorMarkerUpdate = compile preprocessFileLineNumbers "Functions\client\WL2_sectorMarkerUpdate.sqf";
BIS_fnc_WL2_sectorRevealHandle = compile preprocessFileLineNumbers "Functions\client\WL2_sectorRevealHandle.sqf";
BIS_fnc_WL2_sectorScanHandle = compile preprocessFileLineNumbers "Functions\common\WL2_sectorScanHandle.sqf";
BIS_fnc_WL2_sectorSelectionHandle = compile preprocessFileLineNumbers "Functions\client\WL2_sectorSelectionHandle.sqf";
BIS_fnc_WL2_sectorsInitClient = compile preprocessFileLineNumbers "Functions\client\WL2_sectorsInitClient.sqf";
BIS_fnc_WL2_sectorsInitServer = compile preprocessFileLineNumbers "Functions\server\WL2_sectorsInitServer.sqf";
BIS_fnc_WL2_sectorOwnershipHandleClient = compile preprocessFileLineNumbers "Functions\client\WL2_sectorOwnershipHandleClient.sqf";
BIS_fnc_WL2_selectedTargetsHandle = compile preprocessFileLineNumbers "Functions\client\WL2_selectedTargetsHandle.sqf";
BIS_fnc_WL2_selectTarget = compile preprocessFileLineNumbers "Functions\server\WL2_selectTarget.sqf";
BIS_fnc_WL2_sendClientRequest = compile preprocessFileLineNumbers "Functions\client\WL2_sendClientRequest.sqf";
BIS_fnc_WL2_setOSDEvent = compile preprocessFileLineNumbers "Functions\client\WL2_setOSDEvent.sqf";
BIS_fnc_WL2_setupNewWarlord = compile preprocessFileLineNumbers "Functions\server\WL2_setupNewWarlord.sqf";
BIS_fnc_WL2_setupUI = compile preprocessFileLineNumbers "Functions\client\WL2_setupUI.sqf";
BIS_fnc_WL2_sideToFaction = compile preprocessFileLineNumbers "Functions\client\WL2_sideToFaction.sqf";
BIS_fnc_WL2_smoothText = compile preprocessFileLineNumbers "Functions\client\WL2_smoothText.sqf";
BIS_fnc_WL2_sortSectorArrays = compile preprocessFileLineNumbers "Functions\common\WL2_sortSectorArrays.sqf";
BIS_fnc_WL2_sub_arsenalSetup = compile preprocessFileLineNumbers "Functions\subroutines\WL2_sub_arsenalSetup.sqf";
BIS_fnc_WL2_sub_assetAssemblyHandle = compile preprocessFileLineNumbers "Functions\subroutines\WL2_sub_assetAssemblyHandle.sqf";
BIS_fnc_WL2_sub_assetLanding = compile preprocessFileLineNumbers "Functions\subroutines\WL2_sub_assetLanding.sqf";
BIS_fnc_WL2_sub_deleteAsset = compile preprocessFileLineNumbers "Functions\subroutines\WL2_sub_deleteAsset.sqf";
BIS_fnc_WL2_sub_purchaseMenuAssetAvailability = compile preprocessFileLineNumbers "Functions\subroutines\WL2_sub_purchaseMenuAssetAvailability.sqf";
BIS_fnc_WL2_sub_purchaseMenuGetUIScale = compile preprocessFileLineNumbers "Functions\subroutines\WL2_sub_purchaseMenuGetUIScale.sqf";
BIS_fnc_WL2_sub_purchaseMenuHandleDLC = compile preprocessFileLineNumbers "Functions\subroutines\WL2_sub_purchaseMenuHandleDLC.sqf";
BIS_fnc_WL2_sub_purchaseMenuRefresh = compile preprocessFileLineNumbers "Functions\subroutines\WL2_sub_purchaseMenuRefresh.sqf";
BIS_fnc_WL2_sub_purchaseMenuSetAssetDetails = compile preprocessFileLineNumbers "Functions\subroutines\WL2_sub_purchaseMenuSetAssetDetails.sqf";
BIS_fnc_WL2_sub_purchaseMenuSetItemsList = compile preprocessFileLineNumbers "Functions\subroutines\WL2_sub_purchaseMenuSetItemsList.sqf";
BIS_fnc_WL2_sub_restrictMines = compile preprocessFileLineNumbers "Functions\subroutines\WL2_sub_restrictMines.sqf";
BIS_fnc_WL2_sub_vehicleLockAction = compile preprocessFileLineNumbers "Functions\subroutines\WL2_sub_vehicleLockAction.sqf";
BIS_fnc_WL2_syncedTime = compile preprocessFileLineNumbers "Functions\common\WL2_syncedTime.sqf";
BIS_fnc_WL2_targetResetHandle = compile preprocessFileLineNumbers "Functions\client\WL2_targetResetHandle.sqf";
BIS_fnc_WL2_targetResetHandleServer = compile preprocessFileLineNumbers "Functions\server\WL2_targetResetHandleServer.sqf";
BIS_fnc_WL2_targetSelected = compile preprocessFileLineNumbers "Functions\client\WL2_targetSelected.sqf";
BIS_fnc_WL2_targetSelectionHandleClient = compile preprocessFileLineNumbers "Functions\client\WL2_targetSelectionHandleClient.sqf";
BIS_fnc_WL2_targetSelectionHandleServer = compile preprocessFileLineNumbers "Functions\server\WL2_targetSelectionHandleServer.sqf";
BIS_fnc_WL2_teammatesAvailability = compile preprocessFileLineNumbers "Functions\client\WL2_teammatesAvailability.sqf";
BIS_fnc_WL2_updateSectorArrays = compile preprocessFileLineNumbers "Functions\common\WL2_updateSectorArrays.sqf";
BIS_fnc_WL2_varsInit = compile preprocessFileLineNumbers "Functions\common\WL2_varsInit.sqf";
BIS_fnc_WL2_zoneRestrictionHandleClient = compile preprocessFileLineNumbers "Functions\client\WL2_zoneRestrictionHandleClient.sqf";
BIS_fnc_WL2_zoneRestrictionHandleServer = compile preprocessFileLineNumbers "Functions\server\WL2_zoneRestrictionHandleServer.sqf";

endLoadingScreen;

//---Trophy
//call compile preprocessFile "Functions\External\Baked_AIS\Baked_AIS_init.sqf";
//execVM "scripts\DAPS\Scripts\Start.sqf";

//view distance limits 
tawvd_maxRange = 4000; //max range allowed
tawvd_disablenone = true; //disables the disabling of grass I think
tawvd_foot = 2000;
tawvd_car = 3000;
tawvd_air = 4000;
tawvd_drone = 4000;
tawvd_object = tawvd_foot;

// runs the earplug script
[] execVM "scripts\GF_Earplugs\Credits.sqf";	// Please keep the Credits or add them to your Diary

addMissionEventHandler ["Loaded", {
	params ["_saveType"];
	
	If(_saveType isEqualto "continue") then{
		[] execVM "GF_Earplugs\GF_Earplugs.sqf";
		
	};
}];




[] execVM "scripts\GF_Earplugs\GF_Earplugs.sqf";
//end of earplug section 

//Vehicle unflip 
if ( hasInterface ) then
{
	waitUntil { !isNull player };
	
	// Call the Vehicle Speed Limit Script.
	//Not needed:  [30, true] call KS_fnc_limitVehicleSpeed;
	
	// Spawn the Vehicle Unflip Script Loop.
	[] spawn KSLOOP_fnc_unflipVehicleAddAction;
};
//End of Vehicle unflip

//welcome test 
[] execVM "welcome.sqf";
//end welcome section 

//all thermal vision off
addMissionEventHandler ["Draw3D",
{

	if (currentVisionMode player isEqualTo 2) then
	{
		if (isNil "A3W_thermalOffline") then
		{
			"A3W_thermalOffline" cutText ["THERMAL IMAGING OFFLINE", "BLACK", 0.001, false];
			A3W_thermalOffline = true;
		};
	}
	else
	{
		if (!isNil "A3W_thermalOffline") then
		{
			"A3W_thermalOffline" cutText ["", "PLAIN", 0.001, false];
			A3W_thermalOffline = nil;
		};
	};
}];


[] call BIS_fnc_WL2_initCommon;