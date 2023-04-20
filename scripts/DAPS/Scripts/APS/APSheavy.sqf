private _v=_this;
//if!(local _v)exitWith{};
private _m=[];
private _r=[];
private _s=[];
private _sm=[];
private _p=[];
private _l=0;
_v setVariable["dapsActive",TRUE,TRUE];
_v setVariable["dapsLastAmmo",(_v call DAPS_fnc_CountAmmo),TRUE];
_v setVariable["dapsType","Heavy APS",TRUE];
_v setVariable["dapsAmmo",6,TRUE];
_v setVariable["dapsAmmoMax",6,TRUE];
private _time=-1;
private _reg=[];
while{TRUE}do{
	if!(alive _v)exitWith{};
	if(_v call DAPS_fnc_Active)then{
		_s=_v nearObjects["ShellCore",200];
		_r=_v nearObjects["RocketCore",200];
		_m=_v nearObjects["MissileCore",200];
		_sm=_v nearObjects["SubmunitionCore",200];
		_p=_v nearObjects["ammo_Penetrator_Base",200];
		_r=_r+_m+_s+_sm+_p;
		//_r=_r-_reg; 
		/*This counts rounds that have already been detected by the system, so they aren't counted twice. 
		The APS will only ever be able to react to a single incoming round at a time and will also spam reaction 
		code at the same round which may cause strange behaviour
		*/
		if((count _r)>0)then{[_v,_r select 0]spawn DAPS_fnc_Generic;_l=.5;_reg pushBack(_r select 0)};
		if((count _r)>1)then{[_v,_r select 1]spawn DAPS_fnc_Generic;_l=.5;_reg pushBack(_r select 1)};
		if(_l>0)then{sleep _l;_l=0};
	};
	if((call DAPS_fnc_Time)>_time)then{
		_v call DAPS_fnc_RearmCheck;
		_time=(call DAPS_fnc_Time)+dapsRearmDelay;
		{if!(alive _x)then{_reg=_reg-[_x]}}forEach _reg;
	};
	sleep .005;
};