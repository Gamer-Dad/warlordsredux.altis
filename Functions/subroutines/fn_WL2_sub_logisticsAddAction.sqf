params ["_asset"];

_asset addAction [
	"",
	{
		_this params ["_asset", "_caller", "_actionID"];
		_cargoTypes = ['Box_CSAT_Equip_F', 'Box_CSAT_Uniforms_F', 'Box_NATO_Uniforms_F', 'Box_NATO_Equip_F', 'B_Slingload_01_Fuel_F', 'B_Slingload_01_Repair_F', 'B_Slingload_01_Ammo_F', 'Land_Pod_Heli_Transport_04_repair_F', 'Land_Pod_Heli_Transport_04_fuel_F', 'Land_Pod_Heli_Transport_04_ammo_F', 'Box_East_AmmoVeh_F', 'Box_NATO_AmmoVeh_F', 'Box_NATO_Ammo_F', 'Box_NATO_Grenades_F', 'Box_NATO_Wps_F', 'Box_NATO_AmmoOrd_F', 'Box_NATO_WpsLaunch_F', 'Box_NATO_WpsSpecial_F', 'B_supplyCrate_F', 'Box_East_Ammo_F','Box_East_Grenades_F', 'Box_East_Wps_F','Box_East_AmmoOrd_F', 'Box_East_WpsLaunch_F','Box_East_WpsSpecial_F', 'O_supplyCrate_F'];
		_nearCargo = _asset nearEntities [_cargoTypes, 30];
		{
			_asset setVehicleCargo _x;
		} forEach _nearCargo;
	},
	[],
	5,
	false,
	false,
	"",
	"alive _target && {((group _this) == (_target getVariable ['BIS_WL_ownerAsset', grpNull])) && {((count (_target nearEntities [['Box_CSAT_Equip_F', 'Box_CSAT_Uniforms_F', 'Box_NATO_Uniforms_F', 'Box_NATO_Equip_F', 'B_Slingload_01_Fuel_F', 'B_Slingload_01_Repair_F', 'B_Slingload_01_Ammo_F', 'Land_Pod_Heli_Transport_04_repair_F', 'Land_Pod_Heli_Transport_04_fuel_F', 'Land_Pod_Heli_Transport_04_ammo_F', 'Box_East_AmmoVeh_F', 'Box_NATO_AmmoVeh_F', 'Box_NATO_Ammo_F', 'Box_NATO_Grenades_F', 'Box_NATO_Wps_F', 'Box_NATO_AmmoOrd_F', 'Box_NATO_WpsLaunch_F', 'Box_NATO_WpsSpecial_F', 'B_supplyCrate_F', 'Box_East_Ammo_F','Box_East_Grenades_F', 'Box_East_Wps_F','Box_East_AmmoOrd_F', 'Box_East_WpsLaunch_F','Box_East_WpsSpecial_F', 'O_supplyCrate_F'], 30])) > 0)}}",
	-98,
	false
];

_asset setUserActionText [_actionId, "Load cargo", format ["<img size='2' image='%1'/>", 'a3\3den\data\cfgwaypoints\load_ca.paa']];