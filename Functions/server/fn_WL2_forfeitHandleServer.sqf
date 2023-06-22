#include "..\warlords_constants.inc"

{
	_x spawn {
		_varName = format ["BIS_WL_forfeitVotingSince_%1", _this];
		
		while {!BIS_WL_missionEnd} do {
			waitUntil {sleep WL_TIMEOUT_SHORT; serverTime < ((missionNamespace getVariable [_varName, -1]) + 30)};
			
			_terminate = FALSE;
			
			while {!_terminate && {serverTime < ((missionNamespace getVariable [_varName, -1]) + 30)}} do {
				sleep WL_TIMEOUT_SHORT;
				
				_warlords = BIS_WL_allWarlords select {side group _x == _this};
				_limit = ceil ((count _warlords) / 2);
				_votedYes = count (_warlords select {(_x getVariable ["BIS_WL_forfeitVote", -1]) == 1});
				_votedNo = count (_warlords select {(_x getVariable ["BIS_WL_forfeitVote", -1]) == 0});
				
				if ((_votedYes >= _limit) && (serverTime >= 180)) then {
					missionNamespace setVariable ["BIS_WL_ffTeam", _this, true];
					missionNamespace setVariable ["BIS_WL_missionEnd", true, true];
					_terminate = true;
				};
			};
			
			{
				if ((_x getVariable ["BIS_WL_forfeitVote", -1]) != -1) then {
					_x setVariable ["BIS_WL_forfeitVote", -1, [2, (owner _x)]];
				};
			} forEach (BIS_WL_allWarlords select {side group _x == _this});
		};
	};
} forEach BIS_WL_competingSides;