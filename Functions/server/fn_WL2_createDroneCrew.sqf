params ["_asset", "_sender"];

private _vehCfg = configFile >> "CfgVehicles" >> typeOf _asset;
private _crewCount = { round getNumber (_x >> "dontCreateAI") < 1 && (
					(_x == _vehCfg && {round getNumber (_x >> "hasDriver") > 0}) ||
					(_x != _vehCfg && {round getNumber (_x >> "hasGunner") > 0})
				)} count ([_asset, configNull] call BIS_fnc_getTurrets);

private _crewNotReady = { alive _asset && {alive _x && !isPlayer _x} count crew _asset < _crewCount };

_i = 0;
while { _i < 2 } do {
	createVehicleCrew _asset;
	_side = (side group _sender);
	_grp = createGroup _side;
	(crew _asset) joinSilent _grp;
	if (call _crewNotReady) then {
		_i = 0;
	} else {
		_i = _i + 1;
	};
	sleep 1;
};

(group _asset) deleteGroupWhenEmpty true;