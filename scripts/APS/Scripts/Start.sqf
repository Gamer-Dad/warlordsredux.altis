sleep 3;

apsLight = [];
apsMedium = [];
apsHeavy = [];
apsDazzler = [];

apsScriptWait = execVM "scripts\APS\Scripts\DefineVehicles.sqf";
waitUntil { scriptDone apsScriptWait };

sleep 1;

apsAPStypes = apsLight + apsMedium + apsHeavy;
apsAPSAll = apsAPStypes + apsDazzler;

sleep 1;

if(isServer)then{
	sleep 5;
	call APS_fnc_BroadcastTypes;
};