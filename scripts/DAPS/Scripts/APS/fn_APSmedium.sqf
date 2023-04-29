private _v = _this;
private _m = [];
private _a = [];
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
        _a = [_v, 150] call DAPS_fnc_GetIncoming; // Function stored in GetIncoming.sqf

        if ((count _a) > 0) then {
			if !((_a select 0) in _reg) then {
				[_v, _a select 0] spawn DAPS_fnc_Generic;
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