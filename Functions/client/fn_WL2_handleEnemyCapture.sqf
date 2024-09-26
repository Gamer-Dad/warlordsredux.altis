params ["_sector"];

_marker = (_sector getVariable "BIS_WL_markers") # 1;
_nextPossibleWarn = 0;
_playerSide = BIS_WL_playerSide;
_enemySide = [west, east];
_enemySide deleteAt (_enemySide find _playerSide);
_enemySide = _enemySide # 0;

if !((_sector getVariable "BIS_WL_owner") == _playerSide) exitWith {};

while {(_sector getVariable "BIS_WL_owner") == _playerSide} do {
	private _captureProgress = _sector getVariable ["BIS_WL_captureProgress", 0];
	private _capturingTeam = _sector getVariable ["BIS_WL_capturingTeam", independent];
	
	if (_capturingTeam == independent) then {
		sleep 2;
		continue;
	};

	if (_capturingTeam == _enemySide) then {
		if (serverTime > _nextPossibleWarn) then {
			_nextPossibleWarn = serverTime + 30;
			"under_attack" call BIS_fnc_WL2_announcer;
			[toUpper format [localize "STR_A3_WL_popup_losing_sector", _enemySide call BIS_fnc_WL2_sideToFaction, _sector getVariable "BIS_WL_name"]] spawn BIS_fnc_WL2_smoothText;
		};
		
		while {_captureProgress > 0 && (_sector getVariable "BIS_WL_owner") == _playerSide} do {
			_marker setMarkerBrushLocal "Solid";
			_marker setMarkerColorLocal BIS_WL_colorMarkerEnemy;
			sleep 0.5;
			
			if ((_sector getVariable "BIS_WL_owner") == _playerSide) then {
				_marker setMarkerBrushLocal "Border";
				_marker setMarkerColorLocal BIS_WL_colorMarkerFriendly;
				sleep 0.5;
			};

			_captureProgress = _sector getVariable ["BIS_WL_captureProgress", 0];
		};
	};
	sleep 5;
};