private _list = serverNamespace getVariable ["garbageCollector", createHashMap];
private _staticsList = serverNamespace getVariable ["WL2_staticsGarbageCollector", createHashMap];
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

	{
		deleteVehicle _x;
	} forEach ((allMissionObjects "") select {_x isKindOf "WeaponHolder" || {_x isKindOf "WeaponHolderSimulated" || {_list getOrDefault [typeOf _x, false]} || {_staticsList getOrDefault [typeOf _x, false] && !(alive _x)}}});
	sleep 300;
};