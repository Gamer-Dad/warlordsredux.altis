#include "..\warlords_constants.inc"

params ["_class", "_cost", "_category", "_requirements", "_offset"];

//[player, -_cost] call BIS_fnc_WL2_fundsControl;

if (_category == "Defences") exitWith {
	["RequestMenu_close"] call BIS_fnc_WL2_setupUI;
	[_class, _cost, _offset] spawn BIS_fnc_WL2_orderDefence;
};

if (_category == "Aircraft") exitWith {
	["RequestMenu_close"] call BIS_fnc_WL2_setupUI;
	[_class, _cost, _requirements] spawn BIS_fnc_WL2_orderAircraft;
};

if (_category == "Naval") exitWith {
	["RequestMenu_close"] call BIS_fnc_WL2_setupUI;
	[_class, _cost] spawn BIS_fnc_WL2_orderNaval;
};

if (_category == "Infantry") exitWith {
	["RequestMenu_close"] call BIS_fnc_WL2_setupUI;
	[_class, _cost] spawn BIS_fnc_WL2_orderAI;
};

if (_category == "Vehicles") exitWith {
	["RequestMenu_close"] call BIS_fnc_WL2_setupUI;
	[_class, _cost] spawn BIS_fnc_WL2_orderVehicle;
};

_display = uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull];
_purchase_queue = _display displayCtrl 109;
_purchase_category = _display displayCtrl 100;
_purchase_items = _display displayCtrl 101;

_i = _purchase_queue lbAdd (_purchase_items lbText lbCurSel _purchase_items);
_purchase_queue lbSetValue [_i, _cost];
if (lbCurSel _purchase_queue == -1) then {
	_purchase_queue lbSetCurSel 0;
};

BIS_WL_dropPool pushBack [_class, _cost, _purchase_items lbText lbCurSel _purchase_items, lbCurSel _purchase_category, lbCurSel _purchase_items];

call BIS_fnc_WL2_sub_purchaseMenuRefresh;