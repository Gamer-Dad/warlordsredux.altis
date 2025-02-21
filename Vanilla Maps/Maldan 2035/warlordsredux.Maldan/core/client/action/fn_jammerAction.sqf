params ["_asset"];

private _actionID = _asset addAction [
	"",
	{
		_this params ["_asset", "_caller", "_actionID"];
		[_asset] call WL2_fnc_jammerToggle;
		[_asset, _actionID] call WL2_fnc_jammerUpdate;
	},
	[],
	99,
	false,
	false,
	"",
	"alive _target && ([_target, _this, ""driver""] call WL2_fnc_accessControl) # 0 && (cursorObject == _target || vehicle _this == _target)",
	30,
	true
];

[_asset, _actionID] spawn {
	params ["_asset", "_actionID"];
	while { alive _asset } do {
		[_asset, _actionID] call WL2_fnc_jammerUpdate;
		sleep 1;
	};
};