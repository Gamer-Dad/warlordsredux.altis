params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];
0 spawn KSLOOP_fnc_unflipVehicleAddAction;

player addAction [
	"Get 10K CP",
	{
		_uid = getPlayerUID player;
		[_uid, 10000] remoteExec ["BIS_fnc_WL2_fundsDatabaseWrite", 2];
	}
];

player setVariable ["assistList", [], true];