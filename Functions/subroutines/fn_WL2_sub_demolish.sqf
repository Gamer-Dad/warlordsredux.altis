#include "..\warlords_constants.inc"

params ["_asset"];

private _demolishMessages = [
    format ["<t color='#ff0000'>%1</t>", "Kaboom (1)"],
    format ["<t color='#ffff00'>%1</t>", "Set explosive charges (2)"],
    format ["<t color='00ff00'>%1</t>", "Identify structural weakness (3)"],
    format ["<t color='#0000ff'>%1</t>", "Prepare for demolition (4)"]
];

private _turnsLeft = _asset getVariable ["WL_demolishTurnsLeft", 4];

[
    _asset,
    _demolishMessages # (_turnsLeft - 1),
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_secure_ca.paa",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_secure_ca.paa",
    "speed player < 1",
    "speed player < 1",
    {},
    {
        params ["_target", "_caller", "_actionId", "_arguments", "_frame", "_maxFrame"];
        if (_frame % 2 == 0) then {
            playSound3D ["\a3\sounds_f\arsenal\tools\minedetector_beep_01.wss", _target];
        };
    },
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        [_target, _caller, _actionId] spawn {
            params ["_target", "_caller", "_actionId"];

            private _turnsLeft = _target getVariable ["WL_demolishTurnsLeft", 3];
            _turnsLeft = _turnsLeft - 1;
            _target setVariable ["WL_demolishTurnsLeft", _turnsLeft, true];
            if (_turnsLeft <= 0) then {
                playSound3D ["a3\sounds_f\sfx\special_sfx\building_destroy_01.wss", _target];

                [_target, _caller] remoteExec ["BIS_fnc_WL2_killRewardHandle", 2];
                // don't call FF script, this prevents runway griefing

                _target setDamage [1, true, _caller];
                sleep 5;
                deleteVehicle _target;
            } else {
                [_target] spawn {
                    params ["_target"];
                    private _turnsLeft = _target getVariable ["WL_demolishTurnsLeft", 3];
                    private _smokeVehicle = switch (_turnsLeft) do {
                        case 3: {
                            "SmokeShellGreen";
                        };
                        case 2: {
                            "SmokeShellYellow";
                        };
                        case 1: {
                            "SmokeShellRed";
                        };
                    };
                    private _smoke = _smokeVehicle createVehicle (getPosATL _target);
                    sleep 5;
                    deleteVehicle _smoke;
                };

                [_target, _actionId] call BIS_fnc_holdActionRemove;
                [_target] call BIS_fnc_WL2_sub_demolish;
            };
        };
    },
    {},
    [],
    10,
    100,
    false,
    false
] call BIS_fnc_holdActionAdd;