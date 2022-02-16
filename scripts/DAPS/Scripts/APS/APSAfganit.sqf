private["_v","_m","_r","_s","_l","_sh","_1","_2","_time"];
_v=_this;
if!(local _v)exitWith{};
_m=[];
_r=[];
_s=[];
_l=0;
_sh=FALSE;
_1=objNull;
_2=objNull;
_v setVariable["dapsActive",TRUE,TRUE];
_v setVariable["dapsLastAmmo",(_v call DAPS_fnc_CountAmmo),TRUE];
_v setVariable["dapsType","Afganit",TRUE];
_v setVariable["dapsAmmoR",5,TRUE];
_v setVariable["dapsAmmoMaxR",5,TRUE];
_v setVariable["dapsAmmoL",5,TRUE];
_v setVariable["dapsAmmoMaxL",5,TRUE];
_time=-1;
while{TRUE}do{
	if!(alive _v)exitWith{};
	if(_v call DAPS_fnc_Active)then{
		_r=[_v,200]call DAPS_fnc_Inc;
		if((count _r)>0)then{_1=_r select 0;if(_1 in _s)then{_sh=TRUE};[_v,_1,_sh]spawn DAPS_fnc_Afganit;_l=.5;_sh=FALSE};
		if((count _r)>1)then{_2=_r select 1;if(_2 in _s)then{_sh=TRUE};[_v,_2,_sh]spawn DAPS_fnc_Afganit;_l=.5;_sh=FALSE};
		if(_l>0)then{sleep _l;_l=0};
	};
	if((call DAPS_fnc_Time)>_time)then{_v call DAPS_fnc_Rearm;_time=(call DAPS_fnc_Time)+dapsRearmDelay};
	sleep .005;
};