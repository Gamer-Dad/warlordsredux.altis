#include "..\warlords_constants.inc"

["client_init"] call BIS_fnc_startLoadingScreen;

BIS_fnc_WL2_announcer = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_announcer.sqf";
BIS_fnc_WL2_askForgiveness = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_askForgiveness.sqf";
BIS_fnc_WL2_assetMapControl = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_assetMapControl.sqf";
BIS_fnc_WL2_betty = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_betty.sqf";
BIS_fnc_WL2_blockScreen = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_blockScreen.sqf";
BIS_fnc_WL2_clientEH = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_clientEH.sqf";
BIS_fnc_WL2_cpBalance = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_cpBalance.sqf";
BIS_fnc_WL2_deathInfo = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_deathInfo.sqf";
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
BIS_fnc_WL2_factionBasedClientInit = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_factionBasedClientInit.sqf";
BIS_fnc_WL2_pingFix = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_pingFix.sqf";
BIS_fnc_WL2_pingFixInit = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_pingFixInit.sqf";
BIS_fnc_WL2_uavJammer = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_uavJammer.sqf";
BIS_fnc_WL2_spectrumAction = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_spectrumAction.sqf";
BIS_fnc_WL2_captureList = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_captureList.sqf";
BIS_fnc_WL2_MineLimitHint = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_MineLimitHint.sqf";
BIS_fnc_WL2_airburst = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_airburst.sqf";

BIS_fnc_WL2_sub_arsenalSetup = compileFinal preprocessFileLineNumbers "Functions\subroutines\fn_WL2_sub_arsenalSetup.sqf";
BIS_fnc_WL2_sub_dazzlerAction = compileFinal preprocessFileLineNumbers "Functions\subroutines\fn_WL2_sub_dazzlerAction.sqf";
BIS_fnc_WL2_sub_demolish = compileFinal preprocessFileLineNumbers "Functions\subroutines\fn_WL2_sub_demolish.sqf";
BIS_fnc_WL2_sub_jammerAction = compileFinal preprocessFileLineNumbers "Functions\subroutines\fn_WL2_sub_jammerAction.sqf";
BIS_fnc_WL2_sub_logisticsAddAction = compileFinal preprocessFileLineNumbers "Functions\subroutines\fn_WL2_sub_logisticsAddAction.sqf";
BIS_fnc_WL2_sub_purchaseMenuAssetAvailability = compileFinal preprocessFileLineNumbers "Functions\subroutines\fn_WL2_sub_purchaseMenuAssetAvailability.sqf";
BIS_fnc_WL2_sub_purchaseMenuGetUIScale = compileFinal preprocessFileLineNumbers "Functions\subroutines\fn_WL2_sub_purchaseMenuGetUIScale.sqf";
BIS_fnc_WL2_sub_purchaseMenuHandleDLC = compileFinal preprocessFileLineNumbers "Functions\subroutines\fn_WL2_sub_purchaseMenuHandleDLC.sqf";
BIS_fnc_WL2_sub_purchaseMenuRefresh = compileFinal preprocessFileLineNumbers "Functions\subroutines\fn_WL2_sub_purchaseMenuRefresh.sqf";
BIS_fnc_WL2_sub_purchaseMenuSetAssetDetails = compileFinal preprocessFileLineNumbers "Functions\subroutines\fn_WL2_sub_purchaseMenuSetAssetDetails.sqf";
BIS_fnc_WL2_sub_purchaseMenuSetItemsList = compileFinal preprocessFileLineNumbers "Functions\subroutines\fn_WL2_sub_purchaseMenuSetItemsList.sqf";
BIS_fnc_WL2_sub_radarOperate = compileFinal preprocessFileLineNumbers "Functions\subroutines\fn_WL2_sub_radarOperate.sqf";
BIS_fnc_WL2_sub_rearmAction = compileFinal preprocessFileLineNumbers "Functions\subroutines\fn_WL2_sub_rearmAction.sqf";
BIS_fnc_WL2_sub_removeAction = compileFinal preprocessFileLineNumbers "Functions\subroutines\fn_WL2_sub_removeAction.sqf";
BIS_fnc_WL2_sub_vehicleLockAction = compileFinal preprocessFileLineNumbers "Functions\subroutines\fn_WL2_sub_vehicleLockAction.sqf";

MRTM_fnc_settingsinit = compileFinal preprocessFileLineNumbers "scripts\MRTM\fn_settingsinit.sqf";

waitUntil {!isNull player && {isPlayer player}};

"client" call BIS_fnc_WL2_varsInit;
waitUntil {!(isNil "BIS_WL_playerSide")};
if (["(EU) #11", serverName] call BIS_fnc_inString) then {
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
		{
			_x setPlayerVoNVolume 1;
		} forEach allPlayers select {side _x == side player};
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
		{
			_x setPlayerVoNVolume 1;
		} forEach allPlayers select {side _x == side player};
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
};

if !(BIS_WL_playerSide in BIS_WL_competingSides) exitWith {
	["client_init"] call BIS_fnc_endLoadingScreen;
	["Warlords error: Your unit is not a Warlords competitor"] call BIS_fnc_error;
};

enableRadio true;
enableSentences true;
{_x enableChannel [true, true]} forEach [3,4,5];
{_x enableChannel [true, false]} forEach [0,1,2];
enableEnvironment [false, true];

call MRTM_fnc_settingsInit;

uiNamespace setVariable ["BIS_WL_purchaseMenuLastSelection", [0,0,0]];
uiNamespace setVariable ["activeControls", []];
uiNamespace setVariable ["control", 10000];

private _uid = getPlayerUID player;
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

0 spawn {
	private _ownedVehicleVar = format ["BIS_WL_ownedVehicles_%1", getPlayerUID player];
	while {!BIS_WL_missionEnd} do {
		private _vehicles = missionNamespace getVariable [_ownedVehicleVar, []];
		{
			private _lastActiveTime = _x getVariable ["BIS_WL_lastActive", 0];
			if (_lastActiveTime < serverTime && _lastActiveTime > 1 && count (crew _x) == 0) then {
				deleteVehicle _x;
				0 remoteExec ["BIS_fnc_WL2_updateVehicleList", 2];
			};
		} forEach _vehicles;

		_vehicles = _vehicles select {alive _x};
		missionNamespace setVariable [_ownedVehicleVar, _vehicles, [2, clientOwner]];
		sleep 10;
	};
};

if !(["(EU) #11", serverName] call BIS_fnc_inString) then {
	player addAction [
		"10K CP",
		{[player, "10K"] remoteExec ["BIS_fnc_WL2_handleClientRequest", 2];}
	];
};

private _squadActionText = format ["<t color='#00FFFF'>%1</t>", localize "STR_SQUADS_squads"];
private _squadActionId = player addAction[_squadActionText, { [true] call SQD_fnc_menu }, [], -100, false, false, "", ""];
player setUserActionText [_squadActionId, _squadActionText, "<img size='2' image='\a3\ui_f\data\igui\cfg\simpletasks\types\meet_ca.paa'/>"];

0 spawn BIS_fnc_WL2_factionBasedClientInit;
0 spawn BIS_fnc_WL2_captureList;
0 spawn BIS_fnc_WL2_MineLimitHint;

call BIS_fnc_WL2_spectrumAction;

player addEventHandler ["HandleRating", {
	params ["_unit", "_rating"];
	0;
}];

call SQD_fnc_initClient;

0 spawn MRTM_fnc_settingsMenu;
missionNamespace setVariable [format ["BIS_WL2_minesDB_%1", getPlayerUID player],
	createHashMapFromArray [
		//***Automatic mines***/
		["APERSMine_Range_Ammo", 				[10, []]],
		["APERSTripMine_Wire_Ammo", 			[10, []]],
		["APERSBoundingMine_Range_Ammo", 		[10, []]],
		["ATMine_Range_Ammo", 					[10, []]],
		["SLAMDirectionalMine_Wire_Ammo", 		[10, []]],
		//***Manually Detonated***/
		["ClaymoreDirectionalMine_Remote_Ammo",	[5,  []]],
		["SatchelCharge_Remote_Ammo", 			[5,  []]],
		["DemoCharge_Remote_Ammo", 				[5,  []]]
		//***Blacklisted***/
		/*
		["APERSMineDispenser_Mine_Ammo", 		[0,  []]],
		["IEDUrbanSmall_Remote_Ammo", 			[0,  []]],
		["IEDLandSmall_Remote_Ammo", 			[0,  []]],
		["IEDUrbanBig_Remote_Ammo", 			[0,  []]],
		["IEDLandBig_Remote_Ammo",				[0,  []]]
		*/
	],
	[2, clientOwner]
];

0 spawn {
	while {!BIS_WL_missionEnd} do {
		{
			private _uav = _x;
			private _ownerUavAsset = _uav getVariable ["BIS_WL_ownerUavAsset", "123"];
			private _ownerUnit = _ownerUavAsset call BIS_fnc_getUnitByUID;
			private _ownerID = getPlayerID _ownerUnit;
			private _isInMySquad = ["isInMySquad", [_ownerID]] call SQD_fnc_client;

			private _isConnectable = player isUAVConnectable [_uav, true];

			if (!_isInMySquad && _ownerUnit != player) then {
				_uav setVariable ["WL_canConnectUav", false];
				if (_isConnectable) then {
					player disableUAVConnectability [_uav, true];
				};
			} else {
				_uav setVariable ["WL_canConnectUav", true];
				if (!_isConnectable) then {
					player enableUAVConnectability [_uav, true];
				};
			};
		} forEach allUnitsUAV;
		sleep 5;
	};
};

0 spawn {
	private _previousState = BIS_WL_currentSelection;
	private _lastFullUpdate = -1;
	while {!BIS_WL_missionEnd} do {
		sleep 0.1;
		if (_previousState == BIS_WL_currentSelection && _lastFullUpdate + 2 > serverTime) then {
			continue;
		};

		// state changed or full update every 2s
		_previousState = BIS_WL_currentSelection;
		_lastFullUpdate = serverTime;
		switch (BIS_WL_currentSelection) do {
			case WL_ID_SELECTION_NONE;
			case WL_ID_SELECTION_ORDERING_NAVAL: {
				BIS_WL_selection_availableSectors = [];
				BIS_WL_selection_showLinks = false;
				BIS_WL_selection_dimSectors = false;
			};
			case WL_ID_SELECTION_VOTING;
			case WL_ID_SELECTION_VOTED: {
				BIS_WL_selection_availableSectors = BIS_WL_sectorsArray # 1;
				BIS_WL_selection_showLinks = true;
				BIS_WL_selection_dimSectors = false;
			};
			case WL_ID_SELECTION_FAST_TRAVEL: {
				BIS_WL_selection_availableSectors = (BIS_WL_sectorsArray # 2) select {(_x getVariable ["BIS_WL_owner", independent]) == (side (group player))};
				BIS_WL_selection_showLinks = false;
				BIS_WL_selection_dimSectors = true;
			};
			case WL_ID_SELECTION_FAST_TRAVEL_CONTESTED: {
				BIS_WL_selection_availableSectors = [WL_TARGET_FRIENDLY];
				BIS_WL_selection_showLinks = false;
				BIS_WL_selection_dimSectors = true;
			};
			case WL_ID_SELECTION_ORDERING_AIRCRAFT: {
				BIS_WL_selection_availableSectors = (BIS_WL_sectorsArray # 0) select {BIS_WL_orderedAssetRequirements isEqualTo (BIS_WL_orderedAssetRequirements arrayIntersect (_x getVariable "BIS_WL_services"))};
				BIS_WL_selection_showLinks = false;
				BIS_WL_selection_dimSectors = true;
			};
			case WL_ID_SELECTION_SCAN: {
				private _allScannableSectors = BIS_WL_sectorsArray # 3;
				private _lastScanEligible = serverTime - (getMissionConfigValue ["BIS_WL_scanCooldown", 300]);
				private _availableSectors = _allScannableSectors select {_x getVariable [format ["BIS_WL_lastScanEnd_%1", BIS_WL_playerSide], -1] < _lastScanEligible};
				BIS_WL_selection_availableSectors = _availableSectors;
				BIS_WL_selection_showLinks = false;
				BIS_WL_selection_dimSectors = true;
			};
		};

		if (BIS_WL_selection_showLinks) then {
			{
				_x setMarkerAlphaLocal WL_CONNECTING_LINE_ALPHA_MAX;
			} forEach BIS_WL_sectorLinks;
		} else {
			{
				_x setMarkerAlphaLocal 0;
			} forEach BIS_WL_sectorLinks;
		};

		{
			private _alpha = if (BIS_WL_selection_dimSectors && !(_x in BIS_WL_selection_availableSectors)) then {
				WL_CONNECTING_LINE_ALPHA_MIN;
			} else {
				1;
			};
			((_x getVariable "BIS_WL_markers") # 0) setMarkerAlphaLocal _alpha;
			((_x getVariable "BIS_WL_markers") # 1) setMarkerAlphaLocal _alpha;
		} forEach BIS_WL_allSectors;
	};
};