#include "..\warlords_constants.inc"

params ["_unit", "_source", "_damage", "_instigator"];

if ((isPlayer _instigator) && ((side (group _unit)) != (side (group _instigator)))) then {
	_list = (_unit getVariable "assistList") pushBackUnique _instigator;
	_unit setVariable ["assistList", _list, true];
};