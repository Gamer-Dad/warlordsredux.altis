params ["_projectile", "_unit"];

private _target = objNull;
private _frag = false;
private _projectileClass = typeOf _projectile;
private _range = getNumber (configfile >> "CfgAmmo" >> _projectileClass >> "indirectHitRange");
private _proxRange = _range * 1.5;

private _lastDistance = 10000;

private _target = missileTarget _projectile;

sleep 0.5;
while { alive _projectile } do {
	sleep 0.01;
	if (isNull _target) then {
		_target = missileTarget _projectile;
		continue;
	};

	private _distanceToTarget = _projectile distance _target;

	if (_distanceToTarget < _proxRange) then {
		_frag = true;

		// Don't detonate prematurely if we're still approaching target
		if (_distanceToTarget > _lastDistance) then {
			break;
		};
		if (_distanceToTarget < _range) then {
			break;
		};
	};

	_lastDistance = _distanceToTarget min _lastDistance;
};

if (!_frag) exitWith {};

// Vanilla explosion
private _projectilePosition = getPos _projectile;

if (!(isNull _target) && _lastDistance < _proxRange) then {
	systemChat format ["SAM detonated %1 meters from target.", round _lastDistance];
} else {
	private _objectsNearby = _projectile nearObjects _proxRange;
	if (count _objectsNearby > 0) then {
		_target = _objectsNearby # 0;
		systemChat format ["SAM detonated %1 meters from target.", round (_projectile distance _target)];
	};
};

triggerAmmo _projectile;

// Burst Explosion
private _burst = createVehicle [_projectileClass, _projectilePosition, [], 50, "FLY"];
triggerAmmo _burst;