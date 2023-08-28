/*
	Author: MrThomasM

	Description: Sets listbx text.
*/
params ["_unit"];

if (isPlayer _unit && {_unit in (units player)}) exitWith {format ["%1: %2", (name _unit), ((missionNamespace getVariable "fundsDatabaseClients") get (getPlayerUID _unit))]};

if (isPlayer _unit) exitWith {(name _unit)};

format ["%1 [AI]", (name _unit)];