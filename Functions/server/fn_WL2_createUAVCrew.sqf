params ["_pos", "_class", "_side"];

if !(isServer) exitWith {};

_asset = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];

private _vehCfg = configFile >> "CfgVehicles" >> _class; 
private _crewCount = { 
	round getNumber (_x >> "dontCreateAI") < 1 && 
	((_x == _vehCfg && { round getNumber (_x >> "hasDriver") > 0 }) || 
	(_x != _vehCfg && { round getNumber (_x >> "hasGunner") > 0 })) 
} count ([_class, configNull] call BIS_fnc_getTurrets);
private _myArray = [0];
_myArray resize _crewCount;

if (_side == west) then {
	private _grp = createGroup west;
	for "_i" from 0 to (count _myArray - 1) do {
		private _unit = _grp createUnit ["B_UAV_AI", _pos, [], 0, "NONE"];
		_unit moveInAny _asset;
	};
} else {
	private _grp = createGroup east;
	for "_i" from 0 to (count _myArray - 1) do {
		private _unit = _grp createUnit ["O_UAV_AI", _pos, [], 0, "NONE"];
		_unit moveInAny _asset;
	};
};

_asset;