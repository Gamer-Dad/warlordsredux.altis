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

missionNamespace setVariable ["imbalance", 0, true];

[36000] call BIS_fnc_countdown;
0 spawn BIS_fnc_WL2_tablesSetUp;

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
		_x spawn BIS_fnc_WL2_sub_deleteAsset;
	} forEach (missionNamespace getVariable format ["BIS_WL_%1_ownedVehicles", _uid]);
	{
		if !(isPlayer _x) then {deleteVehicle _x;};
	} forEach ((units group _unit) - [_unit]);
	missionNamespace setVariable [format ["BIS_WL_%1_ownedVehicles", _uid], []];
	
	0 spawn BIS_fnc_WL2_calcImbalance;
}];

addMissionEventHandler ["EntityKilled", {
	_this spawn BIS_fnc_WL2_killRewardHandle;
	_this spawn BIS_fnc_WL2_friendlyFireHandleServer;

	if ((typeOf (_this # 0)) == "Land_IRMaskingCover_01_F") then {
		{
			_asset = _x;
			if !(alive _x) then {
				deleteVehicle _asset;
			};
		} forEach ((allMissionObjects "") select {(["BIS_WL_", str _x, false] call BIS_fnc_inString) && !(["BIS_WL_init", str _x, false] call BIS_fnc_inString)});	
	};
}];

missionNamespace setVariable ["BIS_WL_missionStart", serverTime, true];
missionNamespace setVariable ["BIS_WL_wrongTeamGroup", createGroup CIVILIAN, true];
BIS_WL_wrongTeamGroup deleteGroupWhenEmpty false;

if !(isDedicated) then {waitUntil {!isNull player && isPlayer player}};

call BIS_fnc_WL2_loadFactionClasses;
call BIS_fnc_WL2_sectorsInitServer;
"setup" call BIS_fnc_WL2_handleRespawnMarkers;
{_x call BIS_fnc_WL2_parsePurchaseList} forEach BIS_WL_competingSides;
0 spawn BIS_fnc_WL2_detectNewPlayers;
["server", true] call BIS_fnc_WL2_updateSectorArrays;
0 spawn BIS_fnc_WL2_targetSelectionHandleServer;
0 spawn BIS_fnc_WL2_zoneRestrictionHandleServer;
0 spawn BIS_fnc_WL2_incomePayoff;
0 spawn BIS_fnc_WL2_targetResetHandleServer;
0 spawn BIS_fnc_WL2_forfeitHandleServer;
0 spawn BIS_fnc_WL2_garbageCollector;
0 spawn BIS_fnc_WL2_mineLimit;
0 spawn BIS_fnc_WL2_processRunways;

setTimeMultiplier 3;
0 spawn {
	while {!BIS_WL_missionEnd} do {
		waitUntil {sleep WL_TIMEOUT_LONG; daytime > 20 || daytime < 5};
		setTimeMultiplier 9;
		waitUntil {sleep WL_TIMEOUT_LONG; daytime < 20 && daytime > 5};
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
			waitUntil {sleep WL_TIMEOUT_LONG; ((missionNamespace getVariable format ["BIS_WL_currentTarget_%1", _side]) getVariable ["BIS_WL_owner", sideUnknown]) == _side};
			sleep WL_TIMEOUT_LONG;
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
	_screen1 setObjectTextureGlobal [0, "img\screen1.paa"];
	private _screen2 = createSimpleObject ["Land_PCSet_01_screen_F", [4191.31,20096.7,317.753]];
	_screen2 setDir 87.086;
	_screen2 setObjectTextureGlobal [0, "img\screen2.paa"];
	private _screen3 = createSimpleObject ["Land_PCSet_01_screen_F", [4191.12,20096.2,317.753]];
	_screen3 setDir 132.739;
	_screen3 setObjectTextureGlobal [0, "img\screen3.paa"];
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
	private _phone = createSimpleObject ["Land_IPPhone_01_sand_F", [4190.71,20097.5,317.647]];
	_phone setDir 40.497;
	_phone setObjectTextureGlobal [1, "img\rick.paa"];
	if ((random 1) < 0.6) then {
		private _car = createVehicle ["C_Offroad_01_comms_F", [4200.52,20100.4,-0.0614624], [], 0, "NONE"];
		_car setDir 145;
	};
	waitUntil { sleep 0.1; !isNil {_seat}};
	if ((floor (random 11)) < 4) then {
		_group = createGroup civilian;
		DEV_MrThomasM = _group createUnit ["C_Man_casual_1_F", [4189.28,20095.9,316.912], [], 0, "NONE"];
		publicVariable "DEV_MrThomasM";
		DEV_MrThomasM forceAddUniform "U_O_R_Gorka_01_black_F";
		DEV_MrThomasM addHeadgear "H_PilotHelmetHeli_B"; 
		DEV_MrThomasM addVest "V_PlateCarrier1_blk"; 
		DEV_MrThomasM addGoggles "G_bandanna_beast"; 
		DEV_MrThomasM addItem "NVGoggles";  
		DEV_MrThomasM assignItem "NVGoggles"; 
		removeBackpack DEV_MrThomasM;
		[DEV_MrThomasM, "SIT_AT_TABLE", "ASIS", _seat] call BIS_fnc_ambientAnim;
		DEV_MrThomasM allowDamage false;
		[DEV_MrThomasM, "InsigniaMrThomasM"] call BIS_fnc_setUnitInsignia;
	};
};

["server_init"] call BIS_fnc_endLoadingScreen;