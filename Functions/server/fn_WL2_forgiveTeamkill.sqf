#include "..\warlords_constants.inc"

params ["_teamkiller", "_forgiver"];

// check to make sure script executor is forgiver
if ((owner _forgiver) != remoteExecutedOwner) exitWith {};

_timestamps = _teamkiller getVariable "BIS_WL_friendlyKillTimestamps";

// find latest TK entry
_newestTeamkillOnForgiver = 0;
_newestTeamkillTime = 0;
{
	if ((_x # 1) != (owner _forgiver)) then { continue };
	if (_newestTeamkillTime < _x # 0) then {
		_newestTeamkillTime = _x # 0;
		_newestTeamkillOnForgiver = _forEachIndex;
	};
} forEach _timestamps;

// delete it
_timestamps deleteAt _newestTeamkillOnForgiver;
_teamkiller setVariable ["BIS_WL_friendlyKillTimestamps", _timestamps, [2, owner _teamkiller]];

_teamKiller spawn {
	params ["_killer"];
	while {rating _killer < 0} do {
		_teamkiller addRating 500;
		sleep 0.1;
	};
};