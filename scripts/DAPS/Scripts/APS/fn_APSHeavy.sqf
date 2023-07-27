params ["_v"];

_a = [];
_reg = [];

_v setVariable ["dapsType", "Heavy APS", true];
_v setVariable ["dapsAmmo", 6, true];
_v setVariable ["dapsAmmoMax", 6, true];

_v addEventHandler ["HandleDamage", {
	_this call DAPS_fnc_LagMitigation;
}];

while {alive _v} do {
	if (_v call DAPS_fnc_active) then {
		_a = (nearestObjects [_v, dapsHeavyBlockList, 125]) select {!(_x in _reg)};

		{
			if !(isNil {_x}) then {
				_reg pushBack _x;
				if ((_x distance _v) > 30) then {
					[_v, _x] remoteExec ["DAPS_fnc_Generic", 2];
					_v spawn DAPS_fnc_PopSmoke;
				};
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