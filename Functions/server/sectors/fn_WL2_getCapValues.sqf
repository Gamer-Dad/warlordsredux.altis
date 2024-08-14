params ["_sector"];

private _sideArr = [west, east, independent];
private _sidesEligibleForCapture = createHashMap;
{
	private _side = _x;

	if (_side == independent) then {
		_sidesEligibleForCapture set [_side, true];
		continue;
	};

	private _neighboringSectors = synchronizedObjects _sector;
	private _connectedNeighboringSectors = _neighboringSectors select { 
		typeof _x == "Logic" && _side == _x getVariable "BIS_WL_owner"
	};
	private _hasConnection = count _connectedNeighboringSectors > 0;
	if (!_hasConnection) then {
		_sidesEligibleForCapture set [_side, false];
		continue;
	};

	private _previousOwners = _sector getVariable ["BIS_WL_previousOwners", []];
	private _isPreviousOwner = _side in _previousOwners;

	private _sideCurrentTarget = missionNamespace getVariable (format ["BIS_WL_currentTarget_%1", _side]);
	private _isCurrentTarget = _sideCurrentTarget == _sector;
	if (!_isPreviousOwner && !_isCurrentTarget) then {
		_sidesEligibleForCapture set [_side, false];
		continue;
	};

	_sidesEligibleForCapture set [_side, true];
} forEach _sideArr;

private _relevantEntities = entities [["LandVehicle", "Man"], ["Logic"], true, true];
private _sectorAO = _sector getVariable "objectAreaComplete";
private _allInArea = _relevantEntities inAreaArray _sectorAO;

// Perf benchmarking result: entities w/ inAreaArray is faster than nearEntities
// private _timeToExecute = diag_codePerformance[{
// 	private _sector = _this # 0;
// 	private _relevantEntities = entities [["LandVehicle", "Man"], ["Logic"], true, true];
// 	private _sectorAO = _sector getVariable "objectAreaComplete";
// 	private _allInArea = _relevantEntities inAreaArray _sectorAO;
// }, [_sector], 100];
// systemChat format ["Time to execute: %1", _timeToExecute];

private _eligibleEntitiesInArea = _allInArea select {
	private _unit = _x;

	if !(_sidesEligibleForCapture getOrDefault [side group _unit, false]) then {
		false
	} else {
		// Tested:
		// Underwater = negative Z
		// Swimming on water surface = ~0
		// Clipped under rocks = ~0, nothing to do about it
		// Standing on top of rocks = ~0
		// Standing on top of building/>1 floor = ~0
		// Climbing ladder = altitude above ground
		// Flying = altitude above ground
		private _zAboveGeneric = (getPos _unit) # 2;
		_zAboveGeneric > -2 && _zAboveGeneric < 50;
	};
};

private _vehicleCapValueList = serverNamespace getVariable "WL2_cappingValues";
private _sideCapValues = createHashMap;
{
	private _unit = _x;
	private _side = side group _unit;

	private _points = if (_unit isKindOf "Man") then {
		if (_side == independent) then {
			2;
		} else {
			1;
		};
	} else {
		private _aliveCrew = (crew _unit) select { alive _x };
		private _crewCount = count _aliveCrew;
		if (_crewCount > 0) then {
			_vehicleCapValueList getOrDefault [typeOf _unit, 0];
		} else {
			0;
		};
	};

	private _currentPoints = _sideCapValues getOrDefault [_side, 0];
	_sideCapValues set [_side, _currentPoints + _points];
} forEach _eligibleEntitiesInArea;

// Return format: [[side, points]...]
// Example: [[west, 5], [east, 3], [independent, 2]]
_sideArr apply {
	private _side = _x;

    private _originalOwner = _sector getVariable ["BIS_WL_owner", independent];
    private _tiebreaker = if (_side == _originalOwner) then { 
        0.5;    // half point defender advantage
    } else { 
        0;
    };
    private _sideScore = _sideCapValues getOrDefault [_side, 0];

	[_side, _sideScore + _tiebreaker];
};