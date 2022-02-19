private ["_v","_ra","_r","_m"];
_v=_this select 0;
_ra=_this select 1;
_r=_v nearObjects["RocketCore",_ra];
if((count _r)>1)exitWith{_r};
_m=_v nearObjects["MissileCore",_ra];
(_r+_m)