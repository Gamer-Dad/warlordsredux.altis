params ["_teamkiller", "_forgiver", "_forgive", "_victim"];

if !(isServer) exitWith {};
if ((owner _forgiver) != remoteExecutedOwner) exitWith {};

if !(_forgive) then {
	private _teamkillerOwner = owner _teamkiller;
	if (_teamkillerOwner < 3) exitwith {};
	_timestamps = _teamkiller getVariable ["BIS_WL_friendlyKillTimestamps", []];
	_timestamps pushBack serverTime;
	_teamkiller setVariable ["BIS_WL_friendlyKillTimestamps", _timestamps, [2, _teamkillerOwner]];
	
	private _displayMsg = format ["You have been punished for killing friendly %1.", _victim];
	_displayMsg remoteExec ["systemChat", _teamkillerOwner];
	[["a3\dubbing_f_bootcamp\boot_m04\50_friendly\boot_m04_50_friendly_ada_0.ogg"]] remoteExec ["playSoundUI", _teamkillerOwner];

	if ((count (_teamKiller getVariable ["BIS_WL_friendlyKillTimestamps", []])) >= 3) then {
		_teamKiller setDamage 1;
		_varName = format ["BIS_WL_%1_friendlyKillPenaltyEnd", getPlayerUID _teamKiller];
		serverNamespace setVariable [_varName, serverTime + 1800];
		[(serverNamespace getVariable _varName)] remoteExec ["BIS_fnc_WL2_friendlyFireHandleClient", _teamkillerOwner];
	};
};