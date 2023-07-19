class CfgFunctions {
	class BIS
	{
    	class Client 
		{
    		file = "Functions\client";
			class WL2_mrtmConvo {ext = ".fsm";};
			class WL2_chatMsg {ext = ".fsm";};
			class WL2_cpBalance {};
    		class WL2_announcer {};
			class WL2_assetMapControl {};
			class WL2_forceGroupIconsFunctionality {};
			class WL2_friendlyFireHandleClient {};
			class WL2_groupIconClickHandle {};
			class WL2_groupIconEnterHandle {};
			class WL2_groupIconLeaveHandle {};
			class WL2_handleEnemyCapture {};
			class WL2_hintHandle {};
			class WL2_initClient {};
			class WL2_mapControlHandle {};
			class WL2_onPause {};
			class WL2_orderAircraft {};
			class WL2_orderArsenal {};
			class WL2_orderDefence {};
			class WL2_orderFastTravel {};
			class WL2_orderVehicle {};
			class WL2_orderFundsTransfer {};
			class WL2_orderLastLoadout {};
			class WL2_orderNaval {};
			class WL2_orderSavedLoadout {};
			class WL2_orderSectorScan {};
			class WL2_purchaseMenuOpeningHandle {};
			class WL2_refreshCurrentTargetData {};
			class WL2_refreshOSD {};
			class WL2_requestPurchase {};
			class WL2_sceneDrawHandle {};
			class WL2_sectorCaptureStatus {};
			class WL2_sectorMarkerUpdate {};
			class WL2_sectorRevealHandle {};
			class WL2_sectorSelectionHandle {};
			class WL2_sectorsInitClient {};
			class WL2_sectorOwnershipHandleClient {};
			class WL2_selectedTargetsHandle {};
			class WL2_setOSDEvent {};
			class WL2_setupUI {};
			class WL2_sideToFaction {};
			class WL2_smoothText {};
			class WL2_targetResetHandle {};
			class WL2_targetSelected {};
			class WL2_targetSelectionHandleClient {};
			class WL2_teammatesAvailability {};
			class WL2_zoneRestrictionHandleClient {};
			class WL2_timer {};
			class WL2_orderFTVehicleFT {};
			class WL2_orderFTVehicle {};
			class WL2_orderFTPodFT {};
			class WL2_orderFTPod {};
			class WL2_welcome {};
			class WL2_betty {};
			class WL2_rita {};
			class WL2_mapIcons {};
			class WL2_vehicleRearm {};
			class WL2_forfeitHandle {};
			class WL2_orderForfeit {};
			class WL2_killRewardClient {};
			class WL2_underWaterCheck {};
			class WL2_mrtmAction {};
			class WL2_targetResetHandleVote {};
			class WL2_orderBounty {};
    	};
		class Server 
		{
    		file = "Functions\server";
    		class WL2_assetRelevanceCheck {ext = ".fsm";};
			class WL2_incomePayoff {ext = ".fsm";};
			class WL2_garbageCollector {};
			class WL2_detectNewPlayers {};
			class WL2_friendlyFireHandleServer {};
			class WL2_changeSectorOwnership {};
			class WL2_initServer {};
			class WL2_loadFactionClasses {};
			class WL2_mineLimit {};
			class WL2_populateSector {};
			class WL2_processRunways {};
			class WL2_sectorsInitServer {};
			class WL2_selectTarget {};
			class WL2_setupNewWarlord {};
			class WL2_targetResetHandleServer {};
			class WL2_targetSelectionHandleServer {};
			class WL2_zoneRestrictionHandleServer {};
			class WL2_killRewardHandle {};
			class WL2_fundsDatabaseWrite {};
			class WL2_fundsDatabaseUpdate {};
			class WL2_tablesSetUp {};
			class WL2_handleClientRequest {};
			class WL2_forfeitHandleServer {};
			class WL2_createDroneCrew {};
			class WL2_setOwner {};
    	};
    	class Common {
    		file = "Functions\common";
    		class WL2_findSpawnPositions {};
			class WL2_generateVariableName {};
			class WL2_getRespawnMarkers {};
			class WL2_getSideBase {};
			class WL2_handleRespawnMarkers {};
			class WL2_income {};
			class WL2_initCommon {};
			class WL2_missionEndHandle {};
			class WL2_newAssetHandle {};
			class WL2_parsePurchaseList {};
			class WL2_playersListHandle {};
			class WL2_respawnHandle {};
			class WL2_sectorScanHandle {};
			class WL2_sortSectorArrays {};
			class WL2_updateSectorArrays {};
			class WL2_varsInit {};
			class WL2_calcImbalance {};
    	};
		class Subroutines 
		{
    		file = "Functions\subroutines";
    		class WL2_sub_arsenalSetup {};
			class WL2_sub_assetAssemblyHandle {};
			class WL2_sub_deleteAsset {};
			class WL2_sub_purchaseMenuAssetAvailability {};
			class WL2_sub_purchaseMenuGetUIScale {};
			class WL2_sub_purchaseMenuHandleDLC {};
			class WL2_sub_purchaseMenuRefresh {};
			class WL2_sub_purchaseMenuSetAssetDetails {};
			class WL2_sub_purchaseMenuSetItemsList {};
			class WL2_sub_vehicleLockAction {};
			class WL2_sub_logisticsAddAction {};
			class WL2_sub_dazzlerAction {};
			class WL2_sub_rearmAction {};
			class WL2_sub_vehicleKickAction {};
    	};
		class MineCleanup 
		{
			file = "Functions\server\mineCleanup";
			class WL2_handleApersMine {};
			class WL2_handleApersBoundingMineMag {};
			class WL2_HandleApersDispenserAmmo {};
			class WL2_HandleATMineAmmo {};
			class WL2_handleM6SlamMineMag {};
			class WL2_handleM6SlamMineAmmo {};
			class WL2_handleClaymoreChargeAmmo {};
			class WL2_HandleExplosiveSatchel {};
			class WL2_handleExplosiveCharge {};
			class WL2_handleLargeIEDUrban {};
			class WL2_handleLargeIED {};
			class WL2_handleSmallIEDUrban {};
			class WL2_handleSmallIED {};
			class WL2_handleApersTripWireAmmo {};
			class WL2_handleApersTripWireMag {};
		}
	};

	/*******************************START OF CUSTOM CONTENT HERE****************************/
	class MRTM {
		class Init {
			file = "scripts\MRTM_settings";
			class settingsMenu {
				ext = ".fsm";
				postInit = 1;
				headerType = -1;
			};
			class onSliderChanged {};
			class updateViewDistance {};
			class openMenu {};
			class onChar {};
		};
	};
	class GOM {
		class init
		{
			file = "scripts\GOM\functions";
			class aircraftLoadoutParameters {preInit = 1;};
			class aircraftLoadoutInit {preInit = 1;};
		};
	};
	class KS
	{	
		class normalFunctions
		{
			file = "scripts\VUnflip\functions";	// Folder where all functions are.
			class unflipVehicle {};
			class unflipVehicleAddAction {};
			class isFlipped {};
		};
	};
	class DAPS
	{
		class APS 
		{
			file = "scripts\DAPS\Scripts\APS";
			class APSDazzler {ext = ".fsm";};
			class APSheavy {ext = ".fsm";};
			class APSlight {ext = ".fsm";};
			class APSmedium {ext = ".fsm";};
			class Dazzler {};
			class Generic {};
		};
		class Management
		{
			file = "scripts\DAPS\Scripts\Management";
			class AssignAPS {};
			class BroadcastTypes {};
			class KeyPressed {};
			class RearmAPS {};
			class RegisterVehicle {};
			class CompileTypes {};
		};
		class MISC
		{
			file = "scripts\DAPS\Scripts\Misc";
			class Active {};
			class CanSmoke {};
			class CountAmmo {};
			class GetDirection {};
			class HasCharges {};
			class IsIRguided {};
			class IsLaserGuided {};
			class IsRadarGuided {};
			class IsVisualGuided {};
			class MisguideMissile {};
			class popSmoke {};
			class PopSmokeTurn {};
			class React {};
			class RelDir2 {};
		};
		class Report
		{
			file = "scripts\DAPS\Scripts\Report";
			class Report {};
		};
	};
	class DIS
	{
		class SAM {
			file = "scripts\DIS\SAM";
			class getOwner {};
			class Frag {};
			class IsSam {};
			class RegisterSAM {};
			class SAMmaneuver {};
			class SAMfired {};
		};
	};
};