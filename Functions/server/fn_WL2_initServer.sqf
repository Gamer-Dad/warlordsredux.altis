#include "..\warlords_constants.inc"

//CP databse
serverNamespace setVariable ["fundsDatabase", createHashMap];

// Mine Array's
MRTM_spawnedAPERS = [];
MRTM_spawnedAPERSDispenser = [];
MRTM_spawnedAPERSDispenserAmmo = [];
MRTM_spawnedAPERSBounding = [];
MRTM_spawnedAT = [];
MRTM_spawnedSLAMs = [];
MRTM_spawnedTripwires = [];
MRTM_spawnedClaymores = [];
MRTM_spawnedClaymoresAmmo = [];
MRTM_spawnedSatchels = [];
MRTM_spawnedCharges = [];
MRTM_spawnedLIEDU = [];
MRTM_spawnedLIEDDI = [];
MRTM_spawnedSIEDU = [];
MRTM_spawnedSIEDDI = [];
MRTM_spawnedTripWires = [];
MRTM_spawnedSLAMs_Ammo = [];

missionNamespace setVariable ["ftVehicleExistsBlu", false, true];
missionNamespace setVariable ["ftVehicleExistsOpf", false, true];
missionNamespace setVariable ["imbalance", 0, true];

missionNamespace setVariable ["serverTimer", 0, true];

[36000] call BIS_fnc_countdown;
0 spawn BIS_fnc_WL2_killRewards;


["server_init"] call BIS_fnc_startLoadingScreen;

{createCenter _x} forEach [WEST, EAST, RESISTANCE, CIVILIAN];

WEST setFriend [EAST, 0];
EAST setFriend [WEST, 0];
RESISTANCE setFriend [WEST, 0];
WEST setFriend [RESISTANCE, 0];
RESISTANCE setFriend [EAST, 0];
EAST setFriend [RESISTANCE, 0];
CIVILIAN setFriend [WEST, 1];
CIVILIAN setFriend [EAST, 1];
CIVILIAN setFriend [RESISTANCE, 1];
WEST setFriend [CIVILIAN, 1];
EAST setFriend [CIVILIAN, 1];
RESISTANCE setFriend [CIVILIAN, 1];

//this part sets fog and rain to zero
0 spawn {
	while {!BIS_WL_missionEnd} do {
		_overcastPreset = random 1;
		(7200 * timeMultiplier) setOvercast _overcastPreset;
		waitUntil {sleep 600; 0 setFog 0; 10e10 setFog 0; 0 setRain 0; 10e10 setRain 0; simulWeatherSync; abs (overcast - _overcastPreset) < 0.2};
	};
};

"server" call BIS_fnc_WL2_varsInit;

addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	
	BIS_WL_allWarlords = BIS_WL_allWarlords - [_unit];
	_sideID = BIS_WL_competingSides find (side group _unit);
	if (_sideID != -1) then {
		_playerSideArr = BIS_WL_playerIDArr # _sideID;
		_playerSideArr = _playerSideArr - [_uid];
		BIS_WL_playerIDArr set [_sideID, _playerSideArr];
	};

	{
		if (typeOf _x == "B_Truck_01_medical_F") then {
			missionNamespace setVariable ["ftVehicleExistsBlu", false, true];
		};
		if (typeOf _x == "O_Truck_03_medical_F") then {
			missionNamespace setVariable ["ftVehicleExistsOpf", false, true];
		};
		_x call BIS_fnc_WL2_sub_deleteAsset;
	} forEach (missionNamespace getVariable format ["BIS_WL_%1_ownedVehicles", _uid]);
	
	{
		if !(isPlayer _x) then {_x setDamage 1};
	} forEach ((units group _unit) - [_unit]);
	
	missionNamespace setVariable [format ["BIS_WL_%1_ownedVehicles", _uid], nil];
}];

addMissionEventHandler ["MarkerCreated", {
	params ["_marker", "_channelNumber", "_owner", "_local"];
	
	if ((isPlayer _owner) && (_channelNumber == 0)) then {
		deleteMarker _marker;
	};
}];

addMissionEventHandler ["EntityKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	_this spawn BIS_fnc_WL2_killRewardHandle;
	_this spawn BIS_fnc_WL2_friendlyFireHandleServer;

	if (typeOf _unit == "B_Truck_01_medical_F") then {
		missionNamespace setVariable ["ftVehicleExistsBlu", false, true];
	};

	if (typeOf _unit == "O_Truck_03_medical_F") then {
		missionNamespace setVariable ["ftVehicleExistsOpf", false, true];
	};

	if (typeOf _unit == "Land_IRMaskingCover_01_F") then {
		{
			_asset = _x;
			if !(alive _x) then {
				deleteVehicle _asset;
			};
		} forEach ((allMissionObjects "") select {(["BIS_WL_", str _x, false] call BIS_fnc_inString) && !(["BIS_WL_init", str _x, false] call BIS_fnc_inString)});		
	};
}];

missionNamespace setVariable ["BIS_WL_missionStart", WL_SYNCED_TIME, TRUE];
missionNamespace setVariable ["BIS_WL_wrongTeamGroup", createGroup CIVILIAN, TRUE];
BIS_WL_wrongTeamGroup deleteGroupWhenEmpty FALSE;

if !(isDedicated) then {waitUntil {!isNull player && isPlayer player}};

call BIS_fnc_WL2_loadFactionClasses;
call BIS_fnc_WL2_sectorsInitServer;
"setup" call BIS_fnc_WL2_handleRespawnMarkers;
{_x call BIS_fnc_WL2_parsePurchaseList} forEach BIS_WL_competingSides;
0 spawn BIS_fnc_WL2_detectNewPlayers;
["server", TRUE] call BIS_fnc_WL2_updateSectorArrays;
0 spawn BIS_fnc_WL2_targetSelectionHandleServer;
0 spawn BIS_fnc_WL2_zoneRestrictionHandleServer;
0 spawn BIS_fnc_WL2_incomePayoff;
0 spawn BIS_fnc_WL2_garbageCollector;
0 spawn BIS_fnc_WL2_targetResetHandleServer;
0 spawn BIS_fnc_WL2_forfeitHandleServer;

setTimeMultiplier 3;

0 spawn {
	while {!BIS_WL_missionEnd} do {
		waitUntil {sleep WL_TIMEOUT_LONG; daytime > 20 || daytime < 5};
		setTimeMultiplier 6;
		waitUntil {sleep WL_TIMEOUT_LONG; daytime < 20 && daytime > 5};
		setTimeMultiplier 3;
	};
};

{
	_x spawn {
		_side = _this;
		while {!BIS_WL_missionEnd} do {
			waitUntil {sleep WL_TIMEOUT_LONG; ((missionNamespace getVariable format ["BIS_WL_currentTarget_%1", _side]) getVariable ["BIS_WL_owner", sideUnknown]) == _side};
			sleep WL_TIMEOUT_LONG;
			if (((missionNamespace getVariable format ["BIS_WL_currentTarget_%1", _side]) getVariable ["BIS_WL_owner", sideUnknown]) == _side) then {
				[_side, objNull] call BIS_fnc_WL2_selectTarget;
			};
		};
	};
} forEach BIS_WL_competingSides;

[] remoteExec ["BIS_fnc_WL2_mineLimit", 2];

["server_init"] call BIS_fnc_endLoadingScreen;

//Log difficulty
diag_log (format ["Server difficulty option death messages: %1", difficultyOption "deathMessages"]);