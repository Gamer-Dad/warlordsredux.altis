private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
waitUntil{!(isNil"dapsDefinitionsLoaded")};
waitUntil{dapsDefinitionsLoaded};
waitUntil{!(isNil"dapsDefinitionsLoaded2")};
private _fncAssignAPS = compile preprocessFileLineNumbers "scripts\DAPS\Scripts\Management\AssignAPS.sqf";
if(_activated)then{[(_module getVariable"dapsAPSType"),_units] call _fncAssignAPS};
TRUE