#include "..\warlords_constants.inc"

player setVariable ["assistList", [], true];
player addEventHandler ["Hit", {
	params ["_unit", "_source", "_damage", "_instigator"];
	_this spawn BIS_fnc_WL2_setAssist;
}];