private _v = _this;
// if !(local _v) exitWith{};
private _r = [];
_v setVariable ["dapsActive", TRUE, TRUE];
_v setVariable ["dapsLastAmmo", (_v call DAPS_fnc_CountAmmo), TRUE];
_v setVariable ["dapsType", "Light APS", TRUE];
_v setVariable ["dapsAmmo", 2, TRUE];
_v setVariable ["dapsAmmoMax", 2, TRUE];

private _time = -1;
private _reg = [];
while {true} do {
	if !(alive _v) exitWith {};
	if (_v call DAPS_fnc_Active) then {
		_r = _v nearObjects ["RocketCore", 150];
		if ((count _r) > 0) then {
			if !((_r select 0) in _reg) then {
				[_v, _r select 0] spawn DAPS_fnc_Generic;
				sleep 0.7;
				_reg pushBackUnique (_r select 0);
			};
		};
	};
	if ((call DAPS_fnc_Time) > _time) then {
		_v call DAPS_fnc_RearmCheck;
		_time = (call DAPS_fnc_Time) + dapsRearmDelay;
		{
			if !(alive _x) then {
				_reg = _reg - [_x];
			};
		} forEach _reg;
	};
	sleep 0.01;
};