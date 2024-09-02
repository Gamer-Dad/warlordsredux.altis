#include "SAM.inc"
params ["_projectile", "_unit"];

private _isDisconnected = unitIsUAV _unit && isNull (getConnectedUAV player);

if (!(profileNamespace getVariable ["MRTM_disableMissileCameras", false]) && !_isDisconnected) then {
    private _existingProcess = uiNamespace getVariable ["APS_Camera_Process", objNull];
    private _existingCam = uiNamespace getVariable ["APS_Camera_Cam", objNull];

    if (!isNull _existingProcess) then {
        terminate _existingProcess;
    };

    if (!isNull _existingCam) then {
        _existingCam cameraEffect ["Terminate", "BACK TOP"];
        camDestroy _existingCam;
        "APS_Camera" cutFadeOut 0;
    };

    private _missileCamera = [_projectile, _unit] spawn DIS_fnc_MissileCamera;
    uiNamespace setVariable ["APS_Camera_Process", _missileCamera];
};