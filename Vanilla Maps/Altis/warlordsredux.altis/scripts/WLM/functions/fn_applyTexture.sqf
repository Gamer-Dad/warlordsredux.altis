params [
    ["_asset", objNull],
    ["_applyTextures", createHashmap]
];

_asset = if (_asset isEqualTo objNull) then {
    uiNamespace getVariable "WLM_asset"
} else {
    _asset
};

private _assetActualType = _asset getVariable ["WL2_orderedClass", typeOf _asset];

private _appearanceDefaults = profileNamespace getVariable ["WLM_appearanceDefaults", createHashmap];
private _assetAppearanceDefaults = _appearanceDefaults getOrDefault [_assetActualType, createHashmap];
_assetAppearanceDefaults set ["camo", _applyTextures];
_appearanceDefaults set [_assetActualType, _assetAppearanceDefaults];
profileNamespace setVariable ["WLM_appearanceDefaults", _appearanceDefaults];

{
    _asset setObjectTextureGlobal [_x, _y];
} forEach _applyTextures;
