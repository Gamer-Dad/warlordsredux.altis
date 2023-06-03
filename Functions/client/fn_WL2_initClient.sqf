#include "..\warlords_constants.inc"

["client_init"] call BIS_fnc_startLoadingScreen;

waitUntil {!isNull player && isPlayer player};

"client" call BIS_fnc_WL2_varsInit;


//this whole if statement stops side switching. Line 11 to 56 comment out

if (RD_DISABLE_TEAM_SWITCHING == 1) then{
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
		waitUntil {!isNull WL_DISPLAY_MAIN};
		WL_DISPLAY_MAIN ctrlCreate ["RscStructuredText", 994001];
		(WL_DISPLAY_MAIN displayCtrl 994001) ctrlSetPosition [safeZoneX, safeZoneY, safeZoneW, safeZoneH];
		(WL_DISPLAY_MAIN displayCtrl 994001) ctrlSetBackgroundColor [0, 0, 0, 0.75];
		(WL_DISPLAY_MAIN displayCtrl 994001) ctrlCommit 0;
		WL_DISPLAY_MAIN ctrlCreate ["RscStructuredText", 994000];
		(WL_DISPLAY_MAIN displayCtrl 994000) ctrlSetPosition [safeZoneX + 0.1, safeZoneY + (safeZoneH * 0.5), safeZoneW, safeZoneH];
		(WL_DISPLAY_MAIN displayCtrl 994000) ctrlCommit 0;
		(WL_DISPLAY_MAIN displayCtrl 994000) ctrlSetStructuredText parseText format [
			"<t shadow = '0'><t size = '%1' color = '#ff4b4b'>%2</t><br/><t size = '%3'>%4</t></t>",
			(2.5 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale),
			localize "STR_A3_WL_switch_teams",
			(1.5 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale),
			localize "STR_A3_WL_switch_teams_info"
		];
	};
};

//View distance
MRTM_inf = 2000;
MRTM_ground = 3000;
MRTM_air = 4000;
MRTM_drones = 4000;
MRTM_objects = 2000;
MRTM_syncObjects = true;
setTerrainGrid 3.125;
setViewDistance MRTM_inf;

//Radar warning system
MRTM_rwr1 = 0.4;
MRTM_rwr2 = 0.4;
MRTM_rwr3 = 0.3;
MRTM_rwr4 = 0.4;

//Options
player setVariable ["MRTM_3rdPersonDisabled", false, [2, clientOwner]];
MRTM_playKillSound = true;
MRTM_EnableRWR = true;

0 spawn {
	_varFormat = format ["BIS_WL_%1_repositionDone", getPlayerUID player];
	missionNamespace setVariable [_varFormat, FALSE];
	publicVariableServer _varFormat;
	_pos = position player;
	_confirmReposition = FALSE;
	while {!_confirmReposition} do {
		waitUntil {player distance _pos > 2}; 
		uiSleep WL_TIMEOUT_STANDARD;
		enableRadio TRUE;
		enableSentences TRUE;
		{_x enableChannel [TRUE, TRUE]} forEach [1,2,3,4,5];
		if (player distance _pos > 1) then {
			_confirmReposition = TRUE;
		};
	};

	missionNamespace setVariable [_varFormat, TRUE];
	publicVariableServer _varFormat;
};



if !((side group player) in BIS_WL_competingSides) exitWith {
	["client_init"] call BIS_fnc_endLoadingScreen;
	["Warlords error: Your unit is not a Warlords competitor"] call BIS_fnc_error;
};

uiNamespace setVariable ["BIS_WL_purchaseMenuLastSelection", [0,0,0]];

private _uidPlayer = getPlayerUID player;
missionNamespace setVariable [format ["BIS_WL_%1_ownedVehicles", _uidPlayer], nil];


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

0 spawn BIS_fnc_WL2_zoneRestrictionHandleClient;
0 spawn BIS_fnc_WL2_sectorCaptureStatus;
0 spawn BIS_fnc_WL2_teammatesAvailability;
0 spawn BIS_fnc_WL2_forceGroupIconsFunctionality;
0 spawn BIS_fnc_WL2_mapControlHandle;

BIS_WL_groupIconClickHandler = addMissionEventHandler ["GroupIconClick", BIS_fnc_WL2_groupIconClickHandle];
BIS_WL_groupIconEnterHandler = addMissionEventHandler ["GroupIconOverEnter", BIS_fnc_WL2_groupIconEnterHandle];
BIS_WL_groupIconLeaveHandler = addMissionEventHandler ["GroupIconOverLeave", BIS_fnc_WL2_groupIconLeaveHandle];

_mapBorderMrkr1 = createMarkerLocal ["BIS_WL_mapBorder1", [(BIS_WL_mapSize / 2) + (BIS_WL_mapSize / 2), -(BIS_WL_mapSize / 2)]];
_mapBorderMrkr2 = createMarkerLocal ["BIS_WL_mapBorder2", [BIS_WL_mapSize + (BIS_WL_mapSize / 2), BIS_WL_mapSize + (BIS_WL_mapSize / 2)]];
_mapBorderMrkr3 = createMarkerLocal ["BIS_WL_mapBorder3", [-(BIS_WL_mapSize / 2), BIS_WL_mapSize + (BIS_WL_mapSize / 2)]];
_mapBorderMrkr4 = createMarkerLocal ["BIS_WL_mapBorder4", [-(BIS_WL_mapSize / 2), BIS_WL_mapSize - (BIS_WL_mapSize / 2)]];

{
	_x setMarkerShapeLocal "RECTANGLE";
	_x setMarkerBrushLocal "SolidFull";
	_x setMarkerColorLocal "ColorBlack";
} forEach [_mapBorderMrkr1, _mapBorderMrkr2, _mapBorderMrkr3, _mapBorderMrkr4];

_mapBorderMrkr1 setMarkerSizeLocal [BIS_WL_mapSize + (BIS_WL_mapSize / 2), (BIS_WL_mapSize / 2)];
_mapBorderMrkr2 setMarkerSizeLocal [(BIS_WL_mapSize / 2), BIS_WL_mapSize + (BIS_WL_mapSize / 2)];
_mapBorderMrkr3 setMarkerSizeLocal [BIS_WL_mapSize + (BIS_WL_mapSize / 2), (BIS_WL_mapSize / 2)];
_mapBorderMrkr4 setMarkerSizeLocal [(BIS_WL_mapSize / 2), BIS_WL_mapSize + (BIS_WL_mapSize / 2)];

_mrkrTargetEnemy = createMarkerLocal ["BIS_WL_targetEnemy", position BIS_WL_enemyBase];
_mrkrTargetEnemy setMarkerColorLocal BIS_WL_colorMarkerEnemy;
_mrkrTargetFriendly = createMarkerLocal ["BIS_WL_targetFriendly", position BIS_WL_playerBase];
_mrkrTargetFriendly setMarkerColorLocal BIS_WL_colorMarkerFriendly;

{
	_x setMarkerAlphaLocal 0;
	_x setMarkerSizeLocal [2, 2];
	_x setMarkerTypeLocal "selector_selectedMission";
} forEach [_mrkrTargetEnemy, _mrkrTargetFriendly];

BIS_WL_enemiesCheckTrigger = createTrigger ["EmptyDetector", position player, FALSE];
BIS_WL_enemiesCheckTrigger attachTo [player, [0, 0, 0]];
BIS_WL_enemiesCheckTrigger setTriggerArea [200, 200, 0, FALSE];
BIS_WL_enemiesCheckTrigger setTriggerActivation ["ANYPLAYER", "PRESENT", TRUE];
BIS_WL_enemiesCheckTrigger setTriggerStatements ["{(side group _x) getFriend BIS_WL_playerSide == 0} count thislist > 0", "", ""];

uiNamespace setVariable ["activeControls", []];
uiNamespace setVariable ["control", 50000];

player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	detach BIS_WL_enemiesCheckTrigger; 
	BIS_WL_enemiesCheckTrigger attachTo [vehicle player, [0, 0, 0]];
}];

if (side group player == west) then {
	0 spawn BIS_fnc_MRTM_betty;
	0 spawn BIS_fnc_MRTM_bettyRWR;
} else {
	0 spawn BIS_fnc_MRTM_rita;
	0 spawn BIS_fnc_MRTM_ritaRWR;
};

player addEventHandler ["InventoryOpened",{
	params ["_unit","_container"];
	_override = false;
	_allUnitBackpackContainers = (player nearEntities ["Man", 50]) select {isPlayer _x && _x getVariable "arsenalOpened"} apply {backpackContainer _x};

	if (_container in _allUnitBackpackContainers) then {
		systemchat "Access denied!";
		_override = true;
	};

	_override;
}];

player addEventHandler ["HandleDamage", {
	params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit"];
	_this spawn BIS_fnc_WL2_setAssist;
	_base = (([BIS_WL_base1, BIS_WL_base2] select {(_x getVariable "BIS_WL_owner") == (side group _unit)}) # 0);
	if ((_unit inArea (_base getVariable "objectAreaComplete")) && ((_base getVariable ["BIS_WL_baseUnderAttack", false]) == false) && ((side (group _unit)) == west)) then {
		_unit setDamage 0;
	} else {
		if ((_unit inArea (_base getVariable "objectAreaComplete")) && ((_base getVariable ["BIS_WL_baseUnderAttack", false]) == false) && ((side (group _unit)) == east)) then {
			_unit setDamage 0;
		} else {
			_damage;
		};
	};
}];

player addEventHandler ["Killed", {
	BIS_WL_loadoutApplied = FALSE;
	["RequestMenu_close"] spawn BIS_fnc_WL2_setupUI;
	
	BIS_WL_lastLoadout = +getUnitLoadout player;
	private _varName = format ["BIS_WL_purchasable_%1", BIS_WL_playerSide];
	private _gearArr = (missionNamespace getVariable _varName) # 5;
	private _lastLoadoutArr = _gearArr # 0;
	private _text = _savedLoadoutArr # 5;
	private _text = localize "STR_A3_WL_last_loadout_info";
	_text = _text + "<br/><br/>";
	{
		switch (_forEachIndex) do {
			case 0;
			case 1;
			case 2;
			case 3;
			case 4: {
				if (count _x > 0) then {
					_text = _text + (getText (configFile >> "CfgWeapons" >> _x # 0 >> "displayName")) + "<br/>";
				};
			};
			case 5: {
				if (count _x > 0) then {
					_text = _text + (getText (configFile >> "CfgVehicles" >> _x # 0 >> "displayName")) + "<br/>";
				};
			};
		};
	} forEach BIS_WL_lastLoadout;
	_lastLoadoutArr set [5, _text];
	_gearArr set [0, _lastLoadoutArr];
	(missionNamespace getVariable _varName) set [5, _gearArr];

	_connectedUAV = getConnectedUAV player;
	if (_connectedUAV != objNull) exitWith {
		player connectTerminalToUAV objNull;
	};
}];

if (BIS_WL_arsenalEnabled) then {
	call BIS_fnc_WL2_sub_arsenalSetup;
};

0 spawn {
	waitUntil {uiSleep WL_TIMEOUT_SHORT; !isNull WL_CONTROL_MAP};
	WL_CONTROL_MAP ctrlMapAnimAdd [0, 0.35, BIS_WL_playerBase];
	ctrlMapAnimCommit WL_CONTROL_MAP;
};

["client_init"] call BIS_fnc_endLoadingScreen;

sleep 0.01;

{_x setMarkerAlphaLocal 0} forEach BIS_WL_sectorLinks;

player call BIS_fnc_WL2_sub_assetAssemblyHandle;
[player, "init"] spawn BIS_fnc_WL2_hintHandle;
0 spawn BIS_fnc_WL2_underWaterCheck;
0 spawn BIS_fnc_WL2_targetResetHandle;
0 spawn BIS_fnc_WL2_sceneDrawHandle;
0 spawn BIS_fnc_WL2_refreshCurrentTargetData;

0 spawn {
	sleep 4;
	0 spawn BIS_fnc_WL2_welcome;
};

(format ["BIS_WL_%1_friendlyKillPenaltyEnd", getPlayerUID player]) addPublicVariableEventHandler BIS_fnc_WL2_friendlyFireHandleClient;

["OSD"] spawn BIS_fnc_WL2_setupUI;
0 spawn BIS_fnc_WL2_timer;
0 spawn BIS_fnc_WL2_cpBalance;


0 spawn {
	waitUntil {sleep WL_TIMEOUT_STANDARD; isNull WL_TARGET_FRIENDLY};
	_t = WL_SYNCED_TIME + 10;
	waitUntil {sleep WL_TIMEOUT_SHORT; WL_SYNCED_TIME > _t || visibleMap};
	if !(visibleMap) then {
		[toUpper localize "STR_A3_WL_tip_voting", 5] spawn BIS_fnc_WL2_smoothText;
		
	};
};

0 spawn {
	_t = WL_SYNCED_TIME + 10;
	waitUntil {sleep 1; (serverTime > _t && !isNull WL_TARGET_FRIENDLY)};
	sleep 5;
	while {!BIS_WL_purchaseMenuDiscovered} do {
		[["Common", "warlordsMenu"], 0, "", 10, "", false, true, false, true] call BIS_fnc_advHint;
		sleep 10;
	};
};

sleep 0.1;

"Initialized" call BIS_fnc_WL2_announcer;
[toUpper localize "STR_A3_WL_popup_init"] spawn BIS_fnc_WL2_smoothText;
[player, "maintenance", {(player nearObjects ["All", WL_MAINTENANCE_RADIUS]) findIf {(_x getVariable ["BIS_WL_canRepair", FALSE]) || (_x getVariable ["BIS_WL_canRearm", FALSE])} != -1}] call BIS_fnc_WL2_hintHandle;

sleep 0.1;

0 spawn BIS_fnc_WL2_selectedTargetsHandle;
0 spawn BIS_fnc_WL2_targetSelectionHandleClient;
0 spawn BIS_fnc_WL2_purchaseMenuOpeningHandle;
0 spawn BIS_fnc_WL2_assetMapControl;
0 spawn BIS_fnc_WL2_mapIcons;
0 spawn BIS_fnc_WL2_cpUpdate;
(side group player) spawn BIS_fnc_WL2_forfeitHandle;

player setVariable ["arsenalOpened", false, true];

waituntil {sleep 0.1; !isnull (findDisplay 46)};
(findDisplay 46) displayAddEventHandler ["KeyDown", {
	_exit = false;
	_key = actionKeysNames "curatorInterface";
	_keyName = (keyName (_this select 1));
	if ((_this # 1) == ((actionKeys "tacticalView") # 0)) then {
		_exit = true;
	};
	if (_keyName == _key) then {
		if !((getPlayerUID player) == "76561198034106257"|| (getPlayerUID player) == "76561198865298977") then {
			_exit = true;
		};
	};
	_exit;
}];