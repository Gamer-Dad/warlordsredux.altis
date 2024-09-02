if (isNil "SQUAD_MANAGER") then {
    SQUAD_MANAGER = [];
    // Structure:
    // [Squad Name, Leader, [Members], Side]
};
missionNamespace setVariable ["SQUAD_MANAGER", SQUAD_MANAGER, true];

if (isNil "WL_PlayerSquadContribution") then {
    WL_PlayerSquadContribution = createHashMap;
};
missionNamespace setVariable ["WL_PlayerSquadContribution", WL_PlayerSquadContribution, true];

addMissionEventHandler ["PlayerDisconnected", {
    params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
    private _playerId = format ["%1", _id];
    ["remove", [_playerId]] call SQD_fnc_server;
}];

WEST_VOICE_CHANNEL = radioChannelCreate [[0.56, 0.93, 0.56, 1], "Squads channel", "%UNIT_NAME", []];
EAST_VOICE_CHANNEL = radioChannelCreate [[0.56, 0.93, 0.56, 1], "Squads channel", "%UNIT_NAME", []];

missionNamespace setVariable ["SQD_VoiceChannels", [WEST_VOICE_CHANNEL, EAST_VOICE_CHANNEL], true];

// Clean up the squad manager
0 spawn {
    while { !BIS_WL_missionEnd } do {
        // clean up squads when everyone goes to the lobby
        private _squadManager = SQUAD_MANAGER;
        {
            private _squad = _x;
            private _members = _squad select 2;
            
            {
                private _member = _x;
                private _danglingSquadmate = allPlayers findIf {getPlayerID _x == _member} == -1;

                if (_danglingSquadmate) then {
                    ["remove", [_member]] call SQD_fnc_server;
                };
            } forEach _members;
        } forEach _squadManager;

        sleep 30;
    };
};