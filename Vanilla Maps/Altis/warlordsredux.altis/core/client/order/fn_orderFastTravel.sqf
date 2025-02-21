#include "..\..\warlords_constants.inc"

params ["_fastTravelMode"];

"Destination" call WL2_fnc_announcer;
[toUpper localize "STR_A3_WL_popup_destination"] spawn WL2_fnc_smoothText;

"RequestMenu_close" call WL2_fnc_setupUI;
if !(visibleMap) then {
	processDiaryLink createDiaryLink ["Map", player, ""];
	if (_fastTravelMode != 0) then {
		WL_CONTROL_MAP ctrlMapAnimAdd [0, BIS_WL_mapSizeIndex / 75, WL_TARGET_FRIENDLY];
	} else {
		WL_CONTROL_MAP ctrlMapAnimAdd [0, 0.3, player];
	};
	ctrlMapAnimCommit WL_CONTROL_MAP;
};
BIS_WL_targetSector = objNull;
private _selectionBefore = BIS_WL_currentSelection;
BIS_WL_currentSelection = switch (_fastTravelMode) do {
	case 0: {
		WL_ID_SELECTION_FAST_TRAVEL
	};
	case 1;
	case 2: {
		WL_ID_SELECTION_FAST_TRAVEL_CONTESTED
	};
	case 3: {
		WL_ID_SELECTION_FAST_TRAVEL_VEHICLE
	};
	case 5: {
		WL_ID_SELECTION_FAST_TRAVEL_HQ
	};
};

WL_MapBusy pushBack "orderFastTravel";

private _marker = "";
private _markerText = "";

if (_fastTravelMode in [1, 2]) then {
	private _fastTravelConflict = _fastTravelMode call WL2_fnc_fastTravelConflictMarker;
	_marker = _fastTravelConflict # 0;
	_markerText = _fastTravelConflict # 1;
};

sleep WL_TIMEOUT_SHORT;

waitUntil {
	sleep WL_TIMEOUT_MIN;
	!isNull BIS_WL_targetSector || !visibleMap || !alive player || lifeState player == "INCAPACITATED"
};

if (isNull BIS_WL_targetSector) exitWith {
	if (BIS_WL_currentSelection in [
		WL_ID_SELECTION_FAST_TRAVEL,
		WL_ID_SELECTION_FAST_TRAVEL_CONTESTED,
		WL_ID_SELECTION_FAST_TRAVEL_VEHICLE,
		WL_ID_SELECTION_FAST_TRAVEL_HQ
	]) then {
		BIS_WL_currentSelection = WL_ID_SELECTION_NONE;
	};
	"Canceled" call WL2_fnc_announcer;
	[toUpper localize "STR_A3_WL_menu_fasttravel_canceled"] spawn WL2_fnc_smoothText;
	deleteMarkerLocal _marker;
	deleteMarkerLocal _markerText;

	sleep 1;
	WL_MapBusy = WL_MapBusy - ["orderFastTravel"];
};

[_fastTravelMode, _marker] call WL2_fnc_executeFastTravel;

deleteMarkerLocal _marker;
deleteMarkerLocal _markerText;

if (BIS_WL_currentSelection in [
	WL_ID_SELECTION_FAST_TRAVEL,
	WL_ID_SELECTION_FAST_TRAVEL_CONTESTED,
	WL_ID_SELECTION_FAST_TRAVEL_VEHICLE,
	WL_ID_SELECTION_FAST_TRAVEL_HQ
]) then {
	BIS_WL_currentSelection = _selectionBefore;
};

sleep 1;
WL_MapBusy = WL_MapBusy - ["orderFastTravel"];