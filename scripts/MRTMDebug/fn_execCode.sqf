/*
	Author: MrThomasM

	Description: Executes given code.
*/
params [["_sender", objNull , [objNull]], ["_code", "", [""]]];

if (isNull _sender) exitWith {};
_serverCheck = isDedicated && {remoteExecutedOwner != (owner _sender) && {(remoteExecutedOwner + (owner _sender)) > 4}};
_adminCheck = !(getPlayerUID ((allPlayers select {owner _x == remoteExecutedOwner}) # 0) in getArray (missionConfigFile >> "adminIDs"));

if (_serverCheck || _adminCheck) exitWith {
	_player = (allPlayers select {owner _x == owner _sender}) select 0;
	if !(isNull _player) then {
		diag_log str format ["WLAC: Name:%1 UID:%2 Attempted to execute command %3%", name _player, getPlayerUID _player, _code];
	} else {
		diag_log str format ["WLAC: REOwner: %1 Sender: %2 attempted to execute command {%3}", remoteExecutedOwner, _sender, _code];
	};
};
if (_code == "") exitWith {};

_code = compile _code;
_return = call _code;
if (isNil {_return}) then {
	_return = "No return value";
};

if (isDedicated) then {
	[_return] remoteExec ["MRTM_fnc_setReturnValue", remoteExecutedOwner];
} else {
	_return spawn MRTM_fnc_setReturnValue;
};