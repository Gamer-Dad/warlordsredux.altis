#include "..\warlords_constants.inc"

params ["_class", "_cost", "_requirements"];

"Sector" call BIS_fnc_WL2_announcer;
[toUpper localize "STR_A3_WL_popup_appropriate_sector_selection"] spawn BIS_fnc_WL2_smoothText;
if !(visibleMap) then {
	processDiaryLink createDiaryLink ["Map", player, ""];
	WL_CONTROL_MAP ctrlMapAnimAdd [0, 0.1, player];
	ctrlMapAnimCommit WL_CONTROL_MAP;
};
BIS_WL_targetSector = objNull;
BIS_WL_currentSelection = WL_ID_SELECTION_ORDERING_AIRCRAFT;
BIS_WL_orderedAssetRequirements = _requirements;
sleep 0.25;

"dropping" spawn BIS_fnc_WL2_sectorSelectionHandle;

waitUntil {sleep WL_TIMEOUT_MIN; !isNull BIS_WL_targetSector || !visibleMap || BIS_WL_currentSelection == WL_ID_SELECTION_VOTING};

["dropping", "end"] call BIS_fnc_WL2_sectorSelectionHandle;

if (BIS_WL_currentSelection == WL_ID_SELECTION_ORDERING_AIRCRAFT) then {
	BIS_WL_currentSelection = WL_ID_SELECTION_NONE;
};

if (isNull BIS_WL_targetSector) exitWith {
	[player, _cost] call BIS_fnc_WL2_fundsControl;
	"Canceled" call BIS_fnc_WL2_announcer;
	[toUpper localize "STR_A3_WL_deploy_canceled"] spawn BIS_fnc_WL2_smoothText;
};

[toUpper localize "STR_A3_WL_asset_dispatched_TODO_REWRITE"] spawn BIS_fnc_WL2_smoothText;

_asset = ["requestAsset", [_class, BIS_WL_targetSector]] call BIS_fnc_WL2_sendClientRequest;

[player, _asset] call BIS_fnc_WL2_newAssetHandle;