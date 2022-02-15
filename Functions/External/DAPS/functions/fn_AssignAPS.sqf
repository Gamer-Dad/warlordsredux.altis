private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
//if!(isServer)exitWith{};
waitUntil{!(isNil"dapsDefinitionsLoaded")};
waitUntil{dapsDefinitionsLoaded};
waitUntil{!(isNil"dapsDefinitionsLoaded2")};
if(_activated)then{[(_module getVariable"dapsAPSType"),_units]execVM"Functions\External\DAPS\Scripts\Management\AssignAPS.sqf"};
TRUE