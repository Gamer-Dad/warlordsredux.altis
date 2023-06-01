params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];
0 spawn KSLOOP_fnc_unflipVehicleAddAction;

player setVariable ["assistList", [], true];

if ([0] call BIS_fnc_countdown < 28800) then {
	player addaction [
	"10K CP", 
		{
			_uid = getPlayerUID player;
			[_uid, 10000] remoteExec ["BIS_fnc_WL2_fundsDatabaseWrite", 2]
		}
	];
};