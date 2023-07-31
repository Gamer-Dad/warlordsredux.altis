params ["_caller"];

_sector = _caller call BIS_fnc_WL2_getCurrentSector;
_home = _caller call BIS_fnc_WL2_getHomeBase;
if (isNil "_sector") then {
	1e11;	// should not happen		
} else {
	_runways = (_caller call BIS_fnc_WL2_getFriendlySectors) select { "A" in (_x getVariable ["BIS_WL_services", ""]) };
	_sectorDistances = (_runways + [_home]) apply { _x distance _sector };
	selectMin _sectorDistances;
};