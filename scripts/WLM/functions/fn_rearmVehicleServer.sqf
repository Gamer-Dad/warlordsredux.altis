params ["_asset"];

[_asset] remoteExec ["WLM_fnc_rearmVehicleOwner", _asset, true];