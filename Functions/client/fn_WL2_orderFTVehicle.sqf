["RequestMenu_close"] spawn BIS_fnc_WL2_setupU;

if (side player == west) exitWith {
	[player, "orderFTVehicle", 200, 0, (side player), false] remoteExec ["BIS_fnc_WL2_handleClientRequest", 2];
};

if (side player == east) exitWith {
	[player, "orderFTVehicle", 200, 0, (side player), false] remoteExec ["BIS_fnc_WL2_handleClientRequest", 2];
};