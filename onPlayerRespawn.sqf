params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];
0 spawn KSLOOP_fnc_unflipVehicleAddAction;

if ((_newUnit != (leader group _newUnit)) && ((_oldUnit distance (leader group _newUnit)) < 50) && (alive (leader group _newUnit))) then {
	0 remoteExec ["BIS_fnc_WL2_orderLastLoadout", (owner _newUnit)];
	_newUnit setVehiclePosition [getPosASL (leader group _newUnit), [], 2, "NONE"];
};

player addAction [
	"Commemorate",
	{
		[toUpper "R.I.P. Spacelukkie"] spawn BIS_fnc_WL2_smoothText;
	},
	nil,
	92,
	true,
	false,
	"",
	"player distance [17366.7,12577.5,0.00148773] < 7",
	5
];

player addAction [
	"Get 20k CP",
	{
		_uid = getPlayerUID player;
		[_uid, 20000] remoteExec ["BIS_fnc_WL2_fundsDatabaseWrite", 2];
	}
];