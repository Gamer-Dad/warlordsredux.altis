#include "..\warlords_constants.inc"

params ["_newUnit", ["_corpse", objNull]];

BIS_WL_allWarlords = BIS_WL_allWarlords - [_corpse];

if (_newUnit getVariable ["BIS_WL_ignore", FALSE]) exitWith {};

[_newUnit] spawn {
	params ["_newUnit"];
	waitUntil {!isNull group _newUnit};
	
	if ((side group _newUnit) in BIS_WL_competingSides) then {
		BIS_WL_allWarlords pushBackUnique _newUnit;
		
		if !(isDedicated) then {
			if ((side group _newUnit) == BIS_WL_playerSide) then {
				call BIS_fnc_WL2_refreshIconsToDraw;
			};
		};
		
		if (isServer) then {
			_newUnit call BIS_fnc_WL2_mainAIHandle;
			_base = WL_BASES # (WL_BASES findIf {(_x getVariable "BIS_WL_owner") == side group _newUnit});
			if (time == 0 || _newUnit inArea (_base getVariable "objectAreaComplete")) then {
				[_newUnit, FALSE] remoteExec ["allowDamage", _newUnit];
				_protectionEnd = WL_SYNCED_TIME + WL_RESPAWN_PROTECTION_DURATION;
				waitUntil {sleep WL_TIMEOUT_STANDARD; !alive _newUnit || WL_SYNCED_TIME >= _protectionEnd || !(_newUnit inArea (_base getVariable "objectAreaComplete"))};
				[_newUnit, TRUE] remoteExec ["allowDamage", _newUnit];
			};
		};
	};
};

if (local _newUnit) then {
	[group _newUnit, 0] setWaypointPosition [getPosASL _newUnit, -1];

	if (_newUnit == player) then {
		detach BIS_WL_enemiesCheckTrigger;
		BIS_WL_enemiesCheckTrigger attachTo [player, [0, 0, 0]];
	};
};