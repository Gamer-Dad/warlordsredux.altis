private["_v"];
if ( !dapsAvailable) exitWith {};
_v = vehicle player;
if ( _v == player) exitWith{};
if (isNil { _v getVariable"dapsType"}) exitWith { systemChat "No APS"};
[ _v, "", 0, false] spawn DAPS_fnc_Report;