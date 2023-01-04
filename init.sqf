startLoadingScreen [""];
BIS_fnc_WL2_welcome = compile preprocessFileLineNumbers "welcome.sqf";
endLoadingScreen;

/*******************************START OF SCRIPTS****************************/
// Trophy
execVM "scripts\DAPS\Scripts\Start.sqf";

// Air Burst
execVM"scripts\DIS\Start.sqf";

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
	[] spawn KSLOOP_fnc_unflipVehicleAddAction;
};

/*******************************END OF SCRIPTS****************************/

[] remoteExec ["BIS_fnc_WL2_mineLimit", 2];
if(isServer) then
{
	//CP databse
	moneyDatabase = createHashmap;
	
	// Mine Array's
	MRTM_spawnedAPERS = [];
	MRTM_spawnedAPERSDispenser = [];
	MRTM_spawnedAPERSDispenserAmmo = [];
	MRTM_spawnedAPERSBounding = [];
	MRTM_spawnedAT = [];
	MRTM_spawnedSLAMs = [];
	MRTM_spawnedTripwires = [];
	MRTM_spawnedClaymores = [];
	MRTM_spawnedSatchels = [];
	MRTM_spawnedCharges = [];
	MRTM_spawnedLIEDU = [];
	MRTM_spawnedLIEDDI = [];
	MRTM_spawnedSIEDU = [];
	MRTM_spawnedSIEDDI = [];
};
[] call BIS_fnc_WL2_initCommon;

