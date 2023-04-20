private _v=_this;
//if!(local _v)exitWith{};
private _m=[];
private _r=[];
private _l=0;
_v setVariable["dapsActive",TRUE,TRUE];
_v setVariable["dapsLastAmmo",(_v call DAPS_fnc_CountAmmo),TRUE];
_v setVariable["dapsType","Medium APS",TRUE];
_v setVariable["dapsAmmo",4,TRUE];
_v setVariable["dapsAmmoMax",4,TRUE];
private _time=-1;
private _reg=[];
while{TRUE}do{
	if!(alive _v)exitWith{};
	if(_v call DAPS_fnc_Active)then{
		_r=[_v,200]call DAPS_fnc_Inc; //Funcntion stored in GetIncoming.sqf
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
	sleep .01;
};