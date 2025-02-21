params ["_sender", "_pos", "_orderedClass"];

if !(isServer) exitWith {};

private _class = missionNamespace getVariable ["WL2_spawnClass", createHashMap] getOrDefault [_orderedClass, _orderedClass];

private _asset = createVehicle [_class, (_pos vectorAdd [0,0,3]), [], 0, "CAN_COLLIDE"];
_asset setDir (getDir _sender);
[_asset, _sender, _orderedClass] call WL2_fnc_processOrder;