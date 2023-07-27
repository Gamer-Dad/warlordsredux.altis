params ["_sector"];

private _inArea = (allUnits inAreaArray (_sector getVariable "objectAreaComplete"));
_infWest = count (_inArea select {_unit = _x; ((side _x) == west) && {(isNull (objectParent _x)) && {((side _x) in (_sector getVariable ["BIS_WL_previousOwners", []])) || {(missionNamespace getVariable (format ["BIS_WL_currentTarget_%1", side _x])) == _sector}}}});
_infEast = count (_inArea select {_unit = _x; ((side _x) == east) && {(isNull (objectParent _x)) && {((side _x) in (_sector getVariable ["BIS_WL_previousOwners", []])) || {(missionNamespace getVariable (format ["BIS_WL_currentTarget_%1", side _x])) == _sector}}}});
_infAaf = count (_inArea select {((side _x) == independent) && (isNull (objectParent _x))});

[[west, _infWest], [east, _infEast], [independent, _infAaf]];