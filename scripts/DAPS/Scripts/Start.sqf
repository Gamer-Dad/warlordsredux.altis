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
DAPS_fnc_CompileTypes = compile preprocessFile "scripts\DAPS\Scripts\Management\fn_CompileTypes.sqf";
call DAPS_fnc_CompileTypes;
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

//https://community.bistudio.com/wiki/DIK_KeyCodes
#include "\a3\editor_f\Data\Scripts\dikCodes.h"
sleep 1;
//["Drongo's APS","APS dialog",["Show Dialog","Tool Tip"],"",{call DAPS_fnc_KeyPressed},[DIK_A,[FALSE,FALSE,TRUE]]]call cba_fnc_addKeybind;


waituntil {sleep 0.1; !isnull (findDisplay 46)};
(findDisplay 46) displayAddEventHandler ["KeyDown", {
	if ((inputaction"cycleThrownItems") > 0.01) then {
        0 spawn DAPS_fnc_KeyPressed;
    };
}];


dapsReady=TRUE;
dapsServer=FALSE;
if(isServer)then{
	dapsServer=TRUE;
	publicVariable"dapsServer";
	sleep 5;
	call DAPS_fnc_BroadcastTypes;
};