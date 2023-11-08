params ["_asset"];

private _actionID = _asset addAction [
	"",
	{
		_this params ["_asset", "_caller", "_actionID"];
		_asset removeAction _actionID;
		if (_asset getVariable "radarOperation") then {
			_asset setVariable ["radarOperation", false];
		} else {
			_asset setVariable ["radarOperation", true];
		};
		_asset call BIS_fnc_WL2_sub_radarOperate;
	},
	[],
	99,
	false,
	false,
	"",
	"alive _target && {_this == ((_target getVariable ['BIS_WL_ownerAsset', '123']) call BIS_fnc_getUnitByUID)}",
	30,
	true
];

_asset setUserActionText [_actionID, format ["<t color = '%1'>%2</t>", if !(_asset getVariable "radarOperation") then {"#4bff58"} else {"#ff4b4b"}, if !(_asset getVariable "radarOperation") then {localize "STR_A3_radar_operation_enable"} else {localize "STR_A3_radar_operation_disable"}]];