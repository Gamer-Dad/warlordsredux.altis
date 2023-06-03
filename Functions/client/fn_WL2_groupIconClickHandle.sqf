#include "..\warlords_constants.inc"

if !(BIS_WL_currentSelection in [WL_ID_SELECTION_VOTING, WL_ID_SELECTION_VOTED, WL_ID_SELECTION_ORDERING_AIRCRAFT, WL_ID_SELECTION_ORDERING_AIRCRAFT, WL_ID_SELECTION_ORDERING_AIRDROP, WL_ID_SELECTION_FAST_TRAVEL, WL_ID_SELECTION_FAST_TRAVEL_CONTESTED, WL_ID_SELECTION_SCAN]) exitWith {BIS_WL_highlightedSector = objNull};

private _sector = (_this # 1) getVariable ["BIS_WL_sector", objNull];

if (isNull _sector) exitWith {};

private _availableSectors = (switch (BIS_WL_currentSelection) do {
	case WL_ID_SELECTION_VOTING;
	case WL_ID_SELECTION_VOTED: {BIS_WL_sectorsArray # 1};
	case WL_ID_SELECTION_ORDERING_AIRCRAFT: {(BIS_WL_sectorsArray # 0) select {BIS_WL_orderedAssetRequirements isEqualTo (BIS_WL_orderedAssetRequirements arrayIntersect (_x getVariable "BIS_WL_services"))}};
	case WL_ID_SELECTION_ORDERING_AIRDROP: {BIS_WL_sectorsArray # 0};
	case WL_ID_SELECTION_FAST_TRAVEL: {(BIS_WL_sectorsArray # 2) select {_x getVariable "BIS_WL_fastTravelEnabled"}};
	case WL_ID_SELECTION_FAST_TRAVEL_CONTESTED: {[WL_TARGET_FRIENDLY]};
	case WL_ID_SELECTION_SCAN: {BIS_WL_sectorsArray # 3};
});

if (_sector in _availableSectors) then {
	switch (BIS_WL_currentSelection) do {
		case WL_ID_SELECTION_VOTING;
		case WL_ID_SELECTION_VOTED: {
			BIS_WL_targetVote = _sector;
			_variableFormat = format ["BIS_WL_targetVote_%1", getPlayerUID player];
			missionNamespace setVariable [_variableFormat, _sector, [2, clientOwner]];
			publicVariableServer _variableFormat;
			if (BIS_WL_currentSelection == WL_ID_SELECTION_VOTING) then {
				BIS_WL_currentSelection = WL_ID_SELECTION_VOTED;
			};
			playSound "AddItemOK";
		};
		case WL_ID_SELECTION_ORDERING_AIRCRAFT;
		case WL_ID_SELECTION_FAST_TRAVEL;
		case WL_ID_SELECTION_FAST_TRAVEL_CONTESTED;
		case WL_ID_SELECTION_ORDERING_AIRDROP: {
			BIS_WL_targetSector = _sector;
			playSound "AddItemOK";
		};
		case WL_ID_SELECTION_SCAN: {
			if ((_sector getVariable [format ["BIS_WL_lastScanEnd_%1", side group player], -9999]) < (WL_SYNCED_TIME) - BIS_WL_scanCooldown) then {
				BIS_WL_targetSector = _sector;
				playSound "AddItemOK";
			} else {
				playSound "AddItemFailed";
			};
		};
	};
} else {
	playSound "AddItemFailed";
};