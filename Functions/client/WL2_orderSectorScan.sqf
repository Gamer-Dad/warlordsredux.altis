#include "..\warlords_constants.inc"

params ["_toContested"];

"Sector" call BIS_fnc_WL2_announcer;
[toUpper localize "STR_A3_WL_popup_scan"] spawn BIS_fnc_WL2_smoothText;
[player, -BIS_WL_scanCost] call BIS_fnc_WL2_fundsControl;
["RequestMenu_close"] call BIS_fnc_WL2_setupUI;
if !(visibleMap) then {
	processDiaryLink createDiaryLink ["Map", player, ""];
	WL_CONTROL_MAP ctrlMapAnimAdd [0, 0.1, player];
	ctrlMapAnimCommit WL_CONTROL_MAP;
};
BIS_WL_targetSector = objNull;
BIS_WL_currentSelection = WL_ID_SELECTION_SCAN;

sleep 0.25;

"scan" spawn BIS_fnc_WL2_sectorSelectionHandle;

waitUntil {sleep WL_TIMEOUT_MIN; !isNull BIS_WL_targetSector || !visibleMap || BIS_WL_currentSelection == WL_ID_SELECTION_VOTING || !alive player || lifeState player == "INCAPACITATED"};

["scan", "end"] call BIS_fnc_WL2_sectorSelectionHandle;

if (BIS_WL_currentSelection == WL_ID_SELECTION_SCAN) then {
	BIS_WL_currentSelection = WL_ID_SELECTION_NONE;
};

if (isNull BIS_WL_targetSector) exitWith {
	"Canceled" call BIS_fnc_WL2_announcer;
	[toUpper localize "STR_A3_WL_scan_canceled"] spawn BIS_fnc_WL2_smoothText;
	[player, BIS_WL_scanCost] call BIS_fnc_WL2_fundsControl;
};

BIS_WL_targetSector setVariable [format ["BIS_WL_lastScanEnd_%1", BIS_WL_playerSide], WL_SYNCED_TIME + WL_SCAN_DURATION, TRUE];