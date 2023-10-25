params ["_sender", "_target"];
if !(isServer) exitWith {};
if !(remoteExecutedOwner == (owner _sender)) exitWith {};

_arr = count ((allPlayers apply {getPlayerUID _x}) select {_x in (getArray (missionConfigFile >> "adminIDs"))});
if (_arr > 0 && {(getPlayerUID _sender) in (getArray (missionConfigFile >> "adminIDs"))}) then {
	["Kicked"] remoteExec ["MRTM_fnc_systemChat", (owner _target)];	
};