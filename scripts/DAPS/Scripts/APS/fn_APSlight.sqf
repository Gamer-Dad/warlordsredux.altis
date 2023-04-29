private _v = _this;
private _a = [];

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
		_a = _v nearObjects ["RocketCore", 150];

		if ((count _a) > 0) then {
			if !((_a select 0) in _reg) then {
				[_v, _a select 0] spawn DAPS_fnc_Generic;
				_reg pushBackUnique (_a select 0);
			};
		};
	};
	
	{
		if !(alive _x) then {
			_reg = _reg - [_x];
		};
	} forEach _reg;
	sleep 0.01;
};