params ["_vehicle"];
_vehicle setVariable ["WL2_airburstRounds", 0];
while {alive _vehicle} do {
	sleep 0.05;
	if (count crew _vehicle == 0) exitwith {_vehicle setVariable ["WL2_airburstActive", false]};
	_active = _vehicle getVariable ["WL2_airburstActive", false];
	if (!_active) exitwith {};
	if (isNull gunner _vehicle) then {sleep 1};
	_rounds = (_vehicle getVariable ["WL2_airburstMunitions", []]) select {alive _x};
	{
		_proximity = (_x nearEntities ["Air", 20]);
		if (count _proximity > 0) then {
			_rounds deleteAt (_rounds find _x);
			triggerAmmo _x;
		};
	}forEach _rounds;
	_vehicle setVariable ["WL2_airburstMunitions", _rounds]
};