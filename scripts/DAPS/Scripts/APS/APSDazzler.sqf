private _v=_this;
private _m=[];
private _sm=[];
private _p=[];
private _r=[];
private _l=0;

_v setVariable ["dapsActive", true, true];
_v setVariable ["dapsLastAmmo", (_v call DAPS_fnc_CountAmmo), true];
_v setVariable ["dapsType", "Dazzler", true];
_v setVariable ["dapsAmmo", 999, true];
_v setVariable ["dapsAmmoMax", 999, true];
private _time = -1;
private _reg = [];

while {true} do {
	if !(alive _v) exitWith {};
	if (_v call DAPS_fnc_ActiveD) then {
		_r = _v nearObjects ["RocketCore", 500];
		_m = _v nearObjects ["MissileCore", 500];
		_sm = _v nearObjects ["SubmunitionCore", 500];
		_p = _v nearObjects ["ammo_Penetrator_Base", 300];
		_r = _r + _m + _sm + _p;
		_r = _r - _reg;
		if ((count _r)> 0) then{
			[_v, _r select 0] spawn DAPS_fnc_Dazzler;
			_l = .3;
			_reg pushBack (_r select 0);
		};
		if ((count _r) > 1) then{
			[_v, _r select 1] spawn DAPS_fnc_Dazzler;
			_l = .3;
			_reg pushBack (_r select 1);
		};
		if ((count _r) > 2) then{
			[_v, _r select 2] spawn DAPS_fnc_Dazzler;
			_l = .3;
			_reg pushBack (_r select 2);
		};
		if (_l > 0) then {
			sleep _l;
			_l = 0;
		};
	};
	if ((call DAPS_fnc_Time) > _time) then {
		{
			if !(alive _x) then {
				_reg = _reg - [_x];
			;}
		} forEach _reg;
		_time = TIME + 60;
	};
	sleep .01;
};