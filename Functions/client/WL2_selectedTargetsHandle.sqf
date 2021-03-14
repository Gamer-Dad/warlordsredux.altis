#include "..\warlords_constants.inc"

_prevSector1 = objNull;
_prevSector2 = objNull;

_side1 = BIS_WL_playerSide;
_side2 = BIS_WL_enemySide;

while {!BIS_WL_missionEnd} do {
	if (_prevSector1 != WL_TARGET_FRIENDLY) then {
		if !(isNull WL_TARGET_FRIENDLY) then {[WL_TARGET_FRIENDLY, _side1, TRUE] call BIS_fnc_WL2_targetSelected};
		if !(isNull _prevSector1) then {[_prevSector1, _side1, FALSE] call BIS_fnc_WL2_targetSelected};
		_prevSector1 = WL_TARGET_FRIENDLY;
	};
	if (_prevSector2 != WL_TARGET_ENEMY) then {
		if !(isNull WL_TARGET_ENEMY) then {[WL_TARGET_ENEMY, _side2, TRUE] call BIS_fnc_WL2_targetSelected};
		if !(isNull _prevSector2) then {[_prevSector2, _side2, FALSE] call BIS_fnc_WL2_targetSelected};
		_prevSector2 = WL_TARGET_ENEMY;
	};
	if (isNull WL_TARGET_FRIENDLY) then {sleep WL_TIMEOUT_SHORT} else {sleep WL_TIMEOUT_STANDARD};
};