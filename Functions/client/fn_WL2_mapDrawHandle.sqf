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