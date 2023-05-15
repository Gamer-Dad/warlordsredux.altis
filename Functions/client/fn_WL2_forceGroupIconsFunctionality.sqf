#include "..\warlords_constants.inc"

waitUntil {!isNil {BIS_WL_missionEnd}};
while {!BIS_WL_missionEnd} do {
	setGroupIconsSelectable TRUE;
	setGroupIconsVisible [TRUE, FALSE];
	waitUntil {sleep WL_TIMEOUT_LONG; !(groupIconsVisible isEqualTo [TRUE, FALSE] && groupIconSelectable)}
};