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

0 spawn {
	_varFormat = format ["BIS_WL_%1_repositionDone", getPlayerUID player];
	missionNamespace setVariable [_varFormat, FALSE];
	publicVariableServer _varFormat;
	//changed pos > 5 to 2
	_pos = position player;
	_confirmReposition = FALSE;
	while {!_confirmReposition} do {
		waitUntil {player distance _pos > 2}; 
		uiSleep 1;
		enableRadio TRUE;
		enableSentences TRUE;
		{_x enableChannel [TRUE, TRUE]} forEach [1,2,3,4,5];
		if (player distance _pos > 2) then {
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
uiNamespace setVariable ["BIS_WL_cp_saved", FALSE];

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

player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	detach BIS_WL_enemiesCheckTrigger; 
	BIS_WL_enemiesCheckTrigger attachTo [vehicle player, [0, 0, 0]];
	if (typeOf _vehicle == "B_Plane_Fighter_01_F" || typeOf _vehicle == "B_Plane_CAS_01_dynamicLoadout_F") then  {
		0 spawn BIS_fnc_WL2_betty;
	};
}];

player addEventHandler ["GetOutMan", {
	detach BIS_WL_enemiesCheckTrigger; 
	BIS_WL_enemiesCheckTrigger attachTo [player, [0, 0, 0]];
	if (_vehicle isKindOf "Air" && getPosATL player # 2 > 100) then {
		0 spawn {
			sleep 1;
			playerFreeFalling = getUnitFreefallInfo player;
			if (playerFreeFalling # 0) then {
				private _backpack = unitBackpack player; 
				private _oldbackpack = typeOf unitBackpack player;
				private _oldbackpackItems = backpackItems player;

				if (!(isNull _backpack)) then {
					removeBackpack player;
					player addBackpack "B_Parachute";
				} else {
					player addBackpack "B_Parachute";
				};

				waitUntil {sleep 1; (getPosATL player # 2) <= 50 || (not (alive player))};
				player action ["OpenParachute", player];
				waitUntil {sleep 1; isNull objectParent player};
				player addBackpack _oldbackpack;
				{player addItemToBackpack _x;} forEach oldbackpackItems;
			};
		};
	};
}];

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

player addEventHandler ["Killed", {
	BIS_WL_loadoutApplied = FALSE;
	["RequestMenu_close"] call BIS_fnc_WL2_setupUI;
	
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

call BIS_fnc_WL2_refreshCurrentTargetData;
call BIS_fnc_WL2_sceneDrawHandle;
call BIS_fnc_WL2_targetResetHandle;
player call BIS_fnc_WL2_sub_assetAssemblyHandle;
[player, "init"] spawn BIS_fnc_WL2_hintHandle;
0 spawn BIS_fnc_WL2_welcome;

(format ["BIS_WL_%1_friendlyKillPenaltyEnd", getPlayerUID player]) addPublicVariableEventHandler BIS_fnc_WL2_friendlyFireHandleClient;

["OSD"] spawn BIS_fnc_WL2_setupUI;
0 spawn BIS_fnc_WL2_timer;
0 spawn BIS_fnc_WL2_cpBalance;


0 spawn {
	waitUntil {sleep 1; isNull WL_TARGET_FRIENDLY};
	_t = WL_SYNCED_TIME + 10;
	waitUntil {sleep WL_TIMEOUT_SHORT; WL_SYNCED_TIME > _t || visibleMap};
	if !(visibleMap) then {
		[toUpper localize "STR_A3_WL_tip_voting", 5] spawn BIS_fnc_WL2_smoothText;
		
	};
};

0 spawn {
	_t = WL_SYNCED_TIME + 10;
	waitUntil {sleep WL_TIMEOUT_STANDARD; WL_SYNCED_TIME > _t && !isNull WL_TARGET_FRIENDLY};
	sleep 5;
	while {!BIS_WL_purchaseMenuDiscovered} do {
		[format [toUpper localize "STR_A3_WL_tip_menu", (actionKeysNamesArray "Gear") # 0], 5] spawn BIS_fnc_WL2_smoothText;
		sleep 10;
	};
};

sleep 0.1;

"Initialized" call BIS_fnc_WL2_announcer;
[toUpper localize "STR_A3_WL_popup_init"] spawn BIS_fnc_WL2_smoothText;
[player, "maintenance", {(player nearObjects ["All", WL_MAINTENANCE_RADIUS]) findIf {(_x getVariable ["BIS_WL_canRepair", FALSE]) || (_x getVariable ["BIS_WL_canRearm", FALSE])} != -1}] call BIS_fnc_WL2_hintHandle;
[player, "nearSL", {(player distance2D (leader group player) <= 50) && (player != (leader group player))}] call BIS_fnc_WL2_hintHandle;

player setVariable [format ["BIS_WL_Bounty_%1", getPlayerUID player], 0, true];

sleep 0.1;

0 spawn BIS_fnc_WL2_selectedTargetsHandle;
0 spawn BIS_fnc_WL2_targetSelectionHandleClient;
0 spawn BIS_fnc_WL2_purchaseMenuOpeningHandle;
0 spawn BIS_fnc_WL2_assetMapControl;
0 spawn BIS_fnc_WL2_getUavConnected;
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

player setVariable ["arsenalOpened", false, true];

0 spawn {
	waitUntil {sleep 0.1; !isNil "BIS_WL_playerSide"};
	0 spawn BIS_fnc_WL2_mapIcons;
};

0 spawn {
	waituntil {sleep 0.1; !isnull (findDisplay 12)};
	if (side player == west) then {
		((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", {
			{
			private _truck = _x;
			(_this select 0) drawIcon [
				getText (configFile/"CfgVehicles"/typeOf _truck/"Icon"),
				[0,0.3,0.6,1],
				ASLToAGL getPosASL _truck,
				15,
				15,
				direction _truck,
				"Fast travel vehicle",
				1,
				WL_MAP_FONT_SIZE,
				"RobotoCondensed",
				"right"
			]; 
			} forEach entities "B_Truck_01_medical_F";
		}];
	};
	if (side player == east) then {
		((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", {
			{
			private _truck = _x;
			(_this select 0) drawIcon [
				getText (configFile/"CfgVehicles"/typeOf _truck/"Icon"),
				[0.5,0,0,1],
				ASLToAGL getPosASL _truck,
				15,
				15,
				direction _truck,
				"Fast travel vehicle",
				1,
				WL_MAP_FONT_SIZE,
				"RobotoCondensed",
				"right"
			]; 
			} forEach entities "O_Truck_03_medical_F";
		}];
	};
};

0 spawn {
	player addAction [
		"Commemorate",
		{
			[toUpper "R.I.P. Spacelukkie"] spawn BIS_fnc_WL2_smoothText;
		},
		nil,
		92,
		true,
		false,
		"",
		"player distance [17366.7,12577.5,0.00148773] < 7",
		5
	];
};

0 spawn {
	waituntil {!isnull (findDisplay 46)};
	(findDisplay 46) displayAddEventHandler ["KeyDown", {
		_key = actionKeysNames "curatorInterface";
		_keyName = (keyName (_this select 1));
		if (_keyName == _key) then {
			if !((getPlayerUID player) == "76561198034106257"|| (getPlayerUID player) == "76561198865298977") then {
				true;
			};
		};
	}];
};

0 spawn {
	while {!BIS_WL_missionEnd} do {
		waitUntil {!isNull (group player)};
		{
			[_x] joinSilent (group player);
			_x setVariable ["BIS_WL_ownerAsset", (getPlayerUID player)];
		} forEach (allUnits select {(_x getVariable "BIS_WL_Owned_By" == getPlayerUID player) && !(_x in (units (group player)))});
		sleep 0.5;
	};
};