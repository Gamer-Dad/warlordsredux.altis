/*
	Author: MrThomasM

	Description: Updates the slider pos rel to input.
*/

params ["_control", "_slider"];

if(isNull _control) exitWith {};
disableSerialization;

_value = parseNumber (ctrlText _control);
_varName = format ["MRTM_%1", _slider];

if (["rwr", _varName] call BIS_fnc_inString) then {
	if (_value > 2 || {_value < 0.05}) exitwith {0 spawn MRTM_fnc_openMenu;};
	missionNamespace setVariable [_varName, _value];
	0 spawn MRTM_fnc_openMenu;
} else {
	_maxRange = 4000;
	if(_value > _maxRange || {_value < 100}) exitwith {0 spawn MRTM_fnc_openMenu;};
	missionNamespace setVariable [_varName, _value];
	0 spawn MRTM_fnc_updateViewDistance;
	0 spawn MRTM_fnc_openMenu;
};