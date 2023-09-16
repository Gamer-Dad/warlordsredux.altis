#include "..\warlords_constants.inc"

params ["_sector", "_side"];

if (_side != (side group player)) exitWith {},

_sector spawn {
	params ["_sector"];
	_revealTrigger = _sector getVariable ["BIS_WL_revealTrigger", objNull];
	_revealTrigger setTriggerArea (_sector getVariable "objectArea");
	_revealTrigger setTriggerActivation ["ANY", "PRESENT", FALSE];
	BIS_WL_currentlyScannedSectors pushBack _sector;
	"Scan" call BIS_fnc_WL2_announcer;
	playSound "Beep_Target";
	[toUpper format [localize "STR_A3_WL_popup_scan_active", _sector getVariable "BIS_WL_name"]] spawn BIS_fnc_WL2_smoothText;
	waitUntil {sleep WL_TIMEOUT_SHORT; (_sector getVariable [format ["BIS_WL_lastScanEnd_%1", BIS_WL_playerSide], -9999]) <= serverTime};
	BIS_WL_currentlyScannedSectors = BIS_WL_currentlyScannedSectors - [_sector];
	"Scan_terminated" call BIS_fnc_WL2_announcer;
	[toUpper format [localize "STR_A3_WL_popup_scan_ended", _sector getVariable "BIS_WL_name"]] spawn BIS_fnc_WL2_smoothText;
};