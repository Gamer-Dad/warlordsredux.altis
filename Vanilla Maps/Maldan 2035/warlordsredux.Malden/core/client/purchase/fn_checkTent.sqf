#include "..\..\warlords_constants.inc"

private _respawnBag = player getVariable ["WL2_respawnBag", objNull];
if (!alive _respawnBag) then {
    [false, "No respawn tents deployed."];
} else {
    [true, ""];
};