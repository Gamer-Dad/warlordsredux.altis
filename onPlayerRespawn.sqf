params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];
0 spawn KS_fnc_unflipVehicleAddAction;

{
	if (isNull _x) then {
		missionNamespace setVariable [(format ["BIS_WL_%1_ownedVehicles", getPlayerUID player]), ((missionNamespace getVariable [format ["BIS_WL_%1_ownedVehicles", getPlayerUID player], []]) - [_x])];
	};
} forEach (missionNamespace getVariable (format ["BIS_WL_%1_ownedVehicles", getPlayerUID player]));

["Died"] call MRTM_fnc_statTracker;

player addAction [
	"10K CP", 
	{[player, "10k"] remoteExec ["BIS_fnc_WL2_handleClientRequest", 2]} 
];

player addAction [ 
	"10K SP", 
	{[player, -10000] remoteExec ["BIS_fnc_WL2_deductSuppliesFromCurrentSector", 2]} 
];