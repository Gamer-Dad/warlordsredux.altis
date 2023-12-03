params ["_teamkiller", "_forgiver", "_forgive"];

if !(isServer) exitWith {};
if ((owner _forgiver) != remoteExecutedOwner) exitWith {};

if (_forgive) then {
	_timestamps = _teamkiller getVariable ["BIS_WL_friendlyKillTimestamps", []];

	_timestamps deleteAt ((count _timestamps) - 1);
	_teamkiller setVariable ["BIS_WL_friendlyKillTimestamps", _timestamps, [2, (owner _teamkiller)]];
} else {
	if ((count (_teamKiller getVariable ["BIS_WL_friendlyKillTimestamps", []])) >= 3) then {
		_teamKiller setDamage 1;
		_varName = format ["BIS_WL_%1_friendlyKillPenaltyEnd", getPlayerUID _teamKiller];
		serverNamespace setVariable [_varName, serverTime + 1800];
		[(serverNamespace getVariable _varName)] remoteExec ["BIS_fnc_WL2_friendlyFireHandleClient", (owner _teamKiller)];
	};
};