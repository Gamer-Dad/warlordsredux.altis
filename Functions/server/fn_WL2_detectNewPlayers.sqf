_public = [0, -2] select isDedicated;
while {!BIS_WL_missionEnd} do {
	_newPlayers = BIS_WL_allWarlords select {(!isNull _x) && {((_x getVariable ["BIS_WL_detectedByServerSince", -1]) == -1) || {(isPlayer _x) && {isNil {missionNamespace getVariable format ["BIS_WL_forceOtherTeam_%1", getPlayerUID _x]}}}}};
	{
		_x spawn BIS_fnc_WL2_setupNewWarlord;
		{
			private _side = _x;
			_players = count (BIS_WL_allWarlords select {side group _x == _side});
			if (_players >= 20) then {
				missionNamespace setVariable [format ["BIS_WL_maxSubordinates_%1", _side], 1, _public];
			} Else {
				if (_players >= 15) then {
					missionNamespace setVariable [format ["BIS_WL_maxSubordinates_%1", _side], 2, _public];
				} Else {
					if (_players >= 10) then {
						missionNamespace setVariable [format ["BIS_WL_maxSubordinates_%1", _side], 3, _public];
					} Else {
						if (_players >= 7) then {
							missionNamespace setVariable [format ["BIS_WL_maxSubordinates_%1", _side], 4, _public];
						} Else {
							if (_players >= 4) then {
								missionNamespace setVariable [format ["BIS_WL_maxSubordinates_%1", _side], 5, _public];
							} Else {
								missionNamespace setVariable [format ["BIS_WL_maxSubordinates_%1", _side], 6, _public];
							};
						};
					};
				};
			};		
		} forEach [west, east];
	} forEach _newPlayers;
	uiSleep 1;
};