["RequestMenu_close"] call BIS_fnc_WL2_setupUI;

if (side player == west) exitWith {
	[player, "orderFTVehicle", 200, 0, (side player), false] remoteExecCall ["BIS_fnc_WL2_handleClientRequest", 2];
};

if (side player == east) exitWith {
	[player, "orderFTVehicle", 200, 0, (side player), false] remoteExecCall ["BIS_fnc_WL2_handleClientRequest", 2];
};