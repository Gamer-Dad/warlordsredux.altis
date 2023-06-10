private _v = _this;
private _a = [];

_v setVariable ["dapsActive", true, true];
_v setVariable ["dapsLastAmmo", (_v call DAPS_fnc_CountAmmo), true];
_v setVariable ["dapsType", "Medium APS", true];
_v setVariable ["dapsAmmo", 4, true];
_v setVariable ["dapsAmmoMax", 4, true];

private _reg = [];
dapsRegistered pushBackUnique _v;

while {alive _v} do {
    if (_v call DAPS_fnc_Active) then {
        _a = nearestObjects [_v, ["RocketCore", "MissileCore", "SubmunitionCore", "ammo_Penetrator_Base"], (if (isServer) then {50} else {150})];

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
            _reg = _reg - [_x]
        };
    } forEach _reg;

    sleep 0.01;
};