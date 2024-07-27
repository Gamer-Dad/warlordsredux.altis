#include "..\warlords_constants.inc"

params ["_area", ["_rimWidth", 0], ["_infantryOnly", true]];
if !(_area isEqualType []) then {_area = [_area]};

private _center = _area # 0;
private _axisA = 0;
private _axisB = 0;

switch (typeName _center) do {
	case typeName []: {
		_axisA = _area # 1;
		_axisB = _area # 1;
	};
	case typeName "": {
		_axisA = (markerSize _center) # 0;
		_axisB = (markerSize _center) # 1;
		_area = [markerPos _center, _axisA, _axisB, markerDir _center, (markerShape _center) == "RECTANGLE"];
		_center = _area # 0;
	};
	case typeName objNull: {
		if (typeOf _center == "EmptyDetector") then {
			_axisA = (triggerArea _center) # 0;
			_axisB = (triggerArea _center) # 1;
		} else {
			if (_center isKindOf "Man") then {
				_area append [250, 250, 0, FALSE];
				_axisA = _area # 1;
				_axisB = _area # 2;
			} else {
				_area = (_center getVariable "objectAreaComplete");
				_axisA = _area # 1;
				_axisB = _area # 2;
			}
		};
		_center = position _center;
	};
};

_rimArea = [];
if !(isNil {_area}) then {
	_rimArea = _area;
};
private _axisRimA = 0;
private _axisRimB = 0;

if (_rimWidth != 0) then {
	_axisRimA = _axisA + _rimWidth;
	_axisRimB = _axisB + _rimWidth;
	_rimArea = [_center, _axisRimA, _axisRimB, _area # 3, _area # 4];
};

_center set [2, 0];

_maxAxis = (if (!(isNil {_area # 4}) && {(_area # 4)}) then {
	if (_rimWidth > 0) then {
		sqrt ((_axisRimA ^ 2) + (_axisRimB ^ 2));
	} else {
		sqrt ((_axisA ^ 2) + (_axisB ^ 2));
	};
} else {
	if (_rimWidth > 0) then {
		_axisRimA max _axisRimB;
	} else {
		_axisA max _axisB;
	};
});

private _areaStart = _center vectorDiff [_maxAxis, _maxAxis, 0];
private _areaEnd = _center vectorAdd [_maxAxis, _maxAxis, 0];
private _axisStep = if (_infantryOnly) then {20} else {40};

private _areaCheck = if (_rimWidth == 0) then {
	{_this inArea _area};
} else {
	if (_rimWidth > 0) then {
		{_this inArea _rimArea && !(_this inArea _area)};
	} else {
		{_this inArea _area && !(_this inArea _rimArea)};
	};
};

private _ret = [];
private _blacklistedMapObjects = ["BUILDING", "HOUSE", "CHURCH", "CHAPEL", "BUNKER", "FORTRESS", "FOUNTAIN", "VIEW-TOWER", "LIGHTHOUSE", "FUELSTATION", "HOSPITAL", "BUSSTOP", "TRANSMITTER", "STACK", "RUIN", "WATERTOWER", "ROCK", "ROCKS", "POWERSOLAR", "POWERWIND", "SHIPWRECK"];
if !(_infantryOnly) then {_blacklistedMapObjects append ["TREE", "FOREST BORDER", "FOREST TRIANGLE", "FOREST SQUARE", "CROSS", "WALL", "FOREST", "POWER LINES"]};

for [{_axisYSpawnCheck = _areaStart # 1}, {_axisYSpawnCheck < (_areaEnd # 1)}, {_axisYSpawnCheck = _axisYSpawnCheck + _axisStep}] do {
	for [{_axisXSpawnCheck = _areaStart # 0}, {_axisXSpawnCheck < (_areaEnd # 0)}, {_axisXSpawnCheck = _axisXSpawnCheck + _axisStep}] do {
		_spawnCheckPos = [_axisXSpawnCheck, _axisYSpawnCheck, 0];
		if (_spawnCheckPos call _areaCheck) then {
			if !(isOnRoad _spawnCheckPos || surfaceIsWater _spawnCheckPos || !(_spawnCheckPos inArea BIS_WL_mapAreaArray)) then {
				_finalPos = _spawnCheckPos isFlatEmpty [6, -1, 0.35, 6, 0, FALSE, objNull];
				if !(_finalPos isEqualTo []) then {
					_finalPos = ASLToATL _finalPos;
					_nearObjs = _finalPos nearObjects ["AllVehicles", 6];
					_nearMapObjs = nearestTerrainObjects [_finalPos, _blacklistedMapObjects, 10, false, true];
					if (count _nearObjs == 0 && {count _nearMapObjs == 0}) then {
						_finalPos set [2, 0];
						_ret pushBack _finalPos;
					};
				};
			};
		};
	};
};
_ret = _ret apply {[_x distance2D _center, [_x]]};
_ret sort true;
_ret = _ret apply {(_x # 1) # 0};

if (count _ret == 0) then {
	_ret = [_center];
};

_ret;