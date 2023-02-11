#include "..\warlords_constants.inc"

while {true} do {
	private _uid = getPlayerUID player;
	private _playerCurrentAmount = player getVariable ["BIS_WL_funds", 0];
	private _id = clientOwner;
	[_uid, _playerCurrentAmount, _id, "save"] remoteExecCall ["BIS_fnc_WL2_dataBase", 2];
	uiNamespace setVariable ["BIS_WL_cp_saved", TRUE];
	systemChat localize "STR_A3_WL_cp_saved";
	[FALSE] call BIS_fnc_WL2_refreshOSD;
	sleep 3;
	uiNamespace setVariable ["BIS_WL_cp_saved", FALSE];
	[FALSE] call BIS_fnc_WL2_refreshOSD;
	sleep 297;
};                     
