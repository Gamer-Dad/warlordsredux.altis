sleep 3;

if !(isNil "dapsExit") exitWith { systemChat "DAPS exit" };

dapsReady = FALSE;
dapsDebug = FALSE;
//dapsDebug = TRUE;
//#include "\a3\editor_f\Data\Scripts\dikCodes.h"

// Vehicles that use each type of APS
dapsLight = [];
dapsMedium = [];
dapsHeavy = [];
dapsDazzler = [];

dapsRearmRange = 50;
dapsRearmTime = 5;
dapsRearmDelay = 5; //15
dapsBlastBig = FALSE;

dapsHitLimit = 4500; // Limit APS ability to intercept by damage

dapsScriptMode = FALSE;
if !(isClass(configFile >> "cfgPatches" >> "DrongosAPS")) then {
    dapsScriptMode = TRUE;
};

private _module = objNull;
dapsScriptWait = execVM "scripts\DAPS\Scripts\DefineVehicles.sqf";
waitUntil { scriptDone dapsScriptWait };

if (count (entities "DAPS_Options") > 0) then {
    _module = (entities "DAPS_Options") select 0;
    if ((_module getVariable "dapsDebug") == "TRUE") then { dapsDebug = TRUE };
    //dapsRearmDelay = _module getVariable "dapsRearmCycle";
    if ((_module getVariable "dapsBlastSize") == "BIG") then { dapsBlastBig = TRUE };
    if ((_module getVariable "dapsClearAll") == "TRUE") then {
        dapsLight = [];
        dapsMedium = [];
        dapsHeavy = [];
		dapsDazzler = [];
    };
};

dapsDefinitionsLoaded = TRUE;
dapsDefinitionsLoaded2 = FALSE;

sleep 1;
if (count (entities "DAPS_AssignAPS") > 0) then {
    waitUntil { dapsDefinitionsLoaded2 };
    sleep 1;
};

// Vehicles with a single launcher
dapsSingle=[];
// Vehicles with double launchers
dapsDouble=[];
// All vehicles with APS
dapsAPStypes=[];
// Compile all vehicle types into single/double and the overall APS list
DAPS_fnc_CompileTypes = compile preprocessFile"scripts\DAPS\Scripts\Management\CompileTypes.sqf";
//if(isServer)then{call DAPS_fnc_CompileTypes};
call DAPS_fnc_CompileTypes;
DAPS_fnc_BroadcastTypes = compile preprocessFile"scripts\DAPS\Scripts\Management\BroadcastTypes.sqf";
//if(isServer)then{call DAPS_fnc_BroadcastTypes};
// Projectiles that have been dazzled
dapsDazzled=[];
//dapsSmokeLaunchers=[];
dapsSmokeLaunchers=["SmokeLauncher"];
// Vehicles that have been registered
dapsRegistered=[];
// Registered vehicles with no APS
dapsNoAPS=[];
dapsLoop=true;
// Classnames of ammo that will not activate APS.
dapsExcludedAmmo=[];

dapsAntiSpam=FALSE;

// Used to allow/disallow the DAPS dialog
dapsAvailable=TRUE;

//DAPS_fnc_MisguideMissile = compile preprocessFile"scripts\DAPS\Scripts\Misc\MisguideMissile.sqf";

DAPS_fnc_IsIRguided = compile preprocessFile"scripts\DAPS\Scripts\Misc\IsIRguided.sqf";
DAPS_fnc_IsLaserGuided = compile preprocessFile"scripts\DAPS\Scripts\Misc\IsLaserGuided.sqf";
DAPS_fnc_IsRadarGuided = compile preprocessFile"scripts\DAPS\Scripts\Misc\IsRadarGuided.sqf";
DAPS_fnc_IsVisualGuided = compile preprocessFile"scripts\DAPS\Scripts\Misc\IsVisualGuided.sqf";

DAPS_fnc_Recheck = compile preprocessFile"scripts\DAPS\Scripts\Management\ForceRecheck.sqf";
DAPS_fnc_HasCharges = compile preprocessFile"scripts\DAPS\Scripts\Misc\HasCharges.sqf";
DAPS_fnc_KeyPressed = compile preprocessFile"scripts\DAPS\Scripts\Management\KeyPressed.sqf";
//DAPS_fnc_ShowDialog = compile preprocessFile"scripts\DAPS\Scripts\Management\ShowDialog.sqf";
DAPS_fnc_Time = compile preprocessFile"scripts\DAPS\Scripts\Misc\Time.sqf";
DAPS_fnc_Indicator = compile preprocessFile"scripts\DAPS\Scripts\Report\Indicator.sqf";
DAPS_fnc_Active = compile preprocessFile"scripts\DAPS\Scripts\Misc\Active.sqf";
DAPS_fnc_Inc = compile preprocessFile"scripts\DAPS\Scripts\Misc\GetIncoming.sqf";
DAPS_fnc_CountAmmo = compile preprocessFile"scripts\DAPS\Scripts\Misc\CountAmmo.sqf";
DAPS_fnc_RearmCheck = compile preprocessFile"scripts\DAPS\Scripts\Misc\RearmCheck.sqf";
DAPS_fnc_Rearm2 = compile preprocessFile"scripts\DAPS\Scripts\Misc\Rearm2.sqf";
DAPS_fnc_ReportRearm = compile preprocessFile"scripts\DAPS\Scripts\Report\ReportRearm.sqf";
// Register an individual vehicle
DAPS_fnc_RegisterVehicle = compile preprocessFile"scripts\DAPS\Scripts\Management\RegisterVehicle.sqf";
// Register all vehicles
DAPS_fnc_RegisterAll = compile preprocessFile"scripts\DAPS\Scripts\Management\RegisterAll.sqf";
// Check for unregistered (ie. newly spawned) vehicles every five seconds and runs DAPS_fnc_RegisterAll;
DAPS_fnc_RegisterLoop = compile preprocessFile"scripts\DAPS\Scripts\Management\RegisterLoop.sqf";
DAPS_fnc_RearmAPS = compile preprocessFile"scripts\DAPS\Scripts\Management\RearmAPS.sqf";
DAPS_fnc_Report = compile preprocessFile"scripts\DAPS\Scripts\Report\Report.sqf";
DAPS_fnc_CustomAmmo = compile preprocessFile"scripts\DAPS\Scripts\Management\CustomAmmo.sqf";

DAPS_fnc_Blast = compile preprocessFile"scripts\DAPS\Scripts\Misc\Blast.sqf";
DAPS_fnc_DeductAmmo = compile preprocessFile"scripts\DAPS\Scripts\Misc\DeductAmmo.sqf";
DAPS_fnc_PopSmokeTurn = compile preprocessFile"scripts\DAPS\Scripts\Misc\PopSmokeTurn.sqf";
DAPS_fnc_PopSmoke = compile preprocessFile"scripts\DAPS\Scripts\Misc\PopSmoke.sqf";
DAPS_fnc_PopSmoke2 = compile preprocessFile"scripts\DAPS\Scripts\Misc\PopSmoke2.sqf";
DAPS_fnc_CanSmoke = compile preprocessFile"scripts\DAPS\Scripts\Misc\CanSmoke.sqf";
DAPS_fnc_GetDirection = compile preprocessFile"scripts\DAPS\Scripts\Misc\GetDirection.sqf";
DAPS_fnc_RelDir = compile preprocessFile"scripts\DAPS\Scripts\Misc\RelDir.sqf";
DAPS_fnc_RelDir2 = compile preprocessFile"scripts\DAPS\Scripts\Misc\RelDir2.sqf";
DAPS_fnc_RelPos = compile preprocessFile"scripts\DAPS\Scripts\Misc\RelPos.sqf";
DAPS_fnc_React = compile preprocessFile"scripts\DAPS\Scripts\Misc\React.sqf";

DAPS_fnc_APSlight = compile preprocessFile"scripts\DAPS\Scripts\APS\APSlight.sqf";
DAPS_fnc_APSmedium = compile preprocessFile"scripts\DAPS\Scripts\APS\APSmedium.sqf";
DAPS_fnc_APSheavy = compile preprocessFile"scripts\DAPS\Scripts\APS\APSheavy.sqf";
DAPS_fnc_Generic = compile preprocessFile"scripts\DAPS\Scripts\APS\Generic.sqf";


DAPS_fnc_Dazzler = compile preprocessFile"scripts\DAPS\Scripts\APS\Dazzler.sqf";
DAPS_fnc_APSDazzler = compile preprocessFile"scripts\DAPS\Scripts\APS\APSDazzler.sqf";

//https://community.bistudio.com/wiki/DIK_KeyCodes
#include "\a3\editor_f\Data\Scripts\dikCodes.h"
sleep 1;
//["Drongo's APS","APS dialog",["Show Dialog","Tool Tip"],"",{call DAPS_fnc_KeyPressed},[DIK_A,[FALSE,FALSE,TRUE]]]call cba_fnc_addKeybind;


dapsKeyHandle = [] spawn{
    while{true}do{
		//https://community.bistudio.com/wiki/inputAction/actions
		if ((inputaction"cycleThrownItems") > .1) then {
			call DAPS_fnc_KeyPressed;
			sleep .3;
		};
		sleep .1;
    };
};


dapsReady=TRUE;
dapsServer=FALSE;
if(isServer)then{
	dapsServer=TRUE;
	publicVariable"dapsServer";
	[]spawn DAPS_fnc_RegisterLoop;
	sleep 3;
	call DAPS_fnc_BroadcastTypes;
};