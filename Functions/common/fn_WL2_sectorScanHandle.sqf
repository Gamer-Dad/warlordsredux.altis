#include "..\warlords_constants.inc"

params ["_sector"];

if (isServer) then {
	_sector spawn BIS_fnc_WL2_sectorScanHandleServer;
};

if !(isDedicated) then {
	_sector spawn BIS_fnc_WL2_sectorScanHandleClient;
};