params ["_class", "_orderedClass", "_pos", "_direction"];
_pos params ["_posX", "_posY", "_posZ"];

if !(isServer) exitWith {};

_asset = createVehicle [_class, [_posX, _posY, _posZ - 50], [], 0, "CAN_COLLIDE"];
_asset setDir _direction;

private _isInCarrierSector = count (BIS_WL_allSectors select {
	_pos inArea (_x getVariable "objectAreaComplete") && count (_x getVariable ["WL_aircraftCarrier", []]) > 0
}) > 0;
if (_isInCarrierSector) then {
	_asset setVehiclePosition [[_posX, _posY, 50], [], 0, "CAN_COLLIDE"];
} else {
	_asset setVehiclePosition [_pos, [], 0, "CAN_COLLIDE"];
};

_asset setDamage 0;
_asset lock true;
_asset enableWeaponDisassembly false;

private _textureHashmap = missionNamespace getVariable ["WL2_textures", createHashMap];
private _assetTextures = _textureHashmap getOrDefault [_orderedClass, []];
{
	_asset setObjectTextureGlobal [_forEachIndex, _x];
} forEach _assetTextures;

sleep 0.5;
_asset;