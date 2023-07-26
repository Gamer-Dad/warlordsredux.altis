params ["_player"];

private _name = name _player;
private _steamProfile = profileNameSteam;
private _uid = getPlayerUID _player;
private _date = systemTimeUTC;
_date = format ["%1/%2/%3", (_date # 1), (_date # 2), (_date # 0)];
private _time = systemTimeUTC;
_time = format ["%1:%2:%3", (_time # 3), (_time # 4), (_time # 5)];

hint "Hi there, thanks for attempting to cheat. You have been automatically reported to Bohemia Interactive.";
_player setVariable ["BIS_WL_registerdCheater", true, true];

playSound "air_raid";
[format ["%1 Has been declared a heretic by Miller. Steam: %1 | UTC Time: %2 | Date: %3.", _steamProfile, _time, _date]] remoteExec ["systemChat", 0];