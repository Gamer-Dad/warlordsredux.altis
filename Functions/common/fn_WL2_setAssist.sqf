#include "..\warlords_constants.inc"

params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit"];

if (isPlayer _instigator && (group _unit != group _instigator)) then {
	(_unit getVariable "assistList") pushBackUnique _instigator;
};