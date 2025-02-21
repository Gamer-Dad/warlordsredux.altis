params ["_asset"];

if (_asset getVariable ["BIS_WL_jammerActivated", false] && isEngineOn _asset) then {
    _asset setVariable ["BIS_WL_jammerActivated", false, true];
    _asset setVariable ["BIS_WL_jammerActivating", false, true];
    playSoundUI ["a3\sounds_f_bootcamp\sfx\vr\simulation_fatal.wss"];
} else {
    if (_asset getVariable ["BIS_WL_jammerActivating", false]) exitWith {
        playSoundUI ["AddItemFailed"];
    };
    playSoundUI ["a3\sounds_f_bootcamp\sfx\vr\simulation_restart.wss"];

    _asset setVariable ["BIS_WL_jammerActivating", true, true];

    if (!isEngineOn _asset) then {
        [_asset] remoteExec ["WL2_fnc_dazzlerOn", 2];
    };

    [_asset] spawn {
        params ["_asset"];
        playSound3D ["a3\data_f_curator\sound\cfgsounds\air_raid.wss", _asset, false, getPosASL _asset, 5, 0.375, 2500];
        sleep 20;
        if (alive _asset && isEngineOn _asset) then {
            _asset setVariable ["BIS_WL_jammerActivated", true, true];
            _asset setVariable ["BIS_WL_jammerActivating", false, true];
        } else {
            _asset setVariable ["BIS_WL_jammerActivating", false, true];
        };
    };
};