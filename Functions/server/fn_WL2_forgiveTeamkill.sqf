#include "..\warlords_constants.inc"

params ["_teamkiller", "_forgiver"];

// check to make sure script executor is forgiver
if ((owner _forgiver) != remoteExecutedOwner) exitWith { false };

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
_forgiver setVariable ["BIS_WL_friendlyKillTimestamps", _timestamps, [2, owner _teamkiller]];

_forgiver addRating 1400;