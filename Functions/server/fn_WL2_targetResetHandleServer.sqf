#include "..\warlords_constants.inc"

{
	_x spawn {
		_varName = format ["BIS_WL_targetResetVotingSince_%1", _this];
		
		while {!BIS_WL_missionEnd} do {
			waitUntil {sleep WL_TIMEOUT_SHORT; serverTime < ((missionNamespace getVariable [_varName, -1]) + WL_TARGET_RESET_VOTING_TIME)};
			
			_terminate = false;
			
			while {!_terminate && {serverTime < ((missionNamespace getVariable [_varName, -1]) + WL_TARGET_RESET_VOTING_TIME)}} do {
				sleep WL_TIMEOUT_SHORT;
				
				_warlords = (BIS_WL_allWarlords select {(side group _x == _this) && {!(isNil {_x})}});
				_limit = ceil ((count _warlords) / 4);
				_votedYes = count (_warlords select {(_x getVariable ["BIS_WL_targetResetVote", -1]) == 1});
				_votedNo = count (_warlords select {(_x getVariable ["BIS_WL_targetResetVote", -1]) == 0});
				
				if (_votedYes >= _limit) then {
					_terminate = TRUE;
					missionNamespace setVariable [format ["BIS_WL_recentTargetReset_%1", _this], true];
					missionNamespace setVariable [format ["BIS_WL_currentTarget_%1", _this], objNull, true];
					["server", TRUE] call BIS_fnc_WL2_updateSectorArrays;
					_this spawn {
						sleep (WL_TARGET_RESET_ZONE_RESTRICTION_TOLERANCE min BIS_WL_targetResetTimeout);
						missionNamespace setVariable [format ["BIS_WL_recentTargetReset_%1", _this], false];
					};
				} else {
					if (_votedNo >= _limit) then {
						_terminate = TRUE;
						missionNamespace setVariable [_varName, (serverTime - WL_TARGET_RESET_VOTING_TIME), true];
					};
				};
			};
			
			{
				if ((_x getVariable ["BIS_WL_targetResetVote", -1]) != -1) then {
					_x setVariable ["BIS_WL_targetResetVote", -1, [2, (owner _x)]];
				};
			} forEach (BIS_WL_allWarlords select {(side group _x == _this) && {!(isNil {_x})}});
		};
	};
} forEach [west, east];