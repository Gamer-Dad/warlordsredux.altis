private _v =_this select 0;
private _ra =_this select 1;
private _r = _v nearObjects ["RocketCore", _ra];
if ((count _r) >1) exitWith{_r};
private _m=_v nearObjects ["MissileCore", _ra];
if ((count _m) >1) exitWith {_m};
private _sm=_v nearObjects ["SubmunitionCore", _ra];
if ((count _sm) >1) exitWith {_sm};
private _p=_v nearObjects ["ammo_Penetrator_Base", _ra];
if ((count _p) >1) exitWith {_p};
(_r + _m + _sm + _p)