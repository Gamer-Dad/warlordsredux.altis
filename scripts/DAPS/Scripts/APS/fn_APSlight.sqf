params ["_v"];

_a = [];
_reg = [];

_v setVariable ["dapsType", "Light APS", true];
_v setVariable ["dapsAmmo", 2, true];
_v setVariable ["dapsAmmoMax", 2, true];

while {alive _v} do {
	if (_v call DAPS_fnc_active) then {
		_a = (nearestObjects [_v, ["R_MRAAWS_HE_F", "R_MRAAWS_HEAT_F", "R_MRAAWS_HEAT55_F", "R_TBG32V_F", "R_PG32V_F", "R_PG7_F", "M_NLAW_AT_F"], 125]) select {!(_x in _reg)};

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