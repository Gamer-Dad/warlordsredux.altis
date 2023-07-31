#include "..\warlords_constants.inc"

params ["_sector"];

if (_sector getVariable ["handledEnemyCaptured", false]) exitWith {};
_sector setVariable ["handledEnemyCaptured", true];

_marker = (_sector getVariable "BIS_WL_markers") # 1;
_nextPossibleWarn = 0;

if !((_sector getVariable "BIS_WL_owner") == (side group player)) exitWith {};

while {(_sector getVariable "BIS_WL_owner") == (side group player) && {count (_sector getVariable ["BIS_WL_seizingInfo", []]) == 3}} do {
	private _seizingInfo = _sector getVariable "BIS_WL_seizingInfo";
	
	_seizingInfo params ["_side"];
	if (_side == BIS_WL_enemySide) then {
		if (serverTime > _nextPossibleWarn) then {
			_nextPossibleWarn = serverTime + WL_LOSING_SECTOR_WARN_FREQ;
			"under_attack" call BIS_fnc_WL2_announcer;
			[toUpper format [localize "STR_A3_WL_popup_losing_sector", BIS_WL_enemySide call BIS_fnc_WL2_sideToFaction, _sector getVariable "BIS_WL_name"]] spawn BIS_fnc_WL2_smoothText;
		};
		
		while {count (_sector getVariable ["BIS_WL_seizingInfo", []]) == 3 && (_sector getVariable "BIS_WL_owner") == (side group player)} do {
			_marker setMarkerBrushLocal "Solid";
			_marker setMarkerColorLocal BIS_WL_colorMarkerEnemy;
			sleep WL_TIMEOUT_MEDIUM;
			
			if ((_sector getVariable "BIS_WL_owner") == (side group player)) then {
				_marker setMarkerBrushLocal "Border";
				_marker setMarkerColorLocal BIS_WL_colorMarkerFriendly;
				sleep WL_TIMEOUT_MEDIUM;
			};
		};
	};
};