#include "..\warlords_constants.inc"

private _sector = (_this # 1) getVariable ["BIS_WL_sector", objNull];

if (isNull _sector) exitWith {BIS_WL_highlightedSector = objNull; ((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlShow FALSE; ((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlEnable FALSE};

private _selectionActive = BIS_WL_currentSelection in [WL_ID_SELECTION_VOTING, WL_ID_SELECTION_VOTED, WL_ID_SELECTION_ORDERING_AIRCRAFT, WL_ID_SELECTION_FAST_TRAVEL, WL_ID_SELECTION_FAST_TRAVEL_CONTESTED, WL_ID_SELECTION_SCAN];
private _services = (_sector getVariable "BIS_WL_services");
private _airstrip = "A" in _services;
private _helipad = "H" in _services;
private _harbor = "W" in _services;

_lastScan = (_sector getVariable [format ["BIS_WL_lastScanEnd_%1", side group player], -9999]);
_scanCD = (_lastScan + (getMissionConfigValue ["BIS_WL_scanCooldown", 300]) - serverTime) max 0;
_capturing = count (_sector getVariable ["BIS_WL_seizingInfo", []]) > 1;
_percentage = if (_capturing) then {linearConversion [((_sector getVariable ["BIS_WL_seizingInfo", []]) # 1), ((_sector getVariable ["BIS_WL_seizingInfo", []]) # 2), serverTime, 0, 1]};
_color = (['#004d99', '#7f0400'] # ([west, east] find ((_sector getVariable ["BIS_WL_seizingInfo", []]) # 0)));

((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlSetPosition [(getMousePosition # 0) + safeZoneW / 100, (getMousePosition # 1) + safeZoneH / 50, safeZoneW, safeZoneH];
((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlCommit 0;
((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlSetStructuredText parseText format [
	if (_scanCD == 0) then {
		"<t shadow = '2' size = '%1'>%2<br/>+%3 %4/%5%6%7%8%9%10%11<br/> <t color = '%15'>%12</t></t>"
	} else {
		"<t shadow = '2' size = '%1'>%2<br/>+%3 %4/%5%6%7%8%9%10%11<br/>%12<br/>%13: <t color = '#ff4b4b'>%14</t></t>"
	},
	(1 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale),
	_sector getVariable "BIS_WL_name",
	_sector getVariable "BIS_WL_value",
	localize "STR_A3_WL_unit_cp",
	localize "STR_A3_rscmpprogress_min",
	if (_airstrip || {_helipad || {_harbor}}) then {"<br/>"} else {""},
	if (_airstrip) then {localize "STR_A3_WL_param32_title"} else {""},
	if (_airstrip && {(_helipad || {_harbor})}) then {", "} else {""},
	if (_helipad) then {localize "STR_A3_WL_module_service_helipad"} else {""},
	if ((_airstrip || {_helipad}) && {_harbor}) then {", "} else {""},
	if (_harbor) then {localize "STR_A3_WL_param30_title"} else {""},
	if (count (_sector getVariable ["BIS_WL_seizingInfo", []]) > 1) then {format ["%1%2", floor (_percentage * 100), "%"]} else {""},
	localize "STR_A3_WL_param_scan_timeout",
	[(ceil _scanCD), "MM:SS"] call BIS_fnc_secondsToString,
	_color
];

((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlShow TRUE;
((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlEnable TRUE;

if (!_selectionActive) exitWith {
	if ((_sector getVariable "BIS_WL_owner") == BIS_WL_playerSide) then {
		WL_CONTROL_MAP ctrlMapCursor ["Track", "HC_overFriendly"];
	} else {
		WL_CONTROL_MAP ctrlMapCursor ["Track", "HC_overEnemy"];
	};
	BIS_WL_highlightedSector = objNull
};

private _availableSectors = (switch (BIS_WL_currentSelection) do {
	case WL_ID_SELECTION_VOTING;
	case WL_ID_SELECTION_VOTED: {BIS_WL_sectorsArray # 1};
	case WL_ID_SELECTION_ORDERING_AIRCRAFT: {(BIS_WL_sectorsArray # 0) select {BIS_WL_orderedAssetRequirements isEqualTo (BIS_WL_orderedAssetRequirements arrayIntersect (_x getVariable "BIS_WL_services"))}};
	case WL_ID_SELECTION_FAST_TRAVEL: {(BIS_WL_sectorsArray # 2) select {(_x getVariable ["BIS_WL_owner", independent]) == (side (group player))}};
	case WL_ID_SELECTION_FAST_TRAVEL_CONTESTED: {[WL_TARGET_FRIENDLY]};
	case WL_ID_SELECTION_SCAN: {BIS_WL_sectorsArray # 3};
});

if (_sector in _availableSectors) then {
	WL_CONTROL_MAP ctrlMapCursor ["Track", "HC_overMission"]; 
	BIS_WL_highlightedSector = _sector;
	if !(BIS_WL_hoverSamplePlayed) then {
		playSound "clickSoft";
		BIS_WL_hoverSamplePlayed = TRUE;
	};
} else {
	WL_CONTROL_MAP ctrlMapCursor ["Track", "HC_unsel"]; 
	BIS_WL_highlightedSector = objNull;
};