#include "..\warlords_constants.inc"

_owner = clientOwner;
_name = name player;
_steamProfile = profileNameSteam;
_uid = getPlayerUID player;

hint "Hi there, thanks for attempting to cheat. You have been automatically reported to Bohemia Interactive.";

playSound "air_raid";
player setVariable ["BIS_WL_isCheater", true, true];

[format ["%1 has been expected of cheating. Steam: %2, UID: %3.", _name, _steamProfile, _uid]] remoteExec ["systemChat", 0, true];
diag_log (format ["Cheater detected |Name: %1 |Steam: %2 |UID: %3| Client owner number: %4 |", _name, _steamProfile, _uid, _owner]);