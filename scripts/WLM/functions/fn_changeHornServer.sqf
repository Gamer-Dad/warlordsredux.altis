params ["_asset", "_horn"];
[_asset, _horn] remoteExec ["WLM_fnc_changeHornOwner", _asset, true];