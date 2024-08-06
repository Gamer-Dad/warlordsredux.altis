#include "SAM.inc"

params ["_rocket"];

private _startManeuveringTime = time;

waitUntil {
    (alive missileTarget _rocket) || 
    (_startManeuveringTime + 5) < time
};

while { alive _rocket } do {
    private _currentVector = velocityModelSpace _rocket;

    private _currentSpeed = _currentVector # 1;
    if ((_currentSpeed + WL_SAM_ACCELERATION) < WL_SAM_MAX_SPEED) then {
        _currentSpeed = _currentSpeed + WL_SAM_ACCELERATION;
    } else {
        _currentSpeed = WL_SAM_MAX_SPEED;
    };

    private _newVector = [
        _currentVector # 0,
        _currentSpeed,
        _currentVector # 2
    ];
    _rocket setVelocityModelSpace _newVector;

    sleep 0.1;

    if (time > (_startManeuveringTime + WL_SAM_TIMEOUT)) exitWith {
        triggerAmmo _rocket;
    };
};
