params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

_dazzleable = _projectile call DAPS_fnc_IsLaserGuided ||
	_projectile call DAPS_fnc_IsIRguided ||
	_projectile call DAPS_fnc_IsVisualGuided ||
	typeOf _projectile == "M_Vorona_HEAT" || 
	typeOf _projectile == "M_Vorona_HE";

// smaller detection radius for non-dazzleable projectiles, saves perf
_radius = if (_dazzleable) then { 225 } else { 125 };

_continue = alive _projectile;

while { _continue } do {
	// find nearby vehicles
	_eligibleNearbyVehicles = (_projectile nearEntities [["LandVehicle"], _radius]) select { 
		_x != _unit &&	// many Gorgons died to bring us this information 
		_x call DAPS_fnc_active
	};

	// ensure consume APS charges from nearest vehicle 
	_sortedEligibleList = [_eligibleNearbyVehicles, [_projectile], { _input0 distance _x }, "ASCEND"] call BIS_fnc_sortBy;

	{	
		// exit if projectile is dead
		if (!alive _projectile || !_continue) exitWith {
			_continue = false;
		};

		// get APS type, get projectile's APS eligibility
		_vehicleAPSType = _x getVariable ["dapsType", -1];
		_projectileAPSType = dapsEligibleProjectiles get (typeOf _projectile);

		if (_vehicleAPSType == 3) then {	// dazzler
			if (_dazzleable) exitWith {		// needs to be separate to prevent else clause from triggering
				[_projectile] spawn DAPS_fnc_MisguideMissile;
			};
		} else {
			_distance =_x distance _projectile;
			if (_vehicleAPSType >= _projectileAPSType && _distance < 125 && _distance > 30) exitWith {	// blockable by aps
				_continue = false;

				// deduct APS charge
				_ammo = _x getVariable "dapsAmmo";
				_x setVariable ["dapsAmmo", _ammo - 1, true];

				// report APS location
				private _projectilePosition = getPosATL _projectile;
				private _projectileDirection = getDir _projectile;
				private _relativeDirection = [_projectileDirection, _x] call DAPS_fnc_RelDir2;
				[_x, _relativeDirection, true] remoteExec ["DAPS_fnc_Report", owner _x];

				// replace projectile with explosion
				deleteVehicle _projectile;
				createVehicle ["HelicopterExploSmall", _projectilePosition, [], 0, "FLY"];

				// if projectile triggers friendly APS, warn player that fired it
				if ((side _unit == side _x) || {(side _x == civilian) && {side ((_x getVariable ["BIS_WL_ownerAsset", "123"]) call BIS_fnc_getUnitByUID) == side _unit}}) then {
					0 spawn {
						// wait so you can hear after loud boom
						sleep 0.5;
						
						// play twice as loud
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