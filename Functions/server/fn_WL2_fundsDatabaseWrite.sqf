#include "..\warlords_constants.inc"

if !(isServer) exitWith {};

params ["_uid", "_amount"];

_fundsDB = (serverNamespace getVariable "fundsDatabase");
_playerFunds = ((serverNamespace getVariable "fundsDatabase") getOrDefault [_uid, 0]);

_fundsDB set [_uid, ((_playerFunds + _amount) min 50000)];

[(serverNamespace getVariable "fundsDatabase"), _uid] spawn BIS_fnc_WL2_fundsDatabaseUpdate;