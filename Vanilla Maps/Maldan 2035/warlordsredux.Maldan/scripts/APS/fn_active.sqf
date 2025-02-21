params ["_asset"];

private _apsType = missionNamespace getVariable ["WL2_aps", createHashMap];
private _assetActualType = _asset getVariable ["WL2_orderedClass", typeOf _asset];
if (_apsType getOrDefault [_assetActualType, -1] == 3) then {		// is dazzler
	private _isDazzlerActivated = _asset getVariable ["BIS_WL_dazzlerActivated", false];
	private _isEngineOn = isEngineOn _asset;
	private _isEngineHealthy = (_asset getHitPointDamage "hitEngine") < 0.5;
	_isDazzlerActivated && _isEngineOn && _isEngineHealthy
} else {
	[_asset] call APS_fnc_hasCharges;
};