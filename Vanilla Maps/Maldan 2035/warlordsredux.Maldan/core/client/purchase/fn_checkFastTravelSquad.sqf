#include "..\..\warlords_constants.inc"

// Is squad leader
private _isSquadLeader = ["isSquadLeader", [getPlayerID player]] call SQD_fnc_client;
if (!_isSquadLeader) exitWith {
    [false, "You must be the squad leader."];
};

[true, ""];