#include "..\warlords_constants.inc"

params ["_asset"];

private _actionID = _asset addAction [
	"",
	{
		_this params ["_asset", "_caller", "_actionID"];
		_asset removeAction _actionID;
		if (_asset getVariable "CIWS_enabled") then {
			_asset setVariable ["CIWS_enabled", false, [clientOwner, 2]];
		} else {
			_asset setVariable ["CIWS_enabled", true, [clientOwner, 2]];
		};
		_asset call BIS_fnc_WL2_sub_cramAction;
	},
	[],
	95,
	false,
	false,
	"",
	"alive _target && (group _this) == (_target getVariable ['BIS_WL_ownerAsset', grpNull]) && vehicle _this == _this",
	30,
	true
];

_asset setUserActionText [_actionID, format ["<t color = '%1'>%2</t>", if (((_asset getVariable "CIWS_enabled") == false)) then {"#4bff58"} else {"#ff4b4b"}, if (((_asset getVariable "CIWS_enabled") == false)) then {localize "STR_A3_cram_enable"} else {localize "STR_A3_cram_disable"}]];