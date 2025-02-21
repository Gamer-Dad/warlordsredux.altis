#include "constants.inc"

params ["_projectile", "_unit"];

[_projectile] spawn {
    params ["_projectile"];
    private _startTime = time;
    private _isLOAL = getNumber (configfile >> "CfgAmmo" >> typeOf _projectile >> "autoSeekTarget") == 1;

    while { alive _projectile } do {
        sleep 7;

        // Ghost missile relocking check.
        if (_isLOAL && !(alive missileTarget _projectile)) exitWith {
            triggerAmmo _projectile;
        };
        if (time > (_startTime + WL_SAM_TIMEOUT)) exitWith {
            triggerAmmo _projectile;
        };
    };
};

[_projectile, _unit] spawn {
    params ["_projectile", "_unit"];
    sleep 1;
    while { alive _projectile } do {
        sleep 0.5;
        private _missileTarget = missileTarget _projectile;
        private _missileTargetSide = _missileTarget getVariable ["BIS_WL_ownerAssetSide", side _missileTarget];
        private _projectileSide = side (group _unit);
        if (_missileTargetSide == _projectileSide) exitWith {
            triggerAmmo _projectile;
        };
    };
};

private _maxAcceleration = (getNumber (configfile >> "CfgAmmo" >> typeOf _projectile >> "thrust")) / 10.0 * WL_SAM_ACCELERATION_FACTOR;
private _maxSpeed = getNumber (configfile >> "CfgAmmo" >> typeOf _projectile >> "maxSpeed") * WL_SAM_MAX_SPEED_FACTOR;
sleep 1;
while { alive _projectile } do {
    private _currentVector = velocityModelSpace _projectile;
    private _currentSpeed = (_currentVector # 1) + ((_maxAcceleration * 0.01) min _maxSpeed);
    private _newVector = [
        0,
        _currentSpeed,
        0
    ];
    _projectile setVelocityModelSpace _newVector;
    private _angularVector = angularVelocityModelSpace _projectile;
    private _newAngularVector = _angularVector vectorMultiply 2.0;
    _projectile setAngularVelocityModelSpace _newAngularVector;
    sleep 0.001;
};
