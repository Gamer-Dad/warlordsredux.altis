private["_v","_s","_a"];
_v=_this select 0;
_s=_this select 1;
_a=_this select 2;
if(_s=="LEFT")then{_v setVariable["dapsAmmoL",(_a-1),TRUE]};
if(_s=="RIGHT")then{_v setVariable["dapsAmmoR",(_a-1),TRUE]};
if(_s=="")then{_v setVariable["dapsAmmo",(_a-1),TRUE]};
if((typeOf _v)in dapsDouble)exitWith{
	if(((_v getVariable"dapsAmmoR")+(_v getVariable"dapsAmmoL"))<1)then{_v setVariable["dapsActive",FALSE,TRUE]};
};
if((_v getVariable"dapsAmmo")<1)then{_v setVariable["dapsActive",FALSE,TRUE]};