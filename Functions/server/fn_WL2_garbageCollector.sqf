while {!BIS_WL_missionEnd} do {
	{
		if (_x isKindOf "Man") then {
			if (vehicle _x != _x) then {
				(vehicle _x) deleteVehicleCrew _x;
			} else {
				deleteVehicle _x;
			};
		} else {
			{_x setPos position _x} forEach crew _x;
			deleteVehicle _x;
		};
	} forEach allDead;

	private _canopy = getArray (missionConfigFile >> "garbageConfig" >> "garbage" >> "Canopys");
	private _garbageList = getArray (missionConfigFile >> "garbageConfig" >> "garbage" >> "List");
	{
		deleteVehicle _x;
	} forEach((allMissionObjects "") select {(_x isKindOf "WeaponHolder" || {_x isKindOf "WeaponHolderSimulated" || {typeOf _x in _canopy || {typeOf _x in _garbageList && {_x getVariable ["BIS_WL_delete", (serverTime + 10)] < serverTime && {(count (crew _x)) == 0}}}}})});
	sleep 300;
};