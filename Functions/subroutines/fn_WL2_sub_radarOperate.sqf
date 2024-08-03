params ["_asset", "_action"];

if (_action == "rotation") then {
	if (typeOf _asset == "B_Radar_System_01_F" || {typeOf _asset == "O_Radar_System_02_F"}) then {
		private _radarActionID = _asset addAction [
			"",
			{
				_this params ["_asset", "_caller", "_radarActionID"];
				_asset removeAction _radarActionID;
				if (_asset getVariable "radarRotation") then {
					_asset setVariable ["radarRotation", false, true];
				} else {
					_asset setVariable ["radarRotation", true, true];
				};
				[_asset, "rotation"] call BIS_fnc_WL2_sub_radarOperate;
			},
			[],
			0,
			false,
			false,
			"",
			"alive _target && {getPlayerUID _this == (_target getVariable ['BIS_WL_ownerAsset', '123'])}",
			30,
			true
		];
		
		_asset setUserActionText [_radarActionID, format ["<t color = '%1'>%2</t>", if !(_asset getVariable "radarRotation") then {"#4bff58"} else {"#ff4b4b"}, if !(_asset getVariable "radarRotation") then {localize "STR_A3_radar_rotation_enable"} else {localize "STR_A3_radar_rotation_disable"}]];
	};
} else {
	private _actionID = _asset addAction [
		"",
		{
			_this params ["_asset", "_caller", "_actionID"];
			_asset removeAction _actionID;
			if (_asset getVariable "radarOperation") then {
				_asset setVariable ["radarOperation", false, true];
			} else {
				_asset setVariable ["radarOperation", true, true];
			};
			[_asset, "toggle"] call BIS_fnc_WL2_sub_radarOperate;
		},
		[],
		0,
		false,
		false,
		"",
		"alive _target && {getPlayerUID _this == (_target getVariable ['BIS_WL_ownerAsset', '123'])}",
		30,
		true
	];

	_asset setUserActionText [_actionID, format ["<t color = '%1'>%2</t>", if !(_asset getVariable "radarOperation") then {"#4bff58"} else {"#ff4b4b"}, if !(_asset getVariable "radarOperation") then {localize "STR_A3_radar_operation_enable"} else {localize "STR_A3_radar_operation_disable"}]];
};