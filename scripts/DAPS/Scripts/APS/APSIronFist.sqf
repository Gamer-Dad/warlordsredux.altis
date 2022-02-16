private["_v","_r","_l","_time"];
_v=_this;
if!(local _v)exitWith{};
_r=[];
_l=0;
_v setVariable["dapsActive",TRUE,TRUE];
_v setVariable["dapsLastAmmo",(_v call DAPS_fnc_CountAmmo),TRUE];
_v setVariable["dapsType","Iron Fist",TRUE];
_v setVariable["dapsAmmoR",2,TRUE];
_v setVariable["dapsAmmoMaxR",2,TRUE];
_v setVariable["dapsAmmoL",2,TRUE];
_v setVariable["dapsAmmoMaxL",2,TRUE];
_time=-1;
while{TRUE}do{
	if!(alive _v)exitWith{};
	if(_v call DAPS_fnc_Active)then{
		_r=[_v,100]call DAPS_fnc_Inc;
		if((count _r)>0)then{[_v,_r select 0]spawn DAPS_fnc_IronFist;_l=.5};
		if((count _r)>1)then{[_v,_r select 1]spawn DAPS_fnc_IronFist;_l=.5};
		if(_l>0)then{sleep _l;_l=0};
	};
	if((call DAPS_fnc_Time)>_time)then{_v call DAPS_fnc_Rearm;_time=(call DAPS_fnc_Time)+dapsRearmDelay};
	sleep .05;
};