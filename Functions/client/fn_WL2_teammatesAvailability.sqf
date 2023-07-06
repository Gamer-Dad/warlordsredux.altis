#include "..\warlords_constants.inc"

"BIS_WL_maxSubordinates" addPublicVariableEventHandler {
	BIS_WL_matesAvailable = (BIS_WL_matesAvailable + 1) min (_this select 1);
	[] spawn BIS_fnc_WL2_refreshOSD;
};