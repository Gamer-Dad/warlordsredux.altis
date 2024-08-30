params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

private _firedPosition = getPosATL _gunner;
private _minDistSqr = getMissionConfigValue ["BIS_WL_minAPSDist", 400];
private _maxDistSqr = getMissionConfigValue ["BIS_WL_maxAPSDist", 1600];

private _dazzleable = _projectile call APS_fnc_IsLaserGuided || {
	_projectile call APS_fnc_IsIRguided || {
	_projectile call APS_fnc_IsVisualGuided || {
	typeOf _projectile == "M_Vorona_HEAT" || {
	typeOf _projectile == "M_Vorona_HE"}}}
};
private _radius = if (_dazzleable) then {125} else {sqrt _maxDistSqr};

private _maxSpeed = getNumber (configFile >> "CfgAmmo" >> typeof _projectile >> "maxSpeed");
private _maxAllowedDisplacement = (sqrt _maxDistSqr) / 2;
private _previousPos = getPosWorld _projectile;
private _safeMaxDistSqr = _maxDistSqr;

private _continue = alive _projectile;
while {_continue && alive _projectile} do {
	private _currentPos = getPosWorld _projectile;
	private _displacement = _currentPos distance _previousPos;
	if (_displacement > _maxAllowedDisplacement) then {
		_safeMaxDistSqr = _maxSpeed * _maxSpeed;
		_maxAllowedDisplacement = _maxSpeed;
	};
	_previousPos = _currentPos;

	private _safeRadius = _radius max (sqrt _safeMaxDistSqr);

	private _eligibleNearbyVehicles = (_projectile nearEntities [["LandVehicle"], _safeRadius]) select {
		_x != _unit &&
		_x call APS_fnc_Active
	};

	_sortedEligibleList = [_eligibleNearbyVehicles, [_projectile], { _input0 distance _x }, "ASCEND"] call BIS_fnc_sortBy;
	{
		if (!alive _projectile || {!_continue}) exitWith {
			_continue = false;
		};

		_vehicleAPSType = _x getVariable ["apsType", -1];
		_projectileAPSType = apsEligibleProjectiles get (typeOf _projectile);
		if (_vehicleAPSType == 3) then {
			if (_dazzleable) exitWith {
				private _projectilePosition = getPosATL _projectile;
				private _projectileDirection = _firedPosition getDir _x;
				private _relativeDirection = [_projectileDirection, _x] call APS_fnc_RelDir2;

				_projectile spawn APS_fnc_MisguideMissile;

				[_x, _relativeDirection, true] remoteExec ["APS_fnc_Report", _x];
			};
		} else {
			if (_vehicleAPSType >= _projectileAPSType && {
					private _distanceSqr =_x distanceSqr _projectile;
					private _firedFromDeadzone = _firedPosition distanceSqr _x < _minDistSqr;
					!_firedFromDeadzone && _distanceSqr < _safeMaxDistSqr;
				} && {
					private _projectileVector = vectorNormalized (velocity _projectile);
					private _vectorToVehicle = (getPosASL _projectile) vectorFromTo (getPosASL _x);
					private _incomingAngle = acos (_projectileVector vectorDotProduct _vectorToVehicle);
					_incomingAngle < 30;
				}) exitWith {
				_continue = false;

				private _ammo = _x getVariable "apsAmmo";
				_x setVariable ["apsAmmo", _ammo - 1, true];

				private _projectilePosition = getPosATL _projectile;
				private _projectileDirection = _firedPosition getDir _x;
				private _relativeDirection = [_projectileDirection, _x] call APS_fnc_RelDir2;

				_projectile setPosWorld [0, 0, 0];
				deleteVehicle _projectile;
				createVehicle ["SmallSecondary", _projectilePosition, [], 0, "FLY"];

				[_x, _relativeDirection, true] remoteExec ["APS_fnc_Report", _x];

				private _ownerSide = _x getVariable ["BIS_WL_ownerAssetSide", sideUnknown];
				if (side _unit == _ownerSide) then {
					0 spawn {
						sleep 0.5;

						playSound "alarm";
						playSound "alarm";
						hint localize "STR_A3_WL_aps_friendly_warning";
					};
				} else {
					[_unit] remoteExec ["APS_fnc_ServerHandleAPS", 2];
				};
			};
		};
	} forEach _sortedEligibleList;

	sleep 0.001;
};
