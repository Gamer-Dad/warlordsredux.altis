#include "..\warlords_constants.inc"

params ["_event", ["_state", "start"]];

if (_state == "start") then {
	switch (_event) do {
		case "voting": {
			BIS_WL_selection_availableSectors = BIS_WL_sectorsArray # 1;
			BIS_WL_selection_showLinks = TRUE;
		};
		case "dropping": {
			BIS_WL_selection_availableSectors = (BIS_WL_sectorsArray # 0) select { _x call BIS_fnc_WL2_canOrderAircraftToSector };
			BIS_WL_selection_showLinks = FALSE;
		};
		case "travelling": {
			BIS_WL_selection_availableSectors = (BIS_WL_sectorsArray # 2) select { _x call BIS_fnc_WL2_canFastTravelToSector };
			BIS_WL_selection_showLinks = FALSE;
		};
		case "travelling_contested": {
			BIS_WL_selection_availableSectors = [WL_TARGET_FRIENDLY];
			BIS_WL_selection_showLinks = FALSE;
		};
		case "scan": {
			BIS_WL_selection_availableSectors = BIS_WL_sectorsArray # 3;
			BIS_WL_selection_showLinks = FALSE;
		};
	};
	
	waitUntil {BIS_WL_selectionMapManager == -1};
	
	{
		((_x getVariable "BIS_WL_markers") # 0) setMarkerAlphaLocal WL_CONNECTING_LINE_ALPHA_MIN;
		((_x getVariable "BIS_WL_markers") # 1) setMarkerAlphaLocal WL_CONNECTING_LINE_ALPHA_MIN;
	} forEach (BIS_WL_allSectors - BIS_WL_selection_availableSectors);
	
	if (BIS_WL_selection_showLinks) then {
		{_x setMarkerAlphaLocal WL_CONNECTING_LINE_ALPHA_MAX} forEach BIS_WL_sectorLinks;
	};

	BIS_WL_selectionMapManager = addMissionEventHandler ["EachFrame", {
		if (visibleMap && isNull (findDisplay 160 displayCtrl 51)) then {
			_mapScale = ctrlMapScale WL_CONTROL_MAP;
			_timer = (serverTime % WL_MAP_PULSE_FREQ);
			_timer = if (_timer <= (WL_MAP_PULSE_FREQ / 2)) then {_timer} else {WL_MAP_PULSE_FREQ - _timer};
			_markerSize = linearConversion [0, WL_MAP_PULSE_FREQ / 2, _timer, 1, WL_MAP_PULSE_ICON_SIZE];
			_markerSizeArr = [_markerSize, _markerSize];
			if (BIS_WL_selection_showLinks) then {
				{
					_x setMarkerSizeLocal [WL_CONNECTING_LINE_AXIS * _mapScale * BIS_WL_mapSizeIndex, (markerSize _x) # 1];
				} forEach BIS_WL_sectorLinks;
			};
			{
				if (_x == BIS_WL_targetVote) then {
					((_x getVariable "BIS_WL_markers") # 0) setMarkerSizeLocal [WL_MAP_PULSE_ICON_SIZE, WL_MAP_PULSE_ICON_SIZE];
				} else {
					((_x getVariable "BIS_WL_markers") # 0) setMarkerSizeLocal _markerSizeArr;
				};
			} forEach BIS_WL_selection_availableSectors;
		};
	}];
} else {
	removeMissionEventHandler ["EachFrame", BIS_WL_selectionMapManager];
		
	{
		_mrkrMain = (_x getVariable "BIS_WL_markers") # 0;
		_mrkrMain setMarkerAlphaLocal 1;
		_mrkrMain setMarkerSizeLocal (if !(_x in WL_BASES && BIS_WL_playerSide in (_x getVariable "BIS_WL_revealedBy")) then {[1, 1]} else {[WL_BASE_ICON_SIZE, WL_BASE_ICON_SIZE]});
		((_x getVariable "BIS_WL_markers") # 1) setMarkerAlphaLocal 1;
	} forEach BIS_WL_allSectors;
	
	if (BIS_WL_selection_showLinks) then {
		{_x setMarkerAlphaLocal 0} forEach BIS_WL_sectorLinks;
	};
	BIS_WL_selectionMapManager = -1;
};