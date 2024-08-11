params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];
0 spawn KS_fnc_unflipVehicleAddAction;

_leader = (leader group _newUnit);
if ((_newUnit != _leader) && {(alive _leader) && {((_oldUnit distance2D _leader) < 200) && {isPlayer _leader}}}) then {
	deleteVehicle _oldUnit;
	call BIS_fnc_WL2_orderLastLoadout;
	_newUnit setVehiclePosition [getPosASL _leader, [], 2, "NONE"];
};

_var = format ["BIS_WL_ownedVehicles_%1", getPlayerUID _newUnit];
_vics = missionNamespace getVariable [_var, []];
{
	_list = missionNamespace getVariable [_var, []];
	_list deleteAt (_list find _x);
	missionNamespace setVariable [_var, _list, [2, clientOwner]];
} forEach (_vics select {!(alive _x)});

if !(["(EU) #11", serverName] call BIS_fnc_inString) then {
	player addAction [
		"10K CP",
		{[player, "10K"] remoteExec ["BIS_fnc_WL2_handleClientRequest", 2];}
	];
};

private _squadActionText = format ["<t color='#0000FF'>%1</t>", localize "STR_SQUADS_squads"];
private _squadActionId = player addAction[_squadActionText, { [true] call SQD_fnc_menu }, [], -100, false, false, "", ""];
player setUserActionText [_squadActionId, _squadActionText, "<img size='2' image='\a3\ui_f\data\igui\cfg\simpletasks\types\meet_ca.paa'/>"];

player setVariable ["BIS_WL_isOrdering", false, [2, clientOwner]];
0 spawn BIS_fnc_WL2_factionBasedClientInit;

player addEventHandler ["HandleRating", {
	params ["_unit", "_rating"];
	0;
}];

call BIS_fnc_WL2_spectrumAction;
0 spawn MRTM_fnc_settingsMenu;