#include "..\warlords_constants.inc"

_owner = clientOwner;
_name = name player;
_steamProfile = profileNameSteam;
_uid = getPlayerUID player;

hint "Hi there, thanks for attempting to cheat. You have been automatically reported to Bohemia Interactive.";

playSound "air_raid";
player setVariable ["BIS_WL_isCheater", true, true];

[format ["%1 Tried to cheat. Steam: %2, Name: %1, UID: %3.", _name, _steamProfile, _uid]] remoteExec ["systemChat", 0, true];