if !(isServer) exitWith {};

params ["_unitUID", "_amount"];

if (isNil {_unitUID}) exitWith {};

_fundsDB = (serverNamespace getVariable "fundsDatabase");
_playerFunds = ((serverNamespace getVariable "fundsDatabase") getOrDefault [_unitUID, 0]);

_dbAmount = (_playerFunds + _amount) min 50000;
_fundsDB set [_unitUID, _dbAmount];

[(serverNamespace getVariable "fundsDatabase"), _unitUID] call BIS_fnc_WL2_fundsDatabaseUpdate;