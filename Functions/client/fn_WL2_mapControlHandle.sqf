#include "..\warlords_constants.inc"

BIS_WL_highlightedSector = objNull;

addMissionEventHandler ["Map", {
	BIS_WL_highlightedSector = objNull;
	BIS_WL_hoverSamplePlayed = FALSE;
	if (_this # 0) then {
		if (isNull WL_TARGET_FRIENDLY && BIS_WL_currentSelection == WL_ID_SELECTION_VOTING) then {
			WL_CONTROL_MAP ctrlMapAnimAdd [0, 1, [BIS_WL_mapSize / 2, BIS_WL_mapSize / 2]];
			ctrlMapAnimCommit WL_CONTROL_MAP;
		};
	};
}];

while {!BIS_WL_missionEnd} do {
	if (time == 0) then {
		if (isMultiplayer) then {
			if (isServer) then {
				waitUntil {!isNull (findDisplay 52)};
				uiNamespace setVariable ["BIS_WL_mapControl", (findDisplay 52) displayCtrl 51];
			} else {
				waitUntil {!isNull (findDisplay 53)};
				uiNamespace setVariable ["BIS_WL_mapControl", (findDisplay 53) displayCtrl 51];
			};
		} else {
			waitUntil {!isNull (findDisplay 37) || time > 0};
			if (time > 0) exitWith {uiNamespace setVariable ["BIS_WL_mapControl", (findDisplay 52) displayCtrl 54]};
			uiNamespace setVariable ["BIS_WL_mapControl", (findDisplay 37) displayCtrl 51];
		};
	} else {
		waitUntil {!isNull (findDisplay 12) || !isNull (findDisplay 160)};
		if !(isNull (findDisplay 12)) then {
			uiNamespace setVariable ["BIS_WL_mapControl", (findDisplay 12) displayCtrl 51];
		} else {
			uiNamespace setVariable ["BIS_WL_mapControl", (findDisplay 160) displayCtrl 51];
		};
	};
	
	if (isNull ((ctrlParent WL_CONTROL_MAP) getVariable ["BIS_sectorInfoBox", controlNull])) then {
		(ctrlParent WL_CONTROL_MAP) setVariable ["BIS_sectorInfoBox", (ctrlParent WL_CONTROL_MAP) ctrlCreate ["RscStructuredText", 9999000]];
		((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlSetBackgroundColor [0, 0, 0, 0];
		((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlSetTextColor [1,1,1,1];
		((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlEnable FALSE;

		0 spawn BIS_fnc_WL2_mapDrawHandle;
		0 spawn BIS_fnc_WL2_mapIcons;
	};
	
	uiSleep WL_TIMEOUT_STANDARD;
};