params ["_asset"];

_asset addAction [
	"Load cargo",
	{
		_this params ["_asset", "_caller", "_actionID"];
		_cargoTypes = ['B_Slingload_01_Fuel_F', 'B_Slingload_01_Repair_F', 'B_Slingload_01_Ammo_F', 'Land_Pod_Heli_Transport_04_repair_F', 'Land_Pod_Heli_Transport_04_fuel_F', 'Land_Pod_Heli_Transport_04_ammo_F', 'Box_East_AmmoVeh_F', 'Box_NATO_AmmoVeh_F', 'Box_NATO_Ammo_F', 'Box_NATO_Grenades_F', 'Box_NATO_Wps_F', 'Box_NATO_AmmoOrd_F', 'Box_NATO_WpsLaunch_F', 'Box_NATO_WpsSpecial_F', 'B_supplyCrate_F', 'Box_East_Ammo_F','Box_East_Grenades_F', 'Box_East_Wps_F','Box_East_AmmoOrd_F', 'Box_East_WpsLaunch_F','Box_East_WpsSpecial_F', 'O_supplyCrate_F'];
		_nearCargo = _asset nearEntities [_cargoTypes, 20];
		{
			_asset setVehicleCargo _x;
		} forEach _nearCargo;
	},
	[],
	5,
	false,
	false,
	"",
	"alive _target && {((group _this) == (_target getVariable ['BIS_WL_ownerAsset', grpNull])) && {((count (_target nearEntities [['B_Slingload_01_Fuel_F', 'B_Slingload_01_Repair_F', 'B_Slingload_01_Ammo_F', 'Land_Pod_Heli_Transport_04_repair_F', 'Land_Pod_Heli_Transport_04_fuel_F', 'Land_Pod_Heli_Transport_04_ammo_F', 'Box_East_AmmoVeh_F', 'Box_NATO_AmmoVeh_F', 'Box_NATO_Ammo_F', 'Box_NATO_Grenades_F', 'Box_NATO_Wps_F', 'Box_NATO_AmmoOrd_F', 'Box_NATO_WpsLaunch_F', 'Box_NATO_WpsSpecial_F', 'B_supplyCrate_F', 'Box_East_Ammo_F','Box_East_Grenades_F', 'Box_East_Wps_F','Box_East_AmmoOrd_F', 'Box_East_WpsLaunch_F','Box_East_WpsSpecial_F', 'O_supplyCrate_F'], 20])) > 0)}}",
	-98,
	false
];