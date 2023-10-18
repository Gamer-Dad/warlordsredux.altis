params ["_asset"];

{
	_lb = lbAdd [1501, _x];
	lbSetData [1501, _lb, str ([_x, (_asset animationPhase _x)])];
	lbSetCurSel [1501, _lb];
} forEach ((animationNames _asset) select {["showcamonet", _x, false] call BIS_fnc_inString});