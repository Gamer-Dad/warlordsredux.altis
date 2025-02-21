#include "..\..\warlords_constants.inc"

private _baseData =
#if WL_OVERRIDE_BASES
	BIS_WL_allSectors select {
		_x getVariable ["BIS_WL_name", ""] in ["AAC Airfield", "Airbase"];
	};
#else
	[] call WL2_fnc_calcHomeBases;
#endif

#if WL_BASE_SELECTION_DEBUG
private _baseProbabilityTable = [];
for "_i" from 0 to 10000 do {
	private _testData = [] call WL2_fnc_calcHomeBases;
	private _firstBase = _testData # 0;
	private _secondBase = _testData # 1;

	private _firstEntry = _baseProbabilityTable findIf {
		_x # 0 == _firstBase;
	};
	if (_firstEntry == -1) then {
		_baseProbabilityTable pushBack [_firstBase, 1];
	} else {
		(_baseProbabilityTable # _firstEntry) set [1, (_baseProbabilityTable # _firstEntry) # 1 + 1];
	};

	private _secondEntry = _baseProbabilityTable findIf {
		_x # 0 == _secondBase;
	};
	if (_secondEntry == -1) then {
		_baseProbabilityTable pushBack [_secondBase, 1];
	} else {
		(_baseProbabilityTable # _secondEntry) set [1, (_baseProbabilityTable # _secondEntry) # 1 + 1];
	};
};

private _sortedSectorsArray = [_baseProbabilityTable, [], { _x # 1 }, "DESCEND"] call BIS_fnc_sortBy;

diag_log "Base probability table:";
{
	private _getPairs = ([_x # 0] call WL2_fnc_calcHomeBases) # 2;
	diag_log format ["%1: %2%%, Pairs: %3", (_x # 0) getVariable ["BIS_WL_name", ""], (_x # 1) / 20000 * 100, count _getPairs];
} forEach _sortedSectorsArray;
#endif

private _firstBase = _baseData # 0;
private _secondBase = _baseData # 1;

#if WL_BASE_SELECTION_DEBUG
systemChat format ["First base: %1", _firstBase getVariable ["BIS_WL_name", ""]];
systemChat format ["Second base: %1", _secondBase getVariable ["BIS_WL_name", ""]];
#endif

missionNamespace setVariable ["BIS_WL_base1", _firstBase, true];
missionNamespace setVariable ["BIS_WL_base2", _secondBase, true];
profileNamespace setVariable ["BIS_WL_lastBases", [_firstBase, _secondBase]];
waitUntil {!isNil "BIS_WL_base1" && {!isNil "BIS_WL_base2"}};

{
	_side = [west, east] # _forEachIndex;
	_base = _x;
	_base setVariable ["BIS_WL_owner", _side, true];
	_base setVariable ["BIS_WL_originalOwner", _side, true];
	_base setVariable ["BIS_WL_previousOwners", [_side], true];
	_base setVariable ["BIS_WL_revealedBy", [_side], true];
	_pos = (position _x) findEmptyPosition [0, 20, "FlagPole_F"];
	_posFinal = if (count _pos == 0) then {
		position _x
	} else {
		_pos
	};
	private _flag = createVehicle ["FlagPole_F", _posFinal, [], 0,"CAN_COLLIDE"];
	if (_side == west) then {
		_flag setFlagTexture "\A3\Data_F\Flags\flag_NATO_CO.paa";
	} else {
		_flag setFlagTexture "\A3\Data_F\Flags\Flag_CSAT_CO.paa";
	};
	_flag setFlagSide _side;
	[_flag] remoteExec ["WLC_fnc_action", 0, true];
} forEach [_firstBase, _secondBase];

{
	_sector = _x;
	_sectorPos = position _sector;
	if ((_sector getVariable ["BIS_WL_owner", sideUnknown]) == sideUnknown) then {
		_sector setVariable ["BIS_WL_owner", resistance, true];
		_sector setVariable ["BIS_WL_previousOwners", [], true];
		[_sector] remoteExec ['WL2_fnc_sectorRevealHandle', [0, -2] select isDedicated];
	};

	_zoneRestrictionTrg1 = createTrigger ["EmptyDetector", _sectorPos, false];
	_zoneRestrictionTrg2 = createTrigger ["EmptyDetector", _sectorPos, false];
	_sector setVariable ["BIS_WL_zoneRestrictionTrgs", [_zoneRestrictionTrg1, _zoneRestrictionTrg2]];
	{
		_handledSide = BIS_WL_competingSides # _forEachIndex;
		if (_handledSide in (_sector getVariable "BIS_WL_previousOwners")) then {
			deleteVehicle _x;
		} else {
			_x enableSimulation false;
			_x setVariable ["BIS_WL_handledSide", _handledSide];
		};
	} forEach [_zoneRestrictionTrg1, _zoneRestrictionTrg2];

	_area = _sector getVariable "objectArea";
	_area set [4, 38];
	_area params ["_a", "_b", "_angle", "_isRectangle"];
	_size = _a * _b * (if (_isRectangle) then {4} else {pi});

	if (_sector in [_firstBase, _secondBase]) then {
		_sector setVariable ["BIS_WL_value", (getMissionConfigValue ["BIS_WL_baseValue", 50])];
	} else {
		_sector setVariable ["BIS_WL_value", round (_size / 13000)];
	};

	_detectionTrg1 = createTrigger ["EmptyDetector", _sectorPos, false];
	_detectionTrg2 = createTrigger ["EmptyDetector", _sectorPos, false];
	_sector setVariable ["BIS_WL_detectionTrgs", [_detectionTrg1, _detectionTrg2]];
	{
		_handledSide = BIS_WL_competingSides # _forEachIndex;
		_x setVariable ["BIS_WL_handledSide", _handledSide];
		_x setVariable ["BIS_WL_sector", _sector];
		_x setTriggerArea _area;
		_x setTriggerActivation [["WEST", "EAST", "GUER"] # (BIS_WL_sidesArray find _handledSide), "PRESENT", false];
		_x setTriggerStatements [format ["this && ((thisTrigger getVariable 'BIS_WL_sector') in ((BIS_WL_sectorsArrays # %1) # 3))", _forEachIndex], format ["[(thisTrigger getVariable 'BIS_WL_sector')] remoteExec ['WL2_fnc_sectorRevealHandle', [0, -2] select isDedicated]; (thisTrigger getVariable 'BIS_WL_sector') setVariable ['BIS_WL_revealedBy', ((thisTrigger getVariable 'BIS_WL_sector') getVariable ['BIS_WL_revealedBy', []]) + [%1], true]", _handledSide], ""];
	} forEach [_detectionTrg1, _detectionTrg2];

	private _sectorVehicles = vehicles inAreaArray (_sector getVariable "objectAreaComplete");
	private _sectorVehiclesArray = [];
	{
		private _vehicle = _x;
		if (_vehicle getVariable ["WL_excludeSectorSpawn", false]) then {
			continue;
		};
		if !(_vehicle isKindOf "AllVehicles") then {
			continue;
		};
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

	if (count _sectorVehiclesArray > 0) then {
		_sector setVariable ["BIS_WL_vehiclesToSpawn", _sectorVehiclesArray];
	};

	_agentGrp = createGroup CIVILIAN;
	_agent = _agentGrp createUnit ["Logic", _sectorPos, [], 0, "CAN_COLLIDE"];
	_agent enableSimulationGlobal false;
	_sector setVariable ["BIS_WL_agentGrp", _agentGrp, true];
} forEach BIS_WL_allSectors;