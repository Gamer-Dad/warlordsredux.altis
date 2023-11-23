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
BIS_fnc_WL2_detectNewPlayers = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_detectNewPlayers.sqf";
BIS_fnc_WL2_forfeitHandleServer = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_forfeitHandleServer.sqf";
BIS_fnc_WL2_friendlyFireHandleServer = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_friendlyFireHandleServer.sqf";
BIS_fnc_WL2_fundsDatabaseUpdate = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_fundsDatabaseUpdate.sqf";
BIS_fnc_WL2_fundsDatabaseWrite = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_fundsDatabaseWrite.sqf";
BIS_fnc_WL2_garbageCollector = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_garbageCollector.sqf";
BIS_fnc_WL2_handleClientRequest = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_handleClientRequest.sqf";
BIS_fnc_WL2_income = compileFinal preprocessFileLineNumbers "Functions\server\fn_WL2_income.sqf";
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

BIS_fnc_orderAir = compileFinal preprocessFileLineNumbers "Functions\server\clientRequests\fn_orderAir.sqf";
BIS_fnc_orderDefence = compileFinal preprocessFileLineNumbers "Functions\server\clientRequests\fn_orderDefence.sqf";
BIS_fnc_orderGround = compileFinal preprocessFileLineNumbers "Functions\server\clientRequests\fn_orderGround.sqf";
BIS_fnc_orderNaval = compileFinal preprocessFileLineNumbers "Functions\server\clientRequests\fn_orderNaval.sqf";

call BIS_fnc_WL2_tablesSetUp;
call BIS_fnc_WL2_serverEHs;

_group = createGroup civilian;
missionNamespace setVariable ["BIS_WL_wrongTeamGroup", _group, true];
_group deleteGroupWhenEmpty false;

{
	serverNamespace setVariable [format ["BIS_WL_boundTo%1", _x], []];
} forEach [west, east];

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

setTimeMultiplier 7;
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

0 spawn {
	private _chair = createSimpleObject ["Land_OfficeChair_01_F", [4190.3,20096.9,316.909]];
	_chair setDir 281.389;
	private _seat = createSimpleObject ["Sign_Pointer_Cyan_F", [4190.3,20096.9,317.462]];
	_seat setDir 101.802;
	_seat setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0,0,0,0)"];
	private _desk = createSimpleObject ["OfficeTable_01_new_F", [4191.02,20096.7,316.913]];
	_desk setDir 86.365;
	private _screen1 = createSimpleObject ["Land_PCSet_01_screen_F", [4191.05,20097.2,317.754]];
	_screen1 setDir 38.168;
	private _screen2 = createSimpleObject ["Land_PCSet_01_screen_F", [4191.31,20096.7,317.753]];
	_screen2 setDir 87.086;
	private _screen3 = createSimpleObject ["Land_PCSet_01_screen_F", [4191.12,20096.2,317.753]];
	_screen3 setDir 132.739;
	private _serverBottom = createSimpleObject ["Land_PortableServer_01_sand_F", [4190.86,20097.7,316.952]];
	_serverBottom setDir 86.365;
	private _serverTop = createSimpleObject ["Land_PortableServer_01_sand_F", [4190.86,20097.7,317.299]];
	_serverTop setDir 86.365;
	private _keyboard = createSimpleObject ["Land_PCSet_01_keyboard_F", [4190.9,20096.9,317.736]];
	_keyboard setDir 104.137;
	private _mousePad = createSimpleObject ["Land_PCSet_01_mousepad_F", [4190.83,20096.5,317.735]];
	_mousePad setDir 86.365;
	private _mouse = createSimpleObject ["Land_PCSet_01_mouse_F", [4190.78,20096.5,317.744]];
	_mouse setDir 91.834;
	private _cabinet = createSimpleObject ["Land_OfficeCabinet_01_F", [4191.19,20095.6,316.908]];
	_cabinet setDir 86.365;
	private _router = createSimpleObject ["Land_Router_01_sand_F", [4191.07,20097.8,317.647]];
	_router setDir 97.622;
	if ((random 1) < 0.4) then {
		private _car = createVehicle ["C_Offroad_01_comms_F", [4200.52,20100.4,-0.0614624], [], 0, "NONE"];
		_car setDir 145;
		[_car, "InsigniaMrThomasM"] call BIS_fnc_setUnitInsignia;
	};
};

["server_init"] call BIS_fnc_endLoadingScreen;