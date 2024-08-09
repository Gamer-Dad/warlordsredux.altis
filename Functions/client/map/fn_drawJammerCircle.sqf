#include "..\..\warlords_constants.inc"
params ["_asset", "_side"];

private _outerMarkerName = format ["BIS_WL_jammerMarkerOuter_%1", netId _asset];
private _jamColor = if (_side == west) then { "ColorWEST" } else { "ColorEAST" };

createMarkerLocal [_outerMarkerName, _asset];
_outerMarkerName setMarkerShapeLocal "ELLIPSE";
_outerMarkerName setMarkerBrushLocal "Cross";
_outerMarkerName setMarkerColorLocal _jamColor;
_outerMarkerName setMarkerSizeLocal [WL_JAMMER_RANGE_OUTER, WL_JAMMER_RANGE_OUTER];
_outerMarkerName setMarkerAlpha 1;

private _jammerMarkers = missionNamespace getVariable ["BIS_WL_jammerMarkers", []];
_jammerMarkers pushBack [_asset, _outerMarkerName];
missionNamespace setVariable ["BIS_WL_jammerMarkers", _jammerMarkers, true];