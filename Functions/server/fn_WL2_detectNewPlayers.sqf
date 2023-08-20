#include "..\warlords_constants.inc"

while {!BIS_WL_missionEnd} do {
	_newPlayers = BIS_WL_allWarlords select {(!isNull _x) && {((_x getVariable ["BIS_WL_detectedByServerSince", -1]) == -1) || {(isPlayer _x) && {isNil {missionNamespace getVariable format ["BIS_WL_teamCheckOK_%1", getPlayerUID _x]}}}}};
	{
		_x spawn BIS_fnc_WL2_setupNewWarlord;
		
		{
			_players = count (BIS_WL_allWarlords select {side group _x == _side});
			private _side = _x;
			if (_players >= 30) then {
				missionNamespace setVariable [format ["BIS_WL_maxSubordinates_%1", _side], 1, true];
			} Else {
				if (_players >= 25) then {
					missionNamespace setVariable [format ["BIS_WL_maxSubordinates_%1", _side], 3, true];
				} Else {
					if (_players >= 20) then {
						missionNamespace setVariable [format ["BIS_WL_maxSubordinates_%1", _side], 4, true];
					} Else {
						if (_players >= 15) then {
							missionNamespace setVariable [format ["BIS_WL_maxSubordinates_%1", _side], 5, true];
						} Else {
							if (_players >= 10) then {
								missionNamespace setVariable [format ["BIS_WL_maxSubordinates_%1", _side], 6, true];
							} Else {
								missionNamespace setVariable [format ["BIS_WL_maxSubordinates_%1", _side], 8, true];
							};
						};
					};
				};
			};			
		} forEach [west, east];
	} forEach _newPlayers;
	uiSleep WL_TIMEOUT_STANDARD;
};