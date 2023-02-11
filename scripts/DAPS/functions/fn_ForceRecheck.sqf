private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
waitUntil{!(isNil"dapsReady")};waitUntil{dapsReady};
if(_activated)then{
	deleteVehicle _module;
	execVM"scripts\DAPS\Scripts\Management\ForceRecheck.sqf"};
TRUE