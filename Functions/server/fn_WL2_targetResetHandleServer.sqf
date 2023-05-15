#include "..\warlords_constants.inc"

{
	_x spawn {
		_varName = format ["BIS_WL_targetResetVotingSince_%1", _this];
		waitUntil {!isNil {BIS_WL_missionEnd}};
		
		while {!BIS_WL_missionEnd} do {
			waitUntil {sleep WL_TIMEOUT_SHORT; WL_SYNCED_TIME < ((missionNamespace getVariable [_varName, -1]) + WL_TARGET_RESET_VOTING_TIME)};
			
			_terminate = FALSE;
			
			while {!_terminate && WL_SYNCED_TIME < ((missionNamespace getVariable [_varName, -1]) + WL_TARGET_RESET_VOTING_TIME)} do {
				sleep WL_TIMEOUT_SHORT;
				
				_warlords = BIS_WL_allWarlords select {side group _x == _this};
				_limit = ceil ((count _warlords) / 4);
				_votedYes = count (_warlords select {(_x getVariable ["BIS_WL_targetResetVote", -1]) == 1});
				_votedNo = count (_warlords select {(_x getVariable ["BIS_WL_targetResetVote", -1]) == 0});
				
				if (_votedYes >= _limit) then {
					_terminate = TRUE;
					missionNamespace setVariable [format ["BIS_WL_recentTargetReset_%1", _this], TRUE];
					missionNamespace setVariable [format ["BIS_WL_currentTarget_%1", _this], objNull, TRUE];
					["server", TRUE] call BIS_fnc_WL2_updateSectorArrays;
					_this spawn {
						sleep (WL_TARGET_RESET_ZONE_RESTRICTION_TOLERANCE min BIS_WL_targetResetTimeout);
						missionNamespace setVariable [format ["BIS_WL_recentTargetReset_%1", _this], FALSE];
					};
				} else {
					if (_votedNo >= _limit) then {
						_terminate = TRUE;
						missionNamespace getVariable [_varName, WL_SYNCED_TIME - WL_TARGET_RESET_VOTING_TIME, TRUE];
					};
				};
			};
			
			{
				if ((_x getVariable ["BIS_WL_targetResetVote", -1]) != -1) then {
					_x setVariable ["BIS_WL_targetResetVote", -1, TRUE];
				};
			} forEach (BIS_WL_allWarlords select {side group _x == _this});
		};
	};
} forEach BIS_WL_competingSides;