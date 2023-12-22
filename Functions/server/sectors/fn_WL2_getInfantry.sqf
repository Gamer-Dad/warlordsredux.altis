params ["_sector"];

private _inArea = (allUnits inAreaArray (_sector getVariable "objectAreaComplete")) select {alive _x && {(isNull (objectParent _x))}};
_infWest = 0;
_infEast = 0;
_infAaf = 0;

{
    _unit = _x;
    _side = side _x;
    if (_side == independent) then {
        _infAaf = _infAaf + 1;
    } else {
        if ((_side in (_sector getVariable ["BIS_WL_previousOwners", []])) || {(missionNamespace getVariable (format ["BIS_WL_currentTarget_%1", _side])) == _sector}) then {
            if (_side == west) then {
                _infWest = _infWest + 1;
            } else {
                if (_side == east) then {
                    _infEast = _infEast + 1;
                };
            };
        };
    };
} forEach _inArea;

[[west, _infWest], [east, _infEast], [independent, _infAaf * 2]];