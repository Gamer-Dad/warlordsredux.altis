params ["_sector"];

private _return = _sector call BIS_fnc_WL2_getInfantry;
private _sideArr = [west, east, independent];

{
	private _index = _sideArr find (side group _x);
	private _points = ((serverNamespace getVariable "WL2_cappingValues") getOrDefault [(typeOf _x), 0]);
	if (_points > 0 && {(side _x) in _sideArr}) then {
		_return set [_index, [(_sideArr # _index), (((_return # _index) # 1) + _points)]];
	};
} forEach (((entities [["LandVehicle"], ["Logic", "Man"], false, true]) inAreaArray (_sector getVariable "objectAreaComplete")) select {((count (crew _x)) > 0) && {(((getPosASLW _x) select 2) > -2.7) && {(if (side _x == independent) then {true} else {_unit = _x; ((count ((synchronizedObjects _sector) select {typeOf _x == "Logic" && {side _unit == _x getVariable "BIS_WL_owner"}})) > 0) && {((side _x) in (_sector getVariable ["BIS_WL_previousOwners", []])) || {(missionNamespace getVariable (format ["BIS_WL_currentTarget_%1", side _x])) == _sector}}})}}});

_return;