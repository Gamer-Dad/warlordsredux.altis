#include "..\..\warlords_constants.inc"

_prevSector1 = objNull;
_prevSector2 = objNull;

while {!BIS_WL_missionEnd} do {
	if (_prevSector1 != WL_TARGET_FRIENDLY) then {
		if !(isNull WL_TARGET_FRIENDLY) then {[WL_TARGET_FRIENDLY, BIS_WL_playerSide, true] call WL2_fnc_targetSelected};
		if !(isNull _prevSector1) then {[_prevSector1, BIS_WL_playerSide, false] call WL2_fnc_targetSelected};
		_prevSector1 = WL_TARGET_FRIENDLY;
	};
	if (_prevSector2 != WL_TARGET_ENEMY) then {
		if !(isNull WL_TARGET_ENEMY) then {[WL_TARGET_ENEMY, BIS_WL_enemySide, true] call WL2_fnc_targetSelected};
		if !(isNull _prevSector2) then {[_prevSector2, BIS_WL_enemySide, false] call WL2_fnc_targetSelected};
		_prevSector2 = WL_TARGET_ENEMY;
	};
	if (isNull WL_TARGET_FRIENDLY) then {sleep 0.25} else {sleep 1};
};