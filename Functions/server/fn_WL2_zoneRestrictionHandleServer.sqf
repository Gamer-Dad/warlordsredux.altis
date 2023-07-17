#include "..\warlords_constants.inc"

_trespassersOld = [];

while {!BIS_WL_missionEnd} do {
	sleep (if (count _trespassersOld == 0) then {WL_TIMEOUT_STANDARD} else {WL_TIMEOUT_SHORT});
	
	_trespassers = [];
	
	{
		_side = _x;
		_sideID = _forEachIndex;
		_warlords = BIS_WL_allWarlords select {alive _x && side group _x == _side && serverTime > ((_x getVariable ["BIS_WL_detectedByServerSince", 10e10]) + 3)};
		_restrictedSectors = BIS_WL_allSectors - ((BIS_WL_sectorsArrays # _sideID) # 3);
		
		{
			_zoneRestrictionTrg = (_x getVariable "BIS_WL_zoneRestrictionTrgs") # _sideID;
			{_trespassers pushBackUnique _x} forEach (_warlords inAreaArray _zoneRestrictionTrg);
		} forEach _restrictedSectors;
	} forEach BIS_WL_competingSides;
	
	{_trespassers pushBackUnique _x} forEach (BIS_WL_allWarlords select {_pos = position _x; alive _x && (_pos # 0) < 0 || (_pos # 1) < 0 || (_pos # 0) > BIS_WL_mapSize || (_pos # 1) > BIS_WL_mapSize});
	
	_trespassersNew = _trespassers - _trespassersOld;
	_trespassersGone = _trespassersOld - _trespassers;
	
	{
		if (isPlayer _x) then {
			_x setVariable ["BIS_WL_zoneRestrictionKillTime", -1, [2, (owner _x)]];
		};
	} forEach _trespassersGone;
	
	{
		if (isPlayer _x) then {
			_timeout = WL_DEATH_ZONE_TIMER;
			_timeout = (serverTime + _timeout);
			_x setVariable ["BIS_WL_zoneRestrictionKillTime", _timeout, [2, (owner _x)]];
			[] remoteExec ["BIS_fnc_WL2_zoneRestrictionHandleClient", _x];
			[_x, _timeout] spawn {
				params ["_player", "_timeout"];
				waitUntil {(_timeout < serverTime) || ((_player getVariable ["BIS_WL_zoneRestrictionKillTime", 0]) < serverTime)};
				if (_timeout < serverTime) then {
					(vehicle _player) setDamage 1;
					_player setDamage 1;
				};
			};
		};
	} forEach _trespassersNew;
	
	_trespassersOld = _trespassers;
};