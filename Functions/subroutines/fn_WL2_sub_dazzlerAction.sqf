params ["_asset"];

private _actionID = _asset addAction [
	"",
	{
		_this params ["_asset", "_caller", "_actionID"];
		_asset removeAction _actionID;
		if (_asset getVariable "dazzlerActivated") then {
			_asset setVariable ["dazzlerActivated", false, true];
		} else {
			_asset setVariable ["dazzlerActivated", true, true];
			[_asset] remoteExec ["BIS_fnc_WL2_dazzlerOn", 2];
		};
		_asset call BIS_fnc_WL2_sub_dazzlerAction;
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

_asset setUserActionText [_actionID, format ["<t color = '%1'>%2</t>", if !(_asset getVariable "dazzlerActivated") then {"#4bff58"} else {"#ff4b4b"}, if !(_asset getVariable "dazzlerActivated") then {localize "STR_A3_dazzler_enable"} else {localize "STR_A3_dazzler_disable"}]];