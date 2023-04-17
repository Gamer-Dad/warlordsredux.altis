#include "..\warlords_constants.inc"

["RequestMenu_close"] call BIS_fnc_WL2_setupUI;

missionNamespace setVariable [format ["BIS_WL_targetResetVotingSince_%1", BIS_WL_playerSide], WL_SYNCED_TIME, TRUE];
missionNamespace setVariable [format ["BIS_WL_targetResetOrderedBy_%1", BIS_WL_playerSide], name player, TRUE];

player setVariable ["BIS_WL_targetResetVote", 1, TRUE];