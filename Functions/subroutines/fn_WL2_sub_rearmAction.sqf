params ["_asset"];

_index = _asset addAction [
	format ["Modify/%1", localize "STR_rearm"],
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
	"alive _target && {_this == ((_target getVariable ['BIS_WL_ownerAsset', '123']) call BIS_fnc_getUnitByUID) && {vehicle _this == _this}}",
	30,
	false
];

_asset setUserActionText [_index, format ["Modify/%1", localize "STR_rearm"], "<img size='1.5' image='a3\ui_f\data\igui\cfg\simpletasks\types\rearm_ca.paa'/>"];