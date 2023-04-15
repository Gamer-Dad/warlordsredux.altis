#include "..\warlords_constants.inc"

if !(isServer) exitWith {};

params ["_database", "_uid"];

with serverNamespace do {
	missionNamespace setVariable ["fundsDatabaseClients", _database];
};

//_player = _uid call BIS_fnc_getUnitByUID;
//_id = owner _player;

//[] remoteExec ["refreshOSD", _id];