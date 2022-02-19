// Delete incoming tank rounds ASAP (though the APS effect makes it look like it happens closer to the vehicle)
private ["_v","_rd","_p","_id","_s"];
_v=_this select 0;
_rd=_this select 1;
_p=_this select 2;
_id=_this select 3;
if((typeOf _i)in dapsExcludedAmmo)exitWith{};
_s="";
_p=[_v,_id,5]call DAPS_fnc_RelPos;
_p remoteExec["DAPS_fnc_Blast"];
if(_rd>180)then{_s="LEFT"}else{_s="RIGHT"};
if(_rd>180)then{_a=_v getVariable"dapsAmmoL"}else{_a=_v getVariable"dapsAmmoR"};
if(_a<1)exitWith{[_v,_s,_rd,TRUE]remoteExec["DAPS_fnc_Report"]};
[_v,_s,_a]call DAPS_fnc_DeductAmmo;
[_v,_s,_rd,TRUE]remoteExec["DAPS_fnc_Report"];