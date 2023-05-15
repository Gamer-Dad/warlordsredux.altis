#include "..\warlords_constants.inc"

while {!BIS_WL_missionEnd} do {
	waitUntil {!isNil {BIS_WL_missionEnd}};
	waitUntil {sleep 2; (getConnectedUAV player != objNull)};
	_connectedUav = getConnectedUAV player;
	if ((group player) != (_connectedUav getVariable ['BIS_WL_ownerAsset', grpNull])) then {
		player connectTerminalToUAV objNull;
	};
};