params ["_asset"];

private _apsType = missionNamespace getVariable ["WL2_aps", createHashMap];
if (_apsType getOrDefault [(typeOf _asset), -1] == 3) then {		// is dazzler
	private _isDazzlerActivated = _asset getVariable ["BIS_WL_dazzlerActivated", false];
	private _isEngineOn = isEngineOn _asset;
	private _isEngineHealthy = (_asset getHitPointDamage "hitEngine") < 0.5;
	_isDazzlerActivated && _isEngineOn && _isEngineHealthy
} else {
	[_asset] call APS_fnc_HasCharges;
};