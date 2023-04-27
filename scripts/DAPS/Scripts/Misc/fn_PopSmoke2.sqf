private _v=_this select 0;
private _w=_this select 1;
private _s=_this select 2;
while{_s>0}do{[_v,_w]call BIS_fnc_fire;_s=_s-1;sleep .1};
[_v]spawn DAPS_fnc_CanSmoke;