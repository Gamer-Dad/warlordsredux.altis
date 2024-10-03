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

private _squadActionText = format ["<t color='#00FFFF'>%1</t>", localize "STR_SQUADS_squads"];
private _squadActionId = player addAction[_squadActionText, { [true] call SQD_fnc_menu }, [], -100, false, false, "", ""];
player setUserActionText [_squadActionId, _squadActionText, "<img size='2' image='\a3\ui_f\data\igui\cfg\simpletasks\types\meet_ca.paa'/>"];

player setVariable ["BIS_WL_isOrdering", false, [2, clientOwner]];
0 spawn BIS_fnc_WL2_factionBasedClientInit;

player addEventHandler ["HandleRating", {
	params ["_unit", "_rating"];
	0;
}];

private _penaltyCheck = profileNameSpace getVariable ["teamkill_penalty", createHashMap];
private _sessionID = missionNamespace getVariable ["sessionID", -1];

if !((count _penaltyCheck) == 0) then {
	_penaltyEnd = _penaltyCheck getorDefault ["penaltyEndTime", 0];
	_penaltySessionID = _penaltyCheck getorDefault ["sessionID", 0];
	if (_penaltySessionID != _sessionID) then {
		profileNameSpace setVariable ["teamkill_penalty", nil];
		saveProfileNamespace;
	};
	if ((_penaltySessionID == _sessionID ) && (_penaltyEnd > 0)) then {
		_penaltyEnd spawn BIS_fnc_WL2_friendlyFireHandleClient;
	};
};

call BIS_fnc_WL2_spectrumAction;
0 spawn MRTM_fnc_settingsMenu;