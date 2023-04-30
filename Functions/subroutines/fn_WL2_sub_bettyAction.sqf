params ["_asset"];

private _actionID = _asset addAction [
	"",
	{
		_this params ["_asset", "_caller", "_actionID"];
		_asset removeAction _actionID;
		if (_asset getVariable "bettyEnabled") then {
			_asset setVariable ["bettyEnabled", false, true];
		} else {
			_asset setVariable ["bettyEnabled", true, true];
		};
		_asset call BIS_fnc_WL2_sub_bettyAction;
	},
	[],
	90,
	false,
	false,
	"",
	"alive _target && (group _this) == (_target getVariable ['BIS_WL_ownerAsset', grpNull])",
	20,
	true
];

_asset setUserActionText [_actionID, format ["<t color = '%1'>%2</t>", if (_asset getVariable "bettyEnabled" == false) then {"#4bff58"} else {"#ff4b4b"}, if (_asset getVariable "bettyEnabled" == false) then {localize "STR_A3_betty_enable"} else {localize "STR_A3_betty_disable"}]];