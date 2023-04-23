private _rocket = _this select 0;
private _target = _this select 1;
private _speed = 1000;
if ((count _this) > 2) then {
    _speed = _this select 2
};
private _minDistanceToTarget = 5;
while {!isNull _rocket && {!isNull _target}} do {
    private _currentPos = getPosASLVisual _rocket;
    private _targetPos = aimPos _target;
    private _forwardVector = vectorNormalized(_targetPos vectorDiff _currentPos);
    private _rightVector = (_forwardVector vectorCrossProduct[0,0,1])vectorMultiply -1;
    private _upVector = _forwardVector vectorCrossProduct _rightVector;
    private _targetVelocity = _forwardVector vectorMultiply _speed;
    _rocket setVectorDirAndUp[_forwardVector,_upVector];
    _rocket setVelocity _targetVelocity;
    if (isNull _rocket || {isNull _target} || {getPosASLVisual _rocket distance _targetPos <= _minDistanceToTarget}) exitWith {};
    if (time>-1) exitWith {};
    sleep 0.01;
};

