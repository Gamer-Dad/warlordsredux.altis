params ["_player"];

_name = name _player;
_steamProfile = profileNameSteam;
_uid = getPlayerUID _player;

hint "Hi there, thanks for attempting to cheat. You have been automatically reported to Bohemia Interactive.";
_player setVariable ["BIS_WL_registerdCheater", true, true];

playSound "air_raid";
[format ["%1 Has been declared a heretic by Miller. Steam: %2, Name: %1, UID: %3.", _name, _steamProfile, _uid]] remoteExec ["systemChat", 0];