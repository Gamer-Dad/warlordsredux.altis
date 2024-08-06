params ["_asset"];

_asset addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
	if (local _projectile) then {
		blufor reportRemoteTarget [_projectile, 60];
		[_unit, _ammo, _projectile] call DIS_fnc_OnSamFired;
	};
}];