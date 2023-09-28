#include "..\warlords_constants.inc"

["client_init"] call BIS_fnc_startLoadingScreen;

waitUntil {!isNull player && isPlayer player};

"client" call BIS_fnc_WL2_varsInit;


//this whole if statement stops side switching. Line 11 to 56 comment out
private _teamCheckOKVarID = format ["BIS_WL_teamCheckOK_%1", getPlayerUID player];

waitUntil {!isNil {missionNamespace getVariable _teamCheckOKVarID}};

if !(missionNamespace getVariable _teamCheckOKVarID) exitWith {
	addMissionEventHandler ["EachFrame", {
		clearRadio;
		{
			deleteMarkerLocal _x;
		} forEach allMapMarkers;
	}];
	sleep 0.1;
	// This section controls the "you can't switch teams" display
	["client_init"] call BIS_fnc_endLoadingScreen;
	player removeItem "ItemMap";
	player removeItem "ItemRadio";
	[player] joinSilent BIS_WL_wrongTeamGroup;
	enableRadio FALSE;
	enableSentences FALSE;
	0 fadeSpeech 0;
	0 fadeRadio 0;
	{_x enableChannel [FALSE, FALSE]} forEach [0,1,2,3,4,5];
	showCinemaBorder FALSE;
	private _camera = "Camera" camCreate position player;
	_camera camSetPos [0, 0, 10];
	_camera camSetTarget [-1000, -1000, 10];
	_camera camCommit 0;
	_camera cameraEffect ["Internal", "Back"];
	waitUntil {!isNull (findDisplay 46)};
	(findDisplay 46) ctrlCreate ["RscStructuredText", 994001];
	((findDisplay 46) displayCtrl 994001) ctrlSetPosition [safeZoneX, safeZoneY, safeZoneW, safeZoneH];
	((findDisplay 46) displayCtrl 994001) ctrlSetBackgroundColor [0, 0, 0, 0.75];
	((findDisplay 46) displayCtrl 994001) ctrlCommit 0;
	(findDisplay 46) ctrlCreate ["RscStructuredText", 994000];
	((findDisplay 46) displayCtrl 994000) ctrlSetPosition [safeZoneX + 0.1, safeZoneY + (safeZoneH * 0.5), safeZoneW, safeZoneH];
	((findDisplay 46) displayCtrl 994000) ctrlCommit 0;
	((findDisplay 46) displayCtrl 994000) ctrlSetStructuredText parseText format [
		"<t shadow = '0'><t size = '%1' color = '#ff4b4b'>%2</t><br/><t size = '%3'>%4</t></t>",
		(2.5 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale),
		localize "STR_A3_WL_switch_teams",
		(1.5 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale),
		localize "STR_A3_WL_switch_teams_info"
	];
};

//init radio after team check 
enableRadio true;
enableSentences true;
{_x enableChannel [true, true]} forEach [1,2,3,4,5];
{_x enableChannel [true, false]} forEach [0]; //no global chat

if !((side group player) in BIS_WL_competingSides) exitWith {
	["client_init"] call BIS_fnc_endLoadingScreen;
	["Warlords error: Your unit is not a Warlords competitor"] call BIS_fnc_error;
};

call MRTM_fnc_settingsInit;

private _uidPlayer = getPlayerUID player;
missionNamespace setVariable [format ["BIS_WL_%1_ownedVehicles", _uidPlayer], []];
player setVariable ["BIS_WL_ownerAsset", (getPlayerUID player), [2, clientOwner]];

//UI
uiNamespace setVariable ["BIS_WL_purchaseMenuLastSelection", [0,0,0]];
uiNamespace setVariable ["activeControls", []];
uiNamespace setVariable ["control", 50000];

//WAS system
if !((getPlayerUID player) in (getArray (missionConfigFile >> "adminIDs"))) then {
	0 spawn BIS_fnc_WL2_wasMain;
};

if !(isServer) then {
	"setup" call BIS_fnc_WL2_handleRespawnMarkers;
};
call BIS_fnc_WL2_sectorsInitClient;

["client", TRUE] call BIS_fnc_WL2_updateSectorArrays;

private _specialStateArray = (BIS_WL_sectorsArray # 6) + (BIS_WL_sectorsArray # 7);
{
	[_x, _x getVariable "BIS_WL_owner", _specialStateArray] call BIS_fnc_WL2_sectorMarkerUpdate;
} forEach BIS_WL_allSectors;

if !(isServer) then {
	BIS_WL_playerSide call BIS_fnc_WL2_parsePurchaseList;
};

0 spawn BIS_fnc_WL2_sectorCaptureStatus;
0 spawn BIS_fnc_WL2_teammatesAvailability;
0 spawn BIS_fnc_WL2_forceGroupIconsFunctionality;
0 spawn BIS_fnc_WL2_mapControlHandle;

addMissionEventHandler ["GroupIconClick", BIS_fnc_WL2_groupIconClickHandle];
addMissionEventHandler ["GroupIconOverEnter", BIS_fnc_WL2_groupIconEnterHandle];
addMissionEventHandler ["GroupIconOverLeave", BIS_fnc_WL2_groupIconLeaveHandle];

_mrkrTargetEnemy = createMarkerLocal ["BIS_WL_targetEnemy", position BIS_WL_enemyBase];
_mrkrTargetEnemy setMarkerColorLocal BIS_WL_colorMarkerEnemy;
_mrkrTargetFriendly = createMarkerLocal ["BIS_WL_targetFriendly", position BIS_WL_playerBase];
_mrkrTargetFriendly setMarkerColorLocal BIS_WL_colorMarkerFriendly;

{
	_x setMarkerAlphaLocal 0;
	_x setMarkerSizeLocal [2, 2];
	_x setMarkerTypeLocal "selector_selectedMission";
} forEach [_mrkrTargetEnemy, _mrkrTargetFriendly];

//Evenhandlers
call BIS_fnc_WL2_clientEH;

player spawn DAPS_fnc_SetupProjectiles;
call BIS_fnc_WL2_sub_arsenalSetup;

0 spawn {
	waitUntil {uiSleep WL_TIMEOUT_SHORT; !isNull WL_CONTROL_MAP};
	WL_CONTROL_MAP ctrlMapAnimAdd [0, 0.35, BIS_WL_playerBase];
	ctrlMapAnimCommit WL_CONTROL_MAP;
};

{_x setMarkerAlphaLocal 0} forEach BIS_WL_sectorLinks;

call BIS_fnc_WL2_refreshCurrentTargetData;
call BIS_fnc_WL2_sceneDrawHandle;
call BIS_fnc_WL2_targetResetHandle;
[player, "init"] spawn BIS_fnc_WL2_hintHandle;
0 spawn BIS_fnc_WL2_underWaterCheck;

["OSD"] spawn BIS_fnc_WL2_setupUI;
0 spawn BIS_fnc_WL2_timer;
0 spawn BIS_fnc_WL2_cpBalance;


0 spawn {
	waitUntil {sleep WL_TIMEOUT_STANDARD; isNull WL_TARGET_FRIENDLY};
	_t = serverTime + 10;
	waitUntil {sleep WL_TIMEOUT_SHORT; serverTime > _t || {visibleMap}};
	if !(visibleMap) then {
		[toUpper localize "STR_A3_WL_tip_voting", 5] spawn BIS_fnc_WL2_smoothText;
	};
};

0 spawn {
	_selectedCnt = count ((groupSelectedUnits player) select {_x != player && {(_x getVariable ["BIS_WL_ownerAsset", "123"]) == (getPlayerUID player)}});
	while {!BIS_WL_missionEnd} do {
		waitUntil {sleep 1; count ((groupSelectedUnits player) select {_x != player && {(_x getVariable ["BIS_WL_ownerAsset", "123"]) == (getPlayerUID player)}}) != _selectedCnt};
		_selectedCnt = count ((groupSelectedUnits player) select {_x != player && {(_x getVariable ["BIS_WL_ownerAsset", "123"]) == (getPlayerUID player)}});
		call BIS_fnc_WL2_sub_purchaseMenuRefresh;
	};
};

0 spawn {
	_t = serverTime + 10;
	waitUntil {sleep WL_TIMEOUT_STANDARD; serverTime > _t && !isNull WL_TARGET_FRIENDLY};
	sleep WL_TIMEOUT_LONG;
	while {!BIS_WL_purchaseMenuDiscovered} do {
		[["Common", "warlordsMenu"], 0, "", 10, "", false, true, false, true] call BIS_fnc_advHint;
		sleep 13;
	};
};

[player, "maintenance", {(player nearObjects ["All", WL_MAINTENANCE_RADIUS]) findIf {(getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "transportRepair") > 0) || {(getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "transportAmmo") > 0)}} != -1}] call BIS_fnc_WL2_hintHandle;
[player, "nearSL", {(player distance2D (leader group player) <= 200) && {player != (leader group player)}}] call BIS_fnc_WL2_hintHandle;

0 spawn BIS_fnc_WL2_selectedTargetsHandle;
0 spawn BIS_fnc_WL2_targetSelectionHandleClient;
0 spawn BIS_fnc_WL2_purchaseMenuOpeningHandle;
0 spawn BIS_fnc_WL2_assetMapControl;
0 spawn BIS_fnc_WL2_mapIcons;
private _fncEarPlugs = compile preprocessFileLineNumbers "scripts\GF_Earplugs\GF_Earplugs.sqf";
call _fncEarPlugs;

0 spawn {
	_t = serverTime + 10;
	waitUntil {sleep 0.1; ((serverTime > _t) || {!(isNil {missionNamespace getVariable "devMRTM"})})};
	if (!(isNil {missionNamespace getVariable "devMRTM"})) then {
		_mrtm = (missionNamespace getVariable "devMRTM") # 0;
		_seat = (missionNamespace getVariable "devMRTM") # 1;
		[_mrtm, "SIT_AT_TABLE", "ASIS", _seat] call BIS_fnc_ambientAnim;
		0 spawn BIS_fnc_WL2_mrtmAction;
	};
};

["client_init"] call BIS_fnc_endLoadingScreen;
"Initialized" call BIS_fnc_WL2_announcer;
[toUpper localize "STR_A3_WL_popup_init"] spawn BIS_fnc_WL2_smoothText;
0 spawn BIS_fnc_WL2_welcome;

0 spawn {
	waitUntil {sleep 0.1; !isnull player};
	_markers = (side group player) call BIS_fnc_WL2_getRespawnMarkers;
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