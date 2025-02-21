params ["_sector"];

private _area = _sector getVariable "objectArea";
private _sectorValue = _sector getVariable ["BIS_WL_value", 50];
private _sectorCaptureValue = _sectorValue min 10;
private _minCaptureTime = linearConversion [5, 30, _sectorValue, 20, 50, true];

private _lastTime = serverTime;
private _fullClientUpdateInterval = serverTime;
while { !BIS_WL_missionEnd } do {
	private _originalOwner = _sector getVariable ["BIS_WL_owner", independent];

	private _capturingTeam = _sector getVariable ["BIS_WL_capturingTeam", independent];
	private _captureProgress = _sector getVariable ["BIS_WL_captureProgress", 0];

	private _actualTimeElapsed = serverTime - _lastTime;
	_lastTime = serverTime;
	private _progressMovement = _actualTimeElapsed / _minCaptureTime;

	private _sortedInfo = _sector call WL2_fnc_getCapValues;

	if (serverTime - _fullClientUpdateInterval > 3) then {
		_sector setVariable ["WL_captureDetails", _sortedInfo, true];
		_fullClientUpdateInterval = serverTime;
	};

	private _topEntry = _sortedInfo # 0;
	private _winner = _topEntry # 0;
	private _winningScore = _topEntry # 1;

	private _secondEntry = _sortedInfo # 1;
	private _secondWinner = _secondEntry # 0;
	private _secondScore = _secondEntry # 1;

	if (_winningScore == _secondScore) then {
		_winner = independent;
		_winningScore = 100;
	};

	// systemChat format ["Winner: %1 (%2), Loser: %3 (%4), Progress: %5", _winner, _winningScore, _secondWinner, _secondScore, _captureProgress];

	if (_winningScore == 0) then {
		_winner = _originalOwner;
	};

	private _scoreGap = _winningScore - _secondScore;
	private _movementMultiplier = linearConversion [0, 20, _scoreGap, 0.1, 1, true];
	private _movement = _progressMovement * _movementMultiplier;

	if (_winner == _capturingTeam) then {
		if (_capturingTeam != _originalOwner) then {
			_captureProgress = _captureProgress + _movement;
		};
	} else {
		if (_captureProgress > 0) then {
			_captureProgress = _captureProgress - _movement * 0.5;
		} else {
			if (_winner != independent) then {
				_captureProgress = 0;
				_capturingTeam = _winner;
			};
		};
	};

	if (_captureProgress < 0) then {
		_captureProgress = 0;
	};

	if (_captureProgress >= 1) then {
		_sector setVariable ["BIS_WL_owner", _capturingTeam, true];
		_sector setVariable ["BIS_WL_capturingTeam", independent, true];
		_sector setVariable ["BIS_WL_captureProgress", 0, true];
		_sector remoteExec ["WL2_fnc_handleEnemyCapture", [0, -2] select isDedicated];
		[_sector, _capturingTeam] call WL2_fnc_changeSectorOwnership;
	} else {
		_sector setVariable ["BIS_WL_captureProgress", _captureProgress, true];
		_sector setVariable ["BIS_WL_capturingTeam", _capturingTeam, true];
	};

	if ((_winner == _originalOwner) && (_captureProgress <= 0) || ((_originalOwner != independent) && _winner == independent)) then {
		sleep 2;
	} else {
		sleep 0.2;
	};
	// systemChat format ["Sector %1 | Owner: %2, Capturing Team: %3, Progress: %4", _sector getVariable ["BIS_WL_name", "Unknown"], _sector getVariable ["BIS_WL_owner", "Unknown"], _sector getVariable ["BIS_WL_capturingTeam", "Unknown"], _sector getVariable ["BIS_WL_captureProgress", 0]];
};