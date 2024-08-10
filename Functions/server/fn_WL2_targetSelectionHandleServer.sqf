#include "..\warlords_constants.inc"

{
	missionNamespace setVariable [format ["BIS_WL_currentTarget_%1", _x], objNull, true];

	[_x, _forEachIndex] spawn {
		params ["_side", "_sideIndex"];
		_votingResetVar = format ["BIS_WL_resetTargetSelection_server_%1", _side];

		private _calculateMostVotedSector = {
			private _warlords = allPlayers select {side group _x == _side};
			private _players = _warlords select {isPlayer _x};

			private _votesByPlayers = createHashMap;
			{
				private _player = _x;
				private _variableName = format ["BIS_WL_targetVote_%1", getPlayerID _player];
				private _vote = missionNamespace getVariable [_variableName, objNull];
				private _voteName = format ["%1", _vote];
				if !(isNull _vote) then {
					private _squadSize = ["getSquadSizeOfSquadLeader", [getPlayerID _x]] call SQD_fnc_server;
					private _squadPower = ceil ((_squadSize * _squadSize) / 2);
					private _voteCount = _squadPower + (_votesByPlayers getOrDefault [_voteName, [objNull, 0]] select 1);
					_votesByPlayers set [_voteName, [_vote, _voteCount]];
				};
			} forEach (_players select { !(["isRegularSquadMember", [getPlayerID _x]] call SQD_fnc_server) });

			private _sortedVoteList = (toArray _votesByPlayers) # 1; // discard keys
			_sortedVoteList = [_sortedVoteList, [], { _x # 1  }, "DESCEND"] call BIS_fnc_sortBy;

			private _display = "<t size='1.8'>Vote in Progress</t><br/>";
			{
				private _vote = _x # 0;
				private _voteCount = _x # 1;
				_display = _display + format ["<t size='1.5' color='#0074e6'>%1: %2</t><br/>", _vote getVariable "BIS_WL_name", _voteCount];
			} forEach _sortedVoteList;

			private _maxVotedSector = if (count _sortedVoteList > 0) then {
				_firstSector  = _sortedVoteList # 0;
				_firstSector # 0 // return sector object
			} else {
				objNull
			};

			[_maxVotedSector, _display];
		};

		private _wipeVotes = {
			_players = allPlayers select {side group _x == _side} select {isPlayer _x};
			_voterVariables = _players apply {format ["BIS_WL_targetVote_%1", getPlayerID _x]};
			{
				missionNamespace setVariable [_x, objNull];
			} forEach (_voterVariables);
		};
		
		while {!BIS_WL_missionEnd} do {
			_t = serverTime + 10 + random 10;
			_tNoPlayers = serverTime + 2 + random 5;
			_variablesPool = [];
			_votesPool = [];
			_npcsVoted = FALSE;
			missionNamespace setVariable [_votingResetVar, FALSE];
			call _wipeVotes;

			_calculation = call _calculateMostVotedSector;
			missionNamespace setVariable [format ["BIS_WL_sectorVoteTallyDisplay_%1", _side], _calculation # 1, true];

			waitUntil {
				sleep WL_TIMEOUT_SHORT;
				_warlords = allPlayers select {side group _x == _side};
				_players = _warlords select {isPlayer _x};
				_npcs = _warlords select {!isPlayer _x};
				_noPlayers = count (allPlayers select {(side group _x) == ([west, east] # _sideIndex)}) == 0;
				_playerVotingVariableNames = _players apply {format ["BIS_WL_targetVote_%1", getPlayerID _x]};

				_votingReset = missionNamespace getVariable [_votingResetVar, false];
				_playerHasVote = _playerVotingVariableNames findIf {!isNull (missionNamespace getVariable [_x, objNull])} != -1;
				_serverTimeCondition = serverTime > _tNoPlayers;

				_conditionNpcsAndNoPlayers = if (count _npcs > 0) then {
					if (_noPlayers) then {_serverTimeCondition} else {false}
				} else {
					false
				};

				// Final condition
				_votingReset || _playerHasVote || _conditionNpcsAndNoPlayers
			};
			
			if !(missionNamespace getVariable [_votingResetVar, false]) then {
				_votingEnd = serverTime + (getMissionConfigValue ["BIS_WL_sectorVotingDuration", 15]);
				_nextUpdate = serverTime;
				
				while {serverTime < _votingEnd && {!(missionNamespace getVariable [_votingResetVar, false])}} do {
					_warlords = allPlayers select {side group _x == _side};
					_players = _warlords select {isPlayer _x};
					_noPlayers = count (allPlayers select {(side group _x) == ([west, east] # _sideIndex)}) == 0;
					
					if (serverTime >= _nextUpdate) then {
						_calculation = call _calculateMostVotedSector;
						missionNamespace setVariable [format ["BIS_WL_mostVoted_%1", _side], [_calculation # 0, _votingEnd], TRUE];
						missionNamespace setVariable [format ["BIS_WL_sectorVoteTallyDisplay_%1", _side], _calculation # 1, TRUE];
						_nextUpdate = serverTime + WL_TIMEOUT_STANDARD;
					};
					
					sleep WL_TIMEOUT_SHORT;
				};

				if !(missionNamespace getVariable [_votingResetVar, false]) then {
					_calculation = call _calculateMostVotedSector;
					[_side, _calculation # 0] call BIS_fnc_WL2_selectTarget;

					call _wipeVotes;
					missionNamespace setVariable [format ["BIS_WL_sectorVoteTallyDisplay_%1", _side], "", TRUE];

					["server", TRUE] call BIS_fnc_WL2_updateSectorArrays;

					waitUntil {sleep WL_TIMEOUT_STANDARD; isNull (missionNamespace getVariable [format ["BIS_WL_currentTarget_%1", _side], objNull])};
				};
			};
		};
	};
} forEach [WEST, EAST];