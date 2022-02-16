//if((call DAPS_fnc_Time)<30)exitWith{};
private["_v","_a","_l"];
_v=_this;
_a=_v call DAPS_fnc_CountAmmo;
_l=_v getVariable"dapsLastAmmo";
if(_a>_l)then{_v call DAPS_fnc_RearmAPS};
if(_a<_l)then{_v setVariable["dapsLastAmmo",_a,TRUE]};
TRUE