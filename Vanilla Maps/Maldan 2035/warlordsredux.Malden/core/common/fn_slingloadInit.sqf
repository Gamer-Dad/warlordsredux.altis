params ["_asset", "_assetToLoad"];

private _slingRopePoints = getArray (configFile >> "CfgVehicles" >> typeOf _assetToLoad >> "slingLoadCargoMemoryPoints");

private _ropeLength = 20;
if (count _slingRopePoints == 0) then {
    private _bounds = boundingBoxReal [_assetToLoad, "FireGeometry"];
    private _sphere = _bounds # 2;

    if (_sphere < 2) then {
        private _slingRope1 = ropeCreate [_asset, "slingload0", _assetToLoad, [0, 0, 0], _ropeLength];
    } else {
        private _offset = (_sphere / 2) min 1;

        private _slingRope1 = ropeCreate [_asset, "slingload0", _assetToLoad, [_offset, _offset, 0], _ropeLength];
        private _slingRope2 = ropeCreate [_asset, "slingload0", _assetToLoad, [-_offset, -_offset, 0], _ropeLength];
        private _slingRope3 = ropeCreate [_asset, "slingload0", _assetToLoad, [_offset, -_offset, 0], _ropeLength];
        private _slingRope4 = ropeCreate [_asset, "slingload0", _assetToLoad, [-_offset, _offset, 0], _ropeLength];
    };
} else {
    {
        private _slingRope = ropeCreate [_asset, "slingload0", _assetToLoad, _x, _ropeLength];
    } forEach _slingRopePoints;
};

_assetToLoad setTowParent _asset;

waitUntil {
    sleep 1;
    local _assetToLoad || !alive _assetToLoad || !alive _asset;
};

private _maxCargoMass = getNumber (configFile >> "CfgVehicles" >> typeOf _asset >> "slingLoadMaxCargoMass");

private _newMass = (_maxCargoMass * 0.7) min (getMass _assetToLoad);

[_assetToLoad, _newMass] remoteExec ["setMass", 0];