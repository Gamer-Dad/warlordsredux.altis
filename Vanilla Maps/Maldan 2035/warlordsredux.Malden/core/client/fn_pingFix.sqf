params ["_position"];

uiNamespace setVariable ["WL2_pingPosition", _position];
playSound ["TacticalPing4", false];

private _r = profileNamespace getVariable ['IGUI_TACTPING_RGB_R', 1.0];
private _g = profileNamespace getVariable ['IGUI_TACTPING_RGB_G', 0.8];
private _b = profileNamespace getVariable ['IGUI_TACTPING_RGB_B', 0.2];
private _a = profileNamespace getVariable ['IGUI_TACTPING_RGB_A', 1.0];

uiNamespace setVariable ["WL2_pingColor", [_r, _g, _b, _a]];

private _ping = addMissionEventHandler ["draw3D", {
    private _alpha = abs ((diag_tickTime * 180 % 100 - 50) / 50.0);
    private _scale = [1.8, 2.2, _alpha] call BIS_fnc_lerp;
    drawIcon3D [
        "\a3\Ui_f\data\IGUI\Cfg\TacticalPing\TacticalPingDefault_ca",
        uiNamespace getVariable ["WL2_pingColor", [1, 0.8, 0.2, 1]],
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

sleep 9;

removeMissionEventHandler ["draw3D", _ping];