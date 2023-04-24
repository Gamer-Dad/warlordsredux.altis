private _v = _this;
private _m = [];
private _a = [];
private _s = [];
private _sm = [];
private _p = [];
private _r = [];
private _l = 0;

_v setVariable ["dapsActive", TRUE, TRUE];
_v setVariable ["dapsLastAmmo", (_v call DAPS_fnc_CountAmmo), TRUE];
_v setVariable ["dapsType", "Heavy APS", TRUE];
_v setVariable ["dapsAmmo", 6, TRUE];
_v setVariable ["dapsAmmoMax", 6, TRUE];

private _time = -1;
private _reg = [];

while {true} do {
    if !(alive _v) exitWith {};

    if (_v call DAPS_fnc_Active) then {
        _s = _v nearObjects ["ShellCore", 100];
        _r = _v nearObjects ["RocketCore", 100];
        _m = _v nearObjects ["MissileCore", 100];
        _sm = _v nearObjects ["SubmunitionCore", 100];
        _p = _v nearObjects ["ammo_Penetrator_Base", 100];
        _a = _r + _m + _s + _sm + _p;

        if ((count _r) > 0) then {
			if !((_a select 0) in _reg) then {
				[_v, _a select 0] spawn DAPS_fnc_Generic;
				_l = 0.5;
				_reg pushBackUnique (_a select 0);
			};
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
            };
        } forEach _reg;
    };

    sleep 0.005;
};