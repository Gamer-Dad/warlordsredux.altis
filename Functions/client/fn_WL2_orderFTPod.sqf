["RequestMenu_close"] call BIS_fnc_WL2_setupUI;

if (side player == west) exitWith {
	[player, "orderFTPod", 0, (side player), false] remoteExec ["BIS_fnc_WL2_handleClientRequest", 2];
};

if (side player == east) exitWith {
	[player, "orderFTPod", 0, (side player), false] remoteExec ["BIS_fnc_WL2_handleClientRequest", 2];
};