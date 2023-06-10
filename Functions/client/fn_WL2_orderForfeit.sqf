#include "..\warlords_constants.inc"

["RequestMenu_close"] spawn BIS_fnc_WL2_setupUI;

missionNamespace setVariable [format ["BIS_WL_forfeitVotingSince_%1", BIS_WL_playerSide], WL_SYNCED_TIME, true];
missionNamespace setVariable [format ["BIS_WL_forfeitOrderedBy_%1", BIS_WL_playerSide], name player, true];

player setVariable ["BIS_WL_forfeitVote", 1, true];