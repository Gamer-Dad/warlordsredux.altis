params ["_unit"];

if (isPlayer _unit) exitWith {(name _unit)};

format ["%1 [AI]", (name _unit)];