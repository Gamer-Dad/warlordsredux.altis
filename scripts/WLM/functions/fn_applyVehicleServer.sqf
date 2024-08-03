params ["_asset", "_magTurretsToRemove", "_magTurretsToAdd", "_eligibleFreeRearm"];

[_asset, _magTurretsToRemove, _magTurretsToAdd, _eligibleFreeRearm] remoteExec ["WLM_fnc_applyVehicleOwner", 0, true];