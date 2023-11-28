params ["_sector"];

_marker = (_sector getVariable "BIS_WL_markers") # 1;
_nextPossibleWarn = 0;
_playerSide = BIS_WL_playerSide;
_enemySide = ([west, east] - [_playerSide]) # 0;

if !((_sector getVariable "BIS_WL_owner") == _playerSide) exitWith {};

while {(_sector getVariable "BIS_WL_owner") == _playerSide && {count (_sector getVariable ["BIS_WL_seizingInfo", []]) == 3}} do {
	private _seizingInfo = _sector getVariable "BIS_WL_seizingInfo";
	
	_seizingInfo params ["_side"];
	if (_side == _enemySide) then {
		if (serverTime > _nextPossibleWarn) then {
			_nextPossibleWarn = serverTime + 30;
			"under_attack" call BIS_fnc_WL2_announcer;
			[toUpper format [localize "STR_A3_WL_popup_losing_sector", _enemySide call BIS_fnc_WL2_sideToFaction, _sector getVariable "BIS_WL_name"]] spawn BIS_fnc_WL2_smoothText;
		};
		
		while {count (_sector getVariable ["BIS_WL_seizingInfo", []]) == 3 && (_sector getVariable "BIS_WL_owner") == _playerSide} do {
			_marker setMarkerBrushLocal "Solid";
			_marker setMarkerColorLocal BIS_WL_colorMarkerEnemy;
			sleep 0.5;
			
			if ((_sector getVariable "BIS_WL_owner") == _playerSide) then {
				_marker setMarkerBrushLocal "Border";
				_marker setMarkerColorLocal BIS_WL_colorMarkerFriendly;
				sleep 0.5;
			};
		};
	};
};