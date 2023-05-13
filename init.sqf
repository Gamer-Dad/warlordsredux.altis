/*******************************START OF SCRIPTS****************************/
// Trophy
DAPS_fnc_start = compile preprocessFile "scripts\DAPS\Scripts\Start.sqf";
call DAPS_fnc_start;

// Air Burst
DIS_fnc_start = compile preprocessFile "scripts\DIS\Start.sqf";
call DIS_fnc_start;

//view distance limits 
tawvd_maxRange = 4000; //max range allowed
tawvd_disablenone = true; //disables the disabling of grass I think
tawvd_foot = 2000;
tawvd_car = 3000;
tawvd_air = 4000;
tawvd_drone = 4000;
tawvd_object = tawvd_foot;

// earplug script
[] execVM "scripts\GF_Earplugs\Credits.sqf";	// Please keep the Credits or add them to your Diary

addMissionEventHandler ["Loaded", {
	params ["_saveType"];
	
	If(_saveType isEqualto "continue") then{
		[] execVM "GF_Earplugs\GF_Earplugs.sqf";
		
	};
}];
[] execVM "scripts\GF_Earplugs\GF_Earplugs.sqf";


//Vehicle unflip 
if ( hasInterface ) then
{
	waitUntil { !isNull player };
	0 spawn KSLOOP_fnc_unflipVehicleAddAction;
};
/*******************************END OF SCRIPTS****************************/


[] call BIS_fnc_WL2_initCommon;

