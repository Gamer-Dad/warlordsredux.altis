params ["_asset"];

private _actionId = _asset addAction [
	"",
	{
		_this params ["_asset", "_caller", "_actionID"];
		_cargoTypes = (getArray (missionConfigFile >> "logisticsConfig" >> "cargoTypes" >> "Cargo"));
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
	"alive _target && {getPlayerUID _this == (_target getVariable ['BIS_WL_ownerAsset', '123']) && {((count (_target nearEntities [(getArray (missionConfigFile >> 'logisticsConfig' >> 'cargoTypes' >> 'Cargo')), 30])) > 0)}}",
	-98,
	false
];

_asset setUserActionText [_actionId, "Load cargo", format ["<img size='2' image='%1'/>", 'a3\3den\data\cfgwaypoints\load_ca.paa']];