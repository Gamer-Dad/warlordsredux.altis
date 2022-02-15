private["_v","_m","_r","_s","_l"];
_v=_this;
if!(local _v)exitWith{};
_m=[];
_r=[];
_s=[];
_l=0;
_v setVariable["dapsActive",TRUE,TRUE];
_v setVariable["dapsLastAmmo",(_v call DAPS_fnc_CountAmmo),TRUE];
_v setVariable["dapsType","Heavy APS",TRUE];
_v setVariable["dapsAmmo",6,TRUE];
_v setVariable["dapsAmmoMax",6,TRUE];
_time=-1;
while{TRUE}do{
	if!(alive _v)exitWith{};
	if(_v call DAPS_fnc_Active)then{
		_s=_v nearObjects["ShellCore",300];
		_r=_v nearObjects["RocketCore",100];
		_m=_v nearObjects["MissileCore",100];
		_r=_s+_r+_m;
		if((count _r)>0)then{[_v,_r select 0]spawn DAPS_fnc_Generic;_l=.5};
		if((count _r)>1)then{[_v,_r select 1]spawn DAPS_fnc_Generic;_l=.5};
		if(_l>0)then{sleep _l;_l=0};
	};
	if((call DAPS_fnc_Time)>_time)then{_v call DAPS_fnc_Rearm;_time=(call DAPS_fnc_Time)+dapsRearmDelay};
	sleep .005;
};