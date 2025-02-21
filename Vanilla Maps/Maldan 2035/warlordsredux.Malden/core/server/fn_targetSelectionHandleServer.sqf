#include "..\warlords_constants.inc"

{
	missionNamespace setVariable [format ["BIS_WL_currentTarget_%1", _x], objNull, true];

	[_x, _forEachIndex] spawn {
		params ["_side", "_sideIndex"];
		private _votingResetVar = format ["BIS_WL_resetTargetSelection_server_%1", _side];

		private _calculateMostVotedSector = {
			private _allPlayers = call BIS_fnc_listPlayers;
			private _warlords = _allPlayers select {side group _x == _side};
			private _players = _warlords select {isPlayer _x};

			private _votesByPlayers = createHashMap;
			{
				private _player = _x;
				private _variableName = format ["BIS_WL_targetVote_%1", getPlayerID _player];
				private _vote = missionNamespace getVariable [_variableName, objNull];
				private _voteName = format ["%1", _vote];
				private _availableSectors = if (isNil "BIS_WL_sectorsArrays") then {
					[];
				} else {
					(BIS_WL_sectorsArrays # _sideIndex) # 1;
				};
				if (!(isNull _vote) && (_vote in _availableSectors)) then {
					private _squadVotingPower = ["getSquadVotingPower", [getPlayerID _x]] call SQD_fnc_server;
					private _voteCount = _squadVotingPower + (_votesByPlayers getOrDefault [_voteName, [objNull, 0]] select 1);
					_votesByPlayers set [_voteName, [_vote, _voteCount]];
				};
			} forEach (_players select { !(["isRegularSquadMember", [getPlayerID _x]] call SQD_fnc_server) });

			private _sortedVoteList = (toArray _votesByPlayers) # 1; // discard keys
			_sortedVoteList = [_sortedVoteList, [], { _x # 1  }, "DESCEND"] call BIS_fnc_sortBy;

			private _maxVotedSector = if (count _sortedVoteList > 0) then {
				_firstSector  = _sortedVoteList # 0;
				_firstSector # 0 // return sector object
			} else {
				objNull
			};

			[_maxVotedSector, _sortedVoteList];
		};

		private _wipeVotes = {
			private _allPlayers = call BIS_fnc_listPlayers;
			private _players = _allPlayers select {side group _x == _side} select {isPlayer _x};
			private _voterVariables = _players apply {format ["BIS_WL_targetVote_%1", getPlayerID _x]};
			{
				missionNamespace setVariable [_x, objNull];
			} forEach _voterVariables;
		};

		while {!BIS_WL_missionEnd} do {
			_t = serverTime + 10 + random 10;
			missionNamespace setVariable [_votingResetVar, FALSE];
			call _wipeVotes;

			_calculation = call _calculateMostVotedSector;
			missionNamespace setVariable [format ["BIS_WL_sectorVoteTallyDisplay_%1", _side], _calculation # 1, true];

			waitUntil {
				sleep WL_TIMEOUT_SHORT;
				private _allPlayers = call BIS_fnc_listPlayers;
				_warlords = _allPlayers select {side group _x == _side};
				_players = _warlords select {isPlayer _x};
				_playerVotingVariableNames = _players apply {format ["BIS_WL_targetVote_%1", getPlayerID _x]};

				_votingReset = missionNamespace getVariable [_votingResetVar, false];
				_playerHasVote = _playerVotingVariableNames findIf {!isNull (missionNamespace getVariable [_x, objNull])} != -1;

				// Final condition
				_votingReset || _playerHasVote
			};

			if !(missionNamespace getVariable [_votingResetVar, false]) then {
				_votingEnd = serverTime + (getMissionConfigValue ["BIS_WL_sectorVotingDuration", 30]);
				_nextUpdate = serverTime;

				while {serverTime < _votingEnd && {!(missionNamespace getVariable [_votingResetVar, false])}} do {
					private _allPlayers = call BIS_fnc_listPlayers;
					_warlords = _allPlayers select {side group _x == _side};
					_players = _warlords select {isPlayer _x};

					if (serverTime >= _nextUpdate) then {
						_calculation = call _calculateMostVotedSector;
						missionNamespace setVariable [format ["BIS_WL_mostVoted_%1", _side], [_calculation # 0, _votingEnd], true];
						missionNamespace setVariable [format ["BIS_WL_sectorVoteTallyDisplay_%1", _side], _calculation # 1, true];
						_nextUpdate = serverTime + WL_TIMEOUT_STANDARD;
					};

					sleep WL_TIMEOUT_SHORT;
				};

				if !(missionNamespace getVariable [_votingResetVar, false]) then {
					_calculation = call _calculateMostVotedSector;
					[_side, _calculation # 0] call WL2_fnc_selectTarget;

					call _wipeVotes;
					missionNamespace setVariable [format ["BIS_WL_sectorVoteTallyDisplay_%1", _side], [], true];

					["server", TRUE] call WL2_fnc_updateSectorArrays;

					waitUntil {sleep WL_TIMEOUT_STANDARD; isNull (missionNamespace getVariable [format ["BIS_WL_currentTarget_%1", _side], objNull])};
				};
			};
		};
	};
} forEach [WEST, EAST];