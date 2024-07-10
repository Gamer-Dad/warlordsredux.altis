SQD_HAS_INVITE = false;

0 spawn {
    private _playerID = getPlayerID player;

    0 spawn SQD_fnc_voice;
    while { !BIS_WL_missionEnd } do {
        if (getPlayerChannel player == 1 && !(["isInSquad", [_playerID]] call SQD_fnc_client)) then {
            [true] call SQD_fnc_menu;
        };
    
        sleep 1;
    };
};