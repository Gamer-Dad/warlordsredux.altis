#include "..\warlords_constants.inc"

_potentialBases = BIS_WL_allSectors select {_x getVariable ["BIS_WL_canBeBase", FALSE]};
private _firstBase = selectRandom ["BIS_WL_base1", "BIS_WL_base2"];
missionNamespace setVariable [_firstBase, selectRandom _potentialBases, TRUE];
_potentialBases = _potentialBases - [missionNamespace getVariable _firstBase];

private _tiers = [];
private _checkedAgainst = [];
private _distance = 0;
private _sectorsToCheckNext = (synchronizedObjects (missionNamespace getVariable _firstBase)) select {_x in BIS_WL_allSectors};
while {count _sectorsToCheckNext > 0} do {
	private _sectorsToCheckNow = _sectorsToCheckNext;
	_sectorsToCheckNext = [];
	private _currentTier = [_distance];
	{
		private _sector = _x;
		if (_sector in _potentialBases && !(_sector in _checkedAgainst)) then {
			_currentTier pushBack _sector;
		};
		_checkedAgainst pushBackUnique _sector;
		{
			_sectorsToCheckNext pushBackUnique _x;
		} forEach ((synchronizedObjects _sector) select {_x != (missionNamespace getVariable _firstBase) && _x in BIS_WL_allSectors && !(_x in _checkedAgainst)});
	} forEach _sectorsToCheckNow;
	if (count _currentTier > 1) then {
		_tiers pushBack _currentTier;
	};
	_distance = _distance + 1;
};
//Use _tolerance value in combo with baseDistanceMin to add randomness to base distances
_potentialBases = [];
_tolerance = 8;
while {count _potentialBases == 0} do {
	_potentialBases = _tiers select {(_x # 0) >= (BIS_WL_baseDistanceMin - _tolerance) && (_x # 0) <= BIS_WL_baseDistanceMax};
	_tolerance = _tolerance + 1;
};
_potentialBases = selectRandom _potentialBases;
_potentialBases = _potentialBases - [_potentialBases # 0];
missionNamespace setVariable [(["BIS_WL_base1", "BIS_WL_base2"] - [_firstBase]) # 0, selectRandom _potentialBases, TRUE];

{
	_side = BIS_WL_competingSides # _forEachIndex;
	_base = _x;
	_base setVariable ["BIS_WL_owner", _side, TRUE];
	_base setVariable ["BIS_WL_originalOwner", _side, TRUE];
	_base setVariable ["BIS_WL_previousOwners", [_side], TRUE];
	_base setVariable ["BIS_WL_revealedBy", [_side], TRUE];
	private _flag = createVehicle ["FlagPole_F", (position _x), [], 20,"NONE"];
	if (_side == west) then {
		_flag setFlagTexture "\A3\Data_F\Flags\flag_NATO_CO.paa";
	} else {
		_flag setFlagTexture "\A3\Data_F\Flags\Flag_CSAT_CO.paa";
	};
	_flag setFlagSide _side;
} forEach WL_BASES;

_nonBaseSectorsCnt = (count BIS_WL_allSectors) - 2;

_sectorsToGiveSide1 = floor (_nonBaseSectorsCnt * ([0, 0] # 0));
_sectorsToGiveSide2 = floor (_nonBaseSectorsCnt * ([0, 0] # 1));

while {_sectorsToGiveSide1 > 0 || _sectorsToGiveSide2 > 0} do {
	if (_sectorsToGiveSide1 > 0) then {
		_side = BIS_WL_competingSides # 0;
		_available = ([_side] call BIS_fnc_WL2_sortSectorArrays) # 1;
		_available = _available select {(_x getVariable ["BIS_WL_owner", sideUnknown]) == sideUnknown};
		if (count _available > 0) then {
			_sector = selectRandom _available;
			_sector setVariable ["BIS_WL_owner", _side, TRUE];
			_sector setVariable ["BIS_WL_previousOwners", [_side], TRUE];
			_sector setVariable ["BIS_WL_revealedBy", [_side], TRUE];
			[_sector] remoteExec ['BIS_fnc_WL2_sectorRevealHandle', [0, -2] select isDedicated];
			_sectorsToGiveSide1 = _sectorsToGiveSide1 - 1;
		} else {
			_sectorsToGiveSide1 = 0;
			_sectorsToGiveSide2 = 0;
		};
	};
	if (_sectorsToGiveSide2 > 0) then {
		_side = BIS_WL_competingSides # 1;
		_available = ([_side] call BIS_fnc_WL2_sortSectorArrays) # 1;
		_available = _available select {(_x getVariable ["BIS_WL_owner", sideUnknown]) == sideUnknown};
		if (count _available > 0) then {
			_sector = selectRandom _available;
			_sector setVariable ["BIS_WL_owner", _side, TRUE];
			_sector setVariable ["BIS_WL_previousOwners", [_side], TRUE];
			_sector setVariable ["BIS_WL_revealedBy", [_side], TRUE];
			[_sector] remoteExec ['BIS_fnc_WL2_sectorRevealHandle', [0, -2] select isDedicated];
			_sectorsToGiveSide2 = _sectorsToGiveSide2 - 1;
			if (count _available == 1) then {
				_sectorsToGiveSide1 = 0;
			};
		} else {
			_sectorsToGiveSide2 = 0;
		};
	};
};

{
	_sector = _x;
	_sectorPos = position _sector;
	
	if ((_sector getVariable ["BIS_WL_owner", sideUnknown]) == sideUnknown) then {
		_sector setVariable ["BIS_WL_owner", BIS_WL_localSide, TRUE];
		_sector setVariable ["BIS_WL_previousOwners", [], TRUE];
		_sector setVariable ["BIS_WL_revealedBy", [], TRUE];
		[_sector] remoteExec ['BIS_fnc_WL2_sectorRevealHandle', [0, -2] select isDedicated];
	};
	
	_zoneRestrictionTrg1 = createTrigger ["EmptyDetector", _sectorPos, FALSE];
	_zoneRestrictionTrg2 = createTrigger ["EmptyDetector", _sectorPos, FALSE];
	
	_sector setVariable ["BIS_WL_zoneRestrictionTrgs", [_zoneRestrictionTrg1, _zoneRestrictionTrg2]];
	
	{
		_handledSide = BIS_WL_competingSides # _forEachIndex;
		if (_handledSide in (_sector getVariable "BIS_WL_previousOwners")) then {
			deleteVehicle _x;
		} else {
			_x enableSimulation FALSE;
			_x setVariable ["BIS_WL_handledSide", _handledSide];
		};
	} forEach [_zoneRestrictionTrg1, _zoneRestrictionTrg2];
	
	_area = _sector getVariable "objectArea";
	_area set [4, WL_MAX_SEIZING_HEIGHT];
	
	_seizeControlTrg1 = createTrigger ["EmptyDetector", _sectorPos, FALSE];
	_seizeControlTrg2 = createTrigger ["EmptyDetector", _sectorPos, FALSE];
	_sector setVariable ["BIS_WL_seizeControlTrgs", [_seizeControlTrg1, _seizeControlTrg2]];
	
	_area params ["_a", "_b", "_angle", "_isRectangle"];
	_size = _a * _b * (if (_isRectangle) then {4} else {pi});
	
	if (_sector in WL_BASES) then {
		_sector setVariable ["BIS_WL_value", BIS_WL_baseValue];
	} else {
		_sector setVariable ["BIS_WL_value", round (_size / 10000)];
	};
	
	{
		_handledSide = BIS_WL_competingSides # _forEachIndex;
		_seizingTime = (WL_SEIZING_TIMEOUT_MIN max (_size / 3000)) min WL_SEIZING_TIMEOUT_MAX;
		_x setVariable ["BIS_WL_handledSide", _handledSide];
		_x setVariable ["BIS_WL_sector", _sector];
		_x setTriggerArea _area;
		_x setTriggerActivation [["WEST SEIZED", "EAST SEIZED", "GUER SEIZED"] # (BIS_WL_sidesArray find _handledSide), "PRESENT", true];
		_x setTriggerTimeout [_seizingTime * 0.75, _seizingTime, _seizingTime * 1.25, TRUE];
		_x setTriggerStatements [format ["this && triggerTimeoutCurrent (((thisTrigger getVariable 'BIS_WL_sector') getVariable 'BIS_WL_seizeControlTrgs') # %1) == -1 && if ((thisTrigger getVariable 'BIS_WL_sector') getVariable 'BIS_WL_owner' == %2) then {TRUE} else {!((thisTrigger getVariable 'BIS_WL_sector') in ((BIS_WL_sectorsArrays # %3) # 7)) || (thisTrigger getVariable 'BIS_WL_sector') == (missionNamespace getVariable [format ['BIS_WL_currentTarget_%2'], objNull])}", if (_forEachIndex == 0) then {1} else {0}, _handledSide, _forEachIndex], format ["if ((thisTrigger getVariable 'BIS_WL_sector') getVariable 'BIS_WL_owner' != %1) then {[thisTrigger getVariable 'BIS_WL_sector', %1] call BIS_fnc_WL2_changeSectorOwnership}", _handledSide], ""];
		if !(_handledSide in (_sector getVariable "BIS_WL_previousOwners")) then {
			_x enableSimulation FALSE;
		};
		[_x, _sector, _handledSide] spawn {
			params ["_trigger", "_sector", "_side"];
			while {!BIS_WL_missionEnd} do {
				waitUntil {sleep WL_TIMEOUT_STANDARD; (triggerTimeoutCurrent _trigger) != -1 && (_sector getVariable "BIS_WL_owner") != _side};
				_sector setVariable ["BIS_WL_seizingInfo", [_side, serverTime, serverTime + triggerTimeoutCurrent _trigger], TRUE];
				[_sector] remoteExec ["BIS_fnc_WL2_handleEnemyCapture", [0, -2] select isDedicated];
				waitUntil {sleep 0.1; (triggerTimeoutCurrent _trigger) == -1};
				_sector setVariable ["BIS_WL_seizingInfo", [], TRUE];
			};
		};
	} forEach [_seizeControlTrg1, _seizeControlTrg2];
	
	if (count (_sector getVariable "BIS_WL_revealedBy") != 2) then {
		_detectionTrg1 = createTrigger ["EmptyDetector", _sectorPos, FALSE];
		_detectionTrg2 = createTrigger ["EmptyDetector", _sectorPos, FALSE];
		_sector setVariable ["BIS_WL_detectionTrgs", [_detectionTrg1, _detectionTrg2]];
		
		{
			_handledSide = BIS_WL_competingSides # _forEachIndex;
			_x setVariable ["BIS_WL_handledSide", _handledSide];
			_x setVariable ["BIS_WL_sector", _sector];
			_x setTriggerArea _area;
			_x setTriggerActivation [["WEST", "EAST", "GUER"] # (BIS_WL_sidesArray find _handledSide), "PRESENT", FALSE];
			_x setTriggerStatements [format ["this && ((thisTrigger getVariable 'BIS_WL_sector') in ((BIS_WL_sectorsArrays # %1) # 3))", _forEachIndex], format ["[(thisTrigger getVariable 'BIS_WL_sector')] remoteExec ['BIS_fnc_WL2_sectorRevealHandle', [0, -2] select isDedicated]; (thisTrigger getVariable 'BIS_WL_sector') setVariable ['BIS_WL_revealedBy', ((thisTrigger getVariable 'BIS_WL_sector') getVariable 'BIS_WL_revealedBy') + [%1], TRUE]", _handledSide], ""];
		} forEach [_detectionTrg1, _detectionTrg2];
	};

	private _sectorVehicles = vehicles inAreaArray (_sector getVariable "objectAreaComplete");
	private _sectorVehiclesArray = [];
	
	{
		private _vehicle = _x;
		private _group = group effectiveCommander _vehicle;
		private _array = [typeOf _vehicle, position _vehicle, direction _vehicle, locked _vehicle];
		private _waypoints = +(waypoints _group);
		reverse _waypoints;
		_waypoints resize ((count _waypoints) - .5);
		reverse _waypoints;
		_waypoints = _waypoints apply {[waypointPosition _x, waypointType _x, waypointSpeed _x, waypointBehaviour _x, waypointTimeout _x]};
		_array pushBack _waypoints;
		_sectorVehiclesArray pushBack _array;
		{_vehicle deleteVehicleCrew _x} forEach crew _vehicle;
		if (count units _group == 0) then {deleteGroup _group};
		deleteVehicle _vehicle;
	} forEach _sectorVehicles;
	
	_sector setVariable ["BIS_WL_vehiclesToSpawn", _sectorVehiclesArray];
	
	_agentGrp = createGroup CIVILIAN;
	_agent = _agentGrp createUnit ["Logic", _sectorPos, [], 0, "CAN_COLLIDE"];
	_agent enableSimulationGlobal FALSE;
	_sector setVariable ["BIS_WL_agentGrp", _agentGrp, TRUE];
} forEach BIS_WL_allSectors;