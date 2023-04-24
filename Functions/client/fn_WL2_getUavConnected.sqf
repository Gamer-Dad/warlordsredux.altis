#include "..\warlords_constants.inc"

while {!BIS_WL_missionEnd} do {
	waitUntil {sleep 2; (getConnectedUAV player != objNull)};
	_connectedUav = getConnectedUAV player;
	if (player != (_connectedUav getVariable ["BIS_WL_ownerAsset", objNull])) then {
		player connectTerminalToUAV objNull;
	};
};