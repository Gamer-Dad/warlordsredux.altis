#include "..\warlords_constants.inc"

while {!BIS_WL_missionEnd} do {
	waitUntil {sleep 2; (getConnectedUAV player != objNull)};
	_connectedUav = getConnectedUAV player;
	if ((group player) != (_connectedUav getVariable ['BIS_WL_ownerGrp', grpNull])) then {
		player connectTerminalToUAV objNull;
	};
};