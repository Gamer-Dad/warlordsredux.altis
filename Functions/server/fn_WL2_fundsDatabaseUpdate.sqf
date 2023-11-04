#include "..\warlords_constants.inc"

if !(isServer) exitWith {};

params ["_amount", "_uid"];

_owner = owner (_uid call BIS_fnc_getUnitByUID);
missionNamespace setVariable ["fundsClient", _amount, _owner];