addMissionEventHandler ["Draw3D", {
	if !(isNull (missionNamespace getVariable format ["BIS_WL_currentTarget_%1", BIS_WL_playerSide])) then {
		drawIcon3D [
			BIS_WL_currentTargetData # 0,
			BIS_WL_currentTargetData # 1,
			BIS_WL_currentTargetData # 2,
			1,
			1,
			0,
			"",
			0,
			0,
			"RobotoCondensedBold",
			"center",
			TRUE
		];
		// _droneView = getConnectedUAVUnit player;
		_pos = positionCameraToWorld [0, 0, 0];
		_dist = _pos distance (missionNamespace getVariable format ["BIS_WL_currentTarget_%1", BIS_WL_playerSide]);
		_units = "m";
		_dist = ceil _dist;
		if (_dist > 1000) then {_dist = _dist / 100; _dist = round _dist; _dist = _dist / 10; _units = "km"};
		drawIcon3D [
			"",
			[1, 1, 1, 0.5],
			BIS_WL_currentTargetData # 2,
			0,
			0.75,
			0,
			format ["%1%2 %3", _dist, if (_dist % 1 == 0 && _units == "km") then {".0"} else {""}, if (_units == "m") then {BIS_WL_localized_m} else {BIS_WL_localized_km}],
			2,
			0.03,
			"RobotoCondensedBold"
		];
	};

	private _cursorTarget = cursorTarget;
	private _displayedPlayers = allPlayers select {
		private _eligible = _x != player && BIS_WL_playerSide == side group _x && alive _x;
		if (_eligible) then {
			private _isInMySquad = ["isInMySquad", [getPlayerID _x]] call SQD_fnc_client;
			private _distanceSqr = _x distanceSqr player;
			if (_x != _cursorTarget && vehicle _x != _cursorTarget) then {
				if (_isInMySquad) then {
					_distanceSqr < (1000 * 1000);
				} else {
					_distanceSqr < (100 * 100);
				};
			} else {
				true;
			};
		} else {
			false;
		};
	};
	{
		private _isInMySquad = ["isInMySquad", [getPlayerID _x]] call SQD_fnc_client;
		private _color = if (lifeState _x == "INCAPACITATED") then {
			[1, 0, 0, 0.8]
		} else {
			if (_isInMySquad) then {
				[0.5, 0.5, 1, 0.8]
			} else {
				[1, 1, 1, 0.8]
			};
		};
		private _size = if (_isInMySquad) then { 0.04 } else { 0.03 };
		private _levelDisplay = _x getVariable ["WL_playerLevel", "Recruit"];
		private _displayName = format ["%1 [%2]", name _x, _levelDisplay];

		drawIcon3D [
			"A3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa",
			_color,
			if (vehicle _x == _x) then {
				(_x modelToWorldVisual (_x selectionPosition "head")) vectorAdd [0,0,0.6];
			} else {
				getPosATLVisual _x
			},
			0,
			0,
			0,
			_displayName,
			2,
			_size,
			"RobotoCondensedBold",
			"center"
		];
	} forEach _displayedPlayers;
}];