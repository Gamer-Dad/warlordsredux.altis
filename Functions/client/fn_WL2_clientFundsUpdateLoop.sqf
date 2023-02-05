#include "..\warlords_constants.inc"

while {true} do {
	private _uid = getPlayerUID player;
	private _playerCurrentAmount = player getVariable ["BIS_WL_funds", 0];
	private _id = clientOwner;
	[_uid, _playerCurrentAmount, _id, "save"] remoteExecCall ["BIS_fnc_WL2_dataBase", 2];
	if (language == "Russian") then {
		[toUpper localize "STR_A3_WL_cp_savedRuss"] spawn BIS_fnc_WL2_smoothText;
	} else {
		[toUpper localize "STR_A3_WL_cp_saved"] spawn BIS_fnc_WL2_smoothText;
	};
	sleep 300;
};                     
