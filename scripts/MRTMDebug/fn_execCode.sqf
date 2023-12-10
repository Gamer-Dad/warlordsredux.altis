/*
	Author: MrThomasM

	Description: Executes given code.
*/
params [["_sender", objNull , [objNull]], ["_code", "", [""]]];

if (isNull _sender) exitWith {};
_serverCheck = isDedicated && {remoteExecutedOwner != (owner _sender) && {count (allPlayers select {getPlayerUID _x == "76561198865298977"}) > 0}};
if (_serverCheck) exitWith {};
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