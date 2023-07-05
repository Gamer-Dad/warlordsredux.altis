#include "..\warlords_constants.inc"

params ["_sector", "_side"];

if (_side != (side group player)) exitWith {},

_sector spawn {
	_revealTrigger = _this getVariable ["BIS_WL_revealTrigger", objNull];
	_revealTrigger setTriggerArea (_this getVariable "objectArea");
	_revealTrigger setTriggerActivation ["ANY", "PRESENT", FALSE];
	BIS_WL_currentlyScannedSectors pushBack _this;
	"Scan" call BIS_fnc_WL2_announcer;
	playSound "Beep_Target";
	[toUpper format [localize "STR_A3_WL_popup_scan_active", _this getVariable "BIS_WL_name"]] spawn BIS_fnc_WL2_smoothText;
	waitUntil {sleep WL_TIMEOUT_SHORT; {player reveal [_x, 4]} forEach list _revealTrigger; (_this getVariable [format ["BIS_WL_lastScanEnd_%1", BIS_WL_playerSide], -9999]) <= serverTime};
	BIS_WL_currentlyScannedSectors = BIS_WL_currentlyScannedSectors - [_this];
	"Scan_terminated" call BIS_fnc_WL2_announcer;
	[toUpper format [localize "STR_A3_WL_popup_scan_ended", _this getVariable "BIS_WL_name"]] spawn BIS_fnc_WL2_smoothText;
};