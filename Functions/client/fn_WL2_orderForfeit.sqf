"RequestMenu_close" call BIS_fnc_WL2_setupUI;
private _side = playerSide;

missionNamespace setVariable [format ["BIS_WL_forfeitVotingSince_%1", _side], serverTime, true];
missionNamespace setVariable [format ["BIS_WL_forfeitOrderedBy_%1", _side], name player, true];
player setVariable ["BIS_WL_forfeitVote", 1, [2, clientOwner]];

[_side] remoteExec ["BIS_fnc_WL2_forfeitHandle", [0, -2] select isDedicated];
[_side] remoteExec ["BIS_fnc_WL2_forfeitHandleServer", 2];