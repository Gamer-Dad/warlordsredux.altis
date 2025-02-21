#include "..\..\warlords_constants.inc"

private _allPlayers = call BIS_fnc_listPlayers;
private _greenPlayers = _allPlayers select {
    side _x == independent;
};
if (count _greenPlayers > 3) then {
    [false, "There are too many Independent players."];
} else {
    [true, ""];
};