params ["_sector"];

_marker = (_sector getVariable "BIS_WL_markers") # 1;
_nextPossibleWarn = 0;

if !((_sector getVariable "BIS_WL_owner") == (side group player)) exitWith {};

while {(_sector getVariable "BIS_WL_owner") == (side group player) && {count (_sector getVariable ["BIS_WL_seizingInfo", []]) == 3}} do {
	private _seizingInfo = _sector getVariable "BIS_WL_seizingInfo";
	
	_seizingInfo params ["_side"];
	if (_side == BIS_WL_enemySide) then {
		if (serverTime > _nextPossibleWarn) then {
			_nextPossibleWarn = serverTime + 30;
			"under_attack" call BIS_fnc_WL2_announcer;
			[toUpper format [localize "STR_A3_WL_popup_losing_sector", BIS_WL_enemySide call BIS_fnc_WL2_sideToFaction, _sector getVariable "BIS_WL_name"]] spawn BIS_fnc_WL2_smoothText;
		};
		
		while {count (_sector getVariable ["BIS_WL_seizingInfo", []]) == 3 && (_sector getVariable "BIS_WL_owner") == (side group player)} do {
			_marker setMarkerBrushLocal "Solid";
			_marker setMarkerColorLocal BIS_WL_colorMarkerEnemy;
			sleep 0.5;
			
			if ((_sector getVariable "BIS_WL_owner") == (side group player)) then {
				_marker setMarkerBrushLocal "Border";
				_marker setMarkerColorLocal BIS_WL_colorMarkerFriendly;
				sleep 0.5;
			};
		};
	};
};