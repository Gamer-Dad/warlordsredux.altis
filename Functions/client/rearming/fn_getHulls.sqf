params ["_asset"];

{
	_lb = lbAdd [1500, _x];
	lbSetData [1500, _lb, str ([_x, (_asset animationPhase _x)])];
	lbSetCurSel [1500, _lb];
} forEach ((animationNames _asset) select {["showslat", _x, false] call BIS_fnc_inString});	