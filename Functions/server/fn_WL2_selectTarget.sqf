#include "..\warlords_constants.inc"

params ["_side", "_sector"];

if (!isNull _sector) then {
	missionNamespace setVariable [format ["BIS_WL_currentTarget_%1", _side], _sector, TRUE];
	missionNamespace setVariable [format ["BIS_WL_sectorSelectedTimestamp_%1", _side], serverTime, TRUE];
	_seizeControlTrg = ((_sector getVariable "BIS_WL_seizeControlTrgs") select {(_x getVariable "BIS_WL_handledSide") == _side}) # 0;
	_seizeControlTrg enableSimulation TRUE;
	if (_sector in WL_BASES) then {
		_sector setVariable ["BIS_WL_baseUnderAttack", true, true];
		["base_vulnerable", _sector getVariable "BIS_WL_originalOwner"] call BIS_fnc_WL2_handleRespawnMarkers;
		_sector spawn {
			sleep WL_TIMEOUT_MAX;
			_this setVariable ["BIS_WL_fastTravelEnabled", TRUE, TRUE];
		};
	} else {
		private _owner = _sector getVariable "BIS_WL_owner";
		[_sector, _owner] spawn BIS_fnc_WL2_populateSector;
	};
} else {
	_prevSector = missionNamespace getVariable format ["BIS_WL_currentTarget_%1", _side];
	missionNamespace setVariable [format ["BIS_WL_currentTarget_%1", _side], objNull, TRUE];
	if !(_side in (_sector getVariable "BIS_WL_previousOwners")) then {
		_seizeControlTrg = ((_prevSector getVariable "BIS_WL_seizeControlTrgs") select {(_x getVariable "BIS_WL_handledSide") == _side}) # 0;
		_seizeControlTrg enableSimulation FALSE;
	};
	if (_prevSector in WL_BASES) then {
		_sector setVariable ["BIS_WL_baseUnderAttack", false, true];
		["base_safe", _prevSector getVariable "BIS_WL_originalOwner"] call BIS_fnc_WL2_handleRespawnMarkers;
		_prevSector setVariable ["BIS_WL_fastTravelEnabled", TRUE, TRUE];
	};
};