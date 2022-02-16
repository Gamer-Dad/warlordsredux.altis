private["_v"];
if(!dapsAvailable)exitWith{};
_v=vehicle player;
if(_v==player)exitWith{};
if(isNil{_v getVariable"dapsType"})exitWith{systemChat"No APS"};
[_v,"",0,FALSE]spawn DAPS_fnc_Report;
// Attempt manual rearm
_v call DAPS_fnc_Rearm2;