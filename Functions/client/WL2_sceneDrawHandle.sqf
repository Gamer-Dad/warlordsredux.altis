#include "..\warlords_constants.inc"

BIS_WL_sceneDrawHandler = addMissionEventHandler ["Draw3D", {
	if (BIS_WL_markersAlpha > 0) then {
		if !(isNull WL_TARGET_FRIENDLY) then {
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
			_dist = (getPosVisual player) distance WL_TARGET_FRIENDLY;
			_units = "m";
			_dist = ceil _dist;
			if (_dist > 1000) then {_dist = _dist / 100; _dist = round _dist; _dist = _dist / 10; _units = "km"};
			drawIcon3D [
				"",
				[1, 1, 1, BIS_WL_markersAlpha],
				BIS_WL_currentTargetData # 2,
				0,
				0.75,
				0,
				format ["%1%2 %3", _dist, if (_dist % 1 == 0 && _units == "km") then {".0"} else {""}, if (_units == "m") then {BIS_WL_localized_m} else {BIS_WL_localized_km}],
				2,
				WL_SCENE_FONT_SIZE,
				"RobotoCondensedBold"
			];
		};
	};
	if (BIS_WL_playersAlpha > 0) then {
		{
			drawIcon3D [
				"A3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa",
				[1, 1, 1, BIS_WL_playersAlpha],
				if (vehicle _x == _x) then {
					(_x modelToWorldVisual (_x selectionPosition "head")) vectorAdd [0,0,0.75];
				} else {
					getPosATLVisual _x
				},
				0,
				0,
				0,
				name _x,
				2,
				WL_SCENE_FONT_SIZE,
				"RobotoCondensedBold",
				"center",
				FALSE
			];
		} forEach BIS_WL_iconDrawArray3D;
	};
	{
		drawIcon3D [
			"\A3\ui_f\data\map\groupicons\selector_selectable_ca.paa",
			[1, 1, 1, 0.5],
			(getPosATLVisual _x) vectorAdd [0,0,1],
			1,
			1,
			0,
			_x getVariable ["BIS_WL_iconText", ""],
			2,
			WL_SCENE_FONT_SIZE,
			"RobotoCondensedBold",
			"center",
			FALSE
		];
	} forEach BIS_WL_recentlyPurchasedAssets;
}];