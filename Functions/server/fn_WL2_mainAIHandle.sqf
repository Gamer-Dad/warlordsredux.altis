#include "..\warlords_constants.inc"

params ["_unit", ["_mode", "init"]];

switch (_mode) do {
	case "init": {
		_scriptHandle = scriptNull;
		if !(isPlayer _unit) then {
			_scriptHandle = [_unit, "main"] spawn BIS_fnc_WL2_mainAIHandle;
		};
		_unit setVariable ["BIS_WL_AIControlScript", _scriptHandle];
		_unit spawn {
			params ["_unit"];
			waitUntil {sleep WL_TIMEOUT_STANDARD; isPlayer _unit || !alive _unit};
			terminate (_unit getVariable "BIS_WL_AIControlScript");
			waitUntil {sleep WL_TIMEOUT_STANDARD; !isPlayer _unit || !alive _unit};
			if (alive _unit) then {
				_unit setDamage 1;
			};
		};
	};
	case "main": {
		while {!BIS_WL_missionEnd} do {
			sleep 3;
		};
	};
};