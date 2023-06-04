params ["_asset"];

cargoTypes = [
"Box_NATO_Ammo_F", "Box_NATO_Grenades_F", 
"Box_NATO_Wps_F", "Box_NATO_AmmoOrd_F", 
"Box_NATO_WpsLaunch_F", "Box_NATO_WpsSpecial_F", 
"B_supplyCrate_F", "Box_East_Ammo_F",
"Box_East_Grenades_F", "Box_East_Wps_F",
"Box_East_AmmoOrd_F", "Box_East_WpsLaunch_F",
"Box_East_WpsSpecial_F", "O_supplyCrate_F"
];

private _actionIDLoad = _asset addAction [
	"Load cargo",
	{
		_this params ["_asset", "_caller", "_actionID"];
		_nearCargo = _asset nearEntities [cargoTypes, 20];
		{
			_asset setVehicleCargo _x;
		} forEach _nearCargo;
	},
	[],
	5.1,
	false,
	false,
	"",
	"(alive _target && {(group _this) == (_target getVariable ['BIS_WL_ownerAsset', grpNull])})",
	-98,
	false
];

private _actionIDUnload = _asset addAction [
	"Unload cargo",
	{
		_this params ["_asset", "_caller", "_actionID"];
		_asset setVehicleCargo objNull;
	},
	[],
	5.1,
	false,
	false,
	"",
	"(alive _target && {(group _this) == (_target getVariable ['BIS_WL_ownerAsset', grpNull])})",
	-98,
	false
];