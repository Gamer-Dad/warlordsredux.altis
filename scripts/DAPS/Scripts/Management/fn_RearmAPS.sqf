private["_v","_type","_max","_a","_report"];
_v=_this;
if!(local _v)exitWith{};
_type=typeOf _v;
_max=0;
_a=0;
_report=FALSE;
if!(_type in dapsAPStypes)exitWith{};

_max = _v getVariable "dapsAmmoMax";
if((_v getVariable"dapsAmmo")<_max)then{_report=TRUE};
_v setVariable["dapsAmmo",_max,TRUE];
_a=_v call DAPS_fnc_CountAmmo;
if(_report)then{_v remoteExec["DAPS_fnc_ReportRearm", (owner _v)]};