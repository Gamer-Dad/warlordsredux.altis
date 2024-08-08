["server_init"] call BIS_fnc_startLoadingScreen;

{createCenter _x} forEach [west, east, resistance, civilian];
west setFriend [east, 0];
east setFriend [west, 0];
resistance setFriend [west, 0];
west setFriend [resistance, 0];
resistance setFriend [east, 0];
east setFriend [resistance, 0];
civilian setFriend [west, 1];
civilian setFriend [east, 1];
civilian setFriend [resistance, 1];
west setFriend [civilian, 1];
east setFriend [civilian, 1];
resistance setFriend [civilian, 1];

BIS_fnc_WL2_assetRelevanceCheck = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_assetRelevanceCheck.sqf";
BIS_fnc_WL2_calcImbalance = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_calcImbalance.sqf";
BIS_fnc_WL2_changeSectorOwnership = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_changeSectorOwnerShip.sqf";
BIS_fnc_WL2_createUAVCrew = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_createUAVCrew.sqf";
BIS_fnc_WL2_createVehicleCorrectly = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_createVehicleCorrectly.sqf";
BIS_fnc_WL2_detectNewPlayers = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_detectNewPlayers.sqf";
BIS_fnc_WL2_forfeitHandleServer = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_forfeitHandleServer.sqf";
BIS_fnc_WL2_forgiveTeamkill = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_forgiveTeamkill.sqf";
BIS_fnc_WL2_friendlyFireHandleServer = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_friendlyFireHandleServer.sqf";
BIS_fnc_WL2_fundsDatabaseUpdate = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_fundsDatabaseUpdate.sqf";
BIS_fnc_WL2_fundsDatabaseWrite = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_fundsDatabaseWrite.sqf";
BIS_fnc_WL2_garbageCollector = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_garbageCollector.sqf";
BIS_fnc_WL2_handleClientRequest = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_handleClientRequest.sqf";
BIS_fnc_WL2_incomePayoff = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_incomePayoff.sqf";
BIS_fnc_WL2_killRewardHandle = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_killRewardHandle.sqf";
BIS_fnc_WL2_populateSector = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_populateSector.sqf";
BIS_fnc_WL2_processRunways = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_processRunways.sqf";
BIS_fnc_WL2_selectTarget = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_selectTarget.sqf";
BIS_fnc_WL2_serverEHs = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_serverEHs.sqf";
BIS_fnc_WL2_setupNewWarlord = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_setupNewWarlord.sqf";
BIS_fnc_WL2_tablesSetUp = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_tablesSetUp.sqf";
BIS_fnc_WL2_targetResetHandleServer = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_targetResetHandleServer.sqf";
BIS_fnc_WL2_targetSelectionHandleServer = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_targetSelectionHandleServer.sqf";
BIS_fnc_WL2_zoneRestrictionHandleServer = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_zoneRestrictionHandleServer.sqf";
BIS_fnc_WL2_getInfantry = compileFinal preprocessFileLineNumbers "Functions\server\sectors\fn_WL2_getInfantry.sqf";
BIS_fnc_WL2_getVehicles = compileFinal preprocessFileLineNumbers "Functions\server\sectors\fn_WL2_getVehicles.sqf";
BIS_fnc_WL2_sectorCaptureHandle = compileFinal preprocessFileLineNumbers "Functions\server\sectors\fn_WL2_sectorCaptureHandle.sqf";
BIS_fnc_WL2_sectorsInitServer = compileFinal preprocessFileLineNumbers "Functions\server\sectors\fn_WL2_sectorsInitServer.sqf";
BIS_fnc_WL2_handleInstigator = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_handleInstigator.sqf";
BIS_fnc_WL2_updateVehicleList = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_updateVehicleList.sqf";

BIS_fnc_orderAir = compileFinal preprocessFileLineNumbers "Functions\server\clientRequests\fn_orderAir.sqf";
BIS_fnc_orderDefence = compileFinal preprocessFileLineNumbers "Functions\server\clientRequests\fn_orderDefence.sqf";
BIS_fnc_orderGround = compileFinal preprocessFileLineNumbers "Functions\server\clientRequests\fn_orderGround.sqf";
BIS_fnc_orderNaval = compileFinal preprocessFileLineNumbers "Functions\server\clientRequests\fn_orderNaval.sqf";

MRTM_fnc_leaveGroup = compileFinal preprocessFileLineNumbers "scripts\MRTM\fn_leaveGroup.sqf";
MRTM_fnc_accept = compileFinal preprocessFileLineNumbers "scripts\MRTM\fn_accept.sqf";
MRTM_fnc_invite = compileFinal preprocessFileLineNumbers "scripts\MRTM\fn_invite.sqf";

call BIS_fnc_WL2_tablesSetUp;
call BIS_fnc_WL2_serverEHs;

_group = createGroup civilian;
missionNamespace setVariable ["BIS_WL_wrongTeamGroup", _group, true];
_group deleteGroupWhenEmpty false;
missionNamespace setVariable ["gameStart", serverTime, true];

if !(isDedicated) then {waitUntil {!isNull player && {isPlayer player}}};

call BIS_fnc_WL2_sectorsInitServer;
"setup" call BIS_fnc_WL2_handleRespawnMarkers;
if !(isDedicated) then {
	{_x call BIS_fnc_WL2_parsePurchaseList} forEach BIS_WL_competingSides;
};
0 spawn BIS_fnc_WL2_detectNewPlayers;
["server", true] call BIS_fnc_WL2_updateSectorArrays;
0 spawn BIS_fnc_WL2_targetSelectionHandleServer;
0 spawn BIS_fnc_WL2_zoneRestrictionHandleServer;
0 spawn BIS_fnc_WL2_incomePayoff;
0 spawn BIS_fnc_WL2_garbageCollector;
call BIS_fnc_WL2_processRunways;

setTimeMultiplier 8;
0 spawn {
	while {!BIS_WL_missionEnd} do {
		_overcastPreset = random 1;
		(7200 * timeMultiplier) setOvercast _overcastPreset;
		waitUntil {sleep 600; 0 setFog 0; 10e10 setFog 0; 0 setRain 0; 10e10 setRain 0; simulWeatherSync; abs (overcast - _overcastPreset) < 0.2};
	};
};

{
	_x spawn {
		_side = _this;
		while {!BIS_WL_missionEnd} do {
			waitUntil {sleep 5; ((missionNamespace getVariable format ["BIS_WL_currentTarget_%1", _side]) getVariable ["BIS_WL_owner", sideUnknown]) == _side};
			sleep 5;
			if (((missionNamespace getVariable format ["BIS_WL_currentTarget_%1", _side]) getVariable ["BIS_WL_owner", sideUnknown]) == _side) then {
				[_side, objNull] call BIS_fnc_WL2_selectTarget;
			};
		};
	};
} forEach BIS_WL_competingSides;

if !(["(EU) #11", serverName] call BIS_fnc_inString) then {
	0 spawn {
		while {!BIS_WL_missionEnd} do {
			_allEntities = entities [[], ["Logic"], true]; 
			{ 
				_x addCuratorEditableObjects [_allEntities, true];
			} forEach allCurators;
			sleep 30;
		};
	};
};

["server_init"] call BIS_fnc_endLoadingScreen;