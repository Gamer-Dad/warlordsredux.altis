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
        _a = nearestObjects [_v, ["M_Scalpel_AT", "M_Scalpel_AT_hidden", "M_SPG9_HE", "M_SPG9_HEAT", "M_Titan_AP", "M_Titan_AT", "M_Titan_AT_long", "M_Titan_AT_static", "M_Vorona_HE", "M_Vorona_HEAT", "Missile_AGM_01_F", "Missile_AGM_02_F", "R_MRAAWS_HE_F", "R_MRAAWS_HEAT_F", "R_MRAAWS_HEAT55_F", "R_PG32V_F", "R_PG7_F", "Rocket_03_AP_F", "Rocket_03_HE_F", "Rocket_04_AP_F", "Rocket_04_HE_F"], 125];

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
            _reg = _reg - [_x];
        };
    } forEach _reg;

    sleep 0.01;
};