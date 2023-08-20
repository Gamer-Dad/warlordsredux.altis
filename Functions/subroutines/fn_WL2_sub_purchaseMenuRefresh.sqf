#include "..\warlords_constants.inc"

_display = uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull];

if (isNull _display) exitWith {};

_purchase_category = _display displayCtrl 100;
_purchase_items = _display displayCtrl 101;
_purchase_pic = _display displayCtrl 102;
_purchase_info = _display displayCtrl 103;
_purchase_income = _display displayCtrl 104;
_purchase_info_asset = _display displayCtrl 105;
_purchase_title_cost = _display displayCtrl 106;
_purchase_request = _display displayCtrl 107;

_funds = ((missionNamespace getVariable "fundsDatabaseClients") get (getPlayerUID player));
_matesAvail = (BIS_WL_matesAvailable + 1 - count ((units group player) select {(_x getVariable ["BIS_WL_ownerAsset", "123"]) == getPlayerUID player})) max 0;
_servicesAvailable = BIS_WL_sectorsArray # 5;

_purchase_income ctrlSetStructuredText parseText format ["<t size = '%7' align = 'center' shadow = '2'>%2 %3%4%5%6, " + localize "STR_A3_WL_max_group_size" + "</t>", _matesAvail, _funds, localize "STR_A3_WL_unit_cp", if ("A" in _servicesAvailable) then {", " + localize "STR_A3_WL_param32_title"} else {""}, if ("H" in _servicesAvailable) then {", " + localize "STR_A3_WL_module_service_helipad"} else {""}, if ("W" in _servicesAvailable) then {", " + localize "STR_A3_WL_param30_title"} else {""}, (1.5 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];

_i = 0;
for "_i" from 0 to ((lbSize _purchase_items) - 1) do {
	_cost = _purchase_items lbValue _i;
	_assetDetails = (_purchase_items lbData _i) splitString "|||";
	
	_assetDetails params [
		"_className",
		"_requirements",
		"_displayName",
		"_picture",
		"_text",
		"_offset"
	];
	
	_requirements = call compile _requirements;
	_category = WL_REQUISITION_CATEGORIES # ((lbCurSel _purchase_category) max 0);
	_availability = call BIS_fnc_WL2_sub_purchaseMenuAssetAvailability;
	if (!(_availability # 0)) then {
		_purchase_items lbSetColor [_i, [0.5, 0.5, 0.5, 1]];
		_purchase_items lbSetTooltip [_i, _availability # 1];
	} else {
		_purchase_items lbSetColor [_i, [1, 1, 1, 1]];
		_purchase_items lbSetTooltip [_i, ""];
	};
};

_id = _purchase_category lbValue lbCurSel _purchase_category;
_curSel = lbCurSel _purchase_items;

if (_curSel == -1) then {
	_purchase_items lbSetCurSel 0;
	_curSel = 0;
};

_assetDetails = (_purchase_items lbData _curSel) splitString "|||";

_assetDetails params [
	"_className",
	"_requirements",
	"_displayName",
	"_picture",
	"_text",
	"_offset"
];

if (count _assetDetails > 0) then {
	_cost = _purchase_items lbValue _curSel;
	_requirements = call compile _requirements;
	_category = WL_REQUISITION_CATEGORIES # ((lbCurSel _purchase_category) max 0);
	_color = BIS_WL_colorFriendly;
	_availability = call BIS_fnc_WL2_sub_purchaseMenuAssetAvailability;
	_purchase_request ctrlSetTooltipColorBox [1, 1, 1, 1];
	_purchase_request ctrlSetTooltipColorText [1, 1, 1, 1];
	if (_id == 6) then {
		_removeUnitsID = uiNamespace getVariable ["BIS_WL_removeUnitsListID", -1];
		if (_removeUnitsID != -1) then {
			_selectedCnt = count ((groupSelectedUnits player) select {_x != player && {(_x getVariable ["BIS_WL_ownerAsset", "123"]) == (getPlayerUID player)}});
			if (_selectedCnt > 0) then {
				_purchase_items lbSetText [_removeUnitsID, format [(localize "STR_A3_WL_feature_dismiss_selected") + " (%1)", _selectedCnt]];
			} else {
				_purchase_items lbSetText [_removeUnitsID, localize "STR_A3_WL_feature_dismiss_selected"];
			};
		};
	};
	if (_availability # 0 && {ctrlEnabled _purchase_request}) then {
		uiNamespace setVariable ["BIS_WL_purchaseMenuItemAffordable", TRUE];
		if (uiNamespace getVariable ["BIS_WL_purchaseMenuButtonHover", FALSE]) then {
			_color = BIS_WL_colorFriendly;
			_purchase_request ctrlSetBackgroundColor [(_color # 0) * 1.25, (_color # 1) * 1.25, (_color # 2) * 1.25, _color # 3];
		} else {
			_purchase_request ctrlSetBackgroundColor _color;
		};
		_purchase_request ctrlSetTextColor [1, 1, 1, 1];
		_purchase_request ctrlSetTooltip "";
		_DLCOwned = _availability # 2;
		_DLCTooltip = _availability # 3;
		if !(_DLCOwned) then {
			_purchase_request ctrlSetTooltip _DLCTooltip;
			_purchase_request ctrlSetTooltipColorText [1, 0, 0, 1];
			_purchase_request ctrlSetTooltipColorBox [1, 0, 0, 1];
		};
	} else {
		uiNamespace setVariable ["BIS_WL_purchaseMenuItemAffordable", FALSE];
		_purchase_request ctrlSetBackgroundColor [(_color # 0) * 0.5, (_color # 1) * 0.5, (_color # 2) * 0.5, _color # 3];
		_purchase_request ctrlSetTextColor [0.5, 0.5, 0.5, 1];
		_purchase_request ctrlSetTooltip (_availability # 1);
	};
};