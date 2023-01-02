#include "..\warlords_constants.inc"


private _uid = getPlayerUID player;
private _playerCurrentAmount = player getVariable ["BIS_WL_funds", 0];
private _id = clientOwner;
[_uid, _playerCurrentAmount, _id, "save"] remoteExecCall ["BIS_fnc_WL2_dataBase", 2];               


