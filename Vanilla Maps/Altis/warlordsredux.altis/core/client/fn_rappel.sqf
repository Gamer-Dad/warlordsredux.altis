params ["_caller", "_boat", "_tire", "_up"];

_caller setVariable ["WL2_rappelling", true];

private _rope = ropeCreate [_boat, "", _tire, [0, 0, 0], -1];
playSoundUI ["a3\sounds_f\air\sfx\sl_4hooksunlock.wss"];
sleep 1;

_caller switchMove "LadderRifleStatic";
_caller allowDamage false;
private _sound = playSoundUI ["a3\sounds_f\vehicles\air\noises\wind_open_int.wss", 0.5, 2, true];

private _segments = ropeSegments _rope;
if (!_up) then {
    reverse _segments;
};

private _rappelTime = if (_up) then {
    5
} else {
    3
};

private _timePerSegment = _rappelTime / count _segments;
{
    private _startPos = getPosASL _caller;
    private _endPos = getPosASL _x;

    private _interval = 0;
    private _startTime = serverTime;

    while { alive _caller && _interval < _timePerSegment } do {
        sleep 0.0001;
        _caller setVelocityTransformation [
            _startPos,
            _endPos,
            [0, 0, 0],
            [0, 0, 0],
            [0, 0, 1],
            [0, 0, 1],
            [0, 0, 1],
            [0, 0, 1],
            _interval / _timePerSegment
        ];
        _interval = serverTime - _startTime;
    };
} forEach _segments;

stopSound _sound;

private _finalPosition = if (_up) then {
    getPosASL _tire
} else {
    getPosASL _boat
};
_caller setVehiclePosition [_finalPosition vectorAdd [0, 0, 1.5], [], 0, "CAN_COLLIDE"];

_caller switchMove "NoActions";
sleep 1;
ropeDestroy _rope;
_caller allowDamage true;

_caller setVariable ["WL2_rappelling", false];