params ["_unit"];

if (_unit isKindOf "Man") then {
    side group _unit;
} else {
    private _groupSide = side group _unit;
    private _backupSide = if (_groupSide == sideUnknown || _groupSide == civilian) then {
        private _typeSide = switch (getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "side")) do {
            case 0: { east };
            case 1: { west };
            case 2: { independent };
            default { independent };
        };
        _typeSide;
    } else {
        _groupSide;
    };

    _unit getVariable ["BIS_WL_ownerAssetSide", _backupSide];
};