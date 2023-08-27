sleep 3;

dapsReady = FALSE;

// Vehicles that use each type of APS
dapsLight = [];
dapsMedium = [];
dapsHeavy = [];
dapsDazzler = [];

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

// Compile all vehicle types into single and the overall APS list
dapsAPStypes = dapsLight + dapsMedium + dapsHeavy;
dapsAPSAll = dapsAPStypes + dapsDazzler;

//https://community.bistudio.com/wiki/DIK_KeyCodes
#include "\a3\editor_f\Data\Scripts\dikCodes.h"
sleep 1;

waituntil {sleep 0.1; !isnull (findDisplay 46)};
(findDisplay 46) displayAddEventHandler ["KeyDown", {
    if (inputAction "cycleThrownItems" > 0.01) then {
        [vehicle player, 0, false] spawn DAPS_fnc_Report;
    };
}];


dapsReady=TRUE;
if(isServer)then{
	sleep 5;
	call DAPS_fnc_BroadcastTypes;
};