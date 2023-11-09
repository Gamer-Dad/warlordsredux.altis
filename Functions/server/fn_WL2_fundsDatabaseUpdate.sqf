#include "..\warlords_constants.inc"

if !(isServer) exitWith {};

params ["_database", "_uid"];

missionNamespace setVariable ["fundsDatabaseClients", _database];
_owner = owner (_uid call BIS_fnc_getUnitByUID);
_owner publicVariableClient "fundsDatabaseClients";