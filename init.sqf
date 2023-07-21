/*******************************START OF SCRIPTS****************************/
// Trophy
DAPS_fnc_start = compile preprocessFile "scripts\DAPS\Scripts\Start.sqf";
0 spawn DAPS_fnc_start;

if !(isServer) then {
	//Earplugs
	[] execVM "scripts\GF_Earplugs\Credits.sqf";	// Please keep the Credits or add them to your Diary
	[] execVM "scripts\GF_Earplugs\GF_Earplugs.sqf";

	//Vehicle unflip 
	waitUntil { !isNull player };
	0 spawn KS_fnc_unflipVehicleAddAction;
};
/*******************************END OF SCRIPTS****************************/

[] call BIS_fnc_WL2_initCommon;