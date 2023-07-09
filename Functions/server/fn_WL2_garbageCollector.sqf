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

	private _canopy = ["Plane_Fighter_03_Canopy_F", "Plane_CAS_02_Canopy_F", "Plane_CAS_01_Canopy_F", "Plane_Fighter_01_Canopy_F", "Plane_Fighter_02_Canopy_F", "Plane_Fighter_04_Canopy_F"];
	private _garbageList = ["O_MRAP_02_F", "O_LSV_02_unarmed_F", "O_Quadbike_01_F", "B_MRAP_01_F", "B_LSV_01_unarmed_F", "B_Quadbike_01_F", "Box_NATO_Ammo_F", "Box_NATO_Grenades_F", "Box_NATO_Wps_F", "Box_NATO_Uniforms_F", "Box_NATO_Equip_F", "Box_NATO_AmmoOrd_F", "Box_NATO_WpsLaunch_F", "Box_NATO_WpsSpecial_F", "B_supplyCrate_F", "Box_East_Ammo_F", "Box_East_Grenades_F", "Box_East_Wps_F", "Box_CSAT_Uniforms_F", "Box_CSAT_Equip_F", "Box_East_WpsLaunch_F", "Box_East_AmmoOrd_F", "Box_East_WpsSpecial_F", "O_supplyCrate_F"];
	{
		if (_x isKindOf "WeaponHolder" || {_x isKindOf "WeaponHolderSimulated" || {typeOf _x in _canopy || {typeOf _x in _garbageList && {_x getVariable ["BIS_WL_delete", (serverTime + 10)] < serverTime && {(count (crew _x)) == 0}}}}}) then {
			deleteVehicle _x;
		};
	} forEach allMissionObjects "";
	sleep 120;
};