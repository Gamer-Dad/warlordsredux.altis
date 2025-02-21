if !(isServer) exitWith {};

params ["_database"];

missionNamespace setVariable ["fundsDatabaseClients", _database];
(owner (_uid call BIS_fnc_getUnitByUID)) publicVariableClient "fundsDatabaseClients";