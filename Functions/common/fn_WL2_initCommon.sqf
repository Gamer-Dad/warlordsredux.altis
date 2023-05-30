#include "..\warlords_constants.inc"

BIS_WL_allSectors = (entities "Logic") select {count synchronizedObjects _x > 0};

call compile preprocessFileLineNumbers "TEMP.sqf";

if (isMultiplayer) then {
	_initModuleVars = allVariables BIS_WL_initModule;
	
	{
		_param = configName _x;
		
		if ((toLower _param) in _initModuleVars) then {
			_value = paramsArray # _forEachIndex;
			_convertToBool = getNumber (_x >> "isBool") == 1;
			
			if (_convertToBool) then {
				_value = [FALSE, TRUE] # _value;
			};
			
			BIS_WL_initModule setVariable [_param, _value];
		};
	} forEach ("TRUE" configClasses (missionConfigFile >> "Params"));
};

"common" call BIS_fnc_WL2_varsInit;

if (!BIS_WL_savingEnabled && isMultiplayer) then {
	enableSaving [FALSE, FALSE];
};

//disabling this to allow script to work
//setViewDistance 4000; 

call BIS_fnc_WL2_playersListHandle;

addMissionEventHandler ["EntityRespawned", {
	_this call BIS_fnc_WL2_respawnHandle;
}];

{
	private _sector = _x;
	_sector setVariable ["BIS_WL_connectedSectors", (synchronizedObjects _sector) select {typeOf _x == "Logic"}];
	_sector setVariable ["objectAreaComplete", [position _sector] + (_sector getVariable "objectArea")];
	_sector spawn BIS_fnc_WL2_sectorScanHandle;
	private _otherSectors = (BIS_WL_allSectors deleteAt (BIS_WL_allSectors find _sector));
	_otherSectors = _otherSectors apply {[_x distance2D _sector, _x]};
	_otherSectors sort TRUE;
	_sector setVariable ["BIS_WL_distanceToNearestSector", _sector distance2D ((_otherSectors # 0) # 1)];
	private _axisA = (_sector getVariable "objectArea") # 0;
	private _axisB = (_sector getVariable "objectArea") # 1;
	_sector setVariable ["BIS_WL_maxAxis", if ((_sector getVariable "objectArea") # 3) then {sqrt ((_axisA ^ 2) + (_axisB ^ 2))} else {_axisA max _axisB}];
} forEach BIS_WL_allSectors;

call BIS_fnc_WL2_processRunways;

if (isServer) then {
	call BIS_fnc_WL2_initServer;
} else {
	waitUntil {{isNil _x} count [
		"BIS_WL_base1",
		"BIS_WL_base2",
		format ["BIS_WL_currentTarget_%1", BIS_WL_competingSides # 0],
		format ["BIS_WL_currentTarget_%1", BIS_WL_competingSides # 1],
		"BIS_WL_missionStart",
		"BIS_WL_wrongTeamGroup"
	] == 0};
	
	waitUntil {{isNil {_x getVariable "BIS_WL_originalOwner"}} count WL_BASES == 0};

	{
		_sector = _x;
		waitUntil {{isNil {_sector getVariable _x}} count [
			"BIS_WL_owner",
			"BIS_WL_previousOwners",
			"BIS_WL_agentGrp",
			"BIS_WL_revealedBy"
		] == 0};
	} forEach BIS_WL_allSectors;
};

if (!isDedicated && hasInterface) then {call BIS_fnc_WL2_initClient};

0 spawn BIS_fnc_WL2_missionEndHandle;