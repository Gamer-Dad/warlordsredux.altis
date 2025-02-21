#include "..\..\warlords_constants.inc"

// Cooldown check
private _paradropNextUseVar = format ["WL_paradropNextUse_%1", getPlayerUID player];
private _paradropNextUse = missionNamespace getVariable [_paradropNextUseVar, 0];
if (serverTime < _paradropNextUse) exitWith {
    private _cooldownText = localize "STR_SQUADS_cooldown";
    private _timeoutDisplay = [_paradropNextUse - serverTime, "MM:SS"] call BIS_fnc_secondsToString;
    [false, format [_cooldownText, _timeoutDisplay]];
};
