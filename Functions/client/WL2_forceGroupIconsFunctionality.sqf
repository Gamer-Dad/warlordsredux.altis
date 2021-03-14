#include "..\warlords_constants.inc"

while {!BIS_WL_missionEnd} do {
	setGroupIconsSelectable TRUE;
	setGroupIconsVisible [TRUE, FALSE];
	waitUntil {sleep WL_TIMEOUT_LONG; !(groupIconsVisible isEqualTo [TRUE, FALSE] && groupIconSelectable)}
};