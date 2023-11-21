params ["_v"];

if !(local _v) exitWith {};
_type = typeOf _v;
if !(_type in apsAPStypes) exitWith {};


_v setVariable ["apsAmmo", (_v call APS_fnc_getMaxAmmo), true];