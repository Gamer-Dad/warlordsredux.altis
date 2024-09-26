params ["_projectile", "_unit"];

private _target = objNull;
private _frag = false;
private _projectileClass = typeOf _projectile;
private _range = getNumber (configfile >> "CfgAmmo" >> _projectileClass >> "indirectHitRange");

private _targets = [];
private _lastDistance = 10000;

scopeName "main";
while { alive _projectile } do {
	_targets = _projectile nearEntities ["AIR", _range * 1.5];
	if (count _targets > 0) then {
		_target = _targets # 0;
		private _distanceToTarget = _projectile distance _target;

		if (_distanceToTarget < _range) then {
			_frag = true;
			_lastDistance = _distanceToTarget;
			breakTo "main";
		};

		// Don't detonate prematurely if we're still approaching target
		if (_distanceToTarget > _lastDistance) then {
			_frag = true;
			_lastDistance = _distanceToTarget;
			breakTo "main";
		};

		_lastDistance = _distanceToTarget;
	};

	sleep 0.01;
};

if (!_frag) exitWith {};
if (count _targets < 1) exitWith {};

// Vanilla explosion
private _projectilePosition = getPos _projectile;
private _targetPosition = getPos _target;
private _distanceToTarget = _projectile distance _target;

triggerAmmo _projectile;
systemChat format ["SAM detonated %1 meters from target.", round _distanceToTarget];

// Burst Explosion
private _burst = createVehicle [_projectileClass, _projectilePosition, [], 50, "FLY"];
triggerAmmo _burst;