params ["_class", "_cost", "_category", "_requirements", "_offset"];

if (_category == "Defences") exitWith {
	"RequestMenu_close" call BIS_fnc_WL2_setupUI;
	[_class, _cost, _offset] spawn BIS_fnc_WL2_orderDefence;
};

if (_category == "Aircraft") exitWith {
	"RequestMenu_close" call BIS_fnc_WL2_setupUI;
	[_class, _cost, _requirements] spawn BIS_fnc_WL2_orderAircraft;
};

if (_category == "Naval") exitWith {
	"RequestMenu_close" call BIS_fnc_WL2_setupUI;
	[_class, _cost] spawn BIS_fnc_WL2_orderNaval;
};

"RequestMenu_close" call BIS_fnc_WL2_setupUI;
[_class, _cost] spawn BIS_fnc_WL2_orderVehicle;