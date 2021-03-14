#include "..\warlords_constants.inc"

params ["_sector"];

_marker = (_sector getVariable "BIS_WL_markers") # 1;
_nextPossibleWarn = 0;

while {!BIS_WL_missionEnd} do {
	waitUntil {sleep WL_TIMEOUT_LONG; (_sector getVariable "BIS_WL_owner") == BIS_WL_playerSide};
	
	while {(_sector getVariable "BIS_WL_owner") == BIS_WL_playerSide} do {
		waitUntil {sleep WL_TIMEOUT_STANDARD; count (_sector getVariable ["BIS_WL_seizingInfo", []]) == 3};
		private _seizingInfo = _sector getVariable "BIS_WL_seizingInfo";
		
		_seizingInfo params ["_side"];
		if (_side == BIS_WL_enemySide) then {
			if (WL_SYNCED_TIME > _nextPossibleWarn) then {
				_nextPossibleWarn = WL_SYNCED_TIME + WL_LOSING_SECTOR_WARN_FREQ;
				"under_attack" call BIS_fnc_WL2_announcer;
				[toUpper format [localize "STR_A3_WL_popup_losing_sector", BIS_WL_enemySide call BIS_fnc_WL2_sideToFaction, _sector getVariable "BIS_WL_name"]] spawn BIS_fnc_WL2_smoothText;
			};
			
			while {count (_sector getVariable ["BIS_WL_seizingInfo", []]) == 3 && (_sector getVariable "BIS_WL_owner") == BIS_WL_playerSide} do {
				_marker setMarkerBrushLocal "Solid";
				_marker setMarkerColorLocal BIS_WL_colorMarkerEnemy;
				sleep WL_TIMEOUT_MEDIUM;
				
				if ((_sector getVariable "BIS_WL_owner") == BIS_WL_playerSide) then {
					_marker setMarkerBrushLocal "Border";
					_marker setMarkerColorLocal BIS_WL_colorMarkerFriendly;
					sleep WL_TIMEOUT_MEDIUM;
				};
			};
		};
	};
};