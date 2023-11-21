/*******************************START OF SCRIPTS****************************/
if !(isDedicated) then {
	APS_fnc_DefineVehicles = compile preprocessFile "scripts\APS\Scripts\DefineVehicles.sqf";
	0 spawn APS_fnc_DefineVehicles;

	private _fncEarPlugsCredit = compile preprocessFileLineNumbers "scripts\GF_Earplugs\Credits.sqf";
	call _fncEarPlugsCredit;

	waitUntil { !isNull player };
	0 spawn KS_fnc_unflipVehicleAddAction;
};
/*******************************END OF SCRIPTS****************************/
call BIS_fnc_WL2_initCommon;