SQD_HAS_INVITE = false;

0 spawn {
    private _playerID = getPlayerID player;

    private _voiceChannels = missionNamespace getVariable ["SQD_VoiceChannels", [-1, -1]];
    private _sideCustomChannel = if (side player == WEST) then {
        _voiceChannels # 0
    } else {
        _voiceChannels # 1
    };
    _sideCustomChannel radioChannelAdd [player];
    setCurrentChannel (_sideCustomChannel + 5);

    player addEventHandler ["Respawn", {
        params ["_unit", "_corpse"];

        private _voiceChannels = missionNamespace getVariable ["SQD_VoiceChannels", [-1, -1]];
        private _sideCustomChannel = if (side _unit == WEST) then {
            _voiceChannels # 0
        } else {
            _voiceChannels # 1
        };

        _sideCustomChannel radioChannelAdd [_unit];
        setCurrentChannel (_sideCustomChannel + 5);
    }];

    addMissionEventHandler ["HandleChatMessage", {
        params ["_channel", "_owner", "_from", "_text", "_person", "_name", "_strID", "_forcedDisplay", "_isPlayerMessage", "_sentenceType", "_chatMessageType", "_params"];

        private _voiceChannels = missionNamespace getVariable ["SQD_VoiceChannels", [-1, -1]];
        private _sideCustomChannel = if (side _person == WEST) then {
            _voiceChannels # 0
        } else {
            _voiceChannels # 1
        };

        if (_channel == (_sideCustomChannel + 5)) then {
            private _playerId = getPlayerID _person;
            private _isInMySquad = ["isInMySquad", [_playerId]] call SQD_fnc_client;
            if (_isInMySquad) then {
                private _squadName = ["getSquadNameOfPlayer", [_playerId]] call SQD_fnc_client;
                private _newFrom = format ["[%1] %2", _squadName, _from];
                [_newFrom, _text];
            } else {
                true;   // block
            };
        } else {
            false;
        };
    }];

    0 spawn SQD_fnc_voice;

    while { !BIS_WL_missionEnd } do {
        if (getPlayerChannel player > 5 && !(["isInSquad", [_playerID]] call SQD_fnc_client)) then {
            [true] call SQD_fnc_menu;
        };

        sleep 0.5;
    };
};