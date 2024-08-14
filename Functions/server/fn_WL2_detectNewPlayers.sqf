while { !BIS_WL_missionEnd } do {
	private _allPlayers = call BIS_fnc_listPlayers;
	private _newPlayers = _allPlayers select {
		(!isNull _x) && !(_x getVariable ["BIS_WL_detectedByServer", false])
	};

	{
		_x call BIS_fnc_WL2_setupNewWarlord;
	} forEach _newPlayers;
	
	private _thresholds = [
		[20, 1],
		[15, 2],
		[10, 3],
		[7, 4],
		[4, 5]
	];

	{
		private _side = _x;
		private _players = playersNumber _side;
		private _value = 6;

		scopeName "mainSideLoop";
		{
			if (_players >= (_x # 0)) then {
				_value = _x # 1;
				breakTo "mainSideLoop";
			};
		} forEach _thresholds;

		missionNamespace setVariable [format ["BIS_WL_maxSubordinates_%1", _side], _value, true];
	} forEach [west, east];

	uiSleep 1;
};