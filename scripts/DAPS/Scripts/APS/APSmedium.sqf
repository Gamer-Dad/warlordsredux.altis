private _v = _this;
private _m = [];
private _r = [];
private _l = 0;

_v setVariable ["dapsActive", true, true];
_v setVariable ["dapsLastAmmo", (_v call DAPS_fnc_CountAmmo), true];
_v setVariable ["dapsType", "Medium APS", true];
_v setVariable ["dapsAmmo", 4, true];
_v setVariable ["dapsAmmoMax", 4, true];

private _time = -1;
private _reg = [];

while {true} do {
    if !(alive _v) exitWith {};

    if (_v call DAPS_fnc_Active) then {
        _r = [_v, 100] call DAPS_fnc_Inc; // Function stored in GetIncoming.sqf

        if ((count _r) > 0) then {
			if !((_r select 0) in _reg) then {
				[_v, _r select 0] spawn DAPS_fnc_Generic;
				_l = 0.5;
				_reg pushBackUnique (_r select 0);
			};
        };

        if (_l > 0) then {
            sleep _l;
            _l = 0;
        };
    };

    if ((call DAPS_fnc_Time) > _time) then {
        _v call DAPS_fnc_RearmCheck;
        _time = (call DAPS_fnc_Time) + dapsRearmDelay;

        {
            if !(alive _x) then {
                _reg = _reg - [_x]
            };
        } forEach _reg;
    };

    sleep 0.01;
};