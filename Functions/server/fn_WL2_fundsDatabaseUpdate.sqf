#include "..\warlords_constants.inc"

if !(isServer) exitWith {};

params ["_database", "_uid"];

missionNamespace setVariable ["fundsDatabaseClients", _database];
publicVariable "fundsDatabaseClients";

_player = _uid call BIS_fnc_getUnitByUID;
_id = owner _player;
[] remoteExec ["BIS_fnc_WL2_refreshOSD", _id];