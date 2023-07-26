params ["_sector"];

_infWest = count ((allUnits inAreaArray (_sector getVariable "objectAreaComplete")) select {_unit = _x; ((side _x) == west) && {(isNull objectParent _x) && {((count ((synchronizedObjects _sector) select {typeOf _x == "Logic" && {side _unit == _x getVariable "BIS_WL_owner"}})) > 0) && {((side _x) in (_sector getVariable ["BIS_WL_previousOwners", []])) || {(missionNamespace getVariable (format ["BIS_WL_currentTarget_%1", side _x])) == _sector}}}}});
_infEast = count ((allUnits inAreaArray (_sector getVariable "objectAreaComplete")) select {_unit = _x; ((side _x) == east) && {(isNull objectParent _x) && {((count ((synchronizedObjects _sector) select {typeOf _x == "Logic" && {side _unit == _x getVariable "BIS_WL_owner"}})) > 0) && {((side _x) in (_sector getVariable ["BIS_WL_previousOwners", []])) || {(missionNamespace getVariable (format ["BIS_WL_currentTarget_%1", side _x])) == _sector}}}}});
_infAaf = count ((allUnits inAreaArray (_sector getVariable "objectAreaComplete")) select {((side _x) == independent) && (isNull objectParent _x)});

[[west, _infWest], [east, _infEast], [independent, _infAaf]];