#include "..\warlords_constants.inc"

BIS_WL_highlightedSector = objNull;
BIS_WL_hoverSamplePlayed = FALSE;

WL_CONTROL_MAP ctrlMapCursor ["Track", "Track"]; 

((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlShow FALSE;
((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlEnable FALSE;