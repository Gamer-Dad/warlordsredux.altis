params ["_asset"];

if (local _asset) then {
    _asset engineOn true;
} else {
    [_asset, true] remoteExec ["engineOn", _asset];
};