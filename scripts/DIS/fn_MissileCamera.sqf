#include "SAM.inc"

params ["_projectile", "_unit"];

private _originalPipViewDistance = getPiPViewDistance;
setPiPViewDistance viewDistance;

"APS_Camera" cutRsc ["RscTitleDisplayEmpty", "PLAIN", -1, false, true];

private _display = uiNamespace getVariable "RscTitleDisplayEmpty";

private _pictureSize = 1.5;

private _titleBar = _display ctrlCreate ["RscText", -1];
_titleBar ctrlSetPosition [safezoneX + 0.2, safezoneY + 0.1, 0.3 * _pictureSize, 0.05];
_titleBar ctrlSetBackgroundColor [0, 0, 0, 0.9];
_titleBar ctrlSetTextColor [1, 1, 1, 1];
_titleBar ctrlSetText "Missile Camera";
_titleBar ctrlCommit 0;

private _pictureControl = _display ctrlCreate ["RscPicture", -1];
_pictureControl ctrlSetPosition [safezoneX + 0.2, safeZoneY + 0.15, 0.3 * _pictureSize, 0.4 * _pictureSize];
_pictureControl ctrlSetText "#(argb,512,512,1)r2t(rtt1,1.0)";
_pictureControl ctrlCommit 0;

private _camera = "camera" camCreate (position _projectile); 
_camera cameraEffect ["Internal", "BACK TOP", "rtt1"];

private _visionMode = (_unit currentVisionMode []) # 0;
"rtt1" setPiPEffect [_visionMode];

uiNamespace setVariable ["APS_Camera_Cam", _camera];

private _stop = false;
private _lastKnownPosition = position _unit;
private _lastKnownDirection = _projectile modelToWorld [0, 1000, 0];
private _startTime = time;

while { !_stop } do {
    private _projectilePosition = position _projectile;
    private _projectileDirection = _projectile modelToWorld [0, 1000, 0];
    private _isDestroyed = _projectilePosition isEqualTo [0, 0, 0] || _projectileDirection isEqualTo [0, 0, 0];
    private _expired = (time - _startTime) > WL_SAM_TIMEOUT;
    private _disconnected = unitIsUAV _unit && isNull (getConnectedUAV player);

    _stop = isNull _projectile || !alive _projectile || _isDestroyed || _expired || _disconnected;
    
    if (!_stop) then {
        _lastKnownPosition = _projectilePosition;
        _lastKnownDirection = _projectileDirection;

        _camera camSetTarget _projectile;
        _camera camSetRelPos [0, -3, 0.4];
        _camera camCommit 0;
    } else {
        _camera camSetPos _lastKnownPosition;
        _camera camSetTarget _lastKnownDirection;
        _camera camCommit 0;
    };
};

sleep 1.5;

_camera cameraEffect ["Terminate", "BACK TOP"];
camDestroy _camera;
"APS_Camera" cutFadeOut 0;

setPiPViewDistance _originalPipViewDistance;