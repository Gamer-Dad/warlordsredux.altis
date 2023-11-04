#include "..\warlords_constants.inc"

if !(isServer) exitWith {};

params ["_uid", "_amount"];

if (isNil {_uid}) exitWith {};

_fundsDB = (serverNamespace getVariable "fundsDatabase");
_playerFunds = ((serverNamespace getVariable "fundsDatabase") getOrDefault [_uid, 0]);

_dbAmount = (_playerFunds + _amount) min 50000;
_fundsDB set [_uid, _dbAmount];

[_dbAmount, _uid] spawn BIS_fnc_WL2_fundsDatabaseUpdate;