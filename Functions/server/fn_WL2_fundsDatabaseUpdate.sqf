#include "..\warlords_constants.inc"

if !(isServer) exitWith {};

params ["_amount", "_uid"];

missionNamespace setVariable ["fundsClient", _amount, (owner (_uid call BIS_fnc_getUnitByUID))];