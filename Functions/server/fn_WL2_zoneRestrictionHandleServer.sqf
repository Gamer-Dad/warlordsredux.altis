#include "..\warlords_constants.inc"

_trespassersOld = [];

while {!BIS_WL_missionEnd} do {
	sleep (if (count _trespassersOld == 0) then {WL_TIMEOUT_STANDARD} else {WL_TIMEOUT_SHORT});
	
	_trespassers = [];
	
	{
		_side = _x;
		_sideID = _forEachIndex;
		_warlords = BIS_WL_allWarlords select {alive _x && {side group _x == _side && {serverTime > ((_x getVariable ["BIS_WL_detectedByServerSince", 10e10]) + 3)}}};
		private _restrictedSectors = BIS_WL_allSectors - ((BIS_WL_sectorsArrays # _sideID) # 3);
		for "_i" from 0 to (count _restrictedSectors - 1) do {
			private _x = _restrictedSectors select _i;
			_zoneRestrictionTrg = (_x getVariable "BIS_WL_zoneRestrictionTrgs") # _sideID;
			private _players = (_warlords inAreaArray _zoneRestrictionTrg);
			for "_i2" from 0 to (count _players - 1) do {
				private _x = _players select _i2;
				_trespassers pushBackUnique _x;
			};	
		};
	} forEach BIS_WL_competingSides;
	
	private _units = (BIS_WL_allWarlords select {_pos = position _x; (alive _x) && {(_pos # 0) < 0 || {(_pos # 1) < 0 || {(_pos # 0) > BIS_WL_mapSize || {(_pos # 1) > BIS_WL_mapSize}}}}});
	for "_i" from 0 to (count _units - 1) do {
		private _x = _units select _i;
		_trespassers pushBackUnique _x;
	};
	
	_trespassersNew = _trespassers - _trespassersOld;
	_trespassersGone = _trespassersOld - _trespassers;
	
	for "_i2" from 0 to (count _trespassersGone - 1) do {
		private _x = _trespassersGone select _i2;
		if (isPlayer _x) then {
			_x setVariable ["BIS_WL_zoneRestrictionKillTime", -1, [2, (owner _x)]];
		};
	};
	
	for "_i3" from 0 to (count _trespassersNew - 1) do {
		private _x = _trespassersNew select _i3;
		if (isPlayer _x) then {
			_timeout = 80;
			if (vehicle _x == _x) then {_timeout = 60} else {
				if ((vehicle _x) isKindOf "Air") then {_timeout = 60};
			};
			_timeout = (serverTime + _timeout);
			_x setVariable ["BIS_WL_zoneRestrictionKillTime", _timeout, [2, (owner _x)]];
			[] remoteExec ["BIS_fnc_WL2_zoneRestrictionHandleClient", (owner _x)];
			[_x, _timeout] spawn {
				params ["_player", "_timeout"];
				waitUntil {(_timeout < serverTime) || {((_player getVariable ["BIS_WL_zoneRestrictionKillTime", 0]) < serverTime)}};
				if (_timeout < serverTime) then {
					(vehicle _player) setDamage 1;
					_player setDamage 1;
				};
			};
		};
	};
	_trespassersOld = _trespassers;
};