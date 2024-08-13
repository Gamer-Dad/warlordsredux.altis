params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

_dazzleable = _projectile call APS_fnc_IsLaserGuided || {
	_projectile call APS_fnc_IsIRguided || {
	_projectile call APS_fnc_IsVisualGuided || {
	typeOf _projectile == "M_Vorona_HEAT" || {
	typeOf _projectile == "M_Vorona_HE"}}}
};
_radius = if (_dazzleable) then {125} else {sqrt (getMissionConfigValue ["BIS_WL_maxAPSDist", 1600])};

_continue = alive _projectile;
while {_continue} do {
	_eligibleNearbyVehicles = (_projectile nearEntities [["LandVehicle"], _radius]) select { 
		_x != _unit &&
		_x call APS_fnc_active
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
				_projectile spawn APS_fnc_MisguideMissile;
			};
		} else {
			if (_vehicleAPSType >= _projectileAPSType && {
					_distance =_x distanceSqr _projectile;
					_distance < (getMissionConfigValue ["BIS_WL_maxAPSDist", 1600]) && _distance > (getMissionConfigValue ["BIS_WL_minAPSDist", 400])
				} && {
					_projectileVector = vectorNormalized (velocity _projectile);
					_vectorToVehicle = (getPosASL _projectile) vectorFromTo (getPosASL _x);
					_incomingAngle = acos (_projectileVector vectorDotProduct _vectorToVehicle);
					_incomingAngle < 30
				}) exitWith {
				_continue = false;

				_ammo = _x getVariable "apsAmmo";
				_x setVariable ["apsAmmo", _ammo - 1, true];

				private _projectilePosition = getPosATL _projectile;
				private _projectileDirection = getDir _projectile;
				private _relativeDirection = [_projectileDirection, _x] call APS_fnc_RelDir2;

				private _ownerUID = _x getVariable ["BIS_WL_ownerAsset", "123"];
				private _assetOwner = _ownerUID call BIS_fnc_getUnitByUID;

				[_x, _relativeDirection, true] remoteExec ["APS_fnc_Report", _assetOwner];

				deleteVehicle _projectile;
				createVehicle ["SmallSecondary", _projectilePosition, [], 0, "FLY"];

				private _ownerSide = _x getVariable ["BIS_WL_ownerAssetSide", sideUnknown];
				if (side _unit == _ownerSide) then {
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