params ["_sector"];

_infWest = count ((allUnits inAreaArray (_sector getVariable "objectAreaComplete")) select {side _x == west && {((side _x) in (_sector getVariable ["BIS_WL_previousOwners", []])) || {(missionNamespace getVariable (format ["BIS_WL_currentTarget_%1", side _x])) == _sector}}});
_infEast = count ((allUnits inAreaArray (_sector getVariable "objectAreaComplete")) select {side _x == east && {((side _x) in (_sector getVariable ["BIS_WL_previousOwners", []])) || {(missionNamespace getVariable (format ["BIS_WL_currentTarget_%1", side _x])) == _sector}}});
_infAaf = count ((allUnits inAreaArray (_sector getVariable "objectAreaComplete")) select {side _x == independent && {((side _x) in (_sector getVariable ["BIS_WL_previousOwners", []])) || {(missionNamespace getVariable (format ["BIS_WL_currentTarget_%1", side _x])) == _sector}}});

[[west, _infWest], [east, _infEast], [independent, _infAaf]];