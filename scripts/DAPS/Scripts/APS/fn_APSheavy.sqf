private _v = _this;
private _a = [];

_v setVariable ["dapsActive", TRUE, TRUE];
_v setVariable ["dapsLastAmmo", (_v call DAPS_fnc_CountAmmo), TRUE];
_v setVariable ["dapsType", "Heavy APS", TRUE];
_v setVariable ["dapsAmmo", 6, TRUE];
_v setVariable ["dapsAmmoMax", 6, TRUE];

private _reg = [];
dapsRegistered pushBackUnique _v;

while {alive _v} do {
    if (_v call DAPS_fnc_Active) then {
        _a = nearestObjects [_v, ["MissileBase", "RocketCore", "RocketBase", "MissileCore"], (if (isServer) then {50} else {150})];

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

    sleep 0.01;
};