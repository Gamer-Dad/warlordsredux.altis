params ["_asset"];

private _actionID = _asset addAction [
	"",
	{
		_this params ["_asset", "_caller", "_actionID"];
		_asset removeAction _actionID;

        private _outerMarkerName = format ["BIS_WL_jammerMarkerOuter_%1", netId _asset];
		if (_asset getVariable "BIS_WL_jammerActivated") then {
			_asset setVariable ["BIS_WL_jammerActivated", false, true];
            _outerMarkerName setMarkerAlpha 0;
		} else {
			_asset setVariable ["BIS_WL_jammerActivated", true, true];
            _outerMarkerName setMarkerAlpha 0.4;
		};
		_asset call BIS_fnc_WL2_sub_jammerAction;
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

private _actionColor = if (_asset getVariable "BIS_WL_jammerActivated") then {
    "#ff4b4b";
} else {
    "#4b51ff";
};

private _actionText = if (_asset getVariable "BIS_WL_jammerActivated") then {
    localize "STR_A3_jammer_disable";
} else {
    localize "STR_A3_jammer_enable";
};

_asset setUserActionText [_actionID, format ["<t color = '%1'>%2</t>", _actionColor, _actionText]];