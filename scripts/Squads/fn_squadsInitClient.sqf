BIS_fnc_squadsMenu = compileFinal preprocessFileLineNumbers "scripts\Squads\fn_squadsMenu.sqf";
BIS_fnc_squadsClient = compileFinal preprocessFileLineNumbers "scripts\Squads\fn_squadsClient.sqf";
BIS_fnc_squadsPlayerSelectionChanged = compileFinal preprocessFileLineNumbers "scripts\Squads\fn_squadsPlayerSelectionChanged.sqf";
BIS_fnc_squadsSquadTreeSelectionChanged = compileFinal preprocessFileLineNumbers "scripts\Squads\fn_squadsSquadTreeSelectionChanged.sqf";

0 spawn {
    _playerID = getPlayerID player;
    while {true} do {
        // if we REALLY want to funnel people into squads, we can change this to side chat (ch1)
        if (getPlayerChannel player == 3 && !(["isInSquad", [_playerID]] call BIS_fnc_squadsClient)) then {
            [true] call BIS_fnc_squadsMenu;
        };
    
        sleep 1;
    };
};