params ["_sector", "_info"];

private _return = _info;
private _sideArr = [west, east, independent];

{
	private _index = _sideArr find (side group _x);
	private _points = ((serverNamespace getVariable "BIS_WL2_cappingValues") getOrDefault [(typeOf _x), 0]);
	if (_points > 0 && {(side group _x) in _sideArr}) then {
		_return set [_index, [(_sideArr # _index), (((_return # _index) # 1) + _points)]];
	};
} forEach ((entities [["Car", "Tank", "Air"], ["Logic", "Man"], false, true]) inAreaArray (_sector getVariable "objectAreaComplete"));

_return;