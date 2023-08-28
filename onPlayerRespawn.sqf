params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];
0 spawn KS_fnc_unflipVehicleAddAction;

_leader = (leader group _newUnit);
if ((_newUnit != _leader) && {(alive _leader) && {((_oldUnit distance _leader) < 100) && {isPlayer _leader}}}) then {
	deleteVehicle _oldUnit;
	0 spawn BIS_fnc_WL2_orderLastLoadout;
	_newUnit setVehiclePosition [getPosASL _leader, [], 2, "NONE"];
};

{
	if (isNull _x) then {
		missionNamespace setVariable [(format ["BIS_WL_%1_ownedVehicles", getPlayerUID player]), ((missionNamespace getVariable [format ["BIS_WL_%1_ownedVehicles", getPlayerUID player], []]) - [_x])];
	};
} forEach (missionNamespace getVariable (format ["BIS_WL_%1_ownedVehicles", getPlayerUID player]));

["Died"] spawn MRTM_fnc_statTracker;

player addAction [
	"10K CP", 
	{[player, "10k"] remoteExec ["BIS_fnc_WL2_handleClientRequest", 2]} 
];