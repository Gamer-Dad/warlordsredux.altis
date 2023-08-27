params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

_dazzleable = _projectile call DAPS_fnc_IsLaserGuided || {
	_projectile call DAPS_fnc_IsIRguided || {
	_projectile call DAPS_fnc_IsVisualGuided || {
	typeOf _projectile == "M_Vorona_HEAT" || {
	typeOf _projectile == "M_Vorona_HE"}}}
};

_radius = if (_dazzleable) then { 225 } else { 80 };

_continue = alive _projectile;

while { _continue } do {
	_eligibleNearbyVehicles = (_projectile nearEntities [["LandVehicle"], _radius]) select { 
		_x != _unit &&
		_x call DAPS_fnc_active
	};

	_sortedEligibleList = [_eligibleNearbyVehicles, [_projectile], { _input0 distance _x }, "ASCEND"] call BIS_fnc_sortBy;

	{
		if (!alive _projectile || {!_continue}) exitWith {
			_continue = false;
		};

		_vehicleAPSType = _x getVariable ["dapsType", -1];
		_projectileAPSType = dapsEligibleProjectiles get (typeOf _projectile);

		if (_vehicleAPSType == 3) then {
			if (_dazzleable) exitWith {
				[_projectile] spawn DAPS_fnc_MisguideMissile;
			};
		} else {
			if (_vehicleAPSType >= _projectileAPSType && {
					_distance =_x distance _projectile;
					_distance < (getMissionConfigValue ["BIS_WL_maxAPSDist", 80]) && _distance > (getMissionConfigValue ["BIS_WL_minAPSDist", 30])
				} && {
					_projectileVector = vectorNormalized (velocity _projectile);
					_vectorToVehicle = (getPosASL _projectile) vectorFromTo (getPosASL _x);
					_incomingAngle = acos (_projectileVector vectorDotProduct _vectorToVehicle);
					_incomingAngle < 30
				}) exitWith {
				_continue = false;

				_ammo = _x getVariable "dapsAmmo";
				_x setVariable ["dapsAmmo", _ammo - 1, true];

				private _projectilePosition = getPosATL _projectile;
				private _projectileDirection = getDir _projectile;
				private _relativeDirection = [_projectileDirection, _x] call DAPS_fnc_RelDir2;
				[_x, _relativeDirection, true] remoteExec ["DAPS_fnc_Report", owner _x];

				triggerAmmo _projectile;

				if ((side _unit == side _x) || {(side _x == civilian) && {side ((_x getVariable ["BIS_WL_ownerAsset", "123"]) call BIS_fnc_getUnitByUID) == side _unit}}) then {
					0 spawn {
						sleep 0.5;
						
						playSound "alarm";
						playSound "alarm";
						hint localize "STR_A3_WL_aps_friendly_warning";
					};
				};
			};
		};
	} forEach _sortedEligibleList;

	sleep 0.001;
};