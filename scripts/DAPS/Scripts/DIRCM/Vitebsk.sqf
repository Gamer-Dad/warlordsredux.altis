private _v=_this;
//if!(local _v)exitWith{};
private _m=[];
private _r=[];
private _l=0;
_v setVariable["dapsActive",TRUE,TRUE];
_v setVariable["dapsType","Vitebsk",TRUE];
private _time=-1;
private _reg=[];
while{TRUE}do{
	if!(alive _v)exitWith{};
	if(isEngineOn _v)then{
		if((getDammage _v)>.3)exitWith{};
		_r=[_v,300]call DAPS_fnc_Inc;
		_r=_r-_reg;
		if((count _r)>0)then{[_v,_r select 0]spawn DAPS_fnc_Vitebsk2;_l=.3;_reg pushBack(_r select 0)};
		if((count _r)>1)then{[_v,_r select 1]spawn DAPS_fnc_Vitebsk2;_l=.3;_reg pushBack(_r select 1)};
		if((count _r)>2)then{[_v,_r select 2]spawn DAPS_fnc_Vitebsk2;_l=.3;_reg pushBack(_r select 2)};
		if(_l>0)then{sleep _l;_l=0};
	};
	if((call DAPS_fnc_Time)>_time)then{
		{if!(alive _x)then{_reg=_reg-[_x]}}forEach _reg;
		_time=TIME+60;
	};
	sleep .01;
};