#include "..\warlords_constants.inc"

if !(isServer) exitWith {};

params ["_uid", "_amount"];

if (isNil {_uid}) exitWith {};

_fundsDB = (serverNamespace getVariable "fundsDatabase");
_playerFunds = ((serverNamespace getVariable "fundsDatabase") getOrDefault [_uid, 0]);

_fundsDB set [_uid, ((_playerFunds + _amount) min 50000)];

[(serverNamespace getVariable "fundsDatabase"), _uid] call BIS_fnc_WL2_fundsDatabaseUpdate;

if (_amount > 0) then {
	[_amount] remoteExec ["BIS_WL2_updateEarnedCP", (owner (_uid call BIS_fnc_getUnitByUID))];	
};