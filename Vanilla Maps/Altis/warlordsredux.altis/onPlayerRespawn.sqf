#include "core\warlords_constants.inc"

params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

private _newGroup = group _newUnit;
if (leader _newGroup != _newUnit) then {
	[_newGroup, _newUnit] remoteExec ["selectLeader", groupOwner _newGroup];
};

#if WL_FACTION_THREE_ENABLED
if (side group player == independent) then {
	"respawn_guerrila" setMarkerPosLocal ([independent] call WL2_fnc_getSideBase);
};
#endif

_var = format ["BIS_WL_ownedVehicles_%1", getPlayerUID _newUnit];
_vics = missionNamespace getVariable [_var, []];
{
	_list = missionNamespace getVariable [_var, []];
	_list deleteAt (_list find _x);
	missionNamespace setVariable [_var, _list, [2, clientOwner]];
} forEach (_vics select {!(alive _x)});

if !(["(EU) #11", serverName] call BIS_fnc_inString) then {
	player addAction [
		"+$10K",
		{[player, "10K"] remoteExec ["WL2_fnc_handleClientRequest", 2];}
	];
};

0 spawn WL2_fnc_reviveAction;

private _squadActionText = format ["<t color='#00FFFF'>%1</t>", localize "STR_SQUADS_squads"];
private _squadActionId = player addAction[_squadActionText, { [true] call SQD_fnc_menu }, [], -100, false, false, "", ""];
player setUserActionText [_squadActionId, _squadActionText, "<img size='2' image='\a3\ui_f\data\igui\cfg\simpletasks\types\meet_ca.paa'/>"];

player setVariable ["BIS_WL_isOrdering", false, [2, clientOwner]];
0 call WL2_fnc_factionBasedClientInit;
0 spawn WLC_fnc_onRespawn;

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
		_penaltyEnd spawn WL2_fnc_friendlyFireHandleClient;
	};
};

0 spawn MRTM_fnc_settingsMenu;

player spawn APS_fnc_setupProjectiles;

0 spawn WL2_fnc_updateLevelDisplay;