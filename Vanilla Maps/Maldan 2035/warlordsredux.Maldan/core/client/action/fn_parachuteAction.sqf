params ["_target", "_caller", "_actionId", "_arguments"];

private _callerPos = getPosATL _caller;
private _parachute = createVehicle ["Steerable_Parachute_F", _callerPos, [], 0, "CAN_COLLIDE"];
_parachute allowDamage false;
_caller moveInDriver _parachute;
_parachute setDir (getDir _caller);

[_parachute, _caller] spawn {
    params ["_parachute", "_caller"];
    waitUntil {
        sleep 1;
        !alive _parachute || !alive _caller || {lifeState _caller == "INCAPACITATED"}
    };
    deleteVehicle _parachute;
};

_caller removeAction _actionId;