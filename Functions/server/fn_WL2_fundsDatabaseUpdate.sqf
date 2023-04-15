#include "..\warlords_constants.inc"

if !(isServer) exitWith {};

params ["_database", "_uid"];

missionNamespace setVariable ["fundsDatabaseClients", _database, 0];

_player = _uid call BIS_fnc_getUnitByUID;
_id = owner _player;
[] remoteExec ["BIS_fnc_WL2_refreshOSD", _id];