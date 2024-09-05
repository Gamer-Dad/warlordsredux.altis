params ["_side"];

_varName = format ["BIS_WL_forfeitVotingSince_%1", _side];
_terminate = false;

while {!_terminate && {serverTime < ((missionNamespace getVariable [_varName, -1]) + 30)}} do {
	sleep 0.25;

	_warlords = allPlayers select {(side group _x == _side) && {!(_x getVariable ["BIS_WL_incomeBlocked", false])}};
	_limit = ceil ((count _warlords) / 2);
	_votedYes = count (_warlords select {(_x getVariable ["BIS_WL_forfeitVote", -1]) == 1});
	_votedNo = count (_warlords select {(_x getVariable ["BIS_WL_forfeitVote", -1]) == 0});

	if ((_votedYes >= _limit) && {(serverTime >= 180)}) then {
		missionNamespace setVariable ["BIS_WL_ffTeam", _side, true];
		missionNamespace setVariable ["BIS_WL_missionEnd", true, true];
		0 remoteExec ["BIS_fnc_WL2_missionEndHandle", 0];
		_terminate = true;
	};
};

{
	if ((_x getVariable ["BIS_WL_forfeitVote", -1]) != -1) then {
		_x setVariable ["BIS_WL_forfeitVote", nil, [2, (owner _x)]];
	};
} forEach (allPlayers select {side group _x == _side});

private _forfeiterNameVar = format ["BIS_WL_forfeitOrderedBy_%1", _side];
private _forfeiterName = missionNamespace getVariable [_forfeiterNameVar, "Someone"];
private _message = format ["%1 has initiated a vote to forfeit the game.", _forfeiterName];
{
	[[_side, "Base"], _message] remoteExec ["commandChat", owner _x];
} forEach (allPlayers select {side group _x == _side});