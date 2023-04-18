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
	while {TRUE} do {
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
		_x call BIS_fnc_WL2_sub_deleteAsset;
	} forEach (missionNamespace getVariable format ["BIS_WL_%1_ownedVehicles", _uid]);
	
	{
		if !(isPlayer _x) then {_x setDamage 1};
	} forEach ((units group _unit) - [_unit]);
	
	missionNamespace setVariable [format ["BIS_WL_%1_ownedVehicles", _uid], nil];
}];

addMissionEventHandler ["EntityKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	_this spawn BIS_fnc_WL2_killRewardHandle;
	_this call BIS_fnc_WL2_friendlyFireHandleServer;

	if (typeOf _unit == "B_Truck_01_medical_F") then {
		missionNamespace setVariable ["ftVehicleExistsBlu", false, true];
	};

	if (typeOf _unit == "O_Truck_03_medical_F") then {
		missionNamespace setVariable ["ftVehicleExistsOpf", false, true];
	};
}];

addMissionEventHandler ["EntityCreated", {
	params ["_entity"];
	if (typeOf _entity == "B_UGV_01_rcws_F" || typeOf _entity == "B_UGV_02_Demining_F" || typeOf _entity == "O_UGV_01_rcws_F" || typeOf _entity == "O_UGV_02_Demining_F") then {
		[_entity] spawn {
			_entity = _this select 0;
			while {alive _entity} do {
				_pos = getPosASLW _entity;
				if (_pos select 2 < 0) then {
					_entity setDamage 1;
				};
				sleep 5;
			};
		};
	};

    if (typeOf _entity == "I_Truck_02_MRL_F") then { //Zamak MLRS
        _entity setObjectTextureGlobal [0, "A3\armor_f_gamma\mbt_01\data\mbt_01_scorcher_hexarid_co.paa"]; //Zamak cabin
        //_entity setObjectTextureGlobal [1, "A3\armor_f_gamma\mbt_02\data\mbt_02_body_co.paa"]; //Does nothing but keep for reminder
        _entity setObjectTextureGlobal [2, "A3\armor_f_gamma\mbt_01\data\mbt_01_scorcher_hexarid_co.paa"]; //Zamak Bed&Launcher                
    };
	
	if (typeOf _entity == "B_AAA_System_01_F") then { //Praetorian
		private _side = side (crew _entity select 0);
		if (_side == east) then {
			_entity setObjectTextureGlobal [0, "A3\static_f_jets\AAA_System_01\data\AAA_system_01_olive_co.paa"];
			_entity setObjectTextureGlobal [1, "A3\static_f_jets\AAA_System_01\data\AAA_system_02_olive_co.paa"];
		};
	} else {
		if (typeOf _entity == "B_SAM_System_01_F") then { //Spartan
			private _side = side (crew _entity select 0);
			if (_side == east) then {
				_entity setObjectTextureGlobal [0, "A3\static_f_jets\SAM_System_01\data\SAM_system_01_olive_co.paa"];
			};
		} else {
			if (typeOf _entity == "B_SAM_System_02_F") then { //Centurion
				private _side = side (crew _entity select 0);
				if (_side == east) then {
					_entity setObjectTextureGlobal [0, "A3\static_f_jets\SAM_System_02\data\SAM_system_02_olive_co.paa"];
				};
			};
		};
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

setTimeMultiplier BIS_WL_timeMultiplier;
private _spaceLukkie = createSimpleObject ["\A3\Structures_F\Civ\Dead\HumanSkeleton_F.p3d", [17366.8,12577.2,18.2285]];
_spaceLukkie setDir 122;

0 spawn {
	while {TRUE} do {
		waitUntil {sleep WL_TIMEOUT_LONG; daytime > 20 || daytime < 5};
		setTimeMultiplier ((BIS_WL_timeMultiplier * 4) min 24);
		waitUntil {sleep WL_TIMEOUT_LONG; daytime < 20 && daytime > 5};
		setTimeMultiplier BIS_WL_timeMultiplier;
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