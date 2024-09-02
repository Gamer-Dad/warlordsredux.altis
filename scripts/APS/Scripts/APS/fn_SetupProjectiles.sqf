_this addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
	WAS_fired = true;
	if !((typeOf _projectile) in apsEligibleProjectiles) exitWith { true };
	_this spawn APS_fnc_FiredProjectile;
}];