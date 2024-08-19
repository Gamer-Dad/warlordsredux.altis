params ["_asset"];

private _lastHitter = _asset getVariable ["BIS_WL_lastHitter", objNull];
if (!(isNull _lastHitter) && alive _asset) then {
    [_asset, _lastHitter] call BIS_fnc_WL2_killRewardHandle;
};

deleteVehicle _asset;