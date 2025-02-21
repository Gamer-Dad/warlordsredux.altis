#include "..\..\warlords_constants.inc"
params ["_asset", "_awacs"];

private _actionId = _asset addAction [
	"SCANNER: INITIALIZING",
	{
        params ["_asset", "_caller", "_actionId", "_args"];
		private _awacs = _args # 0;

        private _scannerOn = _asset getVariable ["WL_scannerOn", false];
        private _newScannerOn = !_scannerOn;
        _asset setVariable ["WL_scannerOn", _newScannerOn, true];
		private _consumption = if (_asset isKindOf "LandVehicle") then {
			25;
		} else {
			if (_awacs) then {
				5;
			} else {
				50;
			};
		};
        if (_newScannerOn) then {
			[_asset, _consumption] remoteExec ["setFuelConsumptionCoef", _asset];
        } else {
			[_asset, 1] remoteExec ["setFuelConsumptionCoef", _asset];
        };
		[_asset, _actionId, _awacs, 0] call WL2_fnc_scanner;
	},
	[_awacs],
	99,
	false,
	false,
	"ActiveSensorsToggle",
	"alive _target && ([_target, player, ""driver""] call WL2_fnc_accessControl) # 0",
	30,
	false
];

[_asset, _actionId, _awacs] spawn {
	params ["_asset", "_actionId", "_awacs"];
	private _iteration = 0;
	while { alive _asset } do {
        [_asset, _actionId, _awacs, _iteration] call WL2_fnc_scanner;
		if (_awacs) then {
			sleep 0.5;
		} else {
			sleep 2;
		};
		_iteration = _iteration + 1;
	};
};