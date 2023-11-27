/*******************************START OF SCRIPTS****************************/

APS_fnc_DefineVehicles = compileFinal preprocessFile "scripts\APS\Scripts\DefineVehicles.sqf";
0 spawn APS_fnc_DefineVehicles;

if !(isDedicated) then {
	private _fncEarPlugsCredit = compileFinal preprocessFileLineNumbers "scripts\GF_Earplugs\Credits.sqf";
	call _fncEarPlugsCredit;

	waitUntil { !isNull player };
	0 spawn KS_fnc_unflipVehicleAddAction;
};
/*******************************END OF SCRIPTS****************************/

BIS_fnc_WL2_findSpawnPositions = compileFinal preprocessFileLineNumbers "Functions\common\fn_WL2_findSpawnPositions.sqf";
BIS_fnc_WL2_getSideBase = compileFinal preprocessFileLineNumbers "Functions\client\fn_WL2_getSideBase.sqf";
BIS_fnc_WL2_handleRespawnMarkers = compileFinal preprocessFileLineNumbers "Functions\common\fn_WL2_handleRespawnMarkers.sqf";
BIS_fnc_WL2_income = compileFinal preprocessFileLineNumbers "Functions\common\fn_WL2_income.sqf";
BIS_fnc_WL2_initCommon = compileFinal preprocessFileLineNumbers "Functions\common\fn_WL2_initCommon.sqf";
BIS_fnc_WL2_missionEndHandle = compileFinal preprocessFileLineNumbers "Functions\common\fn_WL2_missionEndHandle.sqf";
BIS_fnc_WL2_newAssetHandle = compileFinal preprocessFileLineNumbers "Functions\common\fn_WL2_newAssetHandle.sqf";
BIS_fnc_WL2_parsePurchaseList = compileFinal preprocessFileLineNumbers "Functions\common\fn_WL2_parsePurchaseList.sqf";
BIS_fnc_WL2_sectorNameInit = compileFinal preprocessFileLineNumbers "Functions\common\fn_WL2_sectorNameInit.sqf";
BIS_fnc_WL2_sortSectorArrays = compileFinal preprocessFileLineNumbers "Functions\common\fn_WL2_sortSectorArrays.sqf";
BIS_fnc_WL2_updateSectorArrays = compileFinal preprocessFileLineNumbers "Functions\common\fn_WL2_updateSectorArrays.sqf";
BIS_fnc_WL2_varsInit = compileFinal preprocessFileLineNumbers "Functions\common\fn_WL2_varsInit.sqf";

call BIS_fnc_WL2_initCommon;