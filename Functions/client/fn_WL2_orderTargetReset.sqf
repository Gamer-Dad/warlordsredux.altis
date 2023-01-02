#include "..\warlords_constants.inc"

["RequestMenu_close"] call BIS_fnc_WL2_setupUI;
[player, -BIS_WL_targetResetCost] call BIS_fnc_WL2_fundsControl;
private  _id = clientOwner;
[] remoteExec ["BIS_fnc_WL2_clientFundsUpdate",  _id];

missionNamespace setVariable [format ["BIS_WL_targetResetVotingSince_%1", BIS_WL_playerSide], WL_SYNCED_TIME, TRUE];
missionNamespace setVariable [format ["BIS_WL_targetResetOrderedBy_%1", BIS_WL_playerSide], name player, TRUE];

player setVariable ["BIS_WL_targetResetVote", 1, TRUE];