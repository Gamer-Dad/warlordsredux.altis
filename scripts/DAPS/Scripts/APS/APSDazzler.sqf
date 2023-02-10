private["_v","_m","_r","_l"];

_v = _this;
if !(local _v) exitWith {};
_m = [];
_r = [];
_l = 0;
_v setVariable ["dapsActive", true, true];
_v setVariable ["dapsLastAmmo", (_v call DAPS_fnc_CountAmmo), true];
_v setVariable ["dapsType", "Dazzler", true];
_v setVariable ["dapsAmmo", 1, true];
_v setVariable ["dapsAmmoMax", 1, true];

while {true} do{
	if !(alive _v) exitWith {};
	if (_v call DAPS_fnc_Active) then {
		_r = _v nearObjects ["RocketCore", 600];
		_m = _v nearObjects ["MissileCore", 600];
		_r = _r + _m;
		if ((count _r) > 0) then {
			[ _v, _r select 0] spawn DAPS_fnc_Dazzler;
			_l= .3;
		};
		if ((count _r) > 1) then {
			[ _v, _r select 1] spawn DAPS_fnc_Dazzler;
			_l= .3;
		};
		if ((count _r) > 2) then {
			[ _v, _r select 2] spawn DAPS_fnc_Dazzler;
			_l= .3;
		};
		if ( _l > 0) then {
			sleep _l;
			_l = 0;
		};
	};
	sleep .01;
};