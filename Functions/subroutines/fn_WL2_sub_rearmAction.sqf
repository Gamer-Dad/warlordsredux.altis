params ["_asset"];

_index = _asset addAction [
	localize "STR_rearm",
	{
		params ["_asset"];
		if (_asset isKindOf "LandVehicle") then {_asset spawn BIS_fnc_WL2_vehicleRearm;};
		if (_asset isKindOf "Air") then {[player] spawn GOM_fnc_aircraftLoadout;}; 
	},
	[],
	5,
	true,
	false,
	"",
	"alive _target && {(group _this) == (_target getVariable ['BIS_WL_ownerAsset', grpNull]) && {vehicle _this == _this}}",
	30,
	false
];

_asset setUserActionText [_index, localize "STR_rearm", "<img size='1.5' image='a3\ui_f\data\igui\cfg\simpletasks\types\rearm_ca.paa'/>"];