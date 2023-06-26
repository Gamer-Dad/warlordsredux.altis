private _v = _this;
private _m = [];
private _sm = [];
private _p = [];
private _a = [];
private _l = 0;

_v setVariable ["dapsType", "Dazzler", true];
_v setVariable ["dapsAmmo", 1, true];

private _reg = [];

while {alive _v} do {
	if (_v call DAPS_fnc_Active) then {
		_a = nearestObjects [_v, ["ammo_Penetrator_Base", "SubmunitionCore", "MissileCore", "RocketCore"], 225];

		if ((count _a) > 0) then{
			if !((_a select 0) in _reg) then {
				[_v, _a select 0] spawn DAPS_fnc_Dazzler;
				_reg pushBackUnique (_a select 0);
			};
		};
	};

	{
		if !(alive _x) then {
			_reg = _reg - [_x];
		;}
	} forEach _reg;
	sleep .01;
};