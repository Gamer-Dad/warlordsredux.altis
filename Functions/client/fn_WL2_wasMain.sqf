WAS_score = false;
WAS_store = false;
WAS_fired = false;
VIC_ENTERED = false;

_maxInActScore = 3;
_minimumDistance = 25;
_sleepDuration = 600;
_currentPos = getPos player;
_currentDir = getDir player;

player addEventHandler ["Fired", {
	params ["_unit", "_object", "_score"];
	WAS_fired = true;
}];

while {!BIS_WL_missionEnd} do {
	sleep (if (player getVariable ["BIS_WL_incomeBlocked", false]) then {10} else {_sleepDuration});
	_inActScore = 5;

	_newDir = getDir player;
	if (_newDir == _currentDir) then {
		_inActScore = _inActScore + 100;
	};
	_currentDir = _newDir;

	_newPos = getPos player;
    _distanceMoved = _currentPos distance2D _newPos;
    if (_distanceMoved > _minimumDistance) then {
		if (_distanceMoved > 500) then {
			_inActScore = _inActScore - 2;
		} else {
			_inActScore = _inActScore - 1;
		};
	};
	_currentPos = _newPos;

	if (WAS_score) then {
		_inActScore = _inActScore - 5;
		WAS_score = false;
	};

	if (VIC_ENTERED) then {
		_inActScore = _inActScore - 5;
		VIC_ENTERED = false;		
	};

	if (WAS_store) then {
		_inActScore = _inActScore - 1;
		WAS_store = false;
	};

	if (WAS_fired) then {
		_inActScore = _inActScore - 1;
		WAS_fired = false;
	};

	_crewNotInGroup = (crew vehicle player) select {(group _x != group player) and (isPlayer _x)};
	if (count _crewNotInGroup > 0) then {
		_inActScore = _inActScore - 1;
	};

	_targets = [missionNamespace getVariable "BIS_WL_currentTarget_west", missionNamespace getVariable "BIS_WL_currentTarget_east"] select {!(isNull _x)};
	if (((_targets findIf {player inArea (_x getVariable "objectAreaComplete")}) != -1)) then {
		_inActScore = 0;
	};

	if (_inActScore > _maxInActScore) then {
		hintSilent "You are too inactive to earn passive income";
		player setVariable ["BIS_WL_incomeBlocked", true, [clientOwner, 2]];
	} else {
		player setVariable ["BIS_WL_incomeBlocked", false, [clientOwner, 2]];
	};
};
