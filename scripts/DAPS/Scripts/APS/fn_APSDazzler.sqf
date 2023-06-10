private _v = _this;
private _m = [];
private _sm = [];
private _p = [];
private _a = [];
private _l = 0;

_v setVariable ["dapsActive", true, true];
_v setVariable ["dapsLastAmmo", (_v call DAPS_fnc_CountAmmo), true];
_v setVariable ["dapsType", "Dazzler", true];
_v setVariable ["dapsAmmo", 999, true];
_v setVariable ["dapsAmmoMax", 999, true];

private _time = -1;
private _reg = [];

while {alive _v} do {
	if (_v call DAPS_fnc_Active) then {
		_r = _v nearObjects ["RocketCore", 225];
		_m = _v nearObjects ["MissileCore", 225];
		_sm = _v nearObjects ["SubmunitionCore", 225];
		_p = _v nearObjects ["ammo_Penetrator_Base", 225];
		_a = _r + _m + _sm + _p;

		if ((count _a) > 0) then{
			if !((_a select 0) in _reg) then {
				[_v, _a select 0] spawn DAPS_fnc_Dazzler;
				_l = .3;
				_reg pushBackUnique (_a select 0);
			};
		};
		if (_l > 0) then {
			sleep _l;
			_l = 0;
		};
	};
	if ((time) > _time) then {
		{
			if !(alive _x) then {
				_reg = _reg - [_x];
			;}
		} forEach _reg;
	};
	sleep .01;
};