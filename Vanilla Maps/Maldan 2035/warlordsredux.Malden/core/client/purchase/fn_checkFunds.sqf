#include "..\..\warlords_constants.inc"

params ["_cost"];
private _funds = (missionNamespace getVariable "fundsDatabaseClients") getOrDefault [getPlayerUID player, 0];
if (_cost > _funds) then {
    [false, localize "STR_A3_WL_low_funds"]
} else {
    [true, ""]
};
