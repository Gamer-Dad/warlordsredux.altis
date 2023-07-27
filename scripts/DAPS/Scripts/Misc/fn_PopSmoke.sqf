params ["_v"];

private _weapons = [];
{
	_weapons pushBack (_v weaponsTurret _x);
} forEach (allTurrets _v);

_smokes = ["SmokeLauncher", (str _weapons)] call BIS_fnc_inString;
if (_smokes) then {
	[_v, "SmokeLauncher"] call BIS_fnc_fire;
};