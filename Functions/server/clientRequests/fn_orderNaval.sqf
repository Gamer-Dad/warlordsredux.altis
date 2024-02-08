params ["_sender", "_pos", "_class"];

if !(isServer) exitWith {};

_asset = createVehicle [_class, (_pos vectorAdd [0,0,3]), [], 0, "CAN_COLLIDE"];

_owner = owner _sender;
_asset setVariable ["BIS_WL_ownerAsset", (getPlayerUID _sender), [2, _owner]];
[_asset, _sender] remoteExec ["BIS_fnc_WL2_newAssetHandle", _owner];
//_sender setVariable ["BIS_WL_isOrdering", false, [2, _owner]];
/*
Removed all refs to BIS_WL_isOrdering in this file because it was causing an error on the server "Order in progress"
See Line 149 in purchaseMenuAssetAvailability func.
Leaving the code as a ref if its needed again in the future. 
*/