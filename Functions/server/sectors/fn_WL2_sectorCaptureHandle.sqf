params ["_sector"];

_sector spawn {
	params ["_sector"];
	While {!BIS_WL_missionEnd} do {
		waitUntil {sleep 1; ((count (_sector getVariable ["BIS_WL_seizingInfo", []])) > 0)};
		_owner = ((_sector getVariable ["BIS_WL_seizingInfo", []]) # 0);
		_time = ((_sector getVariable ["BIS_WL_seizingInfo", []]) # 2);
		waitUntil {sleep 0.2; serverTime > _time || {((count (_sector getVariable ["BIS_WL_seizingInfo", []])) == 0)}};
		if (serverTime > _time) then {
			[_sector, _owner] call BIS_fnc_WL2_changeSectorOwnership;
			_sector setVariable ["BIS_WL_seizingInfo", [], true];
		};
	};
};

_area = _sector getVariable "objectArea";
_size = (_area # 0) * (_area # 1) * (if (_area # 3) then {4} else {pi});
_seizingTime = (_size / 2900);

[format ["%1", _seizingTime]] remoteExec ["hint", 0];

//Custom code
while {!BIS_WL_missionEnd} do {
	_info1 = _sector call BIS_fnc_WL2_getInfantry;
	_info = [_sector, _info1] call BIS_fnc_WL2_getVehicles;
	_highestPoints = (([_info, [], {(_x # 1)}, "DESCEND"] call BIS_fnc_sortBy) # 0);
	_winner = (_highestPoints # 0);
	if (_winner != _sector getVariable ["BIS_WL_owner", civilian] && {(count (_sector getVariable ["BIS_WL_seizingInfo", []])) == 0}) then {
		_sector setVariable ["BIS_WL_seizingInfo", [_winner, serverTime, (serverTime + _seizingTime)], true];
		[_sector] remoteExec ["BIS_fnc_WL2_handleEnemyCapture", [0, -2] select isDedicated];
	} else {
		if ((count (_sector getVariable ["BIS_WL_seizingInfo", []])) > 0 && {_winner == _sector getVariable ["BIS_WL_owner", civilian]}) then {
			_sector setVariable ["BIS_WL_seizingInfo", [], true];
		};
	};
	sleep 1;
};