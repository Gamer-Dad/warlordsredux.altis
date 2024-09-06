params ["_asset"];

private _actionID = _asset addAction [
	"",
	{
		_this params ["_asset", "_caller", "_actionID"];
		if (_asset getVariable ["BIS_WL_jammerActivated", false] && isEngineOn _asset) then {
			_asset setVariable ["BIS_WL_jammerActivated", false, true];
			_asset setVariable ["BIS_WL_jammerActivating", false, true];
		} else {
			if (_asset getVariable ["BIS_WL_jammerActivating", false]) exitWith {};

			_asset setVariable ["BIS_WL_jammerActivating", true, true];

			if (!isEngineOn _asset) then {
				[_asset] remoteExec ["BIS_fnc_WL2_dazzlerOn", 2];
			};

			[_asset] spawn {
				params ["_asset"];
				playSound3D ["a3\data_f_curator\sound\cfgsounds\air_raid.wss", _asset, false, getPosASL _asset, 5, 0.375, 2500];
				sleep 20;
				if (alive _asset && isEngineOn _asset) then {
					_asset setVariable ["BIS_WL_jammerActivated", true, true];
					_asset setVariable ["BIS_WL_jammerActivating", false, true];
				} else {
					_asset setVariable ["BIS_WL_jammerActivating", false, true];
				};
			};
		};
	},
	[],
	99,
	false,
	false,
	"",
	"alive _target && {getPlayerUID _this == (_target getVariable ['BIS_WL_ownerAsset', '123'])}",
	30,
	true
];

[_asset, _actionID] spawn {
	params ["_asset", "_actionID"];
	while { alive _asset } do {
		private _isActive = _asset getVariable ["BIS_WL_jammerActivated", false] && isEngineOn _asset;
		private _isActivating = _asset getVariable ["BIS_WL_jammerActivating", false] && isEngineOn _asset;
		private _actionColor = if (_isActive) then {
			"#ff4b4b";
		} else {
			"#4b51ff";
		};

		private _actionText = if (_isActive) then {
			localize "STR_A3_jammer_disable";
		} else {
			if (_isActivating) then {
				localize "STR_A3_jammer_activating";
			} else {
				localize "STR_A3_jammer_enable";
			};
		};

        private _outerMarkerName = format ["BIS_WL_jammerMarkerOuter_%1", netId _asset];
		if (_isActive) then {
			_asset setFuelConsumptionCoef 5;
			_outerMarkerName setMarkerAlpha 1;
		} else {
			if (_isActivating) then {
				_asset setFuelConsumptionCoef 5;
				_outerMarkerName setMarkerAlpha 1;
			} else {
				_asset setFuelConsumptionCoef 1;
				_outerMarkerName setMarkerAlpha 0;
			};
		};

		_asset setUserActionText [_actionID, format ["<t color = '%1'>%2</t>", _actionColor, _actionText]];

		sleep 1;
	};
};