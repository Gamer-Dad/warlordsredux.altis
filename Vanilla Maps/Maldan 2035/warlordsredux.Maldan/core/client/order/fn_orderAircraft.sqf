#include "..\..\warlords_constants.inc"

params ["_orderedClass", "_cost", "_requirements"];

private _class = missionNamespace getVariable ["WL2_spawnClass", createHashMap] getOrDefault [_orderedClass, _orderedClass];

player setVariable ["BIS_WL_isOrdering", true, [2, clientOwner]];

"Sector" call WL2_fnc_announcer;
[toUpper localize "STR_A3_WL_popup_appropriate_sector_selection"] spawn WL2_fnc_smoothText;
if !(visibleMap) then {
	processDiaryLink createDiaryLink ["Map", player, ""];
	WL_CONTROL_MAP ctrlMapAnimAdd [0, 0.1, player];
	ctrlMapAnimCommit WL_CONTROL_MAP;
};
BIS_WL_targetSector = objNull;
private _selectionBefore = BIS_WL_currentSelection;
BIS_WL_currentSelection = WL_ID_SELECTION_ORDERING_AIRCRAFT;
BIS_WL_orderedAssetRequirements = _requirements;
WL_MapBusy pushBack "orderAircraft";
sleep 0.25;

waitUntil {
	sleep 0.05;
	!isNull BIS_WL_targetSector || !visibleMap
};

if (BIS_WL_currentSelection == WL_ID_SELECTION_ORDERING_AIRCRAFT) then {
	BIS_WL_currentSelection = _selectionBefore;
};

if (isNull BIS_WL_targetSector) exitWith {
	"Canceled" call WL2_fnc_announcer;
	[toUpper localize "STR_A3_WL_deploy_canceled"] spawn WL2_fnc_smoothText;
	player setVariable ["BIS_WL_isOrdering", false, [2, clientOwner]];

	sleep 1;
	WL_MapBusy = WL_MapBusy - ["orderAircraft"];
};

[toUpper localize "STR_A3_WL_asset_dispatched_TODO_REWRITE"] spawn WL2_fnc_smoothText;

[player, "orderAsset", "air", BIS_WL_targetSector, _orderedClass] remoteExec ["WL2_fnc_handleClientRequest", 2];

sleep 1;
WL_MapBusy = WL_MapBusy - ["orderAircraft"];