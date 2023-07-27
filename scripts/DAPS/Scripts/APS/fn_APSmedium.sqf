params ["_v"];

_a = [];
_reg = [];

_v setVariable ["dapsType", "Medium APS", true];
_v setVariable ["dapsAmmo", 4, true];
_v setVariable ["dapsAmmoMax", 4, true];

while {alive _v} do {
	if (_v call DAPS_fnc_active) then {
		_a = (nearestObjects [_v, ["R_80mm_HE", "M_120mm_cannon_ATGM_LG", "R_TBG32V_F", "M_AT", "M_PG_AT", "M_Scalpel_AT", "M_Scalpel_AT_hidden", "M_SPG9_HE", "M_SPG9_HEAT", "M_Titan_AP", "M_Titan_AT", "M_Titan_AT_long", "M_Titan_AT_static", "M_Vorona_HE", "M_Vorona_HEAT", "Missile_AGM_01_F", "Missile_AGM_02_F", "R_MRAAWS_HE_F", "R_MRAAWS_HEAT_F", "R_MRAAWS_HEAT55_F", "R_PG32V_F", "R_PG7_F", "M_NLAW_AT_F"], 125]) select {!(_x in _reg)};

		{
			if !(isNil {_x}) then {
				_reg pushBack _x;
				[_v, _x] remoteExec ["DAPS_fnc_Generic", 2];
				_v spawn DAPS_fnc_PopSmoke;
			};
		} forEach _a;

		{
		    if !(alive _x) then {
		        _reg = _reg - [_x];
		    };
		} forEach _reg;
	};
	sleep 0.001;
};