#include "..\warlords_constants.inc"

params ["_sector"];

if (isServer) then {
	_sector spawn {
		while {!BIS_WL_missionEnd} do {
			waitUntil {sleep WL_TIMEOUT_STANDARD; BIS_WL_competingSides findIf {(_this getVariable [format ["BIS_WL_lastScanEnd_%1", _x], -9999]) > WL_SYNCED_TIME} != -1};
			_revealTrigger = createTrigger ["EmptyDetector", position _this];
			_revealTrigger setTriggerArea (_this getVariable "objectArea");
			_revealTrigger setTriggerActivation ["ANY", "PRESENT", FALSE];
			_this setVariable ["BIS_WL_revealTrigger", _revealTrigger, TRUE];
			[_this, _revealTrigger] spawn {
				params ["_sector", "_revealTrigger"];
				while {!isNull _revealTrigger} do {
					_eligibleSides = BIS_WL_competingSides select {(_sector getVariable [format ["BIS_WL_lastScanEnd_%1", _x], -9999]) > WL_SYNCED_TIME};
					_eligibleWarlords = BIS_WL_allWarlords select {local _x && (side group _x) in _eligibleSides};
					{
						_toReveal = _x;
						{
							_x reveal [_toReveal, 4];
						} forEach _eligibleWarlords;
					} forEach list _revealTrigger;
					sleep WL_TIMEOUT_STANDARD;
				};
			};
			waitUntil {sleep WL_TIMEOUT_SHORT; BIS_WL_competingSides findIf {(_this getVariable [format ["BIS_WL_lastScanEnd_%1", _x], -9999]) > WL_SYNCED_TIME} == -1};
			deleteVehicle _revealTrigger;
		};
	};
};

if !(isDedicated) then {
	_sector spawn {
		while {!BIS_WL_missionEnd} do {
			waitUntil {sleep WL_TIMEOUT_STANDARD; (_this getVariable [format ["BIS_WL_lastScanEnd_%1", BIS_WL_playerSide], -9999]) > WL_SYNCED_TIME && !isNull (_this getVariable ["BIS_WL_revealTrigger", objNull])};
			_revealTrigger = _this getVariable ["BIS_WL_revealTrigger", objNull];
			_revealTrigger setTriggerArea (_this getVariable "objectArea");
			_revealTrigger setTriggerActivation ["ANY", "PRESENT", FALSE];
			BIS_WL_currentlyScannedSectors pushBack _this;
			"Scan" call BIS_fnc_WL2_announcer;
			playSound "Beep_Target";
			[toUpper format [localize "STR_A3_WL_popup_scan_active", _this getVariable "BIS_WL_name"]] spawn BIS_fnc_WL2_smoothText;
			waitUntil {sleep WL_TIMEOUT_SHORT; {player reveal [_x, 4]} forEach list _revealTrigger; (_this getVariable [format ["BIS_WL_lastScanEnd_%1", BIS_WL_playerSide], -9999]) <= WL_SYNCED_TIME};
			BIS_WL_currentlyScannedSectors = BIS_WL_currentlyScannedSectors - [_this];
			"Scan_terminated" call BIS_fnc_WL2_announcer;
			[toUpper format [localize "STR_A3_WL_popup_scan_ended", _this getVariable "BIS_WL_name"]] spawn BIS_fnc_WL2_smoothText;
		};
	};
};