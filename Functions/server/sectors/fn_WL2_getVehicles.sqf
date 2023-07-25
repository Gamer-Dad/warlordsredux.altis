params ["_sector", "_info"];

private _return = _info;
private _sideArr = [west, east, independent];

{
	private _index = _sideArr find (side group _x);
	private _points = ((serverNamespace getVariable "BIS_WL2_cappingValues") getOrDefault [(typeOf _x), 0]);
	private _target = (missionNamespace getVariable (format ["BIS_WL_currentTarget_%1", side _x]));
	if (_points > 0 && {(side group _x) in _sideArr}) then {
		_return set [_index, [(_sideArr # _index), (((_return # _index) # 1) + _points)]];
	};
} forEach (((entities [["Car", "Tank", "Air"], ["Logic", "Man"], false, true]) inAreaArray (_sector getVariable "objectAreaComplete")) select {((side _x) in (_sector getVariable ["BIS_WL_previousOwners", []])) || {_target == _sector}});

_return;