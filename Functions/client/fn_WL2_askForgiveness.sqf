params ["_killer"];

// Don't interrupt the victim if they're still alive somehow.
if (alive player) exitWith { false };

_askForgivenessResult = [format ["Choose to forgive %1?", name _killer], "Forgive teamkiller", "Forgive", "Don't forgive"] call BIS_fnc_guiMessage;
if (_askForgivenessResult) then {
	[_killer, player] remoteExec ["BIS_fnc_WL2_forgiveTeamkill", 2];
};