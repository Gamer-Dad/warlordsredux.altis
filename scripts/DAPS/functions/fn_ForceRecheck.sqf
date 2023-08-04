private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
waitUntil{!(isNil"dapsReady")};waitUntil{dapsReady};
if(_activated)then{
	deleteVehicle _module;
	private _fncForceRecheck = compile preprocessFileLineNumbers "scripts\DAPS\Scripts\Management\ForceRecheck.sqf";
	call _fncForceRecheck;
};
TRUE