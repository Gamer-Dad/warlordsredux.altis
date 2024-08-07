params ["_pos", "_class", "_direction", "_side"];

private _vehCfg = configFile >> "CfgVehicles" >> _class; 
private _crewCount = { 
	round getNumber (_x >> "dontCreateAI") < 1 && 
	((_x == _vehCfg && { round getNumber (_x >> "hasDriver") > 0 }) || 
	(_x != _vehCfg && { round getNumber (_x >> "hasGunner") > 0 })) 
} count ([_class, configNull] call BIS_fnc_getTurrets);
private _myArray = [0];
_myArray resize _crewCount;

_asset = [_class, _pos, _direction] call BIS_fnc_WL2_createVehicleCorrectly;

private _assetGrp = createGroup _side;
private _aiUnit = if (_side == west) then {
	"B_UAV_AI"
} else {
	"O_UAV_AI"
};

{
	private _unit = _assetGrp createUnit [_aiUnit, _pos, [], 0, "NONE"];
	_unit moveInAny _asset;
} forEach _myArray;
_assetGrp deleteGroupWhenEmpty true;

_asset;