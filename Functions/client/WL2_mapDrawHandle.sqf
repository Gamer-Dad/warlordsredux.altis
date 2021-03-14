#include "..\warlords_constants.inc"

{(_x displayCtrl 51) ctrlRemoveEventHandler ["Draw", missionNamespace getVariable ["BIS_WL_mapDrawHandler", -1]]} forEach allDisplays;

BIS_WL_mapDrawHandler = WL_CONTROL_MAP ctrlAddEventHandler ["Draw", {
	if !(isNull BIS_WL_highlightedSector) then {
		WL_CONTROL_MAP drawIcon [
			"A3\ui_f\data\map\groupicons\selector_selectedMission_ca.paa",
			[1,1,1,0.5],
			BIS_WL_highlightedSector,
			60,
			60,
			(time * 75) % 360
		];
	};
	if (BIS_WL_currentSelection == WL_ID_SELECTION_ORDERING_NAVAL) then {
		_cursorPos = WL_CONTROL_MAP ctrlMapScreenToWorld getMousePosition;
		_isWater = surfaceIsWater _cursorPos;
		WL_CONTROL_MAP drawIcon [
			"A3\ui_f\data\map\groupicons\selector_selectedMission_ca.paa",
			if (_isWater) then {[1,1,1,0.5]} else {[1,1,1,0.1]},
			_cursorPos,
			60,
			60,
			if (_isWater) then {(time * 75) % 360} else {0}
		];
	};
	if (BIS_WL_playersAlpha > 0 && time > 0) then {
		{
			WL_CONTROL_MAP drawIcon [
				"A3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa",
				if (_x == player) then {[1, 0, 0, BIS_WL_playersAlpha]} else {[1, 1, 1, BIS_WL_playersAlpha]},
				getPosVisual _x,
				20,
				20,
				0,
				if (_x == player) then {""} else {format [" %1", name _x]},
				1,
				WL_MAP_FONT_SIZE,
				"RobotoCondensed",
				"right"
			];
		} forEach (BIS_WL_iconDrawArrayMap);
	};
	{
		private _revealTrigger = _x getVariable "BIS_WL_revealTrigger";
		{
			if ((side group _x) in BIS_WL_sidesArray) then {
				_isMan = _x isKindOf "Man";
				_isAir = FALSE;
				if !(_isMan) then {
					if ((_x getVariable ["BIS_WL_iconText", ""]) == "") then {
						_x setVariable ["BIS_WL_iconText", getText (configFile >> "CfgVehicles" >> typeOf _x >> "displayName")];
					};
					_isAir = _x isKindOf "Air";
				};
				WL_CONTROL_MAP drawIcon [
					if (_isMan) then {
						"\A3\ui_f\data\map\markers\military\dot_CA.paa"
					} else {
						if (_isAir) then {
							"\A3\ui_f\data\map\markers\military\triangle_CA.paa"
						} else {
							"\A3\ui_f\data\map\markers\military\box_CA.paa"
						}
					},
					BIS_WL_colorsArray # (BIS_WL_sidesArray find side group _x),
					position _x,
					if (_isMan) then {20} else {30},
					if (_isMan) then {20} else {30},
					0,
					if (_isMan) then {""} else {" " + (_x getVariable "BIS_WL_iconText")},
					0,
					WL_MAP_FONT_SIZE,
					"RobotoCondensed",
                        		"right"
				];
			};
		} forEach ((list _revealTrigger) - WL_PLAYER_VEHS);
	} forEach BIS_WL_currentlyScannedSectors;
	{
		if (_x != vehicle player) then {
			WL_CONTROL_MAP drawIcon [
				_x getVariable ["BIS_WL_icon", "#(argb,8,8,3)color(0,0,0,0)"],
				BIS_WL_colorsArray # (BIS_WL_sidesArray find BIS_WL_playerSide),
				position _x,
				30,
				30,
				direction _x,
				_x getVariable ["BIS_WL_iconText", ""],
				0,
				WL_MAP_FONT_SIZE,
				"RobotoCondensed",
                		"right"
			];
		};
	} forEach WL_PLAYER_VEHS;
	if (!isNull BIS_WL_mapAssetTarget) then {
		WL_CONTROL_MAP drawIcon [
			"A3\ui_f\data\map\groupicons\selector_selectedMission_ca.paa",
			[1,1,1,1],
			BIS_WL_mapAssetTarget,
			40,
			40,
			(time * 75) % 360
		];
	};
}];