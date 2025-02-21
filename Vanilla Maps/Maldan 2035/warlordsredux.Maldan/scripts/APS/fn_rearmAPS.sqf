params ["_asset"];

if !(local _asset) exitWith {};
private _type = _asset getVariable ["WL2_orderedClass", typeOf _asset];
private _apsType = missionNamespace getVariable ["WL2_aps", createHashMap];
if !(_type in _apsType) exitWith {};

_asset setVariable ["apsAmmo", _asset call APS_fnc_getMaxAmmo, true];