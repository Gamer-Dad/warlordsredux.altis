params ["_attach", "_arguments"];

if (_attach) then {
    private _asset = _arguments # 0;
    private _load = _arguments # 1;
    private _offset = _arguments # 2;

    _load attachTo [_asset, _offset];

    _asset setVariable ["WL2_loadingAsset", false, true];

    [_asset, _load, true] call WL2_fnc_attachVehicle;
} else {
    private _asset = _arguments # 0;
    private _load = _arguments # 1;
    private _offset = _arguments # 2;
    private _position = _arguments # 3;
    private _direction = _arguments # 4;

    _load attachTo [_asset, _offset];
    detach _load;
    _load setDir _direction;
    _load setVehiclePosition [_position, [], 0, "CAN_COLLIDE"];

    _asset setVariable ["WL2_loadingAsset", false, true];

    [_asset, _load, false] call WL2_fnc_attachVehicle;
};