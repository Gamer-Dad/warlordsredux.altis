_h = serverTime + 600;

while {!BIS_WL_missionEnd} do {
	_players = count allPlayers;
	if (_players >= 51) then {	
		systemchat "Max AI now at 1, human interaction encouraged!";
	} Else {
		if (_players >= 45) then {
			systemchat "Max AI now at 2, make em count!";
		} Else {
			if (_players >= 40) then {
				systemchat "Max AI now at 3, put them to work!";
			} Else {
				if (_players >= 30) then {
					systemchat "Max AI now at 4, squad size!";
				} Else {
					if (_players >= 20) then {
						systemchat "Max AI now at 5, you can make it work!";
					} Else {
						if (_players < 10) then {
							systemchat "Max AI now at 6, full company size!";
						};
					};
				};
			};
		};
	};

	if (serverTime > _h && {!(profileNamespace getVariable ["MRTM_disableHint", true])}) then {
		hintSilent (localize (format ["STR_MRTM_easterEgg_hint_%1", (floor (random 9))]));
		_h = serverTime + 1800;
	};
	sleep 900;
};