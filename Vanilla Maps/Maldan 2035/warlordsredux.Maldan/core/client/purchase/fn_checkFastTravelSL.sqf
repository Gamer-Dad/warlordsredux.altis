#include "..\..\warlords_constants.inc"

// Cooldown check
private _ftNextUseVar = format ["BIS_WL_FTSLNextUse_%1", getPlayerUID player];
private _ftNextUse = missionNamespace getVariable [_ftNextUseVar, 0];
if (serverTime < _ftNextUse) exitWith {
    private _cooldownText = localize "STR_SQUADS_cooldown";
    private _timeoutDisplay = [_ftNextUse - serverTime, "MM:SS"] call BIS_fnc_secondsToString;
    [false, format [_cooldownText, _timeoutDisplay]];
};

// Has valid squad leader
private _squadLeaderID = ['getMySquadLeader'] call SQD_fnc_client;
if (_squadLeaderID == getPlayerID player) exitWith {
    [false, localize "STR_SQUADS_fastTravelSquadLeaderInvalid"];
};
if (_squadLeaderID == "-1") exitWith {
    [false, localize "STR_SQUADS_fastTravelSquadInvalidNoSquad"];
};

// Squad leader in valid state
private _squadLeader = allPlayers select {
    getPlayerID _x == _squadLeaderID
} select 0;

if !(isNull objectParent _squadLeader) exitWith {
    [false, localize "STR_SQUADS_fastTravelSquadLeaderInVehicle"];
};
if (!alive _squadLeader || lifeState _squadLeader == "INCAPACITATED") exitWith {
    [false, localize "STR_SQUADS_fastTravelSquadLeaderUnavailable"];
};

[true, ""];