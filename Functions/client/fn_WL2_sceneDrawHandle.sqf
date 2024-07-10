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
		_droneView = getConnectedUAVUnit player;
		_pos = getPosVisual (if (isNull(_droneView)) then { player } else { _droneView });
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
	{
		_isInMySquad = ["isInMySquad", [getPlayerID _x]] call BIS_fnc_squadsClient;
		_color = if (_isInMySquad) then { [0.5, 0.5, 1, 1] } else { [1, 1, 1, 1] };
		_size = if (_isInMySquad) then { 0.05 } else { 0.03 };

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
			name _x,
			2,
			_size,
			"RobotoCondensedBold",
			"center"
		];
	} forEach ((allPlayers inAreaArray [player, 100, 100]) select {_x != player && {BIS_WL_playerSide == side group _x && {alive _x}}});
}];