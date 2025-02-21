params ["_asset"];

private _vehicleApsMap = missionNamespace getVariable ["WL2_aps", createHashMap];
private _assetActualType = _asset getVariable ["WL2_orderedClass", typeOf _asset];
private _index = _vehicleApsMap getOrDefault [_assetActualType, -1];
private _ammo = switch (_index) do {
	case 3: { 0 };
	case 2: { 6 };
	case 1: { 4 };
	case 0: { 2 };
	default { -1 };
};

_ammo;