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

SQUADS_API = compileFinal preprocessFileLineNumbers "scripts\Squads\fn_squadsServer.sqf";

// Clean up the squad manager
0 spawn {
    addMissionEventHandler ["PlayerDisconnected", {
        params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
        private _playerId = format ["%1", _id];
        ["remove", [_playerId]] call SQUADS_API;
    }];

    while {true} do {
        // clean up squads when everyone goes to the lobby
        private _squadManager = SQUAD_MANAGER;
        {
            private _squad = _x;
            private _members = _squad select 2;
            
            {
                private _member = _x;
                private _danglingSquadmate = allPlayers findIf {getPlayerID _x == _member} == -1;

                if (_danglingSquadmate) then {
                    ["remove", [_member]] call SQUADS_API;
                };
            } forEach _members;
        } forEach _squadManager;

        sleep 30;
    };
};