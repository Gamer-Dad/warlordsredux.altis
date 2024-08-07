params ["_asset"];

private _defaultMags = _asset getVariable ["WLM_savedDefaultMags", []];
{
    _x params ["_className", "_turretPath", "_ammoCount", "_id", "_creator"];
    _asset removeMagazinesTurret [_className, _turretPath];
} forEach _defaultMags;

{
    _x params ["_className", "_turretPath", "_ammoCount", "_id", "_creator"];
    _asset addMagazineTurret [_className, _turretPath, _ammoCount];
} forEach _defaultMags;

_asset spawn APS_fnc_RearmAPS;

_asset setVehicleReceiveRemoteTargets true;
_asset setVehicleReportRemoteTargets true;
_asset setVehicleReportOwnPosition true;

_rearmTime = (missionNamespace getVariable "BIS_WL2_rearmTimers") getOrDefault [typeOf _asset, 600];

_asset setVariable ["BIS_WL_nextRearm", serverTime + _rearmTime];
playSound3D ["A3\Sounds_F\sfx\UI\vehicles\Vehicle_Rearm.wss", _asset, false, getPosASL _asset, 1, 1, 75];
[toUpper localize "STR_A3_WL_popup_asset_rearmed"] spawn BIS_fnc_WL2_smoothText;