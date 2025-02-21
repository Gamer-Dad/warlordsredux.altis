#include "..\..\warlords_constants.inc"

BIS_WL_highlightedSector = objNull;

addMissionEventHandler ["Map", {
	BIS_WL_highlightedSector = objNull;
	BIS_WL_hoverSamplePlayed = false;
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
			waitUntil {!isNull (findDisplay 37) || {time > 0}};
			if (time > 0) exitWith {uiNamespace setVariable ["BIS_WL_mapControl", (findDisplay 52) displayCtrl 54]};
			uiNamespace setVariable ["BIS_WL_mapControl", (findDisplay 37) displayCtrl 51];
		};
	} else {
		waitUntil {!isNull (findDisplay 12) || {!isNull (findDisplay 160)}};
		if !(isNull (findDisplay 12)) then {
			uiNamespace setVariable ["BIS_WL_mapControl", (findDisplay 12) displayCtrl 51];
		} else {
			uiNamespace setVariable ["BIS_WL_mapControl", (findDisplay 160) displayCtrl 51];
		};
	};

	private _controlMap = ctrlParent WL_CONTROL_MAP;
	private _sectorInfoBox = _controlMap getVariable ["BIS_sectorInfoBox", controlNull];
	if (isNull _sectorInfoBox) then {
		_sectorInfoBox = _controlMap ctrlCreate ["RscStructuredText", 9999000];
		_controlMap setVariable ["BIS_sectorInfoBox", _sectorInfoBox];
		_sectorInfoBox ctrlSetBackgroundColor [0, 0, 0, 0];
		_sectorInfoBox ctrlSetTextColor [1, 1, 1, 1];
		_sectorInfoBox ctrlEnable false;
	};

	private _assetInfoBox = _controlMap getVariable ["BIS_assetInfoBox", controlNull];
	if (isNull _assetInfoBox) then {
		_assetInfoBox = _controlMap ctrlCreate ["RscStructuredText", 9999001];
		_controlMap setVariable ["BIS_assetInfoBox", _assetInfoBox];
		_assetInfoBox ctrlSetBackgroundColor [0, 0, 0, 0];
		_assetInfoBox ctrlSetTextColor [1, 1, 1, 1];
		_assetInfoBox ctrlEnable false;
	};

	uiSleep WL_TIMEOUT_STANDARD;
};