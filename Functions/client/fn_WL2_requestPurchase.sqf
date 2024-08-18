params ["_class", "_cost", "_category", "_requirements", "_offset"];

"RequestMenu_close" call BIS_fnc_WL2_setupUI;

if (_category == "Defences") exitWith {
	[_class, _cost, _offset] spawn BIS_fnc_WL2_orderDefence;
};

if (_category == "Naval") exitWith {
	[_class, _cost] spawn BIS_fnc_WL2_orderNaval;
};

private _isPlane = "A" in _requirements;
if (_isPlane) then {
	[_class, _cost, _requirements] spawn BIS_fnc_WL2_orderAircraft;
} else {
	[_class, _cost] spawn BIS_fnc_WL2_orderVehicle;
};