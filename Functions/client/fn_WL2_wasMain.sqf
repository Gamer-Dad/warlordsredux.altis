WAS_score = false;
WAS_store = false;
WAS_fired = false;

private _maxInActScore = 2;
private _minimumDistance = 25;
private _sleepDuration = 300;
private _currentPos = getPos player;

player addEventHandler ["HandleScore", {
	params ["_unit", "_object", "_score"];
	WAS_score = true;
}];

player addEventHandler ["Fired", {
	params ["_unit", "_object", "_score"];
	WAS_fired = true;
}];

while {!BIS_WL_missionEnd} do {
	sleep _sleepDuration;
	private _inActScore = 0;

	//Moved further than _minimumDistance in the last cycle
	private _newPos = getPos player;
    private _distanceMoved = _currentPos distance _newPos;
    if (_distanceMoved <= _minimumDistance) then {
        _inActScore = _inActScore + 1;
	};
	_currentPos = _newPos;

	//Scored recently
	if (WAS_score == false) then {
		_inActScore = _inActScore + 1;
	} else {
		WAS_score = false;
	};

	//Bought something recently
	if (WAS_store == false) then {
		_inActScore = _inActScore + 1;
	} else {
		WAS_store = false;
	};

	//Fired a weapon recently
	if (WAS_fired == false) then {
		_inActScore = _inActScore + 1;
	} else {
		WAS_fired = false;
	};
	
	//Selected sector
	private _targets = [missionNamespace getVariable "BIS_WL_currentTarget_west", missionNamespace getVariable "BIS_WL_currentTarget_east"] select {not(isNull _x)};
	if (((_targets findIf {player inArea (_x getVariable "objectAreaComplete")}) != -1)) then {
		_inActScore = 0;
	};

	//In a vehicle with crew from another group
	private _crewNotInGroup = (crew vehicle player) select {group _x != group player};
	if (count _crewNotInGroup > 0) then {
		_inActScore = _inActScore - 1;
	};

	if (_inActScore > _maxInActScore) then {
		hint "You are too inactive to earn passive income";
		player setVariable ["BIS_WL_incomeBlocked", true, true];
	} else {
		hintSilent "";
		player setVariable ["BIS_WL_incomeBlocked", false, true];
	};
};