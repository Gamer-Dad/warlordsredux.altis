#include "..\..\warlords_constants.inc"

params ["_toContested"];

"Sector" call WL2_fnc_announcer;
[toUpper localize "STR_A3_WL_popup_scan"] spawn WL2_fnc_smoothText;

"RequestMenu_close" call WL2_fnc_setupUI;
if !(visibleMap) then {
	processDiaryLink createDiaryLink ["Map", player, ""];
	WL_CONTROL_MAP ctrlMapAnimAdd [0, 0.1, player];
	ctrlMapAnimCommit WL_CONTROL_MAP;
};
BIS_WL_targetSector = objNull;
private _selectionBefore = BIS_WL_currentSelection;
BIS_WL_currentSelection = WL_ID_SELECTION_SCAN;
WL_MapBusy pushBack "orderSectorScan";

sleep WL_TIMEOUT_SHORT;

waitUntil {
	sleep WL_TIMEOUT_MIN;

	!isNull BIS_WL_targetSector ||
	!visibleMap ||
	!alive player ||
	lifeState player == "INCAPACITATED";
};

if (BIS_WL_currentSelection == WL_ID_SELECTION_SCAN) then {
	BIS_WL_currentSelection = _selectionBefore;
};

if (isNull BIS_WL_targetSector) exitWith {
	"Canceled" call WL2_fnc_announcer;
	[toUpper localize "STR_A3_WL_scan_canceled"] spawn WL2_fnc_smoothText;

	sleep 1;
	WL_MapBusy = WL_MapBusy - ["orderSectorScan"];
};

[player, "scan", [], BIS_WL_targetSector] remoteExec ["WL2_fnc_handleClientRequest", 2];

sleep 1;
WL_MapBusy = WL_MapBusy - ["orderSectorScan"];