[
    player,
    "<t color='#00ff00'>Revive<t>",
    "\a3\ui_f\data\igui\cfg\revive\overlayIcons\u100_ca.paa",
    "\a3\ui_f\data\igui\cfg\revive\overlayIcons\u100_ca.paa",
    "isPlayer cursorTarget && lifeState cursorTarget == 'INCAPACITATED' && side group cursorTarget == side group player && cursorTarget distance2D player < 3",
    "isPlayer cursorTarget && lifeState cursorTarget == 'INCAPACITATED' && side group cursorTarget == side group player && cursorTarget distance2D player < 3",
    {
        private _soundId = playSoundUI ["a3\sounds_f\characters\ingame\ainvpknlmstpslaywrfldnon_medic.wss"];
        player setVariable ["WL_reviveSound", _soundId];
    },
    {},
    {
        private _unit = cursorTarget;
        [_unit] remoteExec ["WL2_fnc_revive", _unit];
    },
    {
        private _soundId = player getVariable ["WL_reviveSound", -1];
        if (_soundId != -1) then {
            stopSound _soundId;
        };
    },
    [],
    5,
    100,
    false,
    false
] call BIS_fnc_holdActionAdd;

[
    player,
    "<t color='#ff0000'>Respawn</t>",
    "\a3\ui_f\data\igui\cfg\revive\overlayIcons\d100_ca.paa",
    "\a3\ui_f\data\igui\cfg\revive\overlayIcons\d100_ca.paa",
    "lifeState player == 'INCAPACITATED'",
    "lifeState player == 'INCAPACITATED'",
    {},
    {},
    {
        private _waitedTime = player getVariable ["WL_unconsciousTime", 0];
        private _originalRespawnTime = getMissionConfigValue ["respawnDelay", 30];
        private _newRespawnTime = (_originalRespawnTime - _waitedTime) max 5;
        setPlayerRespawnTime _newRespawnTime;
        forceRespawn player;
    },
    {},
    [],
    1,
    100,
    false,
    true
] call BIS_fnc_holdActionAdd;

player setCaptive false;
player setVariable ["WL2_alreadyHandled", false, 2];
player setVariable ["WL_unconsciousTime", 0];
setPlayerRespawnTime (getMissionConfigValue ["respawnDelay", 30]);