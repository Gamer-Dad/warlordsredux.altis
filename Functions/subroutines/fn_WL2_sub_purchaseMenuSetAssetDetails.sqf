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
	"_offset",
	"_categoryId"
];

_requirements = call compile _requirements;

_purchase_pic ctrlSetStructuredText parseText format ["<img image = '%1' size = '%2' align = 'center' shadow = '0'></img>", _picture, (7.693 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];
_id = _purchase_category lbValue lbCurSel _purchase_category;
_purchase_info_asset ctrlSetStructuredText parseText format ["<t align = 'center' size = '%2'>%1</t>", _text, (0.85 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];
_cost = _purchase_items lbValue lbCurSel _purchase_items;

_funds = ((missionNamespace getVariable "fundsDatabaseClients") get (getPlayerUID player));
_supplies = player call BIS_fnc_WL2_getSectorSupply;

_supplyCostText = if (!WL_LOGISTICS_ENABLED || {_categoryId == "3"}) then {
	""
} else {
	if (_categoryId == "6" && {!(_className in ["FTSeized"])}) then {
		""
	} else {
		_supplyCost = switch _className do {
			case ("FTSeized"): { WL_LOGISTICS_FAST_TRAVEL_COST };
			case ("B_Truck_01_ammo_F"): { WL_LOGISTICS_LARGE_AMMO_COST };
			case ("O_Truck_03_ammo_F"): { WL_LOGISTICS_LARGE_AMMO_COST };
			case ("B_Slingload_01_Ammo_F"): { WL_LOGISTICS_LARGE_AMMO_COST };
			case ("Land_Pod_Heli_Transport_04_ammo_F"): { WL_LOGISTICS_LARGE_AMMO_COST };
			case ("Box_NATO_AmmoVeh_F"): { WL_LOGISTICS_SMALL_AMMO_COST };
			case ("Box_East_AmmoVeh_F"): { WL_LOGISTICS_SMALL_AMMO_COST };
			default { _cost };
		};
		if (_supplyCost == 0) then { "" } else {
			if (_supplyCost > _supplies) then {
				format [", <t color='#FF7276'>%1 %2</t>", _supplyCost, localize "STR_A3_WL_supplies"];
			} else {
				format [", %1 %2", _supplyCost, localize "STR_A3_WL_supplies"];
			};
		};
	}
};

_costText = if (_cost == 0) then { "" } else {
	if (_cost > _funds) then {
		format ["<t color='#FF7276'>%1 %2</t>", _cost, localize "STR_A3_WL_unit_cp"];
	} else {
		format ["%1 %2", _cost, localize "STR_A3_WL_unit_cp"];
	};
};

_purchase_title_cost ctrlSetStructuredText parseText format ["<t size = '%7' align = 'center' shadow = '0'>%1%8: %2%3%4%5%6</t>", localize "STR_A3_WL_menu_cost", _costText, _supplyCostText, if ("A" in _requirements) then {", " + localize "STR_A3_WL_param32_title"} else {""}, if ("H" in _requirements) then {", " + localize "STR_A3_WL_module_service_helipad"} else {""}, if ("W" in _requirements) then {", " + localize "STR_A3_WL_param30_title"} else {""}, (1.25 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale), if (toLower language == "french") then {" "} else {""}];
call BIS_fnc_WL2_sub_purchaseMenuRefresh;