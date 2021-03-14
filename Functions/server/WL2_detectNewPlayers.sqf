#include "..\warlords_constants.inc"

while {!BIS_WL_missionEnd} do {
	_newPlayers = BIS_WL_allWarlords select {!isNull _x && ((_x getVariable ["BIS_WL_detectedByServerSince", -1]) == -1) || (isPlayer _x && isNil {missionNamespace getVariable format ["BIS_WL_teamCheckOK_%1", getPlayerUID _x]})};
	{
		_x spawn BIS_fnc_WL2_setupNewWarlord;
	} forEach _newPlayers;
	
	uiSleep WL_TIMEOUT_STANDARD;
};