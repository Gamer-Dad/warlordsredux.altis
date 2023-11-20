#include "..\server_macros.inc"

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
	} forEach((allMissionObjects "") select {(_x isKindOf "WeaponHolder" || {_x isKindOf "WeaponHolderSimulated" || {typeOf _x in canopys || {typeOf _x in garbageList && {_x getVariable ["BIS_WL_delete", (serverTime + 10)] < serverTime && {(count (crew _x)) == 0}}}}})});
	sleep 300;
};