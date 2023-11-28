
params ["_teamkiller", "_forgiver", "_forgive"];

if !(isServer) exitWith {};
if ((owner _forgiver) != remoteExecutedOwner) exitWith {};

[format ["%1: %2", serverTime, "forgive teamkill"]] remoteExec ["systemChat", 0];
[format ["%1: %2", serverTime, _forgive]] remoteExec ["systemChat", 0];

if (_forgive) then {
	_timestamps = _teamkiller getVariable ["BIS_WL_friendlyKillTimestamps", []];

	_timestamps deleteAt ((count _timestamps) - 1);
	_teamkiller setVariable ["BIS_WL_friendlyKillTimestamps", _timestamps, [2, (owner _teamkiller)]];

	_teamKiller spawn {
		params ["_teamKiller"];
		while {rating _teamKiller < 0} do {
			_teamkiller addRating 500;
			sleep 0.1;
		};
	};
} else {
	if ((count (_teamKiller getVariable "BIS_WL_friendlyKillTimestamps")) >= 3) then {
		_varName = format ["BIS_WL_%1_friendlyKillPenaltyEnd", getPlayerUID _teamKiller];
		serverNamespace setVariable [_varName, serverTime + 1800];
		[(serverNamespace getVariable _varName)] remoteExec ["BIS_fnc_WL2_friendlyFireHandleClient", (owner _teamKiller)];
	};
};