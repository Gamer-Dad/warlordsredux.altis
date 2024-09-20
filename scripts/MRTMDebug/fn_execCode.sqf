/*
	Author: Weasley Wells

	Description: Executes given code by client if their player UID is in the  description.ext
*/
params [["_sender", objNull , [objNull]], ["_code", "", [""]]];
private ["_serverCheck", "_adminCheck"];

if (isNull _sender) exitWith {};

_serverCheck = isDedicated && remoteExecutedOwner == (owner _sender) && (remoteExecutedOwner + (owner _sender)) > 4;
if (isDedicated) then {
	_adminCheck = (getPlayerUID ((allPlayers select {owner _x == remoteExecutedOwner}) # 0) in getArray (missionConfigFile >> "adminIDs"));
} else {
	_adminCheck = ((getPlayerUID player) in getArray (missionConfigFile >> "adminIDs"));
};

if ((_serverCheck && _adminCheck) || (!isDedicated && _adminCheck)) then {
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
} else {
	if (isDedicated) then {
		diag_log format ["WLAC: Sender: %1 UID: %2 attempted to execute command {%3}", _sender, getPlayerUID _sender, _code];
	} else {
		[format ["WLAC: Name:%1 UID:%2 Attempted to execute command %3%", player, getPlayerUID player, _code]] remoteExec ["diag_log", 2];
	};
};