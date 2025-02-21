params ["_asset"];

private _radarActionID = _asset addAction [
    "",
    {
        _this params ["_asset", "_caller", "_actionID"];
        _asset setVariable ["radarOperation", !(_asset getVariable ["radarOperation", false]), true];
        [_asset, _actionID] call WL2_fnc_radarOperateUpdate;
    },
    [],
    -1,
    false,
    false,
    "",
    "alive _target && ([_target, _this, ""full""] call WL2_fnc_accessControl) # 0 && (cursorObject == _target || vehicle _this == _target)",
    30,
    true
];

[_asset, _radarActionID] spawn {
    params ["_asset", "_radarActionID"];
    while { alive _asset } do {
        [_asset, _radarActionID] call WL2_fnc_radarOperateUpdate;
        sleep 1;
    };
};