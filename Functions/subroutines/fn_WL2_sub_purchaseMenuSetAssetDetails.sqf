#include "..\warlords_constants.inc"

_display = uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull];

_purchase_category = _display displayCtrl 100;
_purchase_items = _display displayCtrl 101;
_purchase_pic = _display displayCtrl 102;
_purchase_info = _display displayCtrl 103;
_purchase_income = _display displayCtrl 104;
_purchase_info_asset = _display displayCtrl 105;
_purchase_title_cost = _display displayCtrl 106;
_purchase_request = _display displayCtrl 107;

_curSel = (lbCurSel _purchase_items) max 0;

_assetDetails = (_purchase_items lbData _curSel) splitString "|||";

_assetDetails params [
	"_className",
	"_requirements",
	"_displayName",
	"_picture",
	"_text",
	"_offset"
];

_requirements = call compile _requirements;

_purchase_pic ctrlSetStructuredText parseText format ["<img image = '%1' size = '%2' align = 'center' shadow = '0'></img>", _picture, (7.693 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];
_id = _purchase_category lbValue lbCurSel _purchase_category;
_purchase_info_asset ctrlSetStructuredText parseText format ["<t align = 'center' size = '%2'>%1</t>", _text, (0.85 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];
_cost = _purchase_items lbValue lbCurSel _purchase_items;

_purchase_title_cost ctrlSetStructuredText parseText format ["<t size = '%7' align = 'center' shadow = '0'>%1%8: %2 %3%4%5%6</t>", localize "STR_A3_WL_menu_cost", _cost, localize "STR_A3_WL_unit_cp", if ("A" in _requirements) then {", " + localize "STR_A3_WL_param32_title"} else {""}, if ("H" in _requirements) then {", " + localize "STR_A3_WL_module_service_helipad"} else {""}, if ("W" in _requirements) then {", " + localize "STR_A3_WL_param30_title"} else {""}, (1.25 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale), if (toLower language == "french") then {" "} else {""}];
call BIS_fnc_WL2_sub_purchaseMenuRefresh;