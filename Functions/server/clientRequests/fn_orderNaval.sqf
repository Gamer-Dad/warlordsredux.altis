params ["_sender", "_pos", "_class"];

if !(isServer) exitWith {};

_asset = createVehicle [_class, (_pos vectorAdd [0,0,3]), [], 0, "CAN_COLLIDE"];
_asset setVariable ["BIS_WL_delete", (serverTime + 600), 2];

[_sender, _asset] remoteExec ["BIS_fnc_WL2_newAssetHandle", (owner _sender)];

waitUntil {sleep 0.01; !(isNull _asset)};

_sender setVariable ["BIS_WL_isOrdering", false, [2, (owner _sender)]];