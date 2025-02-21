private _alreadyAdded = _this getVariable ["APS_fireEventHandlerAdded", false];
if (_alreadyAdded) exitWith {};
_this setVariable ["APS_fireEventHandlerAdded", true];

_this addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

	WAS_fired = true;

	if !(local _projectile) exitWith { true };
	// [_projectile] spawn APS_fnc_lagProtection;
	[_projectile] spawn APS_fnc_projectileStateUpdate;

	if !((typeOf _projectile) in APS_projectileConfig) exitWith { true };
	_this spawn APS_fnc_firedProjectile;

	private _projectileConfig = APS_projectileConfig getOrDefault [typeOf _projectile, createHashMap];
	private _projectileMissileCamera = _projectileConfig getOrDefault ["camera", false];
	if (_projectileMissileCamera) then {
		[_projectile, _unit] call DIS_fnc_startMissileCamera;
	};

	private _projectileSam = _projectileConfig getOrDefault ["sam", false];
	if (_projectileSam) then {
		[_projectile, _unit] spawn DIS_fnc_frag;
		[_projectile, _unit] spawn DIS_fnc_maneuver;
	};

	private _projectileSead = _projectileConfig getOrDefault ["sead", false];
	if (_projectileSead) then {
		[_projectile, _unit] spawn APS_fnc_sead;
	};
}];