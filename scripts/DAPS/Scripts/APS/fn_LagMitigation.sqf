params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit"];

if (!alive _unit) exitWith {	// vehicle already dead?
	nil;
};
if (!(_unit call DAPS_fnc_active)) exitWith {	// APS active and has charges?
	nil;
};
if (_unit distance _source < 30) exitWith {	// too close?
	nil;
};

// get damage prior to hit
_oldDamage = _unit getHitIndex _hitIndex;

// don't use exitWith if we want returned value to be respected
if (dapsHeavySubmunitionBlockList find _projectile >= 0) then {
	_oldDamage
} else {
	if (dapsHeavyBlockList find _projectile >= 0) then {
		if (_selection == "") then {	// damage to hull
			if (isNull _instigator) then {
				_instigator = vehicle _source;
			};
			if (isNull _instigator) then {
				_instigator = UAVControl vehicle _source # 0;
			};
			if (isNull _instigator) then {
				_instigator = _source getVariable ["BIS_WL_ownerAsset", grpNull];
			};
			if (isNull _instigator) then {
				_instigator = _source;
			};
			if (isNull _instigator) exitWith {	// no instigator found?
				nil;
			};

			_responsiblePlayer = leader _instigator;

			// spawn APS explosion
			_p = position _unit;
			createVehicle ["HelicopterExploSmall", [_p # 0, _p # 1, _p # 2 + 30], [], 0, "FLY"];
			
			// alert for vehicle owner
			[_unit, "", 0, true] remoteExec ["DAPS_fnc_Report", owner _unit];

			// notify target & shooter in system chat
			_msg = format["Projectile %1 intercepted by lag detection script, APS charge consumed.", _projectile];
			_msg remoteExec ["systemChat", owner _responsiblePlayer];
			_msg remoteExec ["systemChat", owner _unit];

			_unit spawn { 
				sleep 0.001;
				// reduce APS charges
				_a = _this getVariable "dapsAmmo";
				_this setVariable ["dapsAmmo", _a - 1, true];
			};

			// block damage
			_oldDamage
		} else {
			_oldDamage
		};
	};
};