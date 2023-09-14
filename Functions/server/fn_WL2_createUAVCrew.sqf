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

[str _myArray] remoteExec ["systemChat", 0];
[str _side] remoteExec ["systemChat", 0];

[_asset, _side, _pos, _myArray] spawn {
	params ["_asset", "_side", "_pos", "_myArray"];
	while {count (crew _asset) == 0} do {
		if (_side == west) then {
			private _grp = createGroup west;
			{
				private _unit = _grp createUnit ["B_UAV_AI", _pos, [], 0, "NONE"];
				_unit moveInAny _asset;
			} forEach _myArray;
		} else {
			private _grp = createGroup east;
			{
				private _unit = _grp createUnit ["O_UAV_AI", _pos, [], 0, "NONE"];
				_unit moveInAny _asset;
			} forEach _myArray;
		};	
		sleep 1;
	};
};

_asset;