#include "..\warlords_constants.inc"

["RequestMenu_close"] spawn BIS_fnc_WL2_setupU;

missionNamespace setVariable [format ["BIS_WL_forfeitVotingSince_%1", BIS_WL_playerSide], serverTime, true];
missionNamespace setVariable [format ["BIS_WL_forfeitOrderedBy_%1", BIS_WL_playerSide], name player, true];
player setVariable ["BIS_WL_forfeitVote", 1, [2, clientOwner]];

[BIS_WL_playerSide] remoteExec ["BIS_fnc_WL2_forfeitHandle", [0, -2] select isDedicated];
[BIS_WL_playerSide] remoteExec ["BIS_fnc_WL2_forfeitHandleServer", 2];