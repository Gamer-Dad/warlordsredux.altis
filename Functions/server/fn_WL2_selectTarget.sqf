#include "..\warlords_constants.inc"

params ["_side", "_sector"];

if (!isNull _sector) then {
	if !(_sector getVariable ["BIS_WL_simulated", false]) then {
		{
			_handledSide = BIS_WL_competingSides # _forEachIndex;
			[_x, _sector, _handledSide] spawn {
				params ["_trigger", "_sector", "_side"];
				while {!BIS_WL_missionEnd} do {
					waitUntil {sleep WL_TIMEOUT_STANDARD; (triggerTimeoutCurrent _trigger) != -1 && (_sector getVariable "BIS_WL_owner") != _side};
					_sector setVariable ["BIS_WL_seizingInfo", [_side, serverTime, serverTime + triggerTimeoutCurrent _trigger], true];
					[_sector] remoteExec ["BIS_fnc_WL2_handleEnemyCapture", [0, -2] select isDedicated];
					waitUntil {sleep 0.1; (triggerTimeoutCurrent _trigger) == -1};
					_sector setVariable ["BIS_WL_seizingInfo", [], true];
				};
			};
		} forEach (_sector getVariable "BIS_WL_seizeControlTrgs");
		_sector setVariable ["BIS_WL_simulated", true];
	};
	missionNamespace setVariable [format ["BIS_WL_currentTarget_%1", _side], _sector, true];
	missionNamespace setVariable [format ["BIS_WL_sectorSelectedTimestamp_%1", _side], serverTime, true];
	_seizeControlTrg = ((_sector getVariable "BIS_WL_seizeControlTrgs") select {(_x getVariable "BIS_WL_handledSide") == _side}) # 0;
	_seizeControlTrg enableSimulation true;
	if (_sector in WL_BASES) then {
		_sector setVariable ["BIS_WL_baseUnderAttack", true, true];
		["base_vulnerable", _sector getVariable "BIS_WL_originalOwner"] call BIS_fnc_WL2_handleRespawnMarkers;
		_sector spawn {
			sleep WL_TIMEOUT_MAX;
			_this setVariable ["BIS_WL_fastTravelEnabled", true, true];
		};
	} else {
		private _owner = _sector getVariable "BIS_WL_owner";
		[_sector, _owner] spawn BIS_fnc_WL2_populateSector;
	};
} else {
	_prevSector = missionNamespace getVariable format ["BIS_WL_currentTarget_%1", _side];
	missionNamespace setVariable [format ["BIS_WL_currentTarget_%1", _side], objNull, true];
	if !(_side in (_sector getVariable "BIS_WL_previousOwners")) then {
		_seizeControlTrg = ((_prevSector getVariable "BIS_WL_seizeControlTrgs") select {(_x getVariable "BIS_WL_handledSide") == _side}) # 0;
		_seizeControlTrg enableSimulation FALSE;
	};
	if (_prevSector in WL_BASES) then {
		_sector setVariable ["BIS_WL_baseUnderAttack", false, true];
		["base_safe", _prevSector getVariable "BIS_WL_originalOwner"] call BIS_fnc_WL2_handleRespawnMarkers;
		_prevSector setVariable ["BIS_WL_fastTravelEnabled", true, true];
	};
};