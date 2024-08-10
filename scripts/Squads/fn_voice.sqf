// Global variables
SQD_AUDIBLE_PLAYERS = createHashMap;
SQD_SOUND_CHANGES = [];

0 spawn {
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

    private _handleSideChat = {
        params ["_player", "_playerId"];
        
        private _isInMySquad = ["isInMySquad", [_playerID]] call SQD_fnc_client;
        private _isSpeakingInCommand = getPlayerChannel _player == 2;

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
            [_player, _playerID, false] call _deltaVoice;
        };
    };

    private _handleCommandChat = {
        params ["_player", "_playerId"];

        private _myPlayerId = getPlayerID player;
        private _amSquadLeader = ["isSquadLeader", [_myPlayerId]] call SQD_fnc_client;
        if (_amSquadLeader) then {
            [_player, _playerID, true] call _deltaVoice;
        } else {
            [_player, _playerID, false] call _deltaVoice;
        };
    };

    private _handleDirectChat = {
        params ["_player", "_playerId"];

        private _distance = player distanceSqr _player;
        if (_distance < (40 * 40)) then {
            [_player, _playerID, true] call _deltaVoice;
        } else {
            [_player, _playerID, false] call _deltaVoice;
        };
    };

    private _handleVehicleChat = {
        params ["_player", "_playerId"];

        private _myVehicle = vehicle player;
        private _playerVehicle = vehicle _player;
        if (_myVehicle == _playerVehicle) then {
            [_player, _playerID, true] call _deltaVoice;
        } else {
            [_player, _playerID, false] call _deltaVoice;
        };
    };

    private _previousChannel = currentChannel;
    private _myPlayerId = getPlayerID player;
    // Fast loop
    while { !BIS_WL_missionEnd } do {
        private _currentChannel = currentChannel;
        if (currentChannel != _previousChannel) then {
            private _playerChannelVar = format ["SQD_Channel_%1", _myPlayerId];
            missionNamespace setVariable [_playerChannelVar, currentChannel, true];
            _previousChannel = currentChannel;
        };

        {
            private _player = _x;
            private _playerID = getPlayerID _player;

            if (_playerID == _myPlayerId) then { continue; };

            private _playerChannelVar = format ["SQD_Channel_%1", _playerID];
            private _playerChannel = missionNamespace getVariable [_playerChannelVar, 1];

            // private _playerChannel = getPlayerChannel _player;
            switch (_playerChannel) do {
                case 1: {
                    [_player, _playerID] call _handleSideChat;
                };
                case 2: {
                    [_player, _playerID] call _handleCommandChat;
                };
                case 4: {
                    [_player, _playerID] call _handleVehicleChat;
                };
                case 5: {
                    [_player, _playerID] call _handleDirectChat;
                };
                default {
                    [_player, _playerID] call _handleSideChat;
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
    private _wasSquadLeader = (channelEnabled 2) # 1;
    if (_isSquadLeader && !_wasSquadLeader) then {
        2 enableChannel [true, true];
    } else {
        if (!_isSquadLeader && _wasSquadLeader) then {
            2 enableChannel [false, false];
        };
    };

    sleep 5;
};