/*******************************START OF SCRIPTS****************************/
// Trophy
APS_fnc_start = compile preprocessFile "scripts\APS\Scripts\Start.sqf";
0 spawn APS_fnc_start;

if !(isServer) then {
	//Earplugs
	private _fncEarPlugsCredit = compile preprocessFileLineNumbers "scripts\GF_Earplugs\Credits.sqf";
	call _fncEarPlugsCredit;

	//Vehicle unflip 
	waitUntil { !isNull player };
	0 spawn KS_fnc_unflipVehicleAddAction;
}
;
/*******************************END OF SCRIPTS****************************/

call BIS_fnc_WL2_initCommon;