params ["_target", "_caller"];

if (!alive _target) exitWith {
    false
};

if (vehicle _caller != _target) exitWith {
    false
};

if (driver _target != player) exitWith {
    false
};

private _eligibleCrew = (crew _target) select {
    alive _x && !(isPlayer _x)
};

if (count _eligibleCrew == 0) exitWith {
    false
};

true;