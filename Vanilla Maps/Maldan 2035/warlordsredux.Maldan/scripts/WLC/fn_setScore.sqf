#include "constants.inc"

params ["_score"];

if (WLC_ENABLED == 0) exitWith {};

private _previousLevel = ["getLevel"] call WLC_fnc_getLevelInfo;
profileNamespace setVariable ["WLC_Score", _score];
private _newLevel = ["getLevel"] call WLC_fnc_getLevelInfo;

if (_newLevel > _previousLevel) then {
    [_newLevel] spawn WLC_fnc_levelUp;
};