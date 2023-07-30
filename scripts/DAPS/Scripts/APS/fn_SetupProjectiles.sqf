_this addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

	if !((typeOf _projectile) in dapsEligibleProjectiles) exitWith { true };

	_this spawn DAPS_fnc_FiredProjectile;
}];