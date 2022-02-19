#include "..\warlords_constants.inc"

_display = uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull];
_purchase_category = _display displayCtrl 100;
lbClear (_display displayCtrl 101);
_id = lbCurSel _purchase_category;

{
	_x params [
		"_className",
		"_cost",
		"_requirements",
		"_displayName",
		"_picture",
		"_text",
		["_offset", [0,0,0]]
	];
	(_display displayCtrl 101) lbAdd _displayName;
	if (_className == "RemoveUnits") then {uiNamespace setVariable ["BIS_WL_removeUnitsListID", -1 + lbSize (_display displayCtrl 101)]};
	(_display displayCtrl 101) lbSetData [_forEachIndex, format ["%1|||%2|||%3|||%4|||%5|||%6", _className, _requirements, _displayName, _picture, _text, _offset]];
	(_display displayCtrl 101) lbSetValue [_forEachIndex, _x # 1];
} forEach (WL_PLAYER_REQUISITION_LIST # _id);
(_display displayCtrl 101) lbSetCurSel ((uiNamespace getVariable ["BIS_WL_purchaseMenuLastSelection", [0, 0, 0]]) # 1);;
_purchase_items = _display displayCtrl 1;
(_display displayCtrl 103) ctrlSetStructuredText parseText format [
	"<t align = 'center' size = '%2'>%1</t>",
	[
		format [localize "STR_A3_WL_asset_infantry_info", BIS_WL_maxSubordinates ],
		localize "STR_A3_WL_asset_vehicles_info",
	 	localize "STR_A3_WL_asset_aircraft_info",
	 	localize "STR_A3_WL_asset_naval_info",
	 	localize "STR_A3_WL_asset_defences_info",
	 	localize "STR_A3_WL_asset_gear_info",
	 	""
	] # _id,
	(0.85 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)
];
call BIS_fnc_WL2_sub_purchaseMenuSetAssetDetails;