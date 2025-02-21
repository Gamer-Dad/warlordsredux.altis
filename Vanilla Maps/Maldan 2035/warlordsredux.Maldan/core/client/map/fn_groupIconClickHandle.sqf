#include "..\..\warlords_constants.inc"

if (isNil "MAP_CONTROL") exitWith {};
if (MAP_CONTROL == -1) exitWith {};

private _orderSelectionActive = BIS_WL_currentSelection in [
	WL_ID_SELECTION_ORDERING_AIRCRAFT,
	WL_ID_SELECTION_FAST_TRAVEL,
	WL_ID_SELECTION_FAST_TRAVEL_CONTESTED,
	WL_ID_SELECTION_FAST_TRAVEL_VEHICLE,
	WL_ID_SELECTION_FAST_TRAVEL_HQ
];
private _scanSelectionActive = BIS_WL_currentSelection == WL_ID_SELECTION_SCAN;
private _votingActive = WL_VotePhase != 0;

if !(_orderSelectionActive || _scanSelectionActive || _votingActive) exitWith {
	BIS_WL_highlightedSector = objNull;
};

call WL2_fnc_updateSelectionState;

private _sector = (_this # 1) getVariable ["BIS_WL_sector", objNull];

if (isNull _sector) exitWith {};

private _availableSectors = BIS_WL_selection_availableSectors;

if !(_sector in _availableSectors) exitWith {
	playSound "AddItemFailed";
};

if (WL_VotePhase == 1) exitWith {
	BIS_WL_targetVote = _sector;
	BIS_WL_highlightedSector = _sector;
	_variableFormat = format ["BIS_WL_targetVote_%1", getPlayerID player];
	missionNamespace setVariable [_variableFormat, _sector, 2];
	playSound "AddItemOK";
};

if (_orderSelectionActive) exitWith {
	BIS_WL_targetSector = _sector;
	playSound "AddItemOK";
};

if (_scanSelectionActive) exitWith {
	if ((_sector getVariable [format ["BIS_WL_lastScanEnd_%1", BIS_WL_playerSide], -9999]) < (serverTime) - (getMissionConfigValue ["BIS_WL_scanCooldown", 300])) then {
		BIS_WL_targetSector = _sector;
		playSound "AddItemOK";
	} else {
		playSound "AddItemFailed";
	};
};

if (WL_VotePhase == 2) exitWith {
	BIS_WL_targetVote = _sector;
	BIS_WL_highlightedSector = _sector;
	_variableFormat = format ["BIS_WL_targetVote_%1", getPlayerID player];
	missionNamespace setVariable [_variableFormat, _sector, 2];
	playSound "AddItemOK";
};