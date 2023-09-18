params ["_asset", "_pos", "_class"];

_t = serverTime + 30;
waitUntil {sleep 0.1; !isNull _asset || {serverTime > _t}};

if (serverTime > _t) exitWith {};

private _vehCfg = configFile >> "CfgVehicles" >> _class; 
private _crewCount = { 
	round getNumber (_x >> "dontCreateAI") < 1 && 
	((_x == _vehCfg && { round getNumber (_x >> "hasDriver") > 0 }) || 
	(_x != _vehCfg && { round getNumber (_x >> "hasGunner") > 0 })) 
} count ([_class, configNull] call BIS_fnc_getTurrets);
private _myArray = [0];
_myArray resize _crewCount;

if ((side group player) == west) then {
	private _grp = createGroup west;
	{
		private _unit = _grp createUnit ["B_UAV_AI", _pos, [], 1, "NONE"];
		_unit moveInAny _asset;
	} forEach _myArray;
	_grp deleteGroupWhenEmpty true;
} else {
	private _grp = createGroup east;
	{
		private _unit = _grp createUnit ["O_UAV_AI", _pos, [], 1, "NONE"];
		_unit moveInAny _asset;
	} forEach _myArray;
	_grp deleteGroupWhenEmpty true;
};