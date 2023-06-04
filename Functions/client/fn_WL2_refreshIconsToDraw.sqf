#include "..\warlords_constants.inc"

if !(isDedicated) then {
	waitUntil {!isNil "BIS_WL_playerSide" && {!isNil "BIS_WL_playersAlpha"}};
	if (BIS_WL_playersAlpha != 0) then {
		BIS_WL_iconDrawArrayMap = BIS_WL_allWarlords select {side group _x == BIS_WL_playerSide};
		BIS_WL_iconDrawArray3D = BIS_WL_iconDrawArrayMap select {isPlayer _x && {_x != player && {_x distance2D player < WL_PLAYER_ICON_RANGE}}};
		if (difficultyOption "mapContent" == 1) then {BIS_WL_iconDrawArrayMap = BIS_WL_iconDrawArrayMap - [player]};
	};
};