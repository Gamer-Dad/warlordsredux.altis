#include "..\warlords_constants.inc"

params ["_unit", "_source", "_damage", "_instigator"];

if (isPlayer _instigator && (group _unit != group _instigator)) then {
	(_unit getVariable "assistList") pushBackUnique _instigator;
};