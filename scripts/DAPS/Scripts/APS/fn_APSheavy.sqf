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
dapsRegistered pushBackUnique _v;
while {true} do {
    if !(alive _v) exitWith {};

    if (_v call DAPS_fnc_Active) then {
        _s = nearestObjects [_v, ["ShellCore"], 100];
        _r = nearestObjects [_v, ["RocketCore"], 100];
        _m = nearestObjects [_v, ["MissileCore"], 100];
        _p = nearestObjects [_v, ["ammo_Penetrator_Base"], 100];
        _a = _r + _m + _s + _p;

        if ((count _a) > 0) then {
			if !((_a select 0) in _reg) then {
                _d = _v distance (_a select 0);
				[_v, _a select 0, _d] spawn DAPS_fnc_Generic;
				_reg pushBackUnique (_a select 0);
			};
        };
    };
    
    {
        if !(alive _x) then {
            _reg = _reg - [_x];
        };
    } forEach _reg;

    sleep 0.005;
};