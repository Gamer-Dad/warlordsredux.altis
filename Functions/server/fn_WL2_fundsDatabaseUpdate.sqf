if !(isServer) exitWith {};

params ["_database", "_playerUID"];

missionNamespace setVariable ["fundsDatabaseClients", _database];
(owner (_playerUID call BIS_fnc_getUnitByUID)) publicVariableClient "fundsDatabaseClients";