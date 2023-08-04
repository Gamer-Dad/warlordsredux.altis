#include "..\warlords_constants.inc"

private _sector = (_this # 1) getVariable ["BIS_WL_sector", objNull];

if (isNull _sector) exitWith {BIS_WL_highlightedSector = objNull; ((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlShow FALSE; ((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlEnable FALSE};

private _selectionActive = BIS_WL_currentSelection in [WL_ID_SELECTION_VOTING, WL_ID_SELECTION_VOTED, WL_ID_SELECTION_ORDERING_AIRCRAFT, WL_ID_SELECTION_ORDERING_AIRDROP, WL_ID_SELECTION_FAST_TRAVEL, WL_ID_SELECTION_FAST_TRAVEL_CONTESTED, WL_ID_SELECTION_SCAN];
private _services = (_sector getVariable "BIS_WL_services");
private _airstrip = "A" in _services;
private _helipad = "H" in _services;
private _harbor = "W" in _services;

_lastScan = (_sector getVariable [format ["BIS_WL_lastScanEnd_%1", side group player], -9999]);
_scanCD = (_lastScan + BIS_WL_scanCooldown - serverTime) max 0;
if (_scanCD == 0) then {_scanCD = -1};

_isScanning = serverTime < _lastScan;
_supplyPoints = (_sector getVariable ["BIS_WL_supplyPoints", 0]);
_supplyPointsMax = (_sector getVariable ["BIS_WL_supplyPointsMax", 0]);
_canSeeSupplyPoints = WL_LOGISTICS_ENABLED && {_supplyPoints >= 0 && {(_isScanning || {(_sector in (BIS_WL_sectorsArray # 0))})}};

((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlSetPosition [(getMousePosition # 0) + safeZoneW / 100, (getMousePosition # 1) + safeZoneH / 50, safeZoneW, safeZoneH];
((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlCommit 0;
((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlSetStructuredText parseText format [
	if (_scanCD == -1) then {
		"<t shadow = '2' size = '%1'>%2<br/>+%3 %4/%5%6%7%8%9%10%11%12</t>"
	} else {
		"<t shadow = '2' size = '%1'>%2<br/>+%3 %4/%5%6%7%8%9%10%11%12<br/>%13: <t color = '#ff4b4b'>%14</t></t>"
	},
	
	(1 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale),
	_sector getVariable "BIS_WL_name",
	_sector getVariable "BIS_WL_value",
	localize "STR_A3_WL_unit_cp",
	localize "STR_A3_rscmpprogress_min",

	if (_canSeeSupplyPoints) then {
		format ["<br/>%1: <t color='%2'>%3", localize "STR_A3_WL_supplies", 
			if (_supplyPoints < 200) then { "#000000" } else {
				if (_supplyPoints < 1000) then { "#ff0000" } else {
					if (_supplyPoints < 10000) then { "#ffff00" } else { "#00ff00" }
				}
			},
			if (_supplyPoints > 1e6) then { localize "STR_A3_WL_unlimited" + "</t>" } else { 
				format ["%1</t> / %2", str _supplyPoints, str _supplyPointsMax] 
			}];
	} else {
		""
	},
	
	if (_airstrip || {_helipad || {_harbor}}) then {"<br/>"} else {""},
	if (_airstrip) then {localize "STR_A3_WL_param32_title"} else {""},
	if (_airstrip && {(_helipad || {_harbor})}) then {", "} else {""},
	if (_helipad) then {localize "STR_A3_WL_module_service_helipad"} else {""},
	if ((_airstrip || {_helipad}) && {_harbor}) then {", "} else {""},
	if (_harbor) then {localize "STR_A3_WL_param30_title"} else {""},
	
	localize "STR_A3_WL_param_scan_timeout",
	[(ceil _scanCD), "MM:SS"] call BIS_fnc_secondsToString
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
	case WL_ID_SELECTION_ORDERING_AIRCRAFT: {(BIS_WL_sectorsArray # 0) select { _x call BIS_fnc_WL2_canOrderAircraftToSector }};
	case WL_ID_SELECTION_ORDERING_AIRDROP: {BIS_WL_sectorsArray # 0};
	case WL_ID_SELECTION_FAST_TRAVEL: {(BIS_WL_sectorsArray # 2) select { _x call BIS_fnc_WL2_canFastTravelToSector }};
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