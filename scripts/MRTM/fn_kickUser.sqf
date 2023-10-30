params [["_param1", "", [""]], ["_param2", objNull, [objNull]], ["_msg", "", [""]], ["_sender", objNull, [objNull]]];
if !(isServer) exitWith {};
if !(remoteExecutedOwner == (owner _sender)) exitWith {};

_arr = count ((allPlayers apply {getPlayerUID _x}) select {_x in (getArray (missionConfigFile >> "adminIDs"))});
if ((_arr > 0) && {(getPlayerUID _sender) in (getArray (missionConfigFile >> "adminIDs"))}) then {
    _param1 serverCommand format ["#kick %1 %2",_param2, _msg];
};