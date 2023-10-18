params ["_asset"];

{
	_lb = lbAdd [1503, _x];
	lbSetData [1503, _lb, str ([_x, (_asset animationPhase _x)])];
	lbSetCurSel [1503, _lb];
} forEach ((animationNames _asset) select {(["showbag", _x, false] call BIS_fnc_inString) || {(["showtools", _x, false] call BIS_fnc_inString) || {(["showlog", _x, false] call BIS_fnc_inString)}}});