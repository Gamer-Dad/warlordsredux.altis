#include "constants.inc"

params ["_projectile", "_unit"];

private _originalPipViewDistance = getPiPViewDistance;
setPiPViewDistance viewDistance;

"APS_Camera" cutRsc ["RscTitleDisplayEmpty", "PLAIN", -1, true, true];

private _display = uiNamespace getVariable "RscTitleDisplayEmpty";

private _pictureSize = 1.5;

private _defaultTitlePosition = [safezoneX + 0.2, safezoneY + 0.1, 0.4 * _pictureSize, 0.05];
private _defaultPicturePosition = [safezoneX + 0.2, safeZoneY + 0.15, 0.4 * _pictureSize, 0.4 * _pictureSize];

private _titleBar = _display ctrlCreate ["RscText", -1];
_titleBar ctrlSetPosition _defaultTitlePosition;
_titleBar ctrlSetBackgroundColor [0, 0, 0, 0.9];
_titleBar ctrlSetTextColor [1, 1, 1, 1];
_titleBar ctrlSetText "Missile Camera";
_titleBar ctrlCommit 0;

private _pictureControl = _display ctrlCreate ["RscPicture", -1];
_pictureControl ctrlSetPosition _defaultPicturePosition;
_pictureControl ctrlSetText "#(argb,512,512,1)r2t(rtt1,1.0)";
_pictureControl ctrlCommit 0;

private _camera = "camera" camCreate (position _projectile);
_camera cameraEffect ["Internal", "BACK TOP", "rtt1"];

"rtt1" setPiPEffect [currentVisionMode player];

uiNamespace setVariable ["APS_Camera_Cam", _camera];

private _stop = false;
private _lastKnownPosition = position _unit;
private _lastKnownDirection = _projectile modelToWorld [0, 1000, 0];
private _startTime = time;

_camera camSetTarget _projectile;
_camera camSetRelPos [0, -3, 0.4];
_camera camCommit 0;

_camera attachTo [_projectile];

[_camera, _titleBar, _pictureControl, _defaultTitlePosition, _defaultPicturePosition] spawn {
    params ["_camera", "_titleBar", "_pictureControl", "_defaultTitlePosition", "_defaultPicturePosition"];
    private _opticsMode = false;
    while { !isNull _camera } do {
        if (inputAction "opticsMode" > 0) then {
            waitUntil {inputAction "opticsMode" == 0};
            _opticsMode = !_opticsMode;

            if (_opticsMode) then {
                _titleBar ctrlSetPosition [safeZoneX / 2, safeZoneY / 2 - 0.05, 1 - safeZoneX, 0.05];
                _pictureControl ctrlSetPosition [safeZoneX / 2, safeZoneY / 2, 1 - safeZoneX, 1 - safeZoneY];
            } else {
                _titleBar ctrlSetPosition _defaultTitlePosition;
                _pictureControl ctrlSetPosition _defaultPicturePosition;
            };

            _titleBar ctrlCommit 0;
            _pictureControl ctrlCommit 0;
        };
    };
};

while { !_stop } do {
    sleep 0.5;

    private _projectilePosition = position _projectile;
    private _projectileDirection = _projectile modelToWorld [0, 1000, 0];
    private _isDestroyed = _projectilePosition isEqualTo [0, 0, 0] || _projectileDirection isEqualTo [0, 0, 0];
    private _expired = (time - _startTime) > WL_SAM_TIMEOUT;
    private _disconnected = unitIsUAV _unit && isNull (getConnectedUAV player);

    _stop = isNull _projectile || !alive _projectile || _isDestroyed || _expired || _disconnected;

    "rtt1" setPiPEffect [currentVisionMode player];

    if (!_stop) then {
        _lastKnownPosition = _projectilePosition;
        _lastKnownDirection = _projectileDirection;
    };
};

_camera camSetPos _lastKnownPosition;
_camera camSetTarget _lastKnownDirection;
_camera camCommit 0;

sleep 1.5;

_camera cameraEffect ["Terminate", "BACK TOP"];
camDestroy _camera;
"APS_Camera" cutFadeOut 0;

setPiPViewDistance _originalPipViewDistance;