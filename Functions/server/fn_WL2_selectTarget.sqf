#include "..\warlords_constants.inc"

params ["_side", "_sector"];

if (!isNull _sector) then {
	if !(_sector getVariable ["BIS_WL_simulated", false]) then {
		_sector setVariable ["BIS_WL_simulated", true];
		_sector spawn BIS_fnc_WL2_sectorCaptureHandle;
	};

	missionNamespace setVariable [format ["BIS_WL_currentTarget_%1", _side], _sector, true];
	missionNamespace setVariable [format ["BIS_WL_sectorSelectedTimestamp_%1", _side], serverTime, true];
	if (_sector in WL_BASES) then {
		_sector setVariable ["BIS_WL_baseUnderAttack", true, true];
		["base_vulnerable", _sector getVariable "BIS_WL_originalOwner"] call BIS_fnc_WL2_handleRespawnMarkers;
	} else {
		private _owner = _sector getVariable "BIS_WL_owner";
		[_sector, _owner] spawn BIS_fnc_WL2_populateSector;
	};
} else {
	_prevSector = missionNamespace getVariable format ["BIS_WL_currentTarget_%1", _side];
	missionNamespace setVariable [format ["BIS_WL_currentTarget_%1", _side], objNull, true];
	if (_prevSector in WL_BASES) then {
		_sector setVariable ["BIS_WL_baseUnderAttack", false, true];
		["base_safe", _prevSector getVariable "BIS_WL_originalOwner"] call BIS_fnc_WL2_handleRespawnMarkers;
	};
};