params ["_caller"];

_currentSector = [_caller] call BIS_fnc_WL2_getCurrentSector;
if (!isNil "_currentSector") then {
	_currentSector getVariable ["BIS_WL_supplyPoints", 0];
} else {
	0;
};