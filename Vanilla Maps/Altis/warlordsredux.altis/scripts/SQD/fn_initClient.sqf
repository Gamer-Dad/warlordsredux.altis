SQD_HAS_INVITE = false;

if (side group player == independent) exitWith {};

0 spawn {
    private _playerID = getPlayerID player;

    private _voiceChannels = missionNamespace getVariable ["SQD_VoiceChannels", [-1, -1]];
    private _sideCustomChannel = if (side player == WEST) then {
        _voiceChannels # 0
    } else {
        _voiceChannels # 1
    };
    _sideCustomChannel radioChannelAdd [player];

    0 spawn SQD_fnc_voice;

    while { !BIS_WL_missionEnd } do {
        if (getPlayerChannel player > 5 && !(["isInSquad", [_playerID]] call SQD_fnc_client)) then {
            [true] call SQD_fnc_menu;
        };

        sleep 0.5;
    };
};