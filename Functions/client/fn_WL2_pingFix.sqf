params ["_position"];

uiNamespace setVariable ["WL2_pingPosition", _position];

private _existingPing = uiNamespace getVariable ["WL2_isPinging", false];
if (!_existingPing) then {
    playSound ["TacticalPing4", false];
    uiNamespace setVariable ["WL2_isPinging", true];
};

private _ping = addMissionEventHandler ["draw3D", {
    private _alpha = abs ((diag_tickTime * 180 % 100 - 50) / 50.0); 
    private _scale = [1.8, 2.2, _alpha] call BIS_fnc_lerp;
    drawIcon3D [
        "\a3\Ui_f\data\IGUI\Cfg\TacticalPing\TacticalPingDefault_ca",
        [0.75, 0.75, 0.5, 0.95],
        uiNamespace getVariable ["WL2_pingPosition", [0, 0, 0]],
        _scale,
        _scale,
        0,
        "",  
        true,
        0.03,
        "TahomaB",
        "center",
        true,
        0,
        -0.06
    ];
}];

sleep 5;

removeMissionEventHandler ["draw3D", _ping];
uiNamespace setVariable ["WL2_isPinging", false];