params ["_sector"];

_infWest = count ((allUnits inAreaArray (_sector getVariable "objectAreaComplete")) select {side _x == west});
_infEast = count ((allUnits inAreaArray (_sector getVariable "objectAreaComplete")) select {side _x == east});
_infAaf = count ((allUnits inAreaArray (_sector getVariable "objectAreaComplete")) select {side _x == independent});

[[west, _infWest], [east, _infEast], [independent, _infAaf]];