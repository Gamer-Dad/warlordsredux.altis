// Global variables
SQD_AUDIBLE_PLAYERS = createHashMap;
SQD_SOUND_CHANGES = [];

0 spawn {
    private _myPlayerId = getPlayerID player;

    private _deltaVoice = {
        params ["_player", "_playerId", "_newValue"];
        private _oldPlayerInfo = SQD_AUDIBLE_PLAYERS getOrDefault [_playerId, []];
        if (count _oldPlayerInfo == 2) then { 
            private _oldValue = _oldPlayerInfo # 1;
            if (_oldValue != _newValue) then {
                if (_newValue) then {
                    SQD_SOUND_CHANGES pushBack [_player, 1];
                } else {
                    SQD_SOUND_CHANGES pushBack [_player, 0];
                };
            };
        } else {
            if (_newValue) then {
                SQD_SOUND_CHANGES pushBack [_player, 1];
            } else {
                SQD_SOUND_CHANGES pushBack [_player, 0];
            };
        };

        SQD_AUDIBLE_PLAYERS set [_playerId, [_player, _newValue]];
    };

    // Fast loop
    while { !BIS_WL_missionEnd } do {
        {
            private _player = _x;
            private _playerID = getPlayerID _player;

            if (_playerID == _myPlayerId) then { continue; };
            if (side _player != side player) then { continue; };
            
            private _isInMySquad = ["isInMySquad", [_playerID]] call SQD_fnc_client;
            private _isSpeakingInCommand = getPlayerChannel _player == 2;
            private _amSquadLeader = ["isSquadLeader", [_myPlayerId]] call SQD_fnc_client;
            if (_isInMySquad) then {
                private _isSquadLeader = ["isSquadLeader", [_playerID]] call SQD_fnc_client;
                if (!_isSquadLeader) then {
                    [_player, _playerID, true] call _deltaVoice;
                } else {
                    if (_isSpeakingInCommand) then {
                        [_player, _playerID, false] call _deltaVoice;
                    } else {
                        [_player, _playerID, true] call _deltaVoice;
                    };
                };
            } else {
                if (_isSpeakingInCommand && _amSquadLeader) then {
                    [_player, _playerID, true] call _deltaVoice;
                } else {
                    [_player, _playerID, false] call _deltaVoice;
                };
            };
        } forEach allPlayers;

        {
            private _playerInfo = _x;
            (_playerInfo # 0) setPlayerVoNVolume (_playerInfo # 1);
        } forEach SQD_SOUND_CHANGES;

        SQD_SOUND_CHANGES = [];

        sleep 0.1;
    };
};

// Slow loop
while { !BIS_WL_missionEnd } do {
    private _myPlayerId = getPlayerID player;

    private _isSquadLeader = ["isSquadLeader", [_myPlayerId]] call SQD_fnc_client;
    if (_isSquadLeader) then {
        2 enableChannel [true, true];
    } else {
        2 enableChannel [false, false];
    };

    sleep 5;
};