// FILE			:	Baked_AIS_init.sqf
// AUTHOR		:	Bakerman
// LAST EDIT	:	15/09/2013
// Version		:	0.1.3
// DESCRIPTION	:	APS Initialization for Baked_AIS (Armor Improvement System)
// LICENSE		:	GO CRAZY - USE IT - ABUSE IT - CREDIT IF YOU WISH

// *************************************************************
// Call with 
// call compile preprocessFile "Baked_AIS\Baked_AIS_init.sqf";
// *************************************************************

systemchat "Trophy AIS-APS Enabled";			

// Make sure to only run once
if !(isnil "baps_running") exitwith {hintSilent "!WARNING! CANNOT RUN MULTIPLE INSTANCES OF AIS-APS";};

// Run only on server
if (isServer) then 
{
	// Get config values
	baps_startHint = 1; // Show hint on startup?
	baps_startDelay = 1; // Delay script for x seconds
	baps_enabledFor = 1; // Enable for types? 0 = M2A1, 1 = ALL TANKS, 2 = ALL ARMOR, 3 = ALL NATO ARMOR, 4 = ALL CSAT ARMOR
	
	// Revert to default values if nil
	if (isNil "baps_startHint") then { _startHint = 0 };
	if (isNil "baps_startDelay") then { _startDelay = 0 };
	if (isNil "baps_enabledFor") then { _enabledFor = 0 };
	
	// Broadcast Variables
	publicVariable "baps_startHint";
	publicVariable "baps_startDelay";
	publicVariable "baps_enabledFor";
	
	onPlayerConnected "[] spawn FNC_ADD_ACTIONS";
};

// Run only on clients
if (!isServer) then
{
	// Revert to default values if nil
	if (isNil "baps_startHint") then { _startHint = 0 };
	if (isNil "baps_startDelay") then { _startDelay = 0 };
	if (isNil "baps_enabledFor") then { _enabledFor = 0 };
};

// Pause script for x seconds
sleep baps_startDelay;

// Call & cache functions
call compile preprocessFile "Functions\External\Baked_AIS\Baked_AIS_fnc.sqf";

// List of weapons/launchers
baps_weapons = [
"missiles_titan", 
"launch_RPG32_F", 
"launch_Titan_short_F", 
"launch_B_Titan_short_F",
"launch_O_Titan_short_F",
"launch_I_Titan_short_F",
"launch_Titan_F", 
"launch_B_Titan_F",
"launch_O_Titan_F",
"launch_I_Titan_F",
"launch_NLAW_F", 
"launch_O_Vorona_brown_F",
"launch_O_Vorona_green_F",
"launcher_SPG9",
"missiles_DAGR", 
"missiles_ASRAAM", 
"missiles_SCALPEL",
"missiles_titan_static", 
"missiles_Jian",
"mortar_155mm_AMOS",
"missiles_Vorona",

"rockets_Skyfire"];

// List of vehicles that defend
baps_defenders = [];
if (baps_enabledFor == 0) then { // FOR M2A1 SLAMMER ONLY
	baps_defenders = [
	"B_MBT_01_cannon_F"]; // Merkava Mk4
};
if (baps_enabledFor == 1) then { // FOR MBT ONLY
	baps_defenders = [
	"B_MBT_01_cannon_F", // Merkava Mk4
	"O_MBT_02_cannon_F"]; // T-100
};
if (baps_enabledFor == 2) then { // FOR ALL ARMORED VEHICLES
	baps_defenders = [
	"B_APC_Tracked_01_rcws_F",  //Panther
	"B_APC_Wheeled_01_cannon_F", //Marshal
	"B_APC_Tracked_01_CRV_F", //Bobcat
	"B_APC_Tracked_01_AA_F", //Cheetah
	"B_MBT_01_cannon_F", //Slammer
	"B_MBT_01_arty_F", //Scorcher
	"B_MBT_01_mlrs_F", //MLRS
	"B_APC_Wheeled_03_cannon_F", //Gorgon
	"O_MBT_02_cannon_F", //Varsuck
	"O_MBT_04_cannon_F", //Angara
	"O_MBT_04_command_F", //Angara K model
	"O_MBT_02_arty_F", //Sochor Arty
	"O_APC_Tracked_02_AA_F", //Tigris
	"O_APC_Tracked_02_cannon_F", //Kamysh
	"O_APC_Wheeled_02_rcws_F", //Marid
	"O_APC_Wheeled_02_rcws_v2_F", //Marid
	"I_APC_Wheeled_03_cannon_F", //Gorgon
	"I_MBT_03_cannon_F"	//Kuma

	];
};
if (baps_enabledFor == 3) then { // BLUFOR / NATO ONLY
	baps_defenders = [
	"B_APC_Tracked_01_rcws_F",  //Panther
	"B_APC_Wheeled_01_cannon_F", //Marshal
	"B_APC_Tracked_01_CRV_F", //Bobcat
	"B_APC_Tracked_01_AA_F", //Cheetah
	"B_MBT_01_cannon_F", //Slammer
	"B_MBT_01_arty_F", //Scorcher
	"B_MBT_01_mlrs_F", //MLRS
	"B_APC_Wheeled_03_cannon_F" //Gorgon

	];
};
if (baps_enabledFor == 4) then { // OPFOR / CSAT ONLY
	baps_defenders = [
	"O_MBT_02_cannon_F", //Varsuck
	"O_MBT_04_cannon_F", //Angara
	"O_MBT_04_command_F", //Angara K model
	"O_MBT_02_arty_F", //Sochor Arty
	"O_APC_Tracked_02_AA_F", //Tigris
	"O_APC_Tracked_02_cannon_F", //Kamysh
	"O_APC_Wheeled_02_rcws_F", //Marid
	"O_APC_Wheeled_02_rcws_v2_F" //Marid
	];
};

// Get an array of every land vehicle and assign ammo count
// Add actions for all units and vehicles
baps_vehiclelist = [];
[] spawn
{
	while { true } do
	{
		{
			if (!(_x in baps_vehiclelist) && (alive _x) && ((typeOf _x) in baps_defenders)) then 
			{
				baps_vehiclelist set [count baps_vehiclelist, _x];
				_x setVariable ["ammo_left", 4, true];
				_x setVariable ["ammo_right", 4, true];
				_x setVariable ["reloading_left", 0, true];
				_x setVariable ["reloading_right", 0, true];
			};			
		} forEach vehicles;
		[] spawn FNC_ADD_ACTIONS;
		sleep 10;
	};
};

baps_unitsActionList = [];
baps_vehiclesActionsList = [];

FNC_ADD_ACTIONS = 
{
	{
		if (!(_x in baps_unitsActionList)) then 
		{
			_x addEventHandler ["Fired",{_this spawn FNC_BAPS_FIRED}];
			baps_unitsActionList set [count baps_unitsActionList, _x];
		};
	} forEach allUnits;

	{
		if (!(_x in baps_vehiclesActionsList)) then 
		{
			_x addEventHandler ["Fired",{_this spawn FNC_BAPS_FIRED}];
			baps_vehiclesActionsList set [count baps_vehiclesActionsList, _x];
		};
	} forEach vehicles; 
};

// Hint that system is active
if (baps_startDelay == 1) then {
	hintSilent "AIS-APS SCRIPT ACTIVE";
};

// AIS-APS is active has run
baps_running = true;