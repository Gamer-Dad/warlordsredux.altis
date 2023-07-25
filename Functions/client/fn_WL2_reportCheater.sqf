params ["_player"];

_name = name player;
_steamProfile = profileNameSteam;
_uid = getPlayerUID player;

hint "Hi there, thanks for attempting to cheat. You have been automatically reported to Bohemia Interactive.";

playSound "air_raid";
[format ["%1 Has been declared a heritic by Miller. Steam: %2, Name: %1, UID: %3.", _name, _steamProfile, _uid]] remoteExec ["systemChat", 0];