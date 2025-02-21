private _previousAIMax = -1;
while { !BIS_WL_missionEnd } do {
	private _newPlayers = allPlayers select {
		(!isNull _x) && !(_x getVariable ["BIS_WL_detectedByServer", false])
	};

	{
		_x call WL2_fnc_setupNewWarlord;
	} forEach _newPlayers;

	private _thresholds = [8, 15, 20, 30, 40];

	private _players = (playersNumber west) + (playersNumber east);
	private _value = 1;
	{
		if (_players < _x) then {
			_value = _value + 1;
		};
	} forEach _thresholds;
	if (_value != _previousAIMax) then {
		missionNamespace setVariable ["BIS_WL_maxSubordinates_west", _value, true];
		missionNamespace setVariable ["BIS_WL_maxSubordinates_east", _value, true];
	};
	_previousAIMax = _value;

	missionNamespace setVariable ["BIS_WL_maxSubordinates_guer", 12, true];

	uiSleep 1;
};