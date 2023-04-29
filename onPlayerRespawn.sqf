params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];
0 spawn KSLOOP_fnc_unflipVehicleAddAction;

if ((_newUnit != (leader group _newUnit)) && ((_oldUnit distance (leader group _newUnit)) < 100) && (alive (leader group _newUnit))) then {
	0 spawn BIS_fnc_WL2_orderLastLoadout;
	_newUnit setVehiclePosition [getPosASL (leader group _newUnit), [], 2, "NONE"];
};

if (([0] call BIS_fnc_countdown) < (33000)) then {
	player addAction [
		"Get 10K CP",
		{
			_uid = getPlayerUID player;
			[_uid, 10000] remoteExec ["BIS_fnc_WL2_fundsDatabaseWrite", 2];
		}
	];
};