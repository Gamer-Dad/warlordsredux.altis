params ["_caller"];

_possibleSectors = _caller call BIS_fnc_WL2_getFriendlySectors;
_visitedSectorID = _possibleSectors findIf {_caller inArea (_x getVariable "objectAreaComplete")};

if (_visitedSectorID >= 0) then {
	_possibleSectors # _visitedSectorID;
} else {
	nil;
};