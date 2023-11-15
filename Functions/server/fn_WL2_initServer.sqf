["server_init"] call BIS_fnc_startLoadingScreen;

[36000] call BIS_fnc_countdown;
call BIS_fnc_WL2_tablesSetUp;

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

call BIS_fnc_WL2_playersListHandle;
"server" call BIS_fnc_WL2_varsInit;
call BIS_fnc_WL2_serverEHs;

missionNamespace setVariable ["BIS_WL_wrongTeamGroup", createGroup CIVILIAN, true];
BIS_WL_wrongTeamGroup deleteGroupWhenEmpty false;

if !(isDedicated) then {waitUntil {!isNull player && {isPlayer player}}};

call BIS_fnc_WL2_loadFactionClasses;
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

setTimeMultiplier 4;
0 spawn {
	while {!BIS_WL_missionEnd} do {
		waitUntil {sleep 5; daytime > 20 || {daytime < 5}};
		setTimeMultiplier 8;
		waitUntil {sleep 5; daytime < 20 && {daytime > 5}};
		setTimeMultiplier 3;
	};
};

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
	waitUntil { sleep 0.1; !isNil {_seat}};
	_group = createGroup civilian;
	_devMRTM = _group createUnit ["C_Man_casual_1_F", [4189.28,20095.9,316.912], [], 0, "NONE"];
	_devMRTM forceAddUniform "U_O_R_Gorka_01_black_F";
	_devMRTM addHeadgear "H_PilotHelmetHeli_B"; 
	_devMRTM addVest "V_PlateCarrier1_blk"; 
	_devMRTM addGoggles "G_bandanna_beast"; 
	_devMRTM addItem "NVGoggles";  
	_devMRTM assignItem "NVGoggles"; 
	removeBackpack _devMRTM;
	[_devMRTM, "SIT_AT_TABLE", "ASIS", _seat] call BIS_fnc_ambientAnim;
	[_devMRTM, "InsigniaMrThomasM"] call BIS_fnc_setUnitInsignia;
	_devMRTM allowDamage false;
	missionNamespace setVariable ["devMRTM", [_devMRTM, _seat], true];
};

["server_init"] call BIS_fnc_endLoadingScreen;