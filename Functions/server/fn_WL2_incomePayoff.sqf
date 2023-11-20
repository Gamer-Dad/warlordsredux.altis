#include "..\server_macros.inc"

while {!BIS_WL_missionEnd} do {
	sleep 60;
	private _notBlocked = allPlayers select {!(_x getVariable ["BIS_WL_incomeBlocked", false])};
	{
		_uid = getPlayerUID _x;

		if ((serverNamespace getVariable [variable, 40]) < 50) then {
			[_uid, 50] call BIS_fnc_WL2_fundsDatabaseWrite;
		} else {
			[_uid, (serverNamespace getVariable variable)] call BIS_fnc_WL2_fundsDatabaseWrite;
		};
	} forEach _notBlocked;
};