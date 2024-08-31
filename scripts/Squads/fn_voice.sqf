#include "squad_constants.inc"

// Global variables
SQD_AUDIBLE_PLAYERS = createHashMap;
SQD_SOUND_CHANGES = [];

0 spawn {
    private _deltaVoice = {
        params ["_player", "_playerId", "_newValue"];
        private _oldPlayerInfo = SQD_AUDIBLE_PLAYERS getOrDefault [_playerId, []];
        if (count _oldPlayerInfo == 2) then {
            private _oldPlayer = _oldPlayerInfo # 0;
            private _oldValue = _oldPlayerInfo # 1;
            if (_oldValue != _newValue || _oldPlayer != _player) then {
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
        [_player, _playerID, _isInMySquad] call _deltaVoice;
    };

    private _handleCommandChat = {
        params ["_player", "_playerId"];

        private _myPlayerId = getPlayerID player;
        private _amSquadLeader = ["isSquadLeader", [_myPlayerId]] call SQD_fnc_client;
        [_player, _playerID, _amSquadLeader] call _deltaVoice;
    };

    private _handleDirectChat = {
        params ["_player", "_playerId"];

        private _distance = player distanceSqr _player;
        [_player, _playerID, _distance < (40 * 40)] call _deltaVoice;
    };

    private _handleVehicleChat = {
        params ["_player", "_playerId"];

        private _myVehicle = vehicle player;
        private _playerVehicle = vehicle _player;
        [_player, _playerID, _myVehicle == _playerVehicle] call _deltaVoice;
    };

    private _myPlayerId = getPlayerID player;

    private _previousChannel = currentChannel;
    private _playerChannelVar = format ["SQD_Channel_%1", _myPlayerId];
    missionNamespace setVariable [_playerChannelVar, currentChannel, true];

    private _customChannels = missionNamespace getVariable ["SQD_VoiceChannels", [-1, -1]];
    private _customSideChannel = if (side player == west) then {
        _customChannels # 0
    } else {
        _customChannels # 1
    };

    private _chatters = [];

    private _voiceDisplay = uiNamespace getVariable ["RscWLVoiceDisplay", objNull];
    if (isNull _voiceDisplay) then {
        "VoiceDisplay" cutRsc ["RscWLVoiceDisplay", "PLAIN", -1, true, false];
        _voiceDisplay = uiNamespace getVariable "RscWLVoiceDisplay";
    };

    private _voiceDisplayBackground = _voiceDisplay displayCtrl 7200;
    private _voiceDisplayText = _voiceDisplay displayCtrl 7201;

    // Fast loop
    while { !BIS_WL_missionEnd } do {
        private _currentChannel = currentChannel;
        if (_currentChannel != _previousChannel) then {
            missionNamespace setVariable [_playerChannelVar, _currentChannel, true];
            _previousChannel = _currentChannel;
        };
        _chatters = [];
        {
            private _player = _x;
            private _playerID = getPlayerID _player;

            if (getPlayerChannel _player > 5) then {
                _chatters pushBack _player;
            };

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
                case (_customSideChannel + 5): {
                    [_player, _playerID] call _handleSideChat;
                };
                default {
                    [_player, _playerID] call _handleSideChat;
                };
            };
        } forEach allPlayers;

        private _chatterNames = (_chatters select { getPlayerVoNVolume _x > 0.01; }) apply {
            private _isSL = ["isSquadLeader", [getPlayerID _x]] call SQD_fnc_client;
            if (_isSL) then {
                format ["<t color='#ff0000'>%1 (SL)</t>", name _x];
            } else {
                name _x;
            };
        };
        if (count _chatterNames > 0) then {
            _voiceDisplayBackground ctrlShow true;
            private _chattersText = format ["%1: %2", localize "STR_SQUADS_talking", _chatterNames joinString ", "];
            _voiceDisplayText ctrlSetStructuredText parseText _chattersText;
            _voiceDisplayBackground ctrlSetPositionW ((_chattersText getTextWidth ["RobotoCondensed", 0.032]) + 0.016);
            _voiceDisplayBackground ctrlCommit 0;
        } else {
            _voiceDisplayBackground ctrlShow false;
            _voiceDisplayText ctrlSetText "";
        };

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

    private _isSquadLeaderOfSize = ["isSquadLeaderOfSize", [_myPlayerId, SQD_MIN_COMMAND_CHAT]] call SQD_fnc_client;
    if (_isSquadLeaderOfSize) then {
        2 enableChannel [true, true];
    } else {
        2 enableChannel [false, false];
    };

    sleep 1;
};