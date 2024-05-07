params ["_class", "_pos", "_direction"];
_pos params ["_posX", "_posY", "_posZ"];

if !(isServer) exitWith {};

_asset = createVehicle [_class, [_posX, _posY, _posZ-50], [], 0, "CAN_COLLIDE"];
_asset setDir _direction;
_asset setVehiclePosition [_pos, [], 0, "CAN_COLLIDE"];
_asset setDamage 0;
sleep 0.5;
_asset;