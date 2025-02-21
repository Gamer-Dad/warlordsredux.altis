#include "..\..\warlords_constants.inc"

params ["_sector", "_side"];

if (_side != BIS_WL_playerSide) exitWith {},

_revealTrigger = _sector getVariable ["BIS_WL_revealTrigger", objNull];
_revealTrigger setTriggerArea (_sector getVariable "objectArea");
_revealTrigger setTriggerActivation ["ANY", "PRESENT", false];
BIS_WL_currentlyScannedSectors pushBack _sector;
"Scan" call WL2_fnc_announcer;
playSound "Beep_Target";
[toUpper format [localize "STR_A3_WL_popup_scan_active", _sector getVariable "BIS_WL_name"]] spawn WL2_fnc_smoothText;
waitUntil {
    sleep 1;

    private _allDetected = list _revealTrigger;
    {
        if (side group _x != _side) then {
            _side reportRemoteTarget [_x, 5];
        };
    } forEach _allDetected;

    (_sector getVariable [format ["BIS_WL_lastScanEnd_%1", BIS_WL_playerSide], -9999]) <= serverTime
};
_sectors = BIS_WL_currentlyScannedSectors;
_sectors deleteAt (_sectors find _sector);
BIS_WL_currentlyScannedSectors = _sectors;
"Scan_terminated" call WL2_fnc_announcer;
[toUpper format [localize "STR_A3_WL_popup_scan_ended", _sector getVariable "BIS_WL_name"]] spawn WL2_fnc_smoothText;