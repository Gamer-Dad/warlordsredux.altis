params ["_player"];

hint "Hi there, thanks for attempting to cheat. You have been automatically reported to Bohemia Interactive.";
_player setVariable ["BIS_WL_registerdCheater", true, true];
playSound "air_raid";