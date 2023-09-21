params ["_pos", "_class"];

private _vehCfg = configFile >> "CfgVehicles" >> _class; 
private _crewCount = { 
	round getNumber (_x >> "dontCreateAI") < 1 && 
	((_x == _vehCfg && { round getNumber (_x >> "hasDriver") > 0 }) || 
	(_x != _vehCfg && { round getNumber (_x >> "hasGunner") > 0 })) 
} count ([_class, configNull] call BIS_fnc_getTurrets);
private _myArray = [0];
_myArray resize _crewCount;

_asset = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
private _assetGrp = createGroup east;
{
	private _unit = _assetGrp createUnit ["O_UAV_AI", _pos, [], 0, "NONE"];
	_unit moveInAny _asset;
} forEach _myArray;
_assetGrp deleteGroupWhenEmpty true;

_asset;