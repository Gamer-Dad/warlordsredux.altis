private["_v","_type","_max","_a","_report"];
_v=_this;
if!(local _v)exitWith{};
_type=typeOf _v;
_max=0;
if!(_type in apsAPStypes)exitWith{};

_max = _v getVariable "apsAmmoMax";
_v setVariable["apsAmmo",_max,TRUE];