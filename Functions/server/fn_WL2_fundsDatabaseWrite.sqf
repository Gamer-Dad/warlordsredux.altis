if !(isServer) exitWith {};

params ["_amount"];

if (isNil {_uid}) exitWith {};

_fundsDB = (serverNamespace getVariable "fundsDatabase");
_playerFunds = ((serverNamespace getVariable "fundsDatabase") getOrDefault [_uid, 0]);

_dbAmount = (_playerFunds + _amount) min 50000;
_fundsDB set [_uid, _dbAmount];

(serverNamespace getVariable "fundsDatabase") call BIS_fnc_WL2_fundsDatabaseUpdate;