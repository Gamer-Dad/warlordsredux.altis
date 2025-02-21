params ["_asset"];

private _lockActionId = _asset addAction [
	"",
	{
		_this params ["_asset", "_caller", "_lockActionId"];
		private _accessControl = _asset getVariable ["WL2_accessControl", 0];
		private _newAccess = (_accessControl + 1) % 8;
		_asset setVariable ["WL2_accessControl", _newAccess, true];
		[_asset, _lockActionId] call WL2_fnc_vehicleLockUpdate;
		playSound3D ["a3\sounds_f\sfx\objects\upload_terminal\terminal_lock_close.wss", _asset, false, getPosASL _asset, 1, 1, 0, 0];

		if (_newAccess == 6) then {
			["TaskLockPersonal"] call WLT_fnc_taskComplete;
		};
	},
	[],
	-97,
	true,
	false,
	"",
	"alive _target && getPlayerUID _this == (_target getVariable ['BIS_WL_ownerAsset', '123']) && (cursorObject == _target || vehicle _this == _target)",
	50,
	true
];

[_asset, _lockActionId] spawn {
    params ["_asset", "_lockActionId"];
    while { alive _asset } do {
		[_asset, _lockActionId] call WL2_fnc_vehicleLockUpdate;
        sleep 1;
    };
};