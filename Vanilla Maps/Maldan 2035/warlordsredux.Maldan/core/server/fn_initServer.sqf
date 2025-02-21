#include "..\warlords_constants.inc"

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

#if WL_FACTION_THREE_ENABLED
{
	private _group = createGroup independent;
	_group deleteGroupWhenEmpty true;

	private _unit = _group createUnit ["I_Soldier_TL_F", [-1000, -1000, 0], [], 0, "NONE"];
	_unit setVariable ["WL2_isPlayableGreen", true, true];
	_unit allowDamage false;
} forEach [1, 2, 3, 4, 5];
#endif

call SQD_fnc_initServer;

call WL2_fnc_serverEHs;

_group = createGroup civilian;
missionNamespace setVariable ["BIS_WL_wrongTeamGroup", _group, true];
_group deleteGroupWhenEmpty false;
missionNamespace setVariable ["gameStart", serverTime, true];
private _sessionID = random(10000000);
missionNamespace setVariable ["sessionID", _sessionID, true];

if !(isDedicated) then {waitUntil {!isNull player && {isPlayer player}}};

call WL2_fnc_sectorsInitServer;
"setup" call WL2_fnc_handleRespawnMarkers;
if !(isDedicated) then {
	{
		_x call WL2_fnc_parsePurchaseList;
	} forEach BIS_WL_sidesArray;
};
0 spawn WL2_fnc_detectNewPlayers;
["server", true] call WL2_fnc_updateSectorArrays;
0 spawn WL2_fnc_targetSelectionHandleServer;
0 spawn WL2_fnc_zoneRestrictionHandleServer;
0 spawn WL2_fnc_incomePayoff;
0 spawn WL2_fnc_garbageCollector;
0 spawn WL2_fnc_wlac;
call WL2_fnc_processRunways;

0 spawn WL2_fnc_cleanupCarrier;

0 spawn {
	while {!BIS_WL_missionEnd} do {
		_overcastPreset = random 1;
		7200 setOvercast _overcastPreset;
		waitUntil {
			sleep 600;
			0 setFog 0;
			10e10 setFog 0;
			0 setRain 0;
			10e10 setRain 0;
			simulWeatherSync;
			abs (overcast - _overcastPreset) < 0.2
		};
	};
};

{
	_x spawn {
		_side = _this;
		while {!BIS_WL_missionEnd} do {
			private _currentSideTargetVar = format ["BIS_WL_currentTarget_%1", _side];
			private _currentSideTarget = missionNamespace getVariable [_currentSideTargetVar, objNull];
			private _currentSideTargetOwner = objNull;
			waitUntil {
				sleep 5;
				_currentSideTarget = missionNamespace getVariable [_currentSideTargetVar, objNull];
				_currentSideTargetOwner = _currentSideTarget getVariable ["BIS_WL_owner", sideUnknown];
				_currentSideTargetOwner != _side;
			};

			sleep 5;
			if (_currentSideTargetOwner == _side) then {
				[_side, objNull] call WL2_fnc_selectTarget;
			};
		};
	};
} forEach BIS_WL_competingSides;

#if WL_ZEUS_ENABLED == 0
{
	deleteVehicle _x;
} forEach (allMissionObjects "ModuleCurator_F");
#endif

if !(["(EU) #11", serverName] call BIS_fnc_inString) then {
	0 spawn {
		while {!BIS_WL_missionEnd} do {
			private _allEntities = entities [[], ["Logic"], true];
			private _allNonLocalEntities = _allEntities select { owner _x != 0 };
			{
				_x addCuratorEditableObjects [_allNonLocalEntities, true];
			} forEach allCurators;
			sleep 30;
		};
	};
};

["server_init"] call BIS_fnc_endLoadingScreen;