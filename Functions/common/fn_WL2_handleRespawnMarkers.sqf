#include "..\warlords_constants.inc"

params ["_mode", ["_side", sideUnknown]];

switch (_mode) do {
	case "setup": {
		_spawnMarkers = {
			_sideID = ["west", "east", "guerrila"] select (BIS_WL_sidesArray find _this);
			_respawnMarkerFormat = format ["respawn_%1_", _sideID];
			_base = _this call BIS_fnc_WL2_getSideBase;
			_baseSpots = _base call BIS_fnc_WL2_findSpawnPositions;
			_baseSpotsCnt = count _baseSpots;
			if (_baseSpotsCnt > WL_RESPAWN_MARKERS_CNT) then {
				_baseSpots resize WL_RESPAWN_MARKERS_CNT;
			};
			
			_i = 1;
			for "_i" from 1 to WL_RESPAWN_MARKERS_CNT do {
				createMarkerLocal [_respawnMarkerFormat + str _i, if (_baseSpotsCnt == WL_RESPAWN_MARKERS_CNT) then {_baseSpots # _i} else {selectRandom _baseSpots}];
			};
		};
		if (isServer) then {
			{_x call _spawnMarkers} forEach BIS_WL_competingSides;
		} else {
			BIS_WL_playerSide call _spawnMarkers;
		};
	};
	case "base_vulnerable": {
		_sideID = ["west", "east", "guerrila"] select (BIS_WL_sidesArray find _side);
		_respawnMarkerFormat = format ["respawn_%1_", _sideID];
		_base = _side call BIS_fnc_WL2_getSideBase;
		_baseArea = +(_base getVariable "objectArea");
		_markerLocArr = [[_base, (_baseArea # 0) + WL_BASE_DANGER_SPAWN_RANGE, (_baseArea # 1) + WL_BASE_DANGER_SPAWN_RANGE, _baseArea # 2, _baseArea # 3], 50] call BIS_fnc_WL2_findSpawnPositions;
		
		_i = 1;
		for "_i" from 1 to WL_RESPAWN_MARKERS_CNT do {
			_mrkr = (_respawnMarkerFormat + str _i);
			_mrkr setMarkerPosLocal (if (count _markerLocArr >= 5) then {selectRandom _markerLocArr} else {[_base, WL_BASE_DANGER_SPAWN_RANGE, random 360] call BIS_fnc_relPos});
		};
	};
	case "base_safe": {
		_sideID = ["west", "east", "guerrila"] select (BIS_WL_sidesArray find _side);
		_respawnMarkerFormat = format ["respawn_%1_", _sideID];
		_base = _side call BIS_fnc_WL2_getSideBase;
		_baseSpots = _base call BIS_fnc_WL2_findSpawnPositions;
		
		_i = 1;
		for "_i" from 1 to WL_RESPAWN_MARKERS_CNT do {
			_mrkr = (_respawnMarkerFormat + str _i);
			_mrkr setMarkerPosLocal (if (count _baseSpots >= 5) then {selectRandom _baseSpots} else {[_base, random 50, random 360] call BIS_fnc_relPos});
		};
	};
};