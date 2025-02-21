params ["_class", "_orderedClass", "_offset", "_range", "_ignoreSector", ["_originalAsset", objNull]];

private _asset = createSimpleObject [_class, AGLToASL (player modelToWorld _offset), true];

_asset setPhysicsCollisionFlag false;

_asset setDir direction player;

_asset lock 2;

private _appearanceDefaults = profileNamespace getVariable ["WLM_appearanceDefaults", createHashmap];
private _assetAppearanceDefaults = _appearanceDefaults getOrDefault [_orderedClass, createHashmap];

private _camo = _assetAppearanceDefaults getOrDefault ["camo", createHashmap];
if (count _camo == 0) then {
    private _textureHashmap = missionNamespace getVariable ["WL2_textures", createHashMap];
    private _assetTextures = _textureHashmap getOrDefault [_orderedClass, []];
    {
        _asset setObjectTextureGlobal [_forEachIndex, _x];
    } forEach _assetTextures;
};

{
    if (_x == "camo") then {
        [_asset, _y] call WLM_fnc_applyTexture;
    } else {
        private _skipped = ["smoke", "horn"];
        if !(_x in _skipped) then {
            [_asset, ["", "", 0, 0, [[_x, _y]], []]] call BIS_fnc_adjustSimpleObject;
        };
    };
} forEach _assetAppearanceDefaults;

private _turretOverrides = missionNamespace getVariable ["WL2_turretOverrides", createHashMap];
private _turretOverridesForVehicle = _turretOverrides getOrDefault [_orderedClass, []];
{
	private _turretOverride = _x;
	private _hideTurret = getNumber (_turretOverride >> "hideTurret");
	if (_hideTurret != 0) then {
		_asset animateSource ["HideTurret", 1, true];
	};
} forEach _turretOverridesForVehicle;

[player, "assembly"] call WL2_fnc_hintHandle;

BIS_WL_spacePressed = false;
BIS_WL_backspacePressed = false;

private _deployKeyHandle = (findDisplay 46) displayAddEventHandler ["KeyDown", {
    if (_this # 1 == 57) then {
        if !(BIS_WL_backspacePressed) then {
            BIS_WL_spacePressed = true;
        };
    };
    if (_this # 1 == 14) then {
        if !(BIS_WL_spacePressed) then {
            BIS_WL_backspacePressed = true;
        };
    };
}];

uiNamespace setVariable ["BIS_WL_deployKeyHandle", _deployKeyHandle];
private _originalPosition = getPosATL _asset;

[_asset, _offset] spawn {
    params ["_asset", "_offset"];

    private _isInCarrierSector = count (BIS_WL_allSectors select {
        player inArea (_x getVariable "objectAreaComplete") && count (_x getVariable ["WL_aircraftCarrier", []]) > 0
    }) > 0;

    private _boundingBoxHeight = (boundingBoxReal _asset) # 0 # 2;
    while { !(isNull _asset) && !(BIS_WL_spacePressed) && !(BIS_WL_backspacePressed) } do {
        private _assetHeight = if (_isInCarrierSector) then {
            getPosASL player # 2;
        } else {
            private _assetPos = player modelToWorld _offset;
            getTerrainHeightASL [_assetPos # 0, _assetPos # 1];
        };

        private _playerHeight = (getPosASL player) # 2;
        private _offset_tweaked = [_offset # 0, _offset # 1, _assetHeight - _playerHeight - _boundingBoxHeight];
        _asset attachTo [player, _offset_tweaked];
        sleep 1;
    };
};

[_originalPosition, _range, _ignoreSector] spawn {
    params ["_originalPosition", "_range", "_ignoreSector"];

    waitUntil {
        sleep 0.1;
        BIS_WL_spacePressed ||
        BIS_WL_backspacePressed ||
        [_originalPosition, _range, _ignoreSector] call WL2_fnc_cancelVehicleOrder;
    };

    if !(BIS_WL_spacePressed) then {
        BIS_WL_backspacePressed = true;
    };
};

waitUntil {
    sleep 0.1;
    BIS_WL_spacePressed || BIS_WL_backspacePressed;
};

private _deployKeyHandle = uiNamespace getVariable ["BIS_WL_deployKeyHandle", nil];
if !(isNil "_deployKeyHandle") then {
    (findDisplay 46) displayRemoveEventHandler ["KeyDown", _deployKeyHandle];
};
uiNamespace setVariable ['BIS_WL_deployKeyHandle', nil];
_offset set [1, _asset distance2D player];
detach _asset;
_p = getPosATL _asset;

private _offset = [0, 0, 0];
if (!isNull _originalAsset) then {
    _asset attachTo [_originalAsset];
    _offset = _originalAsset getRelPos _asset;
};

deleteVehicle _asset;

[player, "assembly", false] call WL2_fnc_hintHandle;

private _canStillOrderVehicle = !([_originalPosition, _range, _ignoreSector] call WL2_fnc_cancelVehicleOrder);

[BIS_WL_spacePressed && _canStillOrderVehicle, _p, _offset];