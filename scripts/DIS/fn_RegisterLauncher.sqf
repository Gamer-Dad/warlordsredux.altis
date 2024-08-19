params ["_asset"];

_asset addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
	if (local _projectile) then {
		[_unit, _ammo, _projectile] call DIS_fnc_OnSamFired;
	};
}];