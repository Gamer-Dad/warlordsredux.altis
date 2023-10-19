BIS_WL_allSectors = (entities "Logic") select {count synchronizedObjects _x > 0};

call compile preprocessFileLineNumbers "TEMP.sqf";

"common" call BIS_fnc_WL2_varsInit;

enableSaving [false, false];

call BIS_fnc_WL2_playersListHandle;

addMissionEventHandler ["EntityRespawned", {
	_this call BIS_fnc_WL2_respawnHandle;
}];

{
	private _sector = _x;
	_sector setVariable ["BIS_WL_connectedSectors", (synchronizedObjects _sector) select {typeOf _x == "Logic"}];
	_sector setVariable ["objectAreaComplete", [position _sector] + (_sector getVariable "objectArea")];
	private _otherSectors = BIS_WL_allSectors - [_sector];
	_otherSectors = _otherSectors apply {[_x distance2D _sector, _x]};
	_otherSectors sort TRUE;
	_sector setVariable ["BIS_WL_distanceToNearestSector", _sector distance2D ((_otherSectors # 0) # 1)];
	private _axisA = (_sector getVariable "objectArea") # 0;
	private _axisB = (_sector getVariable "objectArea") # 1;
	_sector setVariable ["BIS_WL_maxAxis", if ((_sector getVariable "objectArea") # 3) then {sqrt ((_axisA ^ 2) + (_axisB ^ 2))} else {_axisA max _axisB}];
} forEach BIS_WL_allSectors;

if (isServer) then {
	call BIS_fnc_WL2_initServer;
} else {
	waitUntil {{isNil _x} count [
		"BIS_WL_base1",
		"BIS_WL_base2",
		format ["BIS_WL_currentTarget_%1", BIS_WL_competingSides # 0],
		format ["BIS_WL_currentTarget_%1", BIS_WL_competingSides # 1],
		"BIS_WL_wrongTeamGroup"
	] == 0};
	
	waitUntil {{isNil {_x getVariable "BIS_WL_originalOwner"}} count [BIS_WL_base1, BIS_WL_base2] == 0};

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