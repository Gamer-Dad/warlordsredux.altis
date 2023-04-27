// Turns the turret to face the incoming round, then pop smoke
private _v=_this select 0;
private _d=_this select 1;
if!(local _v)exitWith{};
private _c=20;
private _fire=false;
private _rd=0;
while{_c>0}do{
	if!(alive _v)exitWith{_fire=false};
	_rd=[_d,_v]call DAPS_fnc_RelDir2;
	if((_rd<50)OR(_rd>320))exitWith{_fire=true};
	_c=_c-1;
	sleep .3;
};
if(_fire)then{_v call DAPS_fnc_PopSmoke};