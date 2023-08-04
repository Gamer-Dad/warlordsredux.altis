while {!BIS_WL_missionEnd} do {
	private _allDead = allDead;
	for "_i" from 0 to (count _allDead - 1) do {
		private _x = _allDead select _i;
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
	};

	private _canopy = ["Plane_Fighter_03_Canopy_F", "Plane_CAS_02_Canopy_F", "Plane_CAS_01_Canopy_F", "Plane_Fighter_01_Canopy_F", "Plane_Fighter_02_Canopy_F", "Plane_Fighter_04_Canopy_F"];
	private _garbageList = ["O_SDV_01_F", "O_Boat_Armed_01_hmg_F", "O_Boat_Transport_01_F", "C_Scooter_Transport_01_F", "B_Boat_Armed_01_minigun_F", "B_Boat_Transport_01_F", "B_SDV_01_F", "O_Quadbike_01_F", "B_Quadbike_01_F", "Box_NATO_Ammo_F", "Box_NATO_Grenades_F", "Box_NATO_Wps_F", "Box_NATO_Uniforms_F", "Box_NATO_Equip_F", "Box_NATO_AmmoOrd_F", "Box_NATO_WpsLaunch_F", "Box_NATO_WpsSpecial_F", "B_supplyCrate_F", "Box_East_Ammo_F", "Box_East_Grenades_F", "Box_East_Wps_F", "Box_CSAT_Uniforms_F", "Box_CSAT_Equip_F", "Box_East_WpsLaunch_F", "Box_East_AmmoOrd_F", "Box_East_WpsSpecial_F", "O_supplyCrate_F"];
	private _list = allMissionObjects "";
	for "_i" from 0 to (count _list - 1) do {
		private _x = _list select _i;
		if (_x isKindOf "WeaponHolder" || {_x isKindOf "WeaponHolderSimulated" || {typeOf _x in _canopy || {typeOf _x in _garbageList && {_x getVariable ["BIS_WL_delete", (serverTime + 10)] < serverTime && {(count (crew _x)) == 0}}}}}) then {
			deleteVehicle _x;
		};
	};
	sleep 300;
};