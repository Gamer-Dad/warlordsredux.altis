#include "..\..\warlords_constants.inc"

params ["_fastTravelMode"];

private _offset = switch (_fastTravelMode) do {
    case 0: {
        WL_FAST_TRAVEL_OFFSET
    };
    case 1: {
        WL_FAST_TRAVEL_OFFSET
    };
    case 2: {
        200
    };
    case 3: {
        500
    };
};

private _startArr = (synchronizedObjects WL_TARGET_FRIENDLY) select {
    (_x getVariable "BIS_WL_owner") == BIS_WL_playerSide
};
_startArr = _startArr apply {
    [_x distance2D player, _x]
};
_startArr sort true;

private _start = (_startArr # 0) # 1;
private _area = WL_TARGET_FRIENDLY getVariable "objectArea";
private _size = if (_area # 3) then {
    sqrt (((_area # 0) ^ 2) + ((_area # 1) ^ 2));
} else {
    (_area # 0) max (_area # 1);
};

private _marker = createMarkerLocal ["localMarker", [WL_TARGET_FRIENDLY, _size + _offset, WL_TARGET_FRIENDLY getDir _start] call BIS_fnc_relPos];
_marker setMarkerShapeLocal "RECTANGLE";
_marker setMarkerColorLocal BIS_WL_colorMarkerFriendly;
_marker setMarkerDirLocal (WL_TARGET_FRIENDLY getDir _start);
_marker setMarkerSizeLocal [_size, WL_FAST_TRAVEL_RANGE_AXIS];

_markerText = createMarkerLocal ["localMarkerText", markerPos _marker];
_markerText setMarkerColorLocal BIS_WL_colorMarkerFriendly;
_markerText setMarkerSizeLocal [0, 0];
_markerText setMarkerTypeLocal "mil_dot";
_markerText setMarkerTextLocal localize "STR_A3_cfgvehicles_moduletasksetdestination_f_arguments_destination_0";

[_marker, _markerText];