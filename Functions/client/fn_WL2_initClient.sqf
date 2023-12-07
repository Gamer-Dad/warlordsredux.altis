#include "..\warlords_constants.inc"

["client_init"] call BIS_fnc_startLoadingScreen;

BIS_fnc_WL2_announcer = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_announcer.sqf";
BIS_fnc_WL2_askForgiveness = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_askForgiveness.sqf";
BIS_fnc_WL2_assetMapControl = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_assetMapControl.sqf";
BIS_fnc_WL2_betty = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_betty.sqf";
BIS_fnc_WL2_blockScreen = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_blockScreen.sqf";
BIS_fnc_WL2_clientEH = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_clientEH.sqf";
BIS_fnc_WL2_cpBalance = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_cpBalance.sqf";
BIS_fnc_WL2_deleteAssetFromMap = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_deleteAssetFromMap.sqf";
BIS_fnc_WL2_forfeitHandle = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_forfeitHandle.sqf";
BIS_fnc_WL2_friendlyFireHandleClient = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_friendlyFireHandleClient.sqf";
BIS_fnc_WL2_getRespawnMarkers = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_getRespawnMarkers.sqf";
BIS_fnc_WL2_groupIconClickHandle = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_groupIconClickHandle.sqf";
BIS_fnc_WL2_groupIconEnterHandle = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_groupIconEnterHandle.sqf";
BIS_fnc_WL2_groupIconLeaveHandle = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_groupIconLeaveHandle.sqf";
BIS_fnc_WL2_handleEnemyCapture = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_handleEnemyCapture.sqf";
BIS_fnc_WL2_hintHandle = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_hintHandle.sqf";
BIS_fnc_WL2_killRewardClient = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_killRewardClient.sqf";
BIS_fnc_WL2_mapControlHandle = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_mapControlHandle.sqf";
BIS_fnc_WL2_mapIcons = compileFinal preprocessFileLineNumbers "Functions\client\map\fn_WL2_mapIcons.sqf";
BIS_fnc_WL2_onPause = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_onPause.sqf";
BIS_fnc_WL2_orderAircraft = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_orderAircraft.sqf";
BIS_fnc_WL2_orderArsenal = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_orderArsenal.sqf";
BIS_fnc_WL2_orderDefence = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_orderDefence.sqf";
BIS_fnc_WL2_orderFastTravel = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_orderFastTravel.sqf";
BIS_fnc_WL2_orderForfeit = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_orderForfeit.sqf";
BIS_fnc_WL2_orderFTPodFT = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_orderFTPodFT.sqf";
BIS_fnc_WL2_orderFTVehicleFT = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_orderFTVehicleFT.sqf";
BIS_fnc_WL2_orderFundsTransfer = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_orderFundsTransfer.sqf";
BIS_fnc_WL2_orderLastLoadout = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_orderLastLoadout.sqf";
BIS_fnc_WL2_orderNaval = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_orderNaval.sqf";
BIS_fnc_WL2_orderSavedLoadout = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_orderSavedLoadout.sqf";
BIS_fnc_WL2_orderSectorScan = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_orderSectorScan.sqf";
BIS_fnc_WL2_orderVehicle = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_orderVehicle.sqf";
BIS_fnc_WL2_refreshCurrentTargetData = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_refreshCurrentTargetData.sqf";
BIS_fnc_WL2_refreshOSD = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_refreshOSD.sqf";
BIS_fnc_WL2_requestPurchase = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_requestPurchase.sqf";
BIS_fnc_WL2_rita = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_rita.sqf";
BIS_fnc_WL2_sceneDrawHandle = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_sceneDrawHandle.sqf";
BIS_fnc_WL2_sectorCaptureStatus = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_sectorCaptureStatus.sqf";
BIS_fnc_WL2_sectorMarkerUpdate = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_sectorMarkerUpdate.sqf";
BIS_fnc_WL2_sectorOwnershipHandleClient = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_sectorOwnershipHandleClient.sqf";
BIS_fnc_WL2_sectorRevealHandle = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_sectorRevealHandle.sqf";
BIS_fnc_WL2_sectorScanHandle = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_sectorScanHandle.sqf";
BIS_fnc_WL2_sectorSelectionHandle = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_sectorSelectionHandle.sqf";
BIS_fnc_WL2_sectorsInitClient = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_sectorsInitClient.sqf";
BIS_fnc_WL2_selectedTargetsHandle = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_selectedTargetsHandle.sqf";
BIS_fnc_WL2_setOSDEvent = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_setOSDEvent.sqf";
BIS_fnc_WL2_setupUI = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_setupUI.sqf";
BIS_fnc_WL2_sideToFaction = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_sideToFaction.sqf";
BIS_fnc_WL2_smoothText = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_smoothText.sqf";
BIS_fnc_WL2_targetResetHandle = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_targetResetHandle.sqf";
BIS_fnc_WL2_targetResetHandleVote = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_targetResetHandleVote.sqf";
BIS_fnc_WL2_targetSelected = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_targetSelected.sqf";
BIS_fnc_WL2_targetSelectionHandleClient = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_targetSelectionHandleClient.sqf";
BIS_fnc_WL2_teammatesAvailability = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_teammatesAvailability.sqf";
BIS_fnc_WL2_timer = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_timer.sqf";
BIS_fnc_WL2_wasMain = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_wasMain.sqf";
BIS_fnc_WL2_welcome = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_welcome.sqf";
BIS_fnc_WL2_zoneRestrictionHandleClient = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_zoneRestrictionHandleClient.sqf";

BIS_fnc_WL2_sub_arsenalSetup = compileFinal preprocessFileLineNumbers "Functions\subroutines\fn_WL2_sub_arsenalSetup.sqf";
BIS_fnc_WL2_sub_dazzlerAction = compileFinal preprocessFileLineNumbers "Functions\subroutines\fn_WL2_sub_dazzlerAction.sqf";
BIS_fnc_WL2_sub_logisticsAddAction = compileFinal preprocessFileLineNumbers "Functions\subroutines\fn_WL2_sub_logisticsAddAction.sqf";
BIS_fnc_WL2_sub_purchaseMenuAssetAvailability = compileFinal preprocessFileLineNumbers "Functions\subroutines\fn_WL2_sub_purchaseMenuAssetAvailability.sqf";
BIS_fnc_WL2_sub_purchaseMenuGetUIScale = compileFinal preprocessFileLineNumbers "Functions\subroutines\fn_WL2_sub_purchaseMenuGetUIScale.sqf";
BIS_fnc_WL2_sub_purchaseMenuHandleDLC = compileFinal preprocessFileLineNumbers "Functions\subroutines\fn_WL2_sub_purchaseMenuHandleDLC.sqf";
BIS_fnc_WL2_sub_purchaseMenuRefresh = compileFinal preprocessFileLineNumbers "Functions\subroutines\fn_WL2_sub_purchaseMenuRefresh.sqf";
BIS_fnc_WL2_sub_purchaseMenuSetAssetDetails = compileFinal preprocessFileLineNumbers "Functions\subroutines\fn_WL2_sub_purchaseMenuSetAssetDetails.sqf";
BIS_fnc_WL2_sub_purchaseMenuSetItemsList = compileFinal preprocessFileLineNumbers "Functions\subroutines\fn_WL2_sub_purchaseMenuSetItemsList.sqf";
BIS_fnc_WL2_sub_radarOperate = compileFinal preprocessFileLineNumbers "Functions\subroutines\fn_WL2_sub_radarOperate.sqf";
BIS_fnc_WL2_sub_rearmAction = compileFinal preprocessFileLineNumbers "Functions\subroutines\fn_WL2_sub_rearmAction.sqf";
BIS_fnc_WL2_sub_rearmActionAir = compileFinal preprocessFileLineNumbers "Functions\subroutines\fn_WL2_sub_rearmActionAir.sqf";
BIS_fnc_WL2_sub_removeAction = compileFinal preprocessFileLineNumbers "Functions\subroutines\fn_WL2_sub_removeAction.sqf";
BIS_fnc_WL2_sub_vehicleLockAction = compileFinal preprocessFileLineNumbers "Functions\subroutines\fn_WL2_sub_vehicleLockAction.sqf";

BIS_fnc_WL2_vehicleRearm = compileFinal preprocessFileLineNumbers "Functions\client\rearming\fn_WL2_vehicleRearm.sqf";
BIS_fnc_animate = compileFinal preprocessFileLineNumbers "Functions\client\rearming\fn_animate.sqf";
BIS_fnc_getCamos = compileFinal preprocessFileLineNumbers "Functions\client\rearming\fn_getCamos.sqf";
BIS_fnc_getExtras = compileFinal preprocessFileLineNumbers "Functions\client\rearming\fn_getExtras.sqf";
BIS_fnc_getHulls = compileFinal preprocessFileLineNumbers "Functions\client\rearming\fn_getHulls.sqf";
BIS_fnc_rearm = compileFinal preprocessFileLineNumbers "Functions\client\rearming\fn_rearm.sqf";

waitUntil {!isNull player && {isPlayer player}};

"client" call BIS_fnc_WL2_varsInit;
waitUntil {!(isNil "BIS_WL_playerSide")};

private _uid = getPlayerUID player;
private _switch = format ["teamBlocked_%1", _uid];
waitUntil {!isNil {missionNamespace getVariable _switch}};
if (missionNamespace getVariable _switch) exitWith {
	addMissionEventHandler ["EachFrame", {
		clearRadio;
	}];
	sleep 0.1;
	["client_init"] call BIS_fnc_endLoadingScreen;
	player removeItem "ItemMap";
	player removeItem "ItemRadio";
	[player] joinSilent BIS_WL_wrongTeamGroup;
	enableRadio false;
	enableSentences false;
	0 fadeSpeech 0;
	0 fadeRadio 0;
	{_x enableChannel [false, false]} forEach [0,1,2,3,4,5];
	missionNamespace setVariable [_switch, nil];
	[localize "STR_A3_WL_switch_teams", localize "STR_A3_WL_switch_teams_info"] call BIS_fnc_WL2_blockScreen;
};
missionNamespace setVariable [_switch, nil];

private _imb = format ["balanceBlocked_%1", _uid];
waitUntil {!isNil {missionNamespace getVariable _imb}};
if (missionNamespace getVariable _imb) exitWith {
	addMissionEventHandler ["EachFrame", {
		clearRadio;
	}];
	sleep 0.1;
	["client_init"] call BIS_fnc_endLoadingScreen;
	player removeItem "ItemMap";
	player removeItem "ItemRadio";
	[player] joinSilent BIS_WL_wrongTeamGroup;
	enableRadio false;
	enableSentences false;
	0 fadeSpeech 0;
	0 fadeRadio 0;
	{_x enableChannel [false, false]} forEach [0,1,2,3,4,5];
	missionNamespace setVariable [_imb, nil];
	["Teams are imbalanced!", "It seems that the teams are not balanced, please head back to the lobby and join the other team, Thank you."] call BIS_fnc_WL2_blockScreen;
};
missionNamespace setVariable [_imb, nil];

_text = toLower (name player);
_list = getArray (missionConfigFile >> "adminFilter");
if ((_list findIf {[_x, _text] call BIS_fnc_inString}) != -1) exitWith {
	["client_init"] call BIS_fnc_endLoadingScreen;
	player removeItem "ItemMap";
	player removeItem "ItemRadio";
	[player] joinSilent BIS_WL_wrongTeamGroup;
	enableRadio false;
	enableSentences false;
	0 fadeSpeech 0;
	0 fadeRadio 0;
	{_x enableChannel [false, false]} forEach [0,1,2,3,4,5];
	[localize "STR_A3_nameFilter", localize "STR_A3_nameFilter_info"] call BIS_fnc_WL2_blockScreen;	
};

if !(BIS_WL_playerSide in BIS_WL_competingSides) exitWith {
	["client_init"] call BIS_fnc_endLoadingScreen;
	["Warlords error: Your unit is not a Warlords competitor"] call BIS_fnc_error;
};

enableRadio true;
enableSentences true;
{_x enableChannel [true, true]} forEach [1,3,4,5];
{_x enableChannel [true, false]} forEach [0,2];
enableEnvironment [false, true];

call MRTM_fnc_settingsInit;
uiNamespace setVariable ["BIS_WL_purchaseMenuLastSelection", [0,0,0]];
uiNamespace setVariable ["activeControls", []];
uiNamespace setVariable ["control", 10000];

if !(_uid in (getArray (missionConfigFile >> "adminIDs"))) then {
	0 spawn BIS_fnc_WL2_wasMain;
};

if !(isServer) then {
	"setup" call BIS_fnc_WL2_handleRespawnMarkers;
};
call BIS_fnc_WL2_sectorsInitClient;

["client", true] call BIS_fnc_WL2_updateSectorArrays;

private _specialStateArray = (BIS_WL_sectorsArray # 6) + (BIS_WL_sectorsArray # 7);
{
	[_x, _x getVariable "BIS_WL_owner", _specialStateArray] call BIS_fnc_WL2_sectorMarkerUpdate;
} forEach BIS_WL_allSectors;

if !(isServer) then {
	BIS_WL_playerSide call BIS_fnc_WL2_parsePurchaseList;
};

0 spawn BIS_fnc_WL2_sectorCaptureStatus;
0 spawn BIS_fnc_WL2_teammatesAvailability;
setGroupIconsSelectable true;
setGroupIconsVisible [true, false];
0 spawn BIS_fnc_WL2_mapControlHandle;

_mrkrTargetEnemy = createMarkerLocal ["BIS_WL_targetEnemy", position (BIS_WL_enemySide call BIS_fnc_WL2_getSideBase)];
_mrkrTargetEnemy setMarkerColorLocal BIS_WL_colorMarkerEnemy;
_mrkrTargetFriendly = createMarkerLocal ["BIS_WL_targetFriendly", position (BIS_WL_playerSide call BIS_fnc_WL2_getSideBase)];
_mrkrTargetFriendly setMarkerColorLocal BIS_WL_colorMarkerFriendly;

{
	_x setMarkerAlphaLocal 0;
	_x setMarkerSizeLocal [2, 2];
	_x setMarkerTypeLocal "selector_selectedMission";
} forEach [_mrkrTargetEnemy, _mrkrTargetFriendly];

//Evenhandlers
0 spawn BIS_fnc_WL2_clientEH;
player spawn APS_fnc_SetupProjectiles;
call BIS_fnc_WL2_sub_arsenalSetup;

0 spawn {
	waitUntil {uiSleep 0.1; !isNull (uiNamespace getVariable ["BIS_WL_mapControl", controlNull])};
	(uiNamespace getVariable ["BIS_WL_mapControl", controlNull]) ctrlMapAnimAdd [0, 0.35, (BIS_WL_playerSide call BIS_fnc_WL2_getSideBase)];
	ctrlMapAnimCommit (uiNamespace getVariable ["BIS_WL_mapControl", controlNull]);
};

{_x setMarkerAlphaLocal 0} forEach BIS_WL_sectorLinks;

call BIS_fnc_WL2_refreshCurrentTargetData;
call BIS_fnc_WL2_sceneDrawHandle;
call BIS_fnc_WL2_targetResetHandle;
[player, "init"] spawn BIS_fnc_WL2_hintHandle;

["OSD"] spawn BIS_fnc_WL2_setupUI;
0 spawn BIS_fnc_WL2_timer;
0 spawn BIS_fnc_WL2_cpBalance;

0 spawn {
	_uid = getPlayerUID player;
	_selectedCnt = count ((groupSelectedUnits player) select {_x != player && {(_x getVariable ["BIS_WL_ownerAsset", "123"]) == _uid}});
	while {!BIS_WL_missionEnd} do {
		waitUntil {sleep 1; count ((groupSelectedUnits player) select {_x != player && {(_x getVariable ["BIS_WL_ownerAsset", "123"]) == _uid}}) != _selectedCnt};
		_selectedCnt = count ((groupSelectedUnits player) select {_x != player && {(_x getVariable ["BIS_WL_ownerAsset", "123"]) == _uid}});
		call BIS_fnc_WL2_sub_purchaseMenuRefresh;
	};
};

[player, "maintenance", {(player nearObjects ["All", 30]) findIf {(getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "transportRepair") > 0) || {(getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "transportAmmo") > 0)}} != -1}] call BIS_fnc_WL2_hintHandle;
[player, "nearSL", {(player distance2D (leader group player) <= 200) && {player != (leader group player)}}] call BIS_fnc_WL2_hintHandle;

0 spawn BIS_fnc_WL2_selectedTargetsHandle;
0 spawn BIS_fnc_WL2_targetSelectionHandleClient;
0 spawn BIS_fnc_WL2_assetMapControl;
0 spawn BIS_fnc_WL2_mapIcons;
private _fncEarPlugs = compile preprocessFileLineNumbers "scripts\GF_Earplugs\GF_Earplugs.sqf";
0 spawn _fncEarPlugs;

["client_init"] call BIS_fnc_endLoadingScreen;
"Initialized" call BIS_fnc_WL2_announcer;
[toUpper localize "STR_A3_WL_popup_init"] spawn BIS_fnc_WL2_smoothText;
0 spawn BIS_fnc_WL2_welcome;

0 spawn {
	_markers = BIS_WL_playerSide call BIS_fnc_WL2_getRespawnMarkers;
	_respawnPos = markerPos selectRandom _markers;
	while {player distance2D _respawnPos > 300} do {
		player setVehiclePosition [_respawnPos, [], 0, "NONE"];
		sleep 1;
	};
};

if !(["(EU) #11", serverName] call BIS_fnc_inString) then {
	player addAction [
		"10K CP",
		{[player, "10K"] remoteExec ["BIS_fnc_WL2_handleClientRequest", 2];}
	];
};
player linkItem"Integrated_NVG_TI_0_F";
