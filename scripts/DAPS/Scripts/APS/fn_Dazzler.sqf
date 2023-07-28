params ["_v", "_i"];

private _exit = true;
_i setOwner 2;

if (_i call DAPS_fnc_IsLaserGuided) then {_exit = false};
if (_i call DAPS_fnc_IsIRguided) then {_exit = false};
if (_i call DAPS_fnc_IsVisualGuided) then {_exit = false};
if (typeOf _i == "M_Vorona_HEAT" || typeOf _i == "M_Vorona_HE") then {_exit = false};
if (_exit) exitWith {};

[_i] spawn DAPS_fnc_MisguideMissile;