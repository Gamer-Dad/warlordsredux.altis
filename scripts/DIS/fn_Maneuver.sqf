#include "SAM.inc"

params ["_projectile"];

[_projectile] spawn {
    params ["_projectile"];
    private _startTime = time;
    private _isLOAL = getNumber (configfile >> "CfgAmmo" >> typeOf _projectile >> "autoSeekTarget") == 1;

    sleep 3;
    while { alive _projectile } do {
        // Ghost missile relocking check.
        if (_isLOAL && !(alive missileTarget _projectile)) exitWith {
            triggerAmmo _projectile;
        };        
        if (time > (_startTime + WL_SAM_TIMEOUT)) exitWith {
            triggerAmmo _projectile;
        };

        sleep 1;
    };
};

sleep 5;
while { alive _projectile } do {
    private _currentVector = velocityModelSpace _projectile;

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
    _projectile setVelocityModelSpace _newVector;

    sleep 0.1;
};
