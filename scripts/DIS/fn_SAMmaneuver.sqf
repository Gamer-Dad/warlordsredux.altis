params ["_rocket", "_speed", "_acceleration", "_maxSpeed", "_time"];
_acceleration = 50;
_maxSpeed = 800;
_time = time + 5;
waitUntil {(alive missileTarget _rocket) or _time < time};
if (!(alive missileTarget _rocket)) exitWith {triggerAmmo _rocket};
while {alive _rocket} do {
    _speed = velocityModelSpace _rocket;
    if (((_speed select 1) + _acceleration) < _maxSpeed) then {
        _acceleration = (_acceleration + 50);
    } else {
        _acceleration = _maxSpeed;
    };
    _newVelocity = [
    _speed select 0,
    _acceleration,
    _speed select 2
    ];
    _rocket setVelocityModelSpace _newVelocity;
    sleep 0.1;
};
