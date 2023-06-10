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
        _a = nearestObjects [_v, ["M_Scalpel_AT", "M_Scalpel_AT_hidden", "M_SPG9_HE", "M_SPG9_HEAT", "M_Titan_AP", "M_Titan_AT", "M_Titan_AT_long", "M_Titan_AT_static", "M_Vorona_HE", "M_Vorona_HEAT", "Missile_AGM_01_F", "Missile_AGM_02_F", "R_MRAAWS_HE_F", "R_MRAAWS_HEAT_F", "R_MRAAWS_HEAT55_F", "R_PG32V_F", "R_PG7_F", "M_NLAW_AT_F"], 125];

        if ((count _a) > 0) then {
			if !((_a select 0) in _reg) then {
				_d = _v distance (_a select 0);
				[_v, _a select 0, _d] remoteExec ["DAPS_fnc_Generic", 2];
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