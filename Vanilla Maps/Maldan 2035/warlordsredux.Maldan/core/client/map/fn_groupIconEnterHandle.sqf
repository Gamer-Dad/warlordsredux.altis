#include "..\..\warlords_constants.inc"

if (isNil "MAP_CONTROL") exitWith {};
if (MAP_CONTROL == -1) exitWith {};

private _sector = (_this # 1) getVariable ["BIS_WL_sector", objNull];

private _conditions = [
	"fastTravelSeized",
	"fastTravelConflict",
	"airAssault",
	"vehicleParadrop",
	"scan"
];
private _sectorHasOptions = false;
{
	private _condition = _x;
	if ([_sector, _condition] call WL2_fnc_mapButtonConditions) then {
		_sectorHasOptions = true;
	};
} forEach _conditions;
WL_SectorActionTargetActive = _sectorHasOptions;

private _sectorInfoBox = (ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox";
if (isNull _sector) exitWith {
	BIS_WL_highlightedSector = objNull;
	_sectorInfoBox ctrlShow FALSE;
	_sectorInfoBox ctrlEnable FALSE
};

private _selectionActive = BIS_WL_currentSelection in [
	WL_ID_SELECTION_ORDERING_AIRCRAFT,
	WL_ID_SELECTION_FAST_TRAVEL,
	WL_ID_SELECTION_FAST_TRAVEL_CONTESTED,
	WL_ID_SELECTION_FAST_TRAVEL_VEHICLE,
	WL_ID_SELECTION_FAST_TRAVEL_HQ,
	WL_ID_SELECTION_SCAN
];
private _votingActive = WL_VotePhase != 0;
private _services = _sector getVariable ["BIS_WL_services", []];
private _airstrip = "A" in _services;
private _helipad = "H" in _services;
private _harbor = "W" in _services;

private _side = BIS_WL_playerSide;

private _lastScan = (_sector getVariable [format ["BIS_WL_lastScanEnd_%1", _side], -9999]);
private _scanCD = (_lastScan + (getMissionConfigValue ["BIS_WL_scanCooldown", 300]) - serverTime) max 0;

private _getTeamColor = {
	params ["_team"];
	['#004d99', '#7f0400', '#007f04'] # ([west, east, independent] find _team);
};

private _percentage = _sector getVariable ["BIS_WL_captureProgress", 0];
private _revealed = _side in (_sector getVariable ["BIS_WL_revealedBy", []]);
private _captureScoreText = "";
if (!_revealed) then {
	_percentage = 0;
};

private _info = _sector getVariable ["WL_captureDetails", []];
private _myTeamInfo = _info select {
	_x # 0 == BIS_WL_playerSide && _x # 1 > 0
};
if (count _myTeamInfo > 0) then {
	private _teamInfo = _myTeamInfo # 0;

	if (_teamInfo # 1 > 0) then {
		private _sortedInfo = [_info, [], { _x # 1 }, "DESCEND"] call BIS_fnc_sortBy;

		private _scoreTexts = [];
		{
			private _team = _x # 0;
			private _score = _x # 1;
			if (_score > 0) then {
				_scoreTexts pushBack format ["<t color='%1'>%2</t>", [_team] call _getTeamColor, floor _score];
			};
		} forEach _sortedInfo;

		_captureScoreText = _scoreTexts joinString " vs. ";
		_captureScoreText = format ["(%1)", _captureScoreText];
	};
};

private _capturingTeam = _sector getVariable ["BIS_WL_capturingTeam", independent];
private _color = [_capturingTeam] call _getTeamColor;

_sectorInfoBox ctrlSetPosition [(getMousePosition # 0) + safeZoneW / 100, (getMousePosition # 1) + safeZoneH / 50, safeZoneW, safeZoneH];
_sectorInfoBox ctrlCommit 0;

private _servicesText = [];
if ("A" in _services) then {
	_servicesText pushBack localize "STR_A3_WL_param32_title";
};
if ("H" in _services) then {
	_servicesText pushBack localize "STR_A3_WL_module_service_helipad";
};
if ("W" in _services) then {
	_servicesText pushBack localize "STR_A3_WL_param30_title";
};

private _linebreak = "<br/>";

private _scanCooldownText = [
	localize "STR_A3_WL_param_scan_timeout",
	": <t color='#ff4b4b'>",
	[ceil _scanCD, "MM:SS"] call BIS_fnc_secondsToString,
	"</t>",
	_linebreak
];

private _sectorInfoText = [
	_sector getVariable ["BIS_WL_name", "Sector"],
	_linebreak,

	[_side] call WL2_fnc_getMoneySign,
	_sector getVariable "BIS_WL_value",
	"/",
	localize "STR_A3_rscmpprogress_min",
	_linebreak,

	if (count _servicesText > 0) then {
		(_servicesText joinString ", ") + _linebreak
	} else {
		""
	},

	if (_scanCD > 0) then {
		_scanCooldownText joinString ""
	} else {
		""
	},

	if (_percentage > 0 || count _myTeamInfo > 0) then {
		format ["<t color='%1'>%2%3</t> %4<br/>", _color, floor (_percentage * 100), "%", _captureScoreText]
	} else {
		""
	}
];

_sectorInfoBox ctrlSetStructuredText parseText format [
	"<t shadow='2' size='%1'>%2</t>",
	1 call WL2_fnc_purchaseMenuGetUIScale,
	_sectorInfoText joinString ""
];

_sectorInfoBox ctrlShow true;
_sectorInfoBox ctrlEnable true;
WL_SectorActionTarget = _sector;
call WL2_fnc_updateSelectionState;

if !(_selectionActive || _votingActive) exitWith {
	if ((_sector getVariable "BIS_WL_owner") == BIS_WL_playerSide) then {
		WL_CONTROL_MAP ctrlMapCursor ["Track", "HC_overFriendly"];
	} else {
		WL_CONTROL_MAP ctrlMapCursor ["Track", "HC_overEnemy"];
	};
	BIS_WL_highlightedSector = objNull;
};

if (_sector in BIS_WL_selection_availableSectors) then {
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