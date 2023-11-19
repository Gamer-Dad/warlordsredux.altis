#include "..\warlords_constants.inc"

{
	missionNamespace setVariable [format ["BIS_WL_currentTarget_%1", _x], objNull, true];

	[_x, _forEachIndex] spawn {
		params ["_side", "_sideIndex"];
		_votingResetVar = format ["BIS_WL_resetTargetSelection_server_%1", _side];

		_calculateMostVotedSector = {
			_allSectorsVotedFor = [];
			{
				_allSectorsVotedFor pushBackUnique _x;
			} forEach _votesPool;
			_allSectorsVotedFor = _allSectorsVotedFor apply {_sector = _x; [{_x == _sector} count _votesPool, _sector]};
			_allSectorsVotedFor sort false;
			(_allSectorsVotedFor # 0) # 1;
		};
		
		while {!BIS_WL_missionEnd} do {
			_t = serverTime + 10 + random 10;
			_tNoPlayers = serverTime + 2 + random 5;
			_variablesPool = [];
			_votesPool = [];
			_npcsVoted = FALSE;
			missionNamespace setVariable [_votingResetVar, FALSE];
			
			waitUntil {
				sleep WL_TIMEOUT_SHORT;
				_warlords = allPlayers select {side group _x == _side};
				_players = _warlords select {isPlayer _x};
				_npcs = _warlords select {!isPlayer _x};
				_noPlayers = count (allPlayers select {(side group _x) == ([west, east] # _sideIndex)}) == 0;
				_playerVotingVariableNames = _players apply {format ["BIS_WL_targetVote_%1", getPlayerUID _x]};
				(missionNamespace getVariable [_votingResetVar, false]) || {((_playerVotingVariableNames findIf {!isNull (missionNamespace getVariable [_x, objNull])} != -1) || {(if (count _npcs > 0) then {if (_noPlayers) then {serverTime > _tNoPlayers} else {false}} else {false})})}
			};
			
			if !(missionNamespace getVariable [_votingResetVar, false]) then {
				_votingEnd = serverTime + (getMissionConfigValue ["BIS_WL_sectorVotingDuration", 15]);
				_nextUpdate = serverTime;
				
				while {serverTime < _votingEnd && {!(missionNamespace getVariable [_votingResetVar, false])}} do {
					_warlords = allPlayers select {side group _x == _side};
					_players = _warlords select {isPlayer _x};
					_noPlayers = count (allPlayers select {(side group _x) == ([west, east] # _sideIndex)}) == 0;
					
					if (!_npcsVoted && (_noPlayers)) then {
						_npcsVoted = TRUE;
						_npcs = _warlords select {!isPlayer _x};
						{
							_votesPool pushBack selectRandom ((BIS_WL_sectorsArrays # _sideIndex) # 1);
						} forEach _npcs;
					};
					
					_playerVotingVariableNames = _players apply {format ["BIS_WL_targetVote_%1", getPlayerUID _x]};
					
					{
						_variableName = _x;
						_vote = missionNamespace getVariable [_variableName, objNull];
						if !(isNull _vote) then {
							_i = _variablesPool find _variableName;
							if (_i == -1) then {
								_variablesPool pushBack _variableName;
								_votesPool pushBack _vote;
							} else {
								_votesPool set [_i, _vote];
							};
						};
					} forEach _playerVotingVariableNames;
					
					if (serverTime >= _nextUpdate) then {
						missionNamespace setVariable [format ["BIS_WL_mostVoted_%1", _side], [call _calculateMostVotedSector, _votingEnd], TRUE];
						_nextUpdate = serverTime + WL_TIMEOUT_STANDARD;
					};
					
					sleep WL_TIMEOUT_SHORT;
				};

				if !(missionNamespace getVariable [_votingResetVar, false]) then {
					[_side, call _calculateMostVotedSector] call BIS_fnc_WL2_selectTarget;
					
					["server", TRUE] call BIS_fnc_WL2_updateSectorArrays;

					waitUntil {sleep WL_TIMEOUT_STANDARD; isNull (missionNamespace getVariable [format ["BIS_WL_currentTarget_%1", _side], objNull])};
				};
			};
			
			{missionNamespace setVariable [_x, objNull]} forEach _variablesPool;
		};
	};
} forEach [WEST, EAST];