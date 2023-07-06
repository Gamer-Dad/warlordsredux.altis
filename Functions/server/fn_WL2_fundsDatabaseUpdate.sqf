#include "..\warlords_constants.inc"

if !(isServer) exitWith {};

params ["_database", "_uid"];

missionNamespace setVariable ["fundsDatabaseClients", _database];
publicVariable "fundsDatabaseClients";