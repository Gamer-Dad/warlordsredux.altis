#include "..\warlords_constants.inc"

params ["_newUnit", ["_corpse", objNull]];

BIS_WL_allWarlords = BIS_WL_allWarlords - [_corpse];

if (_newUnit getVariable ["BIS_WL_ignore", FALSE]) exitWith {};

[_newUnit] spawn {
	params ["_newUnit"];
	waitUntil {!isNull group _newUnit};
	
	if ((side group _newUnit) in BIS_WL_competingSides) then {
		BIS_WL_allWarlords pushBackUnique _newUnit;
	};
};

if (local _newUnit) then {
	if (_newUnit == player) then {
		detach BIS_WL_enemiesCheckTrigger;
		BIS_WL_enemiesCheckTrigger attachTo [player, [0, 0, 0]];
	};
};