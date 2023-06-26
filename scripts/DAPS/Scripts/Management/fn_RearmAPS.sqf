private["_v","_type","_max","_a","_report"];
_v=_this;
if!(local _v)exitWith{};
_type=typeOf _v;
_max=0;
if!(_type in dapsAPStypes)exitWith{};

_max = _v getVariable "dapsAmmoMax";
_v setVariable["dapsAmmo",_max,TRUE];