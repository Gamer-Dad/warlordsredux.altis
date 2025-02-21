params ["_class", "_cost", "_category", "_requirements", "_offset"];

"RequestMenu_close" call WL2_fnc_setupUI;

if (_category == "Naval") exitWith {
	[_class, _cost] spawn WL2_fnc_orderNaval;
};

private _isPlane = "A" in _requirements;
if (_isPlane) then {
	[_class, _cost, _requirements] spawn WL2_fnc_orderAircraft;
} else {
	[_class, _cost, _offset] spawn WL2_fnc_orderVehicle;
};