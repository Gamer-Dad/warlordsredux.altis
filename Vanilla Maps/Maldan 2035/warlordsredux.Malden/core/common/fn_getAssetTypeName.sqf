params ["_asset", ["_assetType", ""]];

if (_assetType == "") then {
    _assetType = typeOf _asset;
};
private _nameOverrides = missionNamespace getVariable ["WL2_nameOverrides", createHashMap];
private _assetActualType = _asset getVariable ["WL2_orderedClass", _assetType];
private _assetDisplayName = _nameOverrides getOrDefault [_assetActualType, getText (configFile >> "CfgVehicles" >> _assetActualType >> "displayName")];

_assetDisplayName