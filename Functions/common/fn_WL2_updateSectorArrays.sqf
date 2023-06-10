#include "..\warlords_constants.inc"

params ["_caller", ["_fullRecalc", FALSE]];

//waitUntil {!BIS_WL_sectorUpdateInProgress};

BIS_WL_sectorUpdateInProgress = TRUE;

if (_caller == "server") then {
	BIS_WL_sectorsArrays = [[BIS_WL_competingSides # 0, _fullRecalc] call BIS_fnc_WL2_sortSectorArrays, [BIS_WL_competingSides # 1, _fullRecalc] call BIS_fnc_WL2_sortSectorArrays];
} else {
	if (isServer && WL_SYNCED_TIME == 0 && !_fullRecalc) then {
		BIS_WL_sectorsArray = BIS_WL_sectorsArrays # (BIS_WL_competingSides find BIS_WL_playerSide);
		BIS_WL_sectorsArrayEnemy = BIS_WL_sectorsArrays # (BIS_WL_competingSides find BIS_WL_enemySide);
	} else {
		BIS_WL_sectorsArray = [BIS_WL_playerSide, _fullRecalc] call BIS_fnc_WL2_sortSectorArrays;
		BIS_WL_sectorsArrayEnemy = [BIS_WL_enemySide, _fullRecalc] call BIS_fnc_WL2_sortSectorArrays;
	};
	[TRUE] spawn BIS_fnc_WL2_refreshOSD;
};

BIS_WL_sectorUpdateInProgress = FALSE;